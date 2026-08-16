SET SERVEROUTPUT ON SIZE UNLIMITED;
SET DEFINE OFF;
SET SQLBLANKLINES ON;

-- Note before loading the Sales_Fact
-- Recommended execution orde
-- 1. Load/refresh Date_Dim
-- 2. Load/refresh Branch_Dim
-- 3. Load/refresh Product_Dim
-- 4. Load/refresh Customer_Dim
-- 5. Load/refresh Staff_Dim
-- 6. Create or replace Sales_Fact_Stg_V
-- 7. Run Sales_Fact initial load
-- 8. For future loads, run Sales_Fact subsequent load

-- In case you did not using the updated Sales_Fact
-- Update constraint on primary key
-- ALTER TABLE Sales_Fact DROP CONSTRAINT PK_Sales_Fact;
-- ALTER TABLE Sales_Fact ADD CONSTRAINT PK_Sales_Fact PRIMARY KEY (SO_Date_Key, Branch_Key, Product_Key, Order_ID);

-- Update the Line_Total hardcoded calculation
-- ALTER TABLE Sales_Fact DROP CONSTRAINT CK_Line_Total;
-- ALTER TABLE Sales_Fact ADD CONSTRAINT CK_Line_Total CHECK (Line_Total >= 0);

-- Change Delivery_Company_Name limitation
-- ALTER TABLE Sales_Fact MODIFY Delivery_Company_Name VARCHAR2(50) NULL;

-- Change SO_Status to the correct constraints
-- ALTER TABLE Sales_Fact DROP CONSRTAINT CK_Sales_Order_Status;
-- ALTER TABLE Sales_Fact ADD CONSTRAINT CK_Sales_Order_Status CHECK (
--    	SO_Status IS NULL
--    	OR SO_Status IN (
--                'UNPAID',
--                'IN_PROGRESS',
--                'READY_FOR_PICKUP',
--                'OUT_FOR_DELIVERY',
--                'COMPLETED',
--                'CANCELLED'
--            )
--    );

-- Validation before loading ETL scripts
-- Check order dates missing from Date_Dim
-- Expected result: no rows
SELECT DISTINCT TRUNC(o.OrderDateTime) AS missing_order_date
FROM Orders o
WHERE NOT EXISTS (
  SELECT 1
  FROM Date_Dim d
  WHERE d.Cal_Date = TRUNC(o.OrderDateTime)
);

-- Check delivered dates missing from Date_Dim
-- Expected result: no rows
SELECT DISTINCT TRUNC(del.DeliveredDateTime) AS missing_delivered_date
FROM Deliveries del
WHERE del.DeliveredDateTime IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM Date_Dim d
    WHERE d.Cal_Date = TRUNC(del.DeliveredDateTime)
  );
  
-- Check branches missing from Branch_Dim
-- Expected result: no rows
SELECT DISTINCT o.BranchID
FROM Orders o
WHERE NOT EXISTS (
  SELECT 1
  FROM Branch_Dim bd
  WHERE bd.Branch_ID = o.BranchID
);

-- Check customers missing from Customer_Dim
-- Expected result: no rows
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE o.CustomerID IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM Customer_Dim cd
    WHERE cd.Customer_ID = o.CustomerID
  );
  
-- Check staff missing from Staff_Dim
-- Expected result: no rows
SELECT DISTINCT o.StaffID
FROM Orders o
WHERE o.StaffID IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM Staff_Dim sd
    WHERE sd.Staff_ID = o.StaffID
  );

-- Check items missing from Product_Dim
-- Expected result: no rows
SELECT DISTINCT oi.ItemID
FROM Ordered_Items oi
WHERE NOT EXISTS (
  SELECT 1
  FROM Product_Dim p
  WHERE p.Item_ID = oi.ItemID
);


-- Create common staging view for Sales_Fact
CREATE OR REPLACE VIEW Sales_Fact_Stg_V AS
WITH order_lines AS (
  SELECT
    o.OrderID                                   AS Order_ID,
    o.BranchID                                  AS Branch_ID,
    o.CustomerID                                AS Customer_ID,
    o.StaffID                                   AS Staff_ID,
    o.OrderStatus                               AS Order_Status,
    TRUNC(o.OrderDateTime)                      AS Order_Date,

    oi.ItemID                                   AS Item_ID,
    oi.Quantity                                 AS Quantity,

    -- Initial load uses transaction historical price
    oi.UnitPrice                                AS historical_unit_price,

    -- Subsequent load uses latest selling price
    i.SellingUnitPrice                          AS latest_unit_price,

    NVL(o.VoucherDiscountAmount, 0)             AS Voucher_Discount_Total,
    NVL(o.MyKasihSubsidyTotal, 0)               AS MyKasih_Subsidy_Total,

    NVL(del.DeliveryFee, 0)                     AS Delivery_Fee,
    del.City                                    AS City,
    del.State                                   AS State,
    del.PostCode                                AS PostCode,
    TRUNC(del.ScheduledDeliveryDate)            AS Scheduled_Delivery_Date,
    TRUNC(del.DeliveredDateTime)                AS Delivered_Date,
    SUBSTR(dc.CompanyName, 1, 50)               AS Delivery_Company_Name,

    -- Historical gross amount per line and per order
    (oi.Quantity * oi.UnitPrice)                AS hist_line_gross,
    SUM(oi.Quantity * oi.UnitPrice)
      OVER (PARTITION BY o.OrderID)             AS hist_order_gross,

    -- Latest selling-price gross amount per line and per order
    (oi.Quantity * i.SellingUnitPrice)          AS latest_line_gross,
    SUM(oi.Quantity * i.SellingUnitPrice)
      OVER (PARTITION BY o.OrderID)             AS latest_order_gross,

    -- Cumulative historical gross for proportional allocation
    SUM(oi.Quantity * oi.UnitPrice)
      OVER (
        PARTITION BY o.OrderID
        ORDER BY oi.ItemID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      )                                         AS hist_cum_gross,

    -- Cumulative latest gross for proportional allocation
    SUM(oi.Quantity * i.SellingUnitPrice)
      OVER (
        PARTITION BY o.OrderID
        ORDER BY oi.ItemID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      )                                         AS latest_cum_gross

  FROM Orders o
  JOIN Ordered_Items oi
    ON oi.OrderID = o.OrderID
  JOIN Items i
    ON i.ItemID = oi.ItemID
  LEFT JOIN Deliveries del
    ON del.OrderID = o.OrderID
  LEFT JOIN Delivery_Companies dc
    ON dc.DeliveryCompanyID = del.DeliveryCompanyID
),
allocations AS (
  SELECT
    ol.*,

    --------------------------------------------------------------------
    -- Historical voucher discount allocation
    --------------------------------------------------------------------
    CASE
      WHEN hist_order_gross = 0 THEN 0
      ELSE
        ROUND(Voucher_Discount_Total * hist_cum_gross / hist_order_gross, 2)
        - ROUND(Voucher_Discount_Total * (hist_cum_gross - hist_line_gross) / hist_order_gross, 2)
    END AS hist_voucher_discount,

    --------------------------------------------------------------------
    -- Historical MyKasih subsidy allocation
    --------------------------------------------------------------------
    CASE
      WHEN hist_order_gross = 0 THEN 0
      ELSE
        ROUND(MyKasih_Subsidy_Total * hist_cum_gross / hist_order_gross, 2)
        - ROUND(MyKasih_Subsidy_Total * (hist_cum_gross - hist_line_gross) / hist_order_gross, 2)
    END AS hist_mykasih_subsidy,

    --------------------------------------------------------------------
    -- Latest-price voucher discount allocation
    --------------------------------------------------------------------
    CASE
      WHEN latest_order_gross = 0 THEN 0
      ELSE
        ROUND(Voucher_Discount_Total * latest_cum_gross / latest_order_gross, 2)
        - ROUND(Voucher_Discount_Total * (latest_cum_gross - latest_line_gross) / latest_order_gross, 2)
    END AS latest_voucher_discount,

    --------------------------------------------------------------------
    -- Latest-price MyKasih subsidy allocation
    --------------------------------------------------------------------
    CASE
      WHEN latest_order_gross = 0 THEN 0
      ELSE
        ROUND(MyKasih_Subsidy_Total * latest_cum_gross / latest_order_gross, 2)
        - ROUND(MyKasih_Subsidy_Total * (latest_cum_gross - latest_line_gross) / latest_order_gross, 2)
    END AS latest_mykasih_subsidy

  FROM order_lines ol
)
SELECT
  a.Order_ID,
  a.Item_ID,
  a.Order_Date,

  od.Date_Key                                   AS SO_Date_Key,
  bd.Branch_Key                                 AS Branch_Key,

  ----------------------------------------------------------------------
  -- Product_Key lookup from Product_Dim SCD Type 2
  -- Prefer the product version effective at order date.
  -- If no effective version is found, fall back to current version.
  ----------------------------------------------------------------------
  NVL(
    (
      SELECT MAX(p.Product_Key)
      FROM Product_Dim p
      WHERE p.Item_ID = a.Item_ID
        AND a.Order_Date BETWEEN p.Effective_Start_Date AND p.Effective_End_Date
    ),
    NVL(
      (
        SELECT MAX(p.Product_Key)
        FROM Product_Dim p
        WHERE p.Item_ID = a.Item_ID
          AND p.Current_Flag = 'Y'
      ),
      (
        SELECT MAX(p.Product_Key)
        FROM Product_Dim p
        WHERE p.Item_ID = a.Item_ID
      )
    )
  )                                             AS Product_Key,

  cd.Customer_Key                               AS Customer_Key,
  sd.Staff_Key                                  AS Staff_Key,

  a.Delivery_Company_Name                       AS Delivery_Company_Name,

  sdd.Date_Key                                  AS Scheduled_Delivery_Date_Key,
  ddd.Date_Key                                  AS Delivered_Date_Key,

  a.Quantity                                    AS Quantity,

  a.historical_unit_price                       AS historical_unit_price,
  a.latest_unit_price                           AS latest_unit_price,

  a.hist_voucher_discount                       AS hist_voucher_discount_amount,
  a.latest_voucher_discount                     AS latest_voucher_discount_amount,

  a.hist_mykasih_subsidy                        AS hist_mykasih_subsidy_amount,
  a.latest_mykasih_subsidy                      AS latest_mykasih_subsidy_amount,

  ROUND(
    (a.Quantity * a.historical_unit_price)
    - a.hist_mykasih_subsidy
    - a.hist_voucher_discount,
    2
  )                                             AS hist_line_total,

  ROUND(
    (a.Quantity * a.latest_unit_price)
    - a.latest_mykasih_subsidy
    - a.latest_voucher_discount,
    2
  )                                             AS latest_line_total,

  a.Delivery_Fee                                AS Delivery_Fee,
  a.City                                        AS City,
  a.State                                       AS State,
  a.PostCode                                    AS PostCode,
  a.Order_Status				AS SO_Status

FROM allocations a
JOIN Date_Dim od
  ON od.Cal_Date = a.Order_Date
JOIN Branch_Dim bd
  ON bd.Branch_ID = a.Branch_ID
LEFT JOIN Customer_Dim cd
  ON cd.Customer_ID = a.Customer_ID
LEFT JOIN Staff_Dim sd
  ON sd.Staff_ID = a.Staff_ID
LEFT JOIN Date_Dim sdd
  ON sdd.Cal_Date = a.Scheduled_Delivery_Date
LEFT JOIN Date_Dim ddd
  ON ddd.Cal_Date = a.Delivered_Date;
  

-- Initial Loading
DECLARE
  v_inserted NUMBER := 0;
BEGIN
  INSERT INTO Sales_Fact (
    SO_Date_Key,
    Branch_Key,
    Product_Key,
    Customer_Key,
    Staff_Key,
    Order_ID,
    Delivery_Company_Name,
    Scheduled_Delivery_Date_Key,
    Delivered_Date_Key,
    Quantity,
    Unit_Price,
    MyKasih_Subsidy_Amount,
    Voucher_Discount_Amount,
    Line_Total,
    Delivery_Fee,
    City,
    State,
    PostCode,
    SO_Status
  )
  SELECT
    s.SO_Date_Key,
    s.Branch_Key,
    s.Product_Key,
    s.Customer_Key,
    s.Staff_Key,
    s.Order_ID,
    s.Delivery_Company_Name,
    s.Scheduled_Delivery_Date_Key,
    s.Delivered_Date_Key,
    s.Quantity,
    s.historical_unit_price,
    s.hist_mykasih_subsidy_amount,
    s.hist_voucher_discount_amount,
    s.hist_line_total,
    s.Delivery_Fee,
    s.City,
    s.State,
    s.PostCode,
    s.SO_Status
  FROM Sales_Fact_Stg_V s
  WHERE s.Product_Key IS NOT NULL
    AND NOT EXISTS (
      SELECT 1
      FROM Sales_Fact f
      WHERE f.Order_ID = s.Order_ID
        AND EXISTS (
          SELECT 1
          FROM Product_Dim p
          WHERE p.Product_Key = f.Product_Key
            AND p.Item_ID = s.Item_ID
        )
    );

  v_inserted := SQL%ROWCOUNT;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Sales_Fact initial load rows inserted: ' || v_inserted);

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Sales_Fact initial load failed: ' || SQLERRM);
    RAISE;
END;
/

-- Subsequent Loading
DECLARE
  v_merged NUMBER := 0;
BEGIN
  MERGE INTO Sales_Fact T
  USING (
    SELECT s.*
    FROM Sales_Fact_Stg_V s
    WHERE s.Product_Key IS NOT NULL

    --------------------------------------------------------------------
    -- Optional incremental filter.
    -- If you want daily incremental loading, uncomment this:
    --------------------------------------------------------------------
    -- AND s.Order_Date >= TRUNC(SYSDATE) - 1
  ) S
  ON (
    T.Order_ID = S.Order_ID
    AND EXISTS (
      SELECT 1
      FROM Product_Dim p
      WHERE p.Product_Key = T.Product_Key
        AND p.Item_ID = S.Item_ID
    )
  )

  WHEN NOT MATCHED THEN
    INSERT (
      SO_Date_Key,
      Branch_Key,
      Product_Key,
      Customer_Key,
      Staff_Key,
      Order_ID,
      Delivery_Company_Name,
      Scheduled_Delivery_Date_Key,
      Delivered_Date_Key,
      Quantity,
      Unit_Price,
      MyKasih_Subsidy_Amount,
      Voucher_Discount_Amount,
      Line_Total,
      Delivery_Fee,
      City,
      State,
      PostCode,
      SO_Status
    )
    VALUES (
      S.SO_Date_Key,
      S.Branch_Key,
      S.Product_Key,
      S.Customer_Key,
      S.Staff_Key,
      S.Order_ID,
      S.Delivery_Company_Name,
      S.Scheduled_Delivery_Date_Key,
      S.Delivered_Date_Key,
      S.Quantity,
      S.latest_unit_price,
      S.latest_mykasih_subsidy_amount,
      S.latest_voucher_discount_amount,
      S.latest_line_total,
      S.Delivery_Fee,
      S.City,
      S.State,
      S.PostCode,
      S.SO_Status
    );

  v_merged := SQL%ROWCOUNT;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Sales_Fact subsequent load rows inserted/updated: ' || v_merged);

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Sales_Fact subsequent load failed: ' || SQLERRM);
    RAISE;
END;
/



-- Validation after loading the ETL scripts
-- Check total loaded fact rows
SELECT COUNT(*) AS sales_fact_count
FROM Sales_Fact;

-- Check fact rows by order status
SELECT SO_Status,
       COUNT(*) AS record_count
FROM Sales_Fact
GROUP BY SO_Status
ORDER BY SO_Status;

-- Check voucher discount split matches order-level voucher discount
-- Expected result: no rows
SELECT
  f.Order_ID,
  o.VoucherDiscountAmount          AS order_voucher_discount,
  SUM(f.Voucher_Discount_Amount)   AS allocated_voucher_discount,
  ABS(
    SUM(f.Voucher_Discount_Amount) - o.VoucherDiscountAmount
  )                                AS difference
FROM Sales_Fact f
JOIN Orders o
  ON o.OrderID = f.Order_ID
GROUP BY
  f.Order_ID,
  o.VoucherDiscountAmount
HAVING ABS(SUM(f.Voucher_Discount_Amount) - o.VoucherDiscountAmount) > 0.01;

-- Check MyKasih subsidy split matches order-level MyKasih subsidy
-- Expected result: no rows
SELECT
  f.Order_ID,
  o.MyKasihSubsidyTotal            AS order_mykasih_subsidy,
  SUM(f.MyKasih_Subsidy_Amount)    AS allocated_mykasih_subsidy,
  ABS(
    SUM(f.MyKasih_Subsidy_Amount) - o.MyKasihSubsidyTotal
  )                                AS difference
FROM Sales_Fact f
JOIN Orders o
  ON o.OrderID = f.Order_ID
GROUP BY
  f.Order_ID,
  o.MyKasihSubsidyTotal
HAVING ABS(SUM(f.MyKasih_Subsidy_Amount) - o.MyKasihSubsidyTotal) > 0.01;

-- Check delivery fee is repeated consistently per order
-- Expected result: no rows
SELECT
  Order_ID,
  MIN(Delivery_Fee) AS min_delivery_fee,
  MAX(Delivery_Fee) AS max_delivery_fee
FROM Sales_Fact
GROUP BY Order_ID
HAVING MIN(Delivery_Fee) <> MAX(Delivery_Fee);

-- Check guest orders are included
SELECT COUNT(*) AS guest_order_line_count
FROM Sales_Fact f
JOIN Orders o
  ON o.OrderID = f.Order_ID
WHERE o.CustomerID IS NULL;


