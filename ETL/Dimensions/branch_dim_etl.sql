SET SERVEROUTPUT ON SIZE UNLIMITED;
SET DEFINE OFF;
SET SQLBLANKLINES ON;

DECLARE
    v_seq_exists NUMBER;
    v_seq_name   VARCHAR2(30) := 'BRANCH_DIM_SEQ';
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

CREATE SEQUENCE Branch_Dim_Seq
START WITH 1
INCREMENT BY 1;


MERGE INTO Branch_Dim T
USING (
    SELECT
        BranchID,
        BranchName,
        City,
        State,
        PostCode,                     
        OpeningDate,
        ClosingDate
    FROM Branches
) S
ON (T.Branch_ID = S.BranchID)

WHEN MATCHED THEN
    UPDATE SET
        T.Branch_Name  = S.BranchName,
        T.City         = S.City,
        T.State        = S.State,
        T.Post_Code    = S.PostCode,
        T.Opening_Date = S.OpeningDate,
        T.Closing_Date = S.ClosingDate

WHEN NOT MATCHED THEN
    INSERT (
        Branch_Key,
        Branch_ID,
        Branch_Name,
        City,
        State,
        Post_Code,
        Opening_Date,
        Closing_Date
    )
    VALUES (
        Branch_Dim_Seq.NEXTVAL,
        S.BranchID,
        S.BranchName,
        S.City,
        S.State,
        S.PostCode,
        S.OpeningDate,
        S.ClosingDate
    );

COMMIT;
