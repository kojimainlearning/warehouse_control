SET SERVEROUTPUT ON SIZE UNLIMITED;
SET DEFINE OFF;
SET SQLBLANKLINES ON;

DECLARE
    v_seq_exists NUMBER;
    v_seq_name   VARCHAR2(30) := 'STAFF_DIM_SEQ';
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

CREATE SEQUENCE Staff_Dim_Seq
  START WITH 1
  INCREMENT BY 1;

MERGE INTO Staff_Dim T
USING (
    SELECT
        StaffID,
        StaffName,
        Role,
        HireDate,
        ResignedDate
    FROM Staffs
) S
ON (T.Staff_ID = S.StaffID)

WHEN MATCHED THEN
    UPDATE SET
        T.Staff_Name    = S.StaffName,
        T.Role          = S.Role,
        T.Hire_Date     = S.HireDate,
        T.Resigned_Date = S.ResignedDate

WHEN NOT MATCHED THEN
    INSERT (
        Staff_Key,
        Staff_ID,
        Staff_Name,
        Role,
        Hire_Date,
        Resigned_Date
    )
    VALUES (
        Staff_Dim_Seq.NEXTVAL,
        S.StaffID,
        S.StaffName,
        S.Role,
        S.HireDate,
        S.ResignedDate
    );

COMMIT;
