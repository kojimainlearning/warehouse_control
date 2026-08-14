-- Ensure the sequence name is consistent
DROP SEQUENCE Product_Dim_Seq;

CREATE SEQUENCE Product_Dim_Seq
START WITH 1
INCREMENT BY 1;

-- Step 1 — Close changed records
UPDATE Product_Dim T
SET
    T.Effective_End_Date = TRUNC(SYSDATE) - 1,
    T.Current_Flag = 'N'
WHERE T.Current_Flag = 'Y'
AND EXISTS (
    SELECT 1
    FROM Items I
    JOIN Product_Categories PC
        ON I.CategoryID = PC.CategoryID
    WHERE I.ItemID = T.Item_ID
    AND (
           NVL(I.ItemName, ' ') 
               <> NVL(T.Item_Name, ' ')
        OR NVL(I.UnitMeasure, ' ')
               <> NVL(T.Unit_Measure, ' ')
        OR NVL(I.SellingUnitPrice, -1)
               <> NVL(T.Selling_Unit_Price, -1)
        OR NVL(I.PurchaseUnitPrice, -1)
               <> NVL(T.Purchase_Unit_Price, -1)
        OR NVL(I.IsHalal, ' ')
               <> NVL(T.Is_Halal, ' ')
        OR NVL(PC.CategoryName, ' ')
               <> NVL(T.Category_Name, ' ')
    )
);

-- Step 2 — Insert new/changed records
INSERT INTO Product_Dim (
    Product_Key,
    Item_ID,
    Item_Name,
    Unit_Measure,
    Selling_Unit_Price,      
    Purchase_Unit_Price,     
    Is_Halal,
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
    PC.CategoryName,
    TRUNC(SYSDATE),
    TO_DATE('31-DEC-9999', 'DD-MON-YYYY'),
    'Y'
FROM Items I
JOIN Product_Categories PC
    ON I.CategoryID = PC.CategoryID
WHERE NOT EXISTS (
    SELECT 1
    FROM Product_Dim P
    WHERE P.Item_ID = I.ItemID
      AND P.Current_Flag = 'Y'
      AND NVL(P.Item_Name, ' ')
          = NVL(I.ItemName, ' ')
      AND NVL(P.Unit_Measure, ' ')
          = NVL(I.UnitMeasure, ' ')
      AND NVL(P.Selling_Unit_Price, -1)
          = NVL(I.SellingUnitPrice, -1)
      AND NVL(P.Purchase_Unit_Price, -1)
          = NVL(I.PurchaseUnitPrice, -1)
      AND NVL(P.Is_Halal, ' ')
          = NVL(I.IsHalal, ' ')
      AND NVL(P.Category_Name, ' ')
          = NVL(PC.CategoryName, ' ')
);

COMMIT;