--Initial Loading
CREATE OR REPLACE PROCEDURE INIT_LOAD_STOCK_MOVEMENT IS
BEGIN
    -- 1. Truncate fact table for a clean full load
    EXECUTE IMMEDIATE 'TRUNCATE TABLE Stock_Movement_Fact';

    -- 2. Direct-path initial insert
    INSERT INTO Stock_Movement_Fact
    (
        Movement_Date_Key,
        Product_Key,
        Branch_Key,
        Staff_Key,
        Reference_ID,
        Movement_Type,
        Quantity_In,
        Quantity_Out
    )
    SELECT
        Movement_Date_Key,
        Product_Key,
        Branch_Key,
        Staff_Key,
        Reference_ID,
        Movement_Type,
        Quantity_In,
        Quantity_Out
    FROM VW_ETL_STOCK_MOVEMENT_FACT;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Initial load for Fact table Stock Movement is completed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20001, 'Initial load failed: ' || SQLERRM);
END INIT_LOAD_STOCK_MOVEMENT;
/

EXEC INIT_LOAD_STOCK_MOVEMENT;

--Incremental Loading
CREATE OR REPLACE PROCEDURE INC_LOAD_STOCK_MOVEMENT (
    p_lookback_days NUMBER DEFAULT 1 -- Safety window for delayed transaction logging
) IS
    v_last_load_date DATE;
BEGIN
    -- 1. Determine High-Water Mark date from current fact data
    SELECT NVL(MAX(D.Cal_Date) - p_lookback_days, TO_DATE('1900-01-01', 'YYYY-MM-DD'))
    INTO v_last_load_date
    FROM Stock_Movement_Fact F
    JOIN Date_Dim D ON F.Movement_Date_Key = D.Date_Key;

    -- 2. Upsert delta dataset using MERGE
    MERGE INTO Stock_Movement_Fact T
    USING (
        -- Source Delta Stream
        SELECT 
            D.Date_Key AS Movement_Date_Key,
            PD.Product_Key,
            BD.Branch_Key,
            SD.Staff_Key,
            PO.PurchaseOrderID AS Reference_ID,
            'PURCHASE' AS Movement_Type,
            POI.QuantityReceived AS Quantity_In,
            0 AS Quantity_Out
        FROM Purchase_Orders PO
        JOIN Purchase_Order_Items POI ON POI.PurchaseOrderID = PO.PurchaseOrderID
        JOIN Staffs S ON S.StaffID = PO.StaffID
        JOIN Date_Dim D ON D.Cal_Date = TRUNC(PO.ReceivedDate)
        JOIN Branch_Dim BD ON BD.Branch_ID = S.BranchID
        JOIN Staff_Dim SD ON SD.Staff_ID = PO.StaffID
        JOIN Product_Dim PD ON PD.Item_ID = POI.ItemID
           AND TRUNC(PO.ReceivedDate) BETWEEN TRUNC(PD.Effective_Start_Date) AND TRUNC(PD.Effective_End_Date)
        WHERE PO.Status = 'RECEIVED'
          AND PO.ReceivedDate IS NOT NULL
          AND POI.QuantityReceived > 0
          AND TRUNC(PO.ReceivedDate) >= v_last_load_date

        UNION ALL

        SELECT 
            D.Date_Key AS Movement_Date_Key,
            PD.Product_Key,
            BD.Branch_Key,
            SD.Staff_Key,
            O.OrderID AS Reference_ID,
            'SALE' AS Movement_Type,
            0 AS Quantity_In,
            OI.Quantity AS Quantity_Out
        FROM Orders O
        JOIN Ordered_Items OI ON OI.OrderID = O.OrderID
        JOIN Date_Dim D ON D.Cal_Date = TRUNC(CAST(O.OrderDateTime AS DATE))
        JOIN Branch_Dim BD ON BD.Branch_ID = O.BranchID
        JOIN Staff_Dim SD ON SD.Staff_ID = O.StaffID
        JOIN Product_Dim PD ON PD.Item_ID = OI.ItemID
           AND TRUNC(CAST(O.OrderDateTime AS DATE)) BETWEEN TRUNC(PD.Effective_Start_Date) AND TRUNC(PD.Effective_End_Date)
        WHERE O.OrderStatus = 'COMPLETED'
          AND O.StaffID IS NOT NULL
          AND TRUNC(CAST(O.OrderDateTime AS DATE)) >= v_last_load_date

        UNION ALL

        SELECT 
            D.Date_Key AS Movement_Date_Key,
            PD.Product_Key,
            BD.Branch_Key,
            SD.Staff_Key,
            R.ReturnID AS Reference_ID,
            'RETURN' AS Movement_Type,
            R.QuantityReturned AS Quantity_In,
            0 AS Quantity_Out
        FROM Return_Requests R
        JOIN Orders O ON O.OrderID = R.OrderID
        JOIN Date_Dim D ON D.Cal_Date = TRUNC(R.ProcessedDate)
        JOIN Branch_Dim BD ON BD.Branch_ID = O.BranchID
        JOIN Staff_Dim SD ON SD.Staff_ID = R.StaffID
        JOIN Product_Dim PD ON PD.Item_ID = R.ItemID
           AND TRUNC(R.ProcessedDate) BETWEEN TRUNC(PD.Effective_Start_Date) AND TRUNC(PD.Effective_End_Date)
        WHERE R.Status IN ('COMPLETED', 'APPROVED')
          AND R.ReturnReason IN ('WRONG_ITEM', 'MISSING')
          AND R.ResolutionType = 'REPLACE'
          AND R.ProcessedDate IS NOT NULL
          AND R.QuantityReturned > 0
          AND TRUNC(R.ProcessedDate) >= v_last_load_date
    ) S
    ON (
        T.Reference_ID  = S.Reference_ID
    AND T.Movement_Type = S.Movement_Type
    AND T.Product_Key   = S.Product_Key
    AND T.Branch_Key    = S.Branch_Key
    )
    WHEN MATCHED THEN
        UPDATE SET 
            T.Movement_Date_Key = S.Movement_Date_Key,
            T.Staff_Key         = S.Staff_Key,
            T.Quantity_In       = S.Quantity_In,
            T.Quantity_Out      = S.Quantity_Out
    WHEN NOT MATCHED THEN
        INSERT (
            Movement_Date_Key,
            Product_Key,
            Branch_Key,
            Staff_Key,
            Reference_ID,
            Movement_Type,
            Quantity_In,
            Quantity_Out
        ) VALUES (
            S.Movement_Date_Key,
            S.Product_Key,
            S.Branch_Key,
            S.Staff_Key,
            S.Reference_ID,
            S.Movement_Type,
            S.Quantity_In,
            S.Quantity_Out
        );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Incremental load of Stock Movement fact table is executed successfully for records from ' || TO_CHAR(v_last_load_date, 'YYYY-MM-DD'));
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Incremental load failed: ' || SQLERRM);
END INC_LOAD_STOCK_MOVEMENT;
/

EXEC INC_LOAD_STOCK_MOVEMENT;
