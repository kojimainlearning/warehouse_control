TRUNCATE TABLE Month_End_Stock_Fact;

MERGE INTO Month_End_Stock_Fact MES
USING
(
    WITH
    /* ============================================================
       1. LAST COMPLETED MONTH-END
       ============================================================ */
    Target_Date AS
    (
        SELECT TRUNC(SYSDATE, 'MM') - 1 AS Max_Date
        FROM DUAL
    ),
    /* ============================================================
       2. ONE BUSINESS PRODUCT PER ITEM
       
       Product_Dim is SCD Type 2.
       Stock itself is tracked using Item_ID.
       ============================================================ */
    Business_Products AS
    (
        SELECT
            Item_ID,
            MIN(TRUNC(Effective_Start_Date)) AS First_Product_Date
        FROM Product_Dim
        GROUP BY Item_ID
    ),
    /* ============================================================
       3. VALID BRANCH × PRODUCT COMBINATIONS
       
       Stock accumulation starts from the later of:
           Branch opening date
           Product first date
       ============================================================ */
    Branch_Product_Base AS
    (
        SELECT
            BD.Branch_Key,
            BD.Branch_ID,
            TRUNC(BD.Opening_Date) AS Opening_Date,
            TRUNC(BD.Closing_Date) AS Closing_Date,
            BP.Item_ID,
            BP.First_Product_Date,
            CASE
                WHEN TRUNC(BD.Opening_Date) >
                     BP.First_Product_Date
                THEN TRUNC(BD.Opening_Date)
                ELSE BP.First_Product_Date
            END AS Start_Date
        FROM Branch_Dim BD
        CROSS JOIN Business_Products BP
        WHERE TRUNC(BD.Opening_Date)
              <=
              (SELECT Max_Date FROM Target_Date)
    ),
    /* ============================================================
       4. GENERATE MONTH-END SNAPSHOTS
       
       Only generate snapshots between:
           Start_Date
           Branch closing date
           Last completed month-end
       ============================================================ */
    Month_Ends AS
    (
        SELECT
            BPB.Branch_Key,
            BPB.Item_ID,
            BPB.Start_Date,
            DD.Cal_Date AS Snapshot_Date
        FROM Branch_Product_Base BPB
        JOIN Date_Dim DD
          ON DD.Last_Day_Ind = 'Y'
         AND DD.Cal_Date >= TRUNC(BPB.Start_Date, 'MM')
         AND DD.Cal_Date <= (SELECT Max_Date FROM Target_Date)
         AND DD.Cal_Date >= BPB.Start_Date
         AND
         (
             BPB.Closing_Date IS NULL
             OR DD.Cal_Date <= BPB.Closing_Date
         )
    ),
    /* ============================================================
       5. FIND SCD2 PRODUCT KEY FOR EACH SNAPSHOT
       
       Product_Key represents the Product_Dim version valid
       on that snapshot date.
       ============================================================ */
    Snapshot_Product_Raw AS
    (
        SELECT
            ME.Branch_Key,
            ME.Item_ID,
            ME.Start_Date,
            ME.Snapshot_Date,
            PD.Product_Key,
            ROW_NUMBER() OVER
            (
                PARTITION BY
                    ME.Branch_Key,
                    ME.Item_ID,
                    ME.Snapshot_Date
                ORDER BY
                    PD.Effective_Start_Date DESC,
                    PD.Product_Key DESC
            ) AS RN
        FROM Month_Ends ME
        JOIN Product_Dim PD
          ON PD.Item_ID = ME.Item_ID
         AND PD.Effective_Start_Date <= ME.Snapshot_Date
         AND PD.Effective_End_Date   >  ME.Snapshot_Date
    ),
    Snapshot_Product AS
    (
        SELECT
            Branch_Key,
            Item_ID,
            Start_Date,
            Snapshot_Date,
            Product_Key
        FROM Snapshot_Product_Raw
        WHERE RN = 1
    ),
    /* ============================================================
       6. ALL STOCK MOVEMENTS
       
       Every movement is converted to:
       
           Event_Date
           BranchID
           ItemID
           Net_Change
       
       SALE      = negative
       PURCHASE  = positive
       RETURN    = positive
       ============================================================ */
    All_Movements AS
    (
        /* --------------------------------------------------------
           6A. DELIVERY SALES
           -------------------------------------------------------- */
        SELECT
            TRUNC(D.DeliveredDateTime) AS Event_Date,
            O.BranchID,
            OI.ItemID,
            -OI.Quantity AS Net_Change
        FROM Deliveries D
        JOIN Orders O
          ON D.OrderID = O.OrderID
        JOIN Ordered_Items OI
          ON O.OrderID = OI.OrderID
        WHERE D.Status = 'DELIVERED'
          AND D.DeliveredDateTime IS NOT NULL
          AND TRUNC(D.DeliveredDateTime)
              <= (SELECT Max_Date FROM Target_Date)
        UNION ALL
        /* --------------------------------------------------------
           6B. WALK-IN / PICKUP SALES
           These have no delivery record.
           Stock leaves when order is completed.
           -------------------------------------------------------- */
        SELECT
            TRUNC(O.OrderDateTime) AS Event_Date,
            O.BranchID,
            OI.ItemID,
            -OI.Quantity AS Net_Change
        FROM Orders O
        JOIN Ordered_Items OI
          ON O.OrderID = OI.OrderID
        WHERE O.FulfillmentType IN ('WALK_IN', 'PICKUP')
          AND O.OrderStatus = 'COMPLETED'
          AND TRUNC(O.OrderDateTime)
              <= (SELECT Max_Date FROM Target_Date)
        UNION ALL
        /* --------------------------------------------------------
           6C. PURCHASES
           Purchase_Orders has no BranchID.
           Branch is therefore derived from the Staff's BranchID.
           -------------------------------------------------------- */
        SELECT
            TRUNC(PO.ReceivedDate) AS Event_Date,
            S.BranchID,
            POI.ItemID,
            POI.QuantityReceived AS Net_Change
        FROM Purchase_Orders PO
        JOIN Purchase_Order_Items POI
          ON PO.PurchaseOrderID = POI.PurchaseOrderID
        JOIN Staffs S
          ON PO.StaffID = S.StaffID
        WHERE PO.Status = 'RECEIVED'
          AND PO.ReceivedDate IS NOT NULL
          AND POI.QuantityReceived > 0
          AND TRUNC(PO.ReceivedDate)
              <= (SELECT Max_Date FROM Target_Date)
        UNION ALL
        /* --------------------------------------------------------
           6D. PHYSICAL PRODUCT RETURNS
           WRONG_ITEM + REPLACE:
               product comes back into stock.
           
           MISSING is NOT treated as stock received because
           the customer does not physically return the product.
           IMPORTANT:
           Return_Requests contains ItemID, so the join must use
           BOTH OrderID and ItemID.
           -------------------------------------------------------- */
        SELECT
            TRUNC(RR.ProcessedDate) AS Event_Date,
            O.BranchID,
            RR.ItemID,
            RR.QuantityReturned AS Net_Change
        FROM Return_Requests RR
        JOIN Orders O
          ON RR.OrderID = O.OrderID
        JOIN Ordered_Items OI
          ON RR.OrderID = OI.OrderID
         AND RR.ItemID  = OI.ItemID
        WHERE RR.Status IN ('APPROVED', 'COMPLETED')
          AND RR.ReturnReason IN ('WRONG_ITEM', 'MISSING')
          AND RR.ResolutionType = 'REPLACE'
          AND RR.ProcessedDate IS NOT NULL
          AND TRUNC(RR.ProcessedDate)
              <= (SELECT Max_Date FROM Target_Date)
    ),
    /* ============================================================
       7. CONVERT BRANCH ID → BRANCH KEY
       ============================================================ */
    Movements_With_Branch_Key AS
    (
        SELECT
            AM.Event_Date,
            BD.Branch_Key,
            AM.ItemID,
            AM.Net_Change
        FROM All_Movements AM
        JOIN Branch_Dim BD
          ON AM.BranchID = BD.Branch_ID
    ),
    /* ============================================================
       8. KEEP ONLY MOVEMENTS VALID FOR THE BRANCH + PRODUCT
       
       A movement before the branch/product starts must not
       contribute to the stock balance.
       A movement after a branch closes must not contribute either.
       ============================================================ */
    Valid_Movements AS
    (
        SELECT
            MBK.Event_Date,
            MBK.Branch_Key,
            MBK.ItemID,
            MBK.Net_Change
        FROM Movements_With_Branch_Key MBK
        JOIN Branch_Product_Base BPB
          ON BPB.Branch_Key = MBK.Branch_Key
         AND BPB.Item_ID    = MBK.ItemID
        WHERE MBK.Event_Date >= BPB.Start_Date
          AND
          (
              BPB.Closing_Date IS NULL
              OR MBK.Event_Date <= BPB.Closing_Date
          )
    ),
    /* ============================================================
       9. AGGREGATE MOVEMENTS ON THE SAME DAY
       
       This can dramatically reduce the number of rows before
       the analytic running-total operation.
       ============================================================ */
    Daily_Movements AS
    (
        SELECT
            Event_Date,
            Branch_Key,
            ItemID,
            SUM(Net_Change) AS Net_Change
        FROM Valid_Movements
        GROUP BY
            Event_Date,
            Branch_Key,
            ItemID
    ),
    /* ============================================================
       10. BUILD A SINGLE STOCK TIMELINE
       
       Movement rows:
           Row_Type = 1
       
       Snapshot rows:
           Row_Type = 2
       
       Therefore, if a movement happens on the exact same date
       as a month-end snapshot, the movement is processed FIRST.
       ============================================================ */
    Stock_Timeline AS
    (
        /* --------------------------------------------------------
           MOVEMENT ROWS
           -------------------------------------------------------- */
        SELECT
            DM.Event_Date,
            DM.Branch_Key,
            DM.ItemID,
            CAST(NULL AS NUMBER) AS Product_Key,
            DM.Net_Change AS Net_Change,
            1 AS Row_Type,
            CAST(NULL AS DATE) AS Snapshot_Date
        FROM Daily_Movements DM
        UNION ALL
        /* --------------------------------------------------------
           SNAPSHOT ROWS
           -------------------------------------------------------- */
        SELECT
            SP.Snapshot_Date AS Event_Date,
            SP.Branch_Key,
            SP.Item_ID AS ItemID,
            SP.Product_Key,
            0 AS Net_Change,
            2 AS Row_Type,
            SP.Snapshot_Date AS Snapshot_Date
        FROM Snapshot_Product SP
    ),
    /* ============================================================
       11. CALCULATE RUNNING STOCK
       
       THIS IS THE MAIN PERFORMANCE FIX.
       
       We calculate the cumulative stock ONCE for each
       Branch + Item timeline.
       
       We do NOT join every snapshot to every previous movement.
       ============================================================ */
    Stock_With_Running_Total AS
    (
        SELECT
            Event_Date,
            Branch_Key,
            ItemID,
            Product_Key,
            Row_Type,
            Snapshot_Date,
            SUM(Net_Change) OVER
            (
                PARTITION BY
                    Branch_Key,
                    ItemID
                ORDER BY
                    Event_Date,
                    Row_Type
                ROWS BETWEEN UNBOUNDED PRECEDING
                         AND CURRENT ROW
            ) AS Quantity_On_Hand
        FROM Stock_Timeline
    ),
    /* ============================================================
       12. RETURN ONLY MONTH-END SNAPSHOT ROWS
       ============================================================ */
    Final_Source AS
    (
        SELECT
            Snapshot_Date,
            Branch_Key,
            Product_Key,
            Quantity_On_Hand
        FROM Stock_With_Running_Total
        WHERE Row_Type = 2
    )
    /* ============================================================
       13. DATA TO MERGE
       ============================================================ */
    SELECT
        Snapshot_Date,
        Branch_Key,
        Product_Key,
        Quantity_On_Hand
    FROM Final_Source
) SRC
ON
(
       MES.Snapshot_Date = SRC.Snapshot_Date
   AND MES.Branch_Key    = SRC.Branch_Key
   AND MES.Product_Key   = SRC.Product_Key
)
WHEN MATCHED THEN
    UPDATE SET
        MES.Quantity_On_Hand = SRC.Quantity_On_Hand
WHEN NOT MATCHED THEN
    INSERT
    (
        Snapshot_Date,
        Branch_Key,
        Product_Key,
        Quantity_On_Hand
    )
    VALUES
    (
        SRC.Snapshot_Date,
        SRC.Branch_Key,
        SRC.Product_Key,
        SRC.Quantity_On_Hand
    );
COMMIT;