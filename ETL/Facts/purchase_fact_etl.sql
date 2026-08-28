SET SERVEROUTPUT ON SIZE UNLIMITED;
SET DEFINE OFF;
SET SQLBLANKLINES ON;

-- Suggested execution order
-- 1. Load Date_Dim
-- 2. Load Branch_Dim
-- 3. Load Supplier_Dim
-- 4. Load Staff_Dim
-- 5. Load Product_Dim
-- 6. Create Purchases_Fact_Stg_V
-- 7. Run Purchases_Fact initial load
-- 8. For future loads, run Purchases_Fact subsequent load with the desired start date

-- Create staging area before initial and subsequent loading
CREATE OR REPLACE VIEW Purchases_Fact_Stg_V AS
WITH purchase_lines AS (
  SELECT
    po.PurchaseOrderID                          AS Purchase_Order_ID,
    po.SupplierID                               AS Supplier_ID,
    po.StaffID                                  AS Staff_ID,
    po.Status                                   AS PO_Status,
    TRUNC(po.OrderDate)                         AS Order_Date,
    TRUNC(po.ReceivedDate)                      AS Received_Date,

    poi.ItemID                                  AS Item_ID,
    poi.QuantityOrdered                         AS Quantity_Ordered,
    poi.QuantityReceived                        AS Quantity_Received,
    poi.UnitCost                                AS Unit_Cost,
    poi.LineTotal                               AS Source_Line_Total,

    st.BranchID                                 AS Derived_Branch_ID,
    i.PurchaseUnitPrice                         AS Latest_Item_Purchase_Price

  FROM Purchase_Orders po
  JOIN Purchase_Order_Items poi
    ON poi.PurchaseOrderID = po.PurchaseOrderID
  LEFT JOIN Staffs st
    ON st.StaffID = po.StaffID
  LEFT JOIN Items i
    ON i.ItemID = poi.ItemID
)
SELECT
  pl.Purchase_Order_ID,
  pl.Supplier_ID,
  pl.Staff_ID,
  pl.Item_ID,
  pl.Order_Date,
  pl.Received_Date,
  pl.PO_Status,

  pl.Quantity_Ordered,
  pl.Quantity_Received,
  pl.Unit_Cost,

  ROUND(pl.Quantity_Ordered * pl.Unit_Cost, 2) AS Line_Total,
  pl.Source_Line_Total,

  CASE
    WHEN ROUND(pl.Quantity_Ordered * pl.Unit_Cost, 2) = pl.Source_Line_Total
      THEN 'Y'
    ELSE 'N'
  END AS Line_Total_Match_Flag,

  pl.Latest_Item_Purchase_Price,

  CASE
    WHEN pl.Latest_Item_Purchase_Price IS NOT NULL
      AND pl.Unit_Cost = pl.Latest_Item_Purchase_Price
      THEN 'Y'
    ELSE 'N'
  END AS Cost_Matches_Latest_Flag,

  sd.Supplier_Key,
  bd.Branch_Key,
  std.Staff_Key,
  pod.Date_Key                                  AS PO_Date_Key,
  rd.Date_Key                                   AS Received_Date_Key,

  NVL(
    (
      SELECT MAX(p.Product_Key)
      FROM Product_Dim p
      WHERE p.Item_ID = pl.Item_ID
        AND pl.Order_Date BETWEEN TRUNC(p.Effective_Start_Date)
                              AND TRUNC(p.Effective_End_Date)
    ),
    NVL(
      (
        SELECT MAX(p.Product_Key)
        FROM Product_Dim p
        WHERE p.Item_ID = pl.Item_ID
          AND p.Current_Flag = 'Y'
      ),
      (
        SELECT MAX(p.Product_Key)
        FROM Product_Dim p
        WHERE p.Item_ID = pl.Item_ID
      )
    )
  ) AS Product_Key

FROM purchase_lines pl
LEFT JOIN Supplier_Dim sd
  ON sd.Supplier_ID = pl.Supplier_ID
LEFT JOIN Branch_Dim bd
  ON bd.Branch_ID = pl.Derived_Branch_ID
LEFT JOIN Staff_Dim std
  ON std.Staff_ID = pl.Staff_ID
LEFT JOIN Date_Dim pod
  ON pod.Cal_Date = pl.Order_Date
LEFT JOIN Date_Dim rd
  ON rd.Cal_Date = pl.Received_Date;
  

-- Initial Loading
DECLARE
  TYPE t_table_list IS TABLE OF VARCHAR2(128);

  v_required_tables t_table_list := t_table_list(
    'PURCHASE_ORDERS',
    'PURCHASE_ORDER_ITEMS',
    'SUPPLIERS',
    'BRANCHES',
    'ITEMS',
    'STAFFS',
    'DATE_DIM',
    'SUPPLIER_DIM',
    'BRANCH_DIM',
    'PRODUCT_DIM',
    'STAFF_DIM'
  );

  v_count                      NUMBER;
  v_source_rows                NUMBER;
  v_staged_rows                NUMBER;
  v_fact_count                 NUMBER;

  v_missing_supplier_key       NUMBER;
  v_missing_branch_key         NUMBER;
  v_missing_staff_key          NUMBER;
  v_missing_po_date_key        NUMBER;
  v_missing_received_date_key  NUMBER;
  v_missing_product_key        NUMBER;

  v_line_total_mismatch        NUMBER;
  v_cost_mismatch              NUMBER;

  v_inserted                   NUMBER := 0;
BEGIN
  FOR i IN 1 .. v_required_tables.COUNT LOOP
    EXECUTE IMMEDIATE
      'SELECT COUNT(*) FROM ' || v_required_tables(i)
      INTO v_count;

    IF v_count = 0 THEN
      raise_application_error(
        -20001,
        'Required table ' || v_required_tables(i) || ' is empty. Load halted.'
      );
    END IF;
  END LOOP;

  SELECT COUNT(*)
  INTO v_source_rows
  FROM Purchase_Order_Items;

  SELECT
    COUNT(*),
    NVL(SUM(CASE WHEN Supplier_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Branch_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Staff_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN PO_Date_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Received_Date IS NOT NULL AND Received_Date_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Product_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Line_Total_Match_Flag = 'N' THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Cost_Matches_Latest_Flag = 'N' THEN 1 ELSE 0 END), 0)
  INTO
    v_staged_rows,
    v_missing_supplier_key,
    v_missing_branch_key,
    v_missing_staff_key,
    v_missing_po_date_key,
    v_missing_received_date_key,
    v_missing_product_key,
    v_line_total_mismatch,
    v_cost_mismatch
  FROM Purchases_Fact_Stg_V;

  DBMS_OUTPUT.PUT_LINE('==================================================');
  DBMS_OUTPUT.PUT_LINE('Purchases_Fact Initial Load Validation');
  DBMS_OUTPUT.PUT_LINE('==================================================');
  DBMS_OUTPUT.PUT_LINE('Purchase_Order_Items source rows : ' || v_source_rows);
  DBMS_OUTPUT.PUT_LINE('Purchases_Fact_Stg_V rows        : ' || v_staged_rows);
  DBMS_OUTPUT.PUT_LINE('Missing Supplier_Key             : ' || v_missing_supplier_key);
  DBMS_OUTPUT.PUT_LINE('Missing Branch_Key               : ' || v_missing_branch_key);
  DBMS_OUTPUT.PUT_LINE('Missing Staff_Key                : ' || v_missing_staff_key);
  DBMS_OUTPUT.PUT_LINE('Missing PO_Date_Key              : ' || v_missing_po_date_key);
  DBMS_OUTPUT.PUT_LINE('Missing Received_Date_Key        : ' || v_missing_received_date_key);
  DBMS_OUTPUT.PUT_LINE('Missing Product_Key              : ' || v_missing_product_key);
  DBMS_OUTPUT.PUT_LINE('Line_Total mismatches            : ' || v_line_total_mismatch);
  DBMS_OUTPUT.PUT_LINE('UnitCost latest-price mismatches : ' || v_cost_mismatch);
  DBMS_OUTPUT.PUT_LINE('==================================================');

  IF v_staged_rows <> v_source_rows THEN
    raise_application_error(
      -20002,
      'Staging row count (' || v_staged_rows ||
      ') does not match Purchase_Order_Items row count (' || v_source_rows ||
      '). Check missing or duplicate dimension records.'
    );
  END IF;

  IF v_missing_supplier_key > 0 THEN
    raise_application_error(
      -20003,
      v_missing_supplier_key || ' rows cannot resolve Supplier_Key. Load halted.'
    );
  END IF;

  IF v_missing_branch_key > 0 THEN
    raise_application_error(
      -20004,
      v_missing_branch_key || ' rows cannot resolve Branch_Key. Load halted.'
    );
  END IF;

  IF v_missing_staff_key > 0 THEN
    raise_application_error(
      -20005,
      v_missing_staff_key || ' rows cannot resolve Staff_Key. Load halted.'
    );
  END IF;

  IF v_missing_po_date_key > 0 THEN
    raise_application_error(
      -20006,
      v_missing_po_date_key || ' rows cannot resolve PO_Date_Key. Load halted.'
    );
  END IF;

  IF v_missing_received_date_key > 0 THEN
    raise_application_error(
      -20007,
      v_missing_received_date_key ||
      ' rows have ReceivedDate but cannot resolve Received_Date_Key. Load halted.'
    );
  END IF;

  IF v_missing_product_key > 0 THEN
    raise_application_error(
      -20008,
      v_missing_product_key || ' rows cannot resolve Product_Key. Load halted.'
    );
  END IF;

  IF v_line_total_mismatch > 0 THEN
    DBMS_OUTPUT.PUT_LINE(
      'Warning: ' || v_line_total_mismatch ||
      ' purchase order item lines have LineTotal different from QuantityOrdered * UnitCost.'
    );
  END IF;

  IF v_cost_mismatch > 0 THEN
    DBMS_OUTPUT.PUT_LINE(
      'Warning: ' || v_cost_mismatch ||
      ' purchase order item lines have UnitCost different from latest Items.PurchaseUnitPrice.'
    );
  END IF;

  SELECT COUNT(*)
  INTO v_fact_count
  FROM Purchases_Fact;

  IF v_fact_count = 0 THEN

    INSERT INTO Purchases_Fact (
      Supplier_Key,
      PO_Date_Key,
      Branch_Key,
      Product_Key,
      Staff_Key,
      Purchase_Order_ID,
      Received_Date_Key,
      Quantity_Ordered,
      Quantity_Received,
      Unit_Cost,
      Line_Total,
      PO_Status
    )
    SELECT
      s.Supplier_Key,
      s.PO_Date_Key,
      s.Branch_Key,
      s.Product_Key,
      s.Staff_Key,
      s.Purchase_Order_ID,
      s.Received_Date_Key,
      s.Quantity_Ordered,
      s.Quantity_Received,
      s.Unit_Cost,
      s.Line_Total,
      s.PO_Status
    FROM Purchases_Fact_Stg_V s
    WHERE s.Supplier_Key IS NOT NULL
      AND s.PO_Date_Key IS NOT NULL
      AND s.Branch_Key IS NOT NULL
      AND s.Product_Key IS NOT NULL
      AND s.Staff_Key IS NOT NULL;

  ELSE

    INSERT INTO Purchases_Fact (
      Supplier_Key,
      PO_Date_Key,
      Branch_Key,
      Product_Key,
      Staff_Key,
      Purchase_Order_ID,
      Received_Date_Key,
      Quantity_Ordered,
      Quantity_Received,
      Unit_Cost,
      Line_Total,
      PO_Status
    )
    SELECT
      s.Supplier_Key,
      s.PO_Date_Key,
      s.Branch_Key,
      s.Product_Key,
      s.Staff_Key,
      s.Purchase_Order_ID,
      s.Received_Date_Key,
      s.Quantity_Ordered,
      s.Quantity_Received,
      s.Unit_Cost,
      s.Line_Total,
      s.PO_Status
    FROM Purchases_Fact_Stg_V s
    WHERE s.Supplier_Key IS NOT NULL
      AND s.PO_Date_Key IS NOT NULL
      AND s.Branch_Key IS NOT NULL
      AND s.Product_Key IS NOT NULL
      AND s.Staff_Key IS NOT NULL
      AND NOT EXISTS (
        SELECT 1
        FROM Purchases_Fact f
        WHERE f.Purchase_Order_ID = s.Purchase_Order_ID
          AND EXISTS (
            SELECT 1
            FROM Product_Dim p
            WHERE p.Product_Key = f.Product_Key
              AND p.Item_ID = s.Item_ID
          )
      );

  END IF;

  v_inserted := SQL%ROWCOUNT;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Purchases_Fact initial load inserted: ' || v_inserted);

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Purchases_Fact initial load failed: ' || SQLERRM);
    RAISE;
END;
/


-- Subsequent Loading
DECLARE
  v_start_date DATE := TRUNC(SYSDATE) - 1; -- Change this date as needed

  TYPE t_table_list IS TABLE OF VARCHAR2(128);

  v_required_tables t_table_list := t_table_list(
    'PURCHASE_ORDERS',
    'PURCHASE_ORDER_ITEMS',
    'SUPPLIERS',
    'BRANCHES',
    'ITEMS',
    'STAFFS',
    'DATE_DIM',
    'SUPPLIER_DIM',
    'BRANCH_DIM',
    'PRODUCT_DIM',
    'STAFF_DIM'
  );

  v_count                      NUMBER;
  v_source_rows                NUMBER;
  v_staged_rows                NUMBER;

  v_missing_supplier_key       NUMBER;
  v_missing_branch_key         NUMBER;
  v_missing_staff_key          NUMBER;
  v_missing_po_date_key        NUMBER;
  v_missing_received_date_key  NUMBER;
  v_missing_product_key        NUMBER;

  v_line_total_mismatch        NUMBER;
  v_cost_mismatch              NUMBER;

  v_merged                     NUMBER := 0;
BEGIN

  IF v_start_date IS NULL THEN
    raise_application_error(
      -20001,
      'v_start_date cannot be NULL.'
    );
  END IF;

  FOR i IN 1 .. v_required_tables.COUNT LOOP
    EXECUTE IMMEDIATE
      'SELECT COUNT(*) FROM ' || v_required_tables(i)
      INTO v_count;

    IF v_count = 0 THEN
      raise_application_error(
        -20002,
        'Required table ' || v_required_tables(i) || ' is empty. Load halted.'
      );
    END IF;
  END LOOP;

  SELECT COUNT(*)
  INTO v_source_rows
  FROM Purchase_Orders po
  JOIN Purchase_Order_Items poi
    ON poi.PurchaseOrderID = po.PurchaseOrderID
  WHERE TRUNC(po.OrderDate) >= v_start_date;

  SELECT
    COUNT(*),
    NVL(SUM(CASE WHEN Supplier_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Branch_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Staff_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN PO_Date_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Received_Date IS NOT NULL AND Received_Date_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Product_Key IS NULL THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Line_Total_Match_Flag = 'N' THEN 1 ELSE 0 END), 0),
    NVL(SUM(CASE WHEN Cost_Matches_Latest_Flag = 'N' THEN 1 ELSE 0 END), 0)
  INTO
    v_staged_rows,
    v_missing_supplier_key,
    v_missing_branch_key,
    v_missing_staff_key,
    v_missing_po_date_key,
    v_missing_received_date_key,
    v_missing_product_key,
    v_line_total_mismatch,
    v_cost_mismatch
  FROM Purchases_Fact_Stg_V s
  WHERE s.Order_Date >= v_start_date;

  DBMS_OUTPUT.PUT_LINE('==================================================');
  DBMS_OUTPUT.PUT_LINE('Purchases_Fact Subsequent Load Validation');
  DBMS_OUTPUT.PUT_LINE('Start Date                       : ' || TO_CHAR(v_start_date, 'YYYY-MM-DD'));
  DBMS_OUTPUT.PUT_LINE('==================================================');
  DBMS_OUTPUT.PUT_LINE('Source rows in period            : ' || v_source_rows);
  DBMS_OUTPUT.PUT_LINE('Staging rows in period           : ' || v_staged_rows);
  DBMS_OUTPUT.PUT_LINE('Missing Supplier_Key             : ' || v_missing_supplier_key);
  DBMS_OUTPUT.PUT_LINE('Missing Branch_Key               : ' || v_missing_branch_key);
  DBMS_OUTPUT.PUT_LINE('Missing Staff_Key                : ' || v_missing_staff_key);
  DBMS_OUTPUT.PUT_LINE('Missing PO_Date_Key              : ' || v_missing_po_date_key);
  DBMS_OUTPUT.PUT_LINE('Missing Received_Date_Key        : ' || v_missing_received_date_key);
  DBMS_OUTPUT.PUT_LINE('Missing Product_Key              : ' || v_missing_product_key);
  DBMS_OUTPUT.PUT_LINE('Line_Total mismatches            : ' || v_line_total_mismatch);
  DBMS_OUTPUT.PUT_LINE('UnitCost latest-price mismatches : ' || v_cost_mismatch);
  DBMS_OUTPUT.PUT_LINE('==================================================');

  IF v_staged_rows <> v_source_rows THEN
    raise_application_error(
      -20003,
      'Staging row count (' || v_staged_rows ||
      ') does not match source row count (' || v_source_rows ||
      ') for the selected period. Check missing or duplicate dimension records.'
    );
  END IF;

  IF v_missing_supplier_key > 0 THEN
    raise_application_error(
      -20004,
      v_missing_supplier_key || ' rows cannot resolve Supplier_Key. Load halted.'
    );
  END IF;

  IF v_missing_branch_key > 0 THEN
    raise_application_error(
      -20005,
      v_missing_branch_key || ' rows cannot resolve Branch_Key. Load halted.'
    );
  END IF;

  IF v_missing_staff_key > 0 THEN
    raise_application_error(
      -20006,
      v_missing_staff_key || ' rows cannot resolve Staff_Key. Load halted.'
    );
  END IF;

  IF v_missing_po_date_key > 0 THEN
    raise_application_error(
      -20007,
      v_missing_po_date_key || ' rows cannot resolve PO_Date_Key. Load halted.'
    );
  END IF;

  IF v_missing_received_date_key > 0 THEN
    raise_application_error(
      -20008,
      v_missing_received_date_key ||
      ' rows have ReceivedDate but cannot resolve Received_Date_Key. Load halted.'
    );
  END IF;

  IF v_missing_product_key > 0 THEN
    raise_application_error(
      -20009,
      v_missing_product_key || ' rows cannot resolve Product_Key. Load halted.'
    );
  END IF;

  IF v_line_total_mismatch > 0 THEN
    DBMS_OUTPUT.PUT_LINE(
      'Warning: ' || v_line_total_mismatch ||
      ' purchase order item lines have LineTotal different from QuantityOrdered * UnitCost.'
    );
  END IF;

  IF v_cost_mismatch > 0 THEN
    DBMS_OUTPUT.PUT_LINE(
      'Warning: ' || v_cost_mismatch ||
      ' purchase order item lines have UnitCost different from latest Items.PurchaseUnitPrice.'
    );
  END IF;

  IF v_staged_rows = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No purchase order item lines to load for the selected period.');
    RETURN;
  END IF;

  MERGE INTO Purchases_Fact T
  USING (
    SELECT s.*
    FROM Purchases_Fact_Stg_V s
    WHERE s.Order_Date >= v_start_date
      AND s.Supplier_Key IS NOT NULL
      AND s.PO_Date_Key IS NOT NULL
      AND s.Branch_Key IS NOT NULL
      AND s.Product_Key IS NOT NULL
      AND s.Staff_Key IS NOT NULL
  ) S
  ON (
    T.Purchase_Order_ID = S.Purchase_Order_ID
    AND EXISTS (
      SELECT 1
      FROM Product_Dim p
      WHERE p.Product_Key = T.Product_Key
        AND p.Item_ID = S.Item_ID
    )
  )

  WHEN MATCHED THEN
    UPDATE SET
      T.Received_Date_Key = S.Received_Date_Key,
      T.Quantity_Ordered  = S.Quantity_Ordered,
      T.Quantity_Received = S.Quantity_Received,
      T.Unit_Cost         = S.Unit_Cost,
      T.Line_Total        = S.Line_Total,
      T.PO_Status         = S.PO_Status

  WHEN NOT MATCHED THEN
    INSERT (
      Supplier_Key,
      PO_Date_Key,
      Branch_Key,
      Product_Key,
      Staff_Key,
      Purchase_Order_ID,
      Received_Date_Key,
      Quantity_Ordered,
      Quantity_Received,
      Unit_Cost,
      Line_Total,
      PO_Status
    )
    VALUES (
      S.Supplier_Key,
      S.PO_Date_Key,
      S.Branch_Key,
      S.Product_Key,
      S.Staff_Key,
      S.Purchase_Order_ID,
      S.Received_Date_Key,
      S.Quantity_Ordered,
      S.Quantity_Received,
      S.Unit_Cost,
      S.Line_Total,
      S.PO_Status
    );

  v_merged := SQL%ROWCOUNT;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Purchases_Fact subsequent load inserted/updated: ' || v_merged);

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Purchases_Fact subsequent load failed: ' || SQLERRM);
    RAISE;
END;
/


-- Validation Queries
-- Check total loaded rows
SELECT COUNT(*) AS purchases_fact_count
FROM Purchases_Fact;

-- Check rows by purchase order status
SELECT PO_Status, COUNT(*) AS status_count
FROM Purchases_Fact
GROUP BY PO_Status;

-- Check purchase orders missing from Purchases_Fact
-- Expected result: no rows
SELECT po.PurchaseOrderID
FROM Purchase_Orders po
WHERE NOT EXISTS (
  SELECT 1
  FROM Purchases_Fact f
  WHERE f.Purchase_Order_ID = po.PurchaseOrderID
);

-- Check purchase order item lines missing from Purchases_Fact
-- Expected result: no rows
SELECT poi.PurchaseOrderID,
       poi.ItemID
FROM Purchase_Order_Items poi
WHERE NOT EXISTS (
  SELECT 1
  FROM Purchases_Fact f
  JOIN Product_Dim p
    ON p.Product_Key = f.Product_Key
  WHERE f.Purchase_Order_ID = poi.PurchaseOrderID
    AND p.Item_ID = poi.ItemID
);

-- Check calculated Line_Total against source LineTotal
-- Expected result: no rows
SELECT
  Purchase_Order_ID,
  Item_ID,
  Quantity_Ordered,
  Unit_Cost,
  Line_Total,
  Source_Line_Total,
  Line_Total_Match_Flag
FROM Purchases_Fact_Stg_V
WHERE Line_Total_Match_Flag = 'N';

-- Check UnitCost against latest Items.PurchaseUnitPrice
SELECT
  Purchase_Order_ID,
  Item_ID,
  Unit_Cost,
  Latest_Item_Purchase_Price,
  Cost_Matches_Latest_Flag
FROM Purchases_Fact_Stg_V
WHERE Cost_Matches_Latest_Flag = 'N';

-- Check purchase order total against fact line total sum
-- Expected result: no rows
SELECT
  po.PurchaseOrderID,
  po.TotalAmount                    AS source_total_amount,
  SUM(f.Line_Total)                 AS fact_line_total_sum,
  ABS(po.TotalAmount - SUM(f.Line_Total)) AS difference
FROM Purchase_Orders po
JOIN Purchases_Fact f
  ON f.Purchase_Order_ID = po.PurchaseOrderID
GROUP BY
  po.PurchaseOrderID,
  po.TotalAmount
HAVING ABS(po.TotalAmount - SUM(f.Line_Total)) > 0.01;

-- Check duplicate purchase order item rows in Purchases_Fact
-- Expected result: no rows
SELECT
  f.Purchase_Order_ID,
  p.Item_ID,
  COUNT(*) AS duplicate_count
FROM Purchases_Fact f
JOIN Product_Dim p
  ON p.Product_Key = f.Product_Key
GROUP BY
  f.Purchase_Order_ID,
  p.Item_ID
HAVING COUNT(*) > 1;


