--Initial Loading
CREATE OR REPLACE PROCEDURE INIT_LOAD_MES IS
BEGIN
    -- 1. Wipe target table for a clean baseline
    EXECUTE IMMEDIATE 'TRUNCATE TABLE Month_End_Stock_Fact';

    -- 2. Direct-path full load
    INSERT INTO Month_End_Stock_Fact
    (
        Snapshot_Date_Key,
        Branch_Key,
        Product_Key,
        Quantity_On_Hand
    )
    WITH
    Target_Date AS (
        SELECT TRUNC(SYSDATE, 'MM') - 1 AS Max_Date FROM DUAL
    ),
    Business_Products AS (
        SELECT Item_ID, MIN(TRUNC(Effective_Start_Date)) AS First_Product_Date
        FROM Product_Dim
        GROUP BY Item_ID
    ),
    Branch_Product_Base AS (
        SELECT
            BD.Branch_Key,
            BD.Branch_ID,
            TRUNC(BD.Opening_Date) AS Opening_Date,
            TRUNC(BD.Closing_Date) AS Closing_Date,
            BP.Item_ID,
            BP.First_Product_Date,
            CASE
                WHEN TRUNC(BD.Opening_Date) > BP.First_Product_Date THEN TRUNC(BD.Opening_Date)
                ELSE BP.First_Product_Date
            END AS Start_Date
        FROM Branch_Dim BD
        CROSS JOIN Business_Products BP
        WHERE TRUNC(BD.Opening_Date) <= (SELECT Max_Date FROM Target_Date)
    ),
    Month_Ends AS (
        SELECT
            BPB.Branch_Key,
            BPB.Item_ID,
            BPB.Start_Date,
            DD.Cal_Date AS Snapshot_Date,
            DD.Date_Key AS Snapshot_Date_Key
        FROM Branch_Product_Base BPB
        JOIN Date_Dim DD
          ON DD.Last_Day_Ind = 'Y'
         AND DD.Cal_Date >= TRUNC(BPB.Start_Date, 'MM')
         AND DD.Cal_Date <= (SELECT Max_Date FROM Target_Date)
         AND DD.Cal_Date >= BPB.Start_Date
         AND (BPB.Closing_Date IS NULL OR DD.Cal_Date <= BPB.Closing_Date)
    ),
    Snapshot_Product_Raw AS (
        SELECT
            ME.Branch_Key,
            ME.Item_ID,
            ME.Start_Date,
            ME.Snapshot_Date,
            ME.Snapshot_Date_Key,
            PD.Product_Key,
            ROW_NUMBER() OVER (
                PARTITION BY ME.Branch_Key, ME.Item_ID, ME.Snapshot_Date
                ORDER BY PD.Effective_Start_Date DESC, PD.Product_Key DESC
            ) AS RN
        FROM Month_Ends ME
        JOIN Product_Dim PD
          ON PD.Item_ID = ME.Item_ID
         AND PD.Effective_Start_Date <= ME.Snapshot_Date
         AND (PD.Effective_End_Date > ME.Snapshot_Date OR PD.Effective_End_Date IS NULL)
    ),
    Snapshot_Product AS (
        SELECT Branch_Key, Item_ID, Start_Date, Snapshot_Date, Snapshot_Date_Key, Product_Key
        FROM Snapshot_Product_Raw
        WHERE RN = 1
    ),
    All_Movements AS (
        SELECT TRUNC(D.DeliveredDateTime) AS Event_Date, O.BranchID, OI.ItemID, -OI.Quantity AS Net_Change
        FROM Deliveries D
        JOIN Orders O ON D.OrderID = O.OrderID
        JOIN Ordered_Items OI ON O.OrderID = OI.OrderID
        WHERE D.Status = 'DELIVERED'
          AND D.DeliveredDateTime IS NOT NULL
          AND TRUNC(D.DeliveredDateTime) <= (SELECT Max_Date FROM Target_Date)
        UNION ALL
        SELECT TRUNC(O.OrderDateTime) AS Event_Date, O.BranchID, OI.ItemID, -OI.Quantity AS Net_Change
        FROM Orders O
        JOIN Ordered_Items OI ON O.OrderID = OI.OrderID
        WHERE O.FulfillmentType IN ('WALK_IN', 'PICKUP')
          AND O.OrderStatus = 'COMPLETED'
          AND TRUNC(O.OrderDateTime) <= (SELECT Max_Date FROM Target_Date)
        UNION ALL
        SELECT TRUNC(PO.ReceivedDate) AS Event_Date, S.BranchID, POI.ItemID, POI.QuantityReceived AS Net_Change
        FROM Purchase_Orders PO
        JOIN Purchase_Order_Items POI ON PO.PurchaseOrderID = POI.PurchaseOrderID
        JOIN Staffs S ON PO.StaffID = S.StaffID
        WHERE PO.Status = 'RECEIVED'
          AND PO.ReceivedDate IS NOT NULL
          AND POI.QuantityReceived > 0
          AND TRUNC(PO.ReceivedDate) <= (SELECT Max_Date FROM Target_Date)
        UNION ALL
        SELECT TRUNC(RR.ProcessedDate) AS Event_Date, O.BranchID, RR.ItemID, RR.QuantityReturned AS Net_Change
        FROM Return_Requests RR
        JOIN Orders O ON RR.OrderID = O.OrderID
        WHERE RR.Status IN ('APPROVED', 'COMPLETED')
          AND RR.ReturnReason IN ('WRONG_ITEM', 'MISSING')
          AND RR.ResolutionType = 'REPLACE'
          AND RR.ProcessedDate IS NOT NULL
          AND TRUNC(RR.ProcessedDate) <= (SELECT Max_Date FROM Target_Date)
    ),
    Movements_With_Branch_Key AS (
        SELECT AM.Event_Date, BD.Branch_Key, AM.ItemID, AM.Net_Change
        FROM All_Movements AM
        JOIN Branch_Dim BD ON AM.BranchID = BD.Branch_ID
    ),
    Valid_Movements AS (
        SELECT MBK.Event_Date, MBK.Branch_Key, MBK.ItemID, MBK.Net_Change
        FROM Movements_With_Branch_Key MBK
        JOIN Branch_Product_Base BPB ON BPB.Branch_Key = MBK.Branch_Key AND BPB.Item_ID = MBK.ItemID
        WHERE MBK.Event_Date >= BPB.Start_Date
          AND (BPB.Closing_Date IS NULL OR MBK.Event_Date <= BPB.Closing_Date)
    ),
    Daily_Movements AS (
        SELECT Event_Date, Branch_Key, ItemID, SUM(Net_Change) AS Net_Change
        FROM Valid_Movements
        GROUP BY Event_Date, Branch_Key, ItemID
    ),
    Stock_Timeline AS (
        SELECT 
            DM.Event_Date, 
            DM.Branch_Key, 
            DM.ItemID, 
            CAST(NULL AS NUMBER) AS Product_Key, 
            DM.Net_Change, 
            1 AS Row_Type, 
            CAST(NULL AS DATE) AS Snapshot_Date, 
            CAST(NULL AS NUMBER) AS Snapshot_Date_Key
        FROM Daily_Movements DM
        UNION ALL
        SELECT 
            SP.Snapshot_Date AS Event_Date, 
            SP.Branch_Key, 
            SP.Item_ID AS ItemID, 
            SP.Product_Key, 
            0 AS Net_Change, 
            2 AS Row_Type, 
            SP.Snapshot_Date, 
            SP.Snapshot_Date_Key
        FROM Snapshot_Product SP
    ),
    Stock_With_Running_Total AS (
        SELECT
            Snapshot_Date_Key,
            Snapshot_Date,
            Branch_Key,
            Product_Key,
            Row_Type,
            SUM(Net_Change) OVER (
                PARTITION BY Branch_Key, ItemID
                ORDER BY Event_Date, Row_Type
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            ) AS Quantity_On_Hand
        FROM Stock_Timeline
    )
    SELECT 
        Snapshot_Date_Key, 
        Branch_Key, 
        Product_Key, 
        Quantity_On_Hand
    FROM Stock_With_Running_Total
    WHERE Row_Type = 2;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Initial snapshot load for Month-End Stock completed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'Initial load failed: ' || SQLERRM);
END INIT_LOAD_MES;
/

EXEC INIT_LOAD_MES;

--Incremental Loading
CREATE OR REPLACE PROCEDURE INC_LOAD_MES (
    p_snapshot_date DATE DEFAULT TRUNC(SYSDATE, 'MM') - 1
) IS
    v_month_start       DATE := TRUNC(p_snapshot_date, 'MM');
    v_month_end         DATE := LAST_DAY(p_snapshot_date);
    v_prev_end          DATE := v_month_start - 1;
    v_snapshot_date_key NUMBER;
    v_prev_date_key     NUMBER;
BEGIN
    -- Look up target and prior snapshot date keys directly from Date_Dim to satisfy FK_MES_DATE
    SELECT Date_Key INTO v_snapshot_date_key
    FROM Date_Dim
    WHERE Cal_Date = v_month_end;

    BEGIN
        SELECT Date_Key INTO v_prev_date_key
        FROM Date_Dim
        WHERE Cal_Date = v_prev_end;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_prev_date_key := NULL;
    END;

    MERGE INTO Month_End_Stock_Fact MES
    USING (
        WITH
        -- 1. Active products valid for current target month-end
        Business_Products AS (
            SELECT Item_ID, MIN(TRUNC(Effective_Start_Date)) AS First_Product_Date
            FROM Product_Dim GROUP BY Item_ID
        ),
        Branch_Product_Base_Raw AS (
            SELECT
                BD.Branch_Key,
                BD.Branch_ID,
                BP.Item_ID,
                PD.Product_Key,
                ROW_NUMBER() OVER (
                    PARTITION BY BD.Branch_Key, BP.Item_ID
                    ORDER BY PD.Effective_Start_Date DESC, PD.Product_Key DESC
                ) AS RN
            FROM Branch_Dim BD
            CROSS JOIN Business_Products BP
            JOIN Product_Dim PD
              ON PD.Item_ID = BP.Item_ID
             AND PD.Effective_Start_Date <= v_month_end
             AND (PD.Effective_End_Date > v_month_end OR PD.Effective_End_Date IS NULL)
            WHERE TRUNC(BD.Opening_Date) <= v_month_end
              AND (BD.Closing_Date IS NULL OR TRUNC(BD.Closing_Date) >= v_month_start)
        ),
        Branch_Product_Base AS (
            SELECT Branch_Key, Branch_ID, Item_ID, Product_Key
            FROM Branch_Product_Base_Raw
            WHERE RN = 1
        ),
        -- 2. Closing balance from prior month-end using DATE_KEY
        Prior_Month_Stock AS (
            SELECT
                MES.Branch_Key,
                PD.Item_ID,
                SUM(MES.Quantity_On_Hand) AS Prior_Qty
            FROM Month_End_Stock_Fact MES
            JOIN Product_Dim PD ON MES.Product_Key = PD.Product_Key
            WHERE MES.Snapshot_Date_Key = v_prev_date_key
            GROUP BY MES.Branch_Key, PD.Item_ID
        ),
        -- 3. Delta movements strictly within current processing month
        Current_Month_Movements AS (
            SELECT TRUNC(D.DeliveredDateTime) AS Event_Date, O.BranchID, OI.ItemID, -OI.Quantity AS Net_Change
            FROM Deliveries D
            JOIN Orders O ON D.OrderID = O.OrderID
            JOIN Ordered_Items OI ON O.OrderID = OI.OrderID
            WHERE D.Status = 'DELIVERED'
              AND D.DeliveredDateTime >= v_month_start AND D.DeliveredDateTime < v_month_end + 1
            UNION ALL
            SELECT TRUNC(O.OrderDateTime) AS Event_Date, O.BranchID, OI.ItemID, -OI.Quantity AS Net_Change
            FROM Orders O
            JOIN Ordered_Items OI ON O.OrderID = OI.OrderID
            WHERE O.FulfillmentType IN ('WALK_IN', 'PICKUP')
              AND O.OrderStatus = 'COMPLETED'
              AND O.OrderDateTime >= v_month_start AND O.OrderDateTime < v_month_end + 1
            UNION ALL
            SELECT TRUNC(PO.ReceivedDate) AS Event_Date, S.BranchID, POI.ItemID, POI.QuantityReceived AS Net_Change
            FROM Purchase_Orders PO
            JOIN Purchase_Order_Items POI ON PO.PurchaseOrderID = POI.PurchaseOrderID
            JOIN Staffs S ON PO.StaffID = S.StaffID
            WHERE PO.Status = 'RECEIVED'
              AND PO.ReceivedDate >= v_month_start AND PO.ReceivedDate < v_month_end + 1
            UNION ALL
            SELECT TRUNC(RR.ProcessedDate) AS Event_Date, O.BranchID, RR.ItemID, RR.QuantityReturned AS Net_Change
            FROM Return_Requests RR
            JOIN Orders O ON RR.OrderID = O.OrderID
            WHERE RR.Status IN ('APPROVED', 'COMPLETED')
              AND RR.ReturnReason IN ('WRONG_ITEM', 'MISSING')
              AND RR.ResolutionType = 'REPLACE'
              AND RR.ProcessedDate >= v_month_start AND RR.ProcessedDate < v_month_end + 1
        ),
        Current_Month_Agg AS (
            SELECT BD.Branch_Key, CMM.ItemID AS Item_ID, SUM(CMM.Net_Change) AS Month_Net_Change
            FROM Current_Month_Movements CMM
            JOIN Branch_Dim BD ON CMM.BranchID = BD.Branch_ID
            GROUP BY BD.Branch_Key, CMM.ItemID
        )
        -- 4. Calculate Ending Stock = Prior Balance + Delta Net Change
        SELECT
            v_snapshot_date_key AS Snapshot_Date_Key,
            BPB.Branch_Key,
            BPB.Product_Key,
            NVL(PMS.Prior_Qty, 0) + NVL(CMA.Month_Net_Change, 0) AS Quantity_On_Hand
        FROM Branch_Product_Base BPB
        LEFT JOIN Prior_Month_Stock PMS
               ON BPB.Branch_Key = PMS.Branch_Key AND BPB.Item_ID = PMS.Item_ID
        LEFT JOIN Current_Month_Agg CMA
               ON BPB.Branch_Key = CMA.Branch_Key AND BPB.Item_ID = CMA.Item_ID
        WHERE NVL(PMS.Prior_Qty, 0) <> 0 OR NVL(CMA.Month_Net_Change, 0) <> 0
    ) SRC
    ON (
        MES.Snapshot_Date_Key = SRC.Snapshot_Date_Key
    AND MES.Branch_Key        = SRC.Branch_Key
    AND MES.Product_Key       = SRC.Product_Key
    )
    WHEN MATCHED THEN
        UPDATE SET MES.Quantity_On_Hand = SRC.Quantity_On_Hand
    WHEN NOT MATCHED THEN
        INSERT (Snapshot_Date_Key, Branch_Key, Product_Key, Quantity_On_Hand)
        VALUES (SRC.Snapshot_Date_Key, SRC.Branch_Key, SRC.Product_Key, SRC.Quantity_On_Hand);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Incremental snapshot load for Month End Stock Fact table is completed for Date Key: ' || TO_CHAR(v_snapshot_date_key));
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Incremental load failed: ' || SQLERRM);
END INC_LOAD_MES;
/

EXEC INC_LOAD_MES;
