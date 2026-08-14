DROP SEQUENCE Supplier_Dim_Seq;

CREATE SEQUENCE Supplier_Dim_Seq
START WITH 1
INCREMENT BY 1;

MERGE INTO Supplier_Dim T
USING (
    SELECT
        SupplierID,
        SupplierName,
        Status,
        City,
        State,
        PostCode
    FROM Suppliers
) S
ON (T.Supplier_ID = S.SupplierID)

WHEN MATCHED THEN
    UPDATE SET
        T.Supplier_Name   = S.SupplierName,
        T.Supplier_Status = S.Status,
        T.City            = S.City,
        T.State           = S.State,
        T.PostCode        = S.PostCode

WHEN NOT MATCHED THEN
    INSERT (
        Supplier_Key,
        Supplier_ID,
        Supplier_Name,
        Supplier_Status,
        City,
        State,
        PostCode
    )
    VALUES (
        Supplier_Dim_Seq.NEXTVAL,
        S.SupplierID,
        S.SupplierName,
        S.Status,
        S.City,
        S.State,
        S.PostCode
    );

COMMIT;
