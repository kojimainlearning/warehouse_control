SET SERVEROUTPUT ON SIZE UNLIMITED;
SET DEFINE OFF;
SET SQLBLANKLINES ON;

DECLARE
    v_seq_exists NUMBER;
    v_seq_name   VARCHAR2(30) := 'SUPPLIER_DIM_SEQ';
BEGIN
    SELECT COUNT(*)
    INTO v_seq_exists
    FROM user_sequences
    WHERE sequence_name = v_seq_name;

    IF v_seq_exists > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || v_seq_name;
        DBMS_OUTPUT.PUT_LINE('Sequence ' || v_seq_name || ' dropped successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Sequence ' || v_seq_name || ' does not exist. A fresh sequence will be created.');
    END IF;
END;
/

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
