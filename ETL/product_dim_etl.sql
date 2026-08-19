-- Ensure the sequence name is consistent
DROP SEQUENCE Product_Dim_Seq;

CREATE SEQUENCE Product_Dim_Seq
START WITH 1
INCREMENT BY 1;
----------------------------------
--   STEP 1 (Initial Loading)
-- Historical Backfill 
----------------------------------
INSERT INTO Product_Dim
(
    Product_Key,
    Item_ID,
    Item_Name,
    Unit_Measure,
    Selling_Unit_Price,
    Purchase_Unit_Price,
    Is_Halal,
    Is_MyKasih_Eligible,
    Category_Name,
    Effective_Start_Date,
    Effective_End_Date,
    Current_Flag
)
WITH
Selling_History AS
(
    SELECT
        OI.ItemID,
        O.OrderDateTime AS Price_DateTime,
        OI.UnitPrice AS Selling_Price,
        O.OrderID AS Reference_ID
    FROM Orders O
    JOIN Ordered_Items OI
        ON O.OrderID = OI.OrderID
    WHERE OI.UnitPrice IS NOT NULL
),
Purchase_History AS
(
    SELECT
        POI.ItemID,
        PO.OrderDate AS Price_DateTime,
        POI.UnitCost AS Purchase_Price,
        PO.PurchaseOrderID AS Reference_ID
    FROM Purchase_Orders PO
    JOIN Purchase_Order_Items POI
        ON PO.PurchaseOrderID = POI.PurchaseOrderID
    WHERE POI.UnitCost IS NOT NULL
      AND PO.Status = 'RECEIVED' 
),
All_Price_Events AS
(
    SELECT
        ItemID,
        Price_DateTime,
        Selling_Price,
        CAST(NULL AS NUMBER) AS Purchase_Price,
        Reference_ID,
        'S' AS Event_Type
    FROM Selling_History
    UNION ALL
    SELECT
        ItemID,
        Price_DateTime,
        CAST(NULL AS NUMBER) AS Selling_Price,
        Purchase_Price,
        Reference_ID,
        'P' AS Event_Type
    FROM Purchase_History
),
Price_Timeline AS
(
    SELECT
        E.ItemID,
        E.Price_DateTime,
        E.Reference_ID,
        E.Event_Type,
        LAST_VALUE(E.Selling_Price IGNORE NULLS) OVER
        (
            PARTITION BY E.ItemID
            ORDER BY E.Price_DateTime, E.Event_Type, E.Reference_ID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS Selling_Price,
        LAST_VALUE(E.Purchase_Price IGNORE NULLS) OVER
        (
            PARTITION BY E.ItemID
            ORDER BY E.Price_DateTime, E.Event_Type, E.Reference_ID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS Purchase_Price
    FROM All_Price_Events E
),
Price_Timeline_Filled AS
(
    SELECT
        ItemID,
        Price_DateTime,
        Reference_ID,
        Event_Type,
        NVL(Selling_Price,
            FIRST_VALUE(Selling_Price IGNORE NULLS) OVER (
                PARTITION BY ItemID ORDER BY Price_DateTime, Event_Type, Reference_ID
                ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
            )
        ) AS Selling_Price,
        NVL(Purchase_Price,
            FIRST_VALUE(Purchase_Price IGNORE NULLS) OVER (
                PARTITION BY ItemID ORDER BY Price_DateTime, Event_Type, Reference_ID
                ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
            )
        ) AS Purchase_Price
    FROM Price_Timeline
),
Latest_Event_Per_Date AS
(
    SELECT
        ItemID,
        Price_DateTime,
        Reference_ID,
        Event_Type,
        Selling_Price,
        Purchase_Price,
        ROW_NUMBER() OVER
        (
            PARTITION BY ItemID, Price_DateTime
            ORDER BY Event_Type DESC, Reference_ID DESC
        ) AS Row_Num
    FROM Price_Timeline_Filled
),
Ordered_Timeline AS
(
    SELECT
        ItemID,
        Price_DateTime,
        Selling_Price,
        Purchase_Price,
        ROW_NUMBER() OVER
        (
            PARTITION BY ItemID
            ORDER BY Price_DateTime
        ) AS Version_Row_Num,
        LAG(Selling_Price) OVER
        (
            PARTITION BY ItemID
            ORDER BY Price_DateTime
        ) AS Previous_Selling_Price,
        LAG(Purchase_Price) OVER
        (
            PARTITION BY ItemID
            ORDER BY Price_DateTime
        ) AS Previous_Purchase_Price
    FROM Latest_Event_Per_Date
    WHERE Row_Num = 1
),
Changed_Versions AS
(
    -- A row is a genuine new SCD2 version only if it is the very first
    -- row for the item (Version_Row_Num = 1), or if the selling price
    -- or purchase price actually differs from the prior version.
    -- NOTE: we deliberately do NOT treat "Previous_Selling_Price IS NULL"
    -- (or Purchase) as a change trigger on its own, because that column
    -- can legitimately still be NULL on a non-first row simply because
    -- that price type hasn't occurred yet for the item (e.g. several
    -- purchase events before the item's first ever sale). Using it as an
    -- OR condition was causing every such row to be kept as a "change"
    -- even when nothing had actually changed.
    SELECT
        ItemID,
        Price_DateTime,
        Selling_Price,
        Purchase_Price
    FROM Ordered_Timeline
    WHERE Version_Row_Num = 1
       OR NVL(Selling_Price, -1) <> NVL(Previous_Selling_Price, -1)
       OR NVL(Purchase_Price, -1) <> NVL(Previous_Purchase_Price, -1)
),
SCD2_Timeline AS
(
    SELECT
        ItemID,
        Price_DateTime,
        Selling_Price,
        Purchase_Price,
        LEAD(Price_DateTime) OVER
        (
            PARTITION BY ItemID
            ORDER BY Price_DateTime
        ) AS Next_Price_DateTime
    FROM Changed_Versions
)
SELECT
    Product_Dim_Seq.NEXTVAL,
    I.ItemID,
    I.ItemName,
    I.UnitMeasure,
    T.Selling_Price,
    T.Purchase_Price,
    I.IsHalal,
    I.IsMyKasihEligible,
    PC.CategoryName,
    T.Price_DateTime,
    NVL(T.Next_Price_DateTime, TO_DATE('9999-12-31', 'YYYY-MM-DD')),
    CASE
        WHEN T.Next_Price_DateTime IS NULL THEN 'Y'
        ELSE 'N'
    END
FROM SCD2_Timeline T
JOIN Items I
    ON T.ItemID = I.ItemID
JOIN Product_Categories PC
    ON I.CategoryID = PC.CategoryID;

----------------------------------
--Step 2 (Incremental Loading)
--TRUNC(SYSDATE) - (1 / 86400) means 23:59:59 yesterday, which is safer when Effective_Start_Date includes a time component.
--If current Items table Unit Price has changed, Modify the Flag -> N in Product_Dim
----------------------------------
UPDATE Product_Dim T
SET
    Effective_End_Date = TRUNC(SYSDATE) - (1 / 86400),
    Current_Flag = 'N'
WHERE T.Current_Flag = 'Y'
  AND T.Effective_Start_Date < TRUNC(SYSDATE)
  AND EXISTS
  (
      SELECT 1
      FROM Items I
      JOIN Product_Categories PC
          ON PC.CategoryID = I.CategoryID
      WHERE I.ItemID = T.Item_ID
        AND
        (
               NVL(I.ItemName, ' ') <> NVL(T.Item_Name, ' ')
            OR NVL(I.UnitMeasure, ' ') <> NVL(T.Unit_Measure, ' ')
            OR NVL(I.SellingUnitPrice, -1) <> NVL(T.Selling_Unit_Price, -1)
            OR NVL(I.PurchaseUnitPrice, -1) <> NVL(T.Purchase_Unit_Price, -1)
            OR NVL(I.IsHalal, ' ') <> NVL(T.Is_Halal, ' ')
            OR NVL(I.IsMyKasihEligible, ' ') <> NVL(T.Is_MyKasih_Eligible, ' ')
            OR NVL(PC.CategoryName, ' ') <> NVL(T.Category_Name, ' ')
        )
  );
  
----------------------------------
--Step 3 (Incremental Loading)
--Insert the Latest Version Unit Price from Items and Product Categories with current flag Y
----------------------------------
INSERT INTO Product_Dim
(
    Product_Key,
    Item_ID,
    Item_Name,
    Unit_Measure,
    Selling_Unit_Price,
    Purchase_Unit_Price,
    Is_Halal,
    Is_MyKasih_Eligible,
    Category_Name,
    Effective_Start_Date,
    Effective_End_Date,
    Current_Flag
)
SELECT
    Product_Dim_Seq.NEXTVAL,
    I.ItemID,
    I.ItemName,
    I.UnitMeasure,
    I.SellingUnitPrice,
    I.PurchaseUnitPrice,
    I.IsHalal,
    I.IsMyKasihEligible,
    PC.CategoryName,
    TRUNC(SYSDATE),
    DATE '9999-12-31',
    'Y'
FROM Items I
JOIN Product_Categories PC
    ON PC.CategoryID = I.CategoryID
WHERE NOT EXISTS
(
    SELECT 1
    FROM Product_Dim P
    WHERE P.Item_ID = I.ItemID
      AND P.Current_Flag = 'Y'
);

COMMIT;
