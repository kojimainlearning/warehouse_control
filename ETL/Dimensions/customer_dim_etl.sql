SET SERVEROUTPUT ON;
SET SQLBLANKLINES ON;
SET DEFINE OFF;

-- Create sequence for Customer_Key if it does not exist 
DECLARE
    v_seq_exists NUMBER;
    v_seq_name   VARCHAR2(30) := 'CUSTOMER_DIM_SEQ';
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


CREATE SEQUENCE Customer_Dim_Seq
  START WITH 1
  INCREMENT BY 1
  CACHE 20
  NOCYCLE;

-- Create staging view for Customer_Dim
CREATE OR REPLACE VIEW Customer_Dim_Stg_V AS
SELECT
  c.CustomerID                          AS Customer_ID,
  c.CustomerName                        AS Customer_Name,

  CASE
    WHEN EXISTS (
      SELECT 1
      FROM MyKasih_Beneficiaries b
      WHERE b.CustomerID = c.CustomerID
        AND TRUNC(SYSDATE) BETWEEN TRUNC(b.ValidFrom)
                               AND TRUNC(b.ValidUntil)
    )
    THEN 'Y'
    ELSE 'N'
  END                                   AS Is_Beneficiary,

  NVL(t.TierName, 'Non-Member')         AS Tier_Name,
  mp.JoinDate                           AS Join_Date

FROM Customers c
LEFT JOIN Member_Profiles mp
  ON mp.CustomerID = c.CustomerID
LEFT JOIN Member_Tiers t
  ON t.TierID = mp.TierID;

-- Initial load into Customer_Dim
DECLARE
  v_rows_loaded NUMBER := 0;
BEGIN
  MERGE INTO Customer_Dim d
  USING Customer_Dim_Stg_V s
  ON (d.Customer_ID = s.Customer_ID)

  WHEN NOT MATCHED THEN
    INSERT (
      Customer_Key,
      Customer_ID,
      Customer_Name,
      Is_Beneficiary,
      Tier_Name,
      Join_Date
    )
    VALUES (
      Customer_Dim_SEQ.NEXTVAL,
      s.Customer_ID,
      s.Customer_Name,
      s.Is_Beneficiary,
      s.Tier_Name,
      s.Join_Date
    );

  v_rows_loaded := SQL%ROWCOUNT;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Customer_Dim rows inserted: ' || v_rows_loaded);

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Customer_Dim load failed: ' || SQLERRM);
    RAISE;
END;
/


-- For Subsequent Loading
-- Creates sequence starting after the current maximum Customer_Key if it does not exist
DECLARE
  v_seq_exists NUMBER;
  v_max_key    NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_seq_exists
  FROM user_sequences
  WHERE sequence_name = 'CUSTOMER_DIM_SEQ';

  IF v_seq_exists = 0 THEN
    SELECT NVL(MAX(Customer_Key), 0) + 1
    INTO v_max_key
    FROM Customer_Dim;

    EXECUTE IMMEDIATE
      'CREATE SEQUENCE Customer_Dim_SEQ
         START WITH ' || v_max_key || '
         INCREMENT BY 1
         CACHE 20
         NOCYCLE';

    DBMS_OUTPUT.PUT_LINE('Created Customer_Dim_SEQ starting at ' || v_max_key);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Customer_Dim_SEQ already exists.');
  END IF;
END;
/

-- Merge load into Customer_Dim
DECLARE
  v_rows_loaded NUMBER := 0;
BEGIN
  MERGE INTO Customer_Dim d
  USING Customer_Dim_Stg_V s
  ON (d.Customer_ID = s.Customer_ID)

  WHEN NOT MATCHED THEN
    INSERT (
      Customer_Key,
      Customer_ID,
      Customer_Name,
      Is_Beneficiary,
      Tier_Name,
      Join_Date
    )
    VALUES (
      Customer_Dim_SEQ.NEXTVAL,
      s.Customer_ID,
      s.Customer_Name,
      s.Is_Beneficiary,
      s.Tier_Name,
      s.Join_Date
    );

  v_rows_loaded := SQL%ROWCOUNT;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Customer_Dim subsequent load rows inserted: ' || v_rows_loaded);

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Customer_Dim subsequent load failed: ' || SQLERRM);
    RAISE;
END;
/


-- Validation Queries
-- Check total loaded customers
SELECT COUNT(*) AS customer_dim_count
FROM Customer_Dim;

-- Check source staging count
SELECT COUNT(*) AS staging_count
FROM Customer_Dim_Stg_V;

-- Check loaded beneficiary count
SELECT Is_Beneficiary,
       COUNT(*) AS customer_count
FROM Customer_Dim
GROUP BY Is_Beneficiary
ORDER BY Is_Beneficiary;

-- Check tier distribution
SELECT Tier_Name,
       COUNT(*) AS customer_count
FROM Customer_Dim
GROUP BY Tier_Name
ORDER BY Tier_Name;

-- Check for missing customers between source and dimension
-- Expected result: no rows
SELECT s.Customer_ID
FROM Customer_Dim_Stg_V s
WHERE NOT EXISTS (
  SELECT 1
  FROM Customer_Dim d
  WHERE d.Customer_ID = s.Customer_ID
);


