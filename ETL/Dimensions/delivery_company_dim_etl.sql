SET SERVEROUTPUT ON;
SET SQLBLANKLINES ON;
SET DEFINE OFF;

-- Create sequence
DECLARE
  v_seq_exists NUMBER;
  v_max_key    NUMBER;
BEGIN
  SELECT COUNT(*)
  INTO v_seq_exists
  FROM user_sequences
  WHERE sequence_name = 'DELIVERY_COMPANY_DIM_SEQ';

  IF v_seq_exists = 0 THEN
    SELECT NVL(MAX(Delivery_Company_Key), 0) + 1
    INTO v_max_key
    FROM Delivery_Company_Dim;

    EXECUTE IMMEDIATE
      'CREATE SEQUENCE Delivery_Company_Dim_Seq
         START WITH ' || v_max_key || '
         INCREMENT BY 1';

    DBMS_OUTPUT.PUT_LINE('Created Delivery_Company_Dim_Seq starting at ' || v_max_key);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Delivery_Company_Dim_Seq already exists.');
  END IF;
END;
/

-- Initial load
DECLARE
  v_rows_loaded NUMBER := 0;
BEGIN
  MERGE INTO Delivery_Company_Dim T
  USING (
      SELECT
          DeliveryCompanyID,
          CompanyName,
          Status
      FROM Delivery_Companies
  ) S
  ON (T.Company_ID = S.DeliveryCompanyID)

  WHEN MATCHED THEN
      UPDATE SET
          T.Company_Name = S.CompanyName,
          T.Status       = S.Status

  WHEN NOT MATCHED THEN
      INSERT (
          Delivery_Company_Key,
          Company_ID,
          Company_Name,
          Status
      )
      VALUES (
          Delivery_Company_Dim_Seq.NEXTVAL,
          S.DeliveryCompanyID,
          S.CompanyName,
          S.Status
      );

  v_rows_loaded := SQL%ROWCOUNT;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Delivery_Company_Dim rows affected: ' || v_rows_loaded);

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Delivery_Company_Dim load failed: ' || SQLERRM);
    RAISE;
END;
/


-- Validation queries
-- Check total number of delivery companies loaded.
SELECT COUNT(*) AS delivery_company_dim_count
FROM Delivery_Company_Dim;

-- Check delivery companies by status.
SELECT
    Status,
    COUNT(*) AS company_count
FROM Delivery_Company_Dim
GROUP BY Status
ORDER BY Status;

-- Check that every source delivery company exists in the dimension.
-- Expected result: NO ROWS.
SELECT
    dc.DeliveryCompanyID,
    dc.CompanyName
FROM Delivery_Companies dc
WHERE NOT EXISTS (
    SELECT 1
    FROM Delivery_Company_Dim dcd
    WHERE dcd.Company_ID = dc.DeliveryCompanyID
);

-- Check that every delivery company used by Deliveries
-- can be resolved to Delivery_Company_Dim.
-- Expected result: NO ROWS.
SELECT DISTINCT
    del.DeliveryCompanyID
FROM Deliveries del
WHERE del.DeliveryCompanyID IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM Delivery_Company_Dim dcd
      WHERE dcd.Company_ID = del.DeliveryCompanyID
  );
  
-- Check for duplicate Company_ID values in the dimension.
-- Expected result: NO ROWS.
SELECT
    Company_ID,
    COUNT(*) AS duplicate_count
FROM Delivery_Company_Dim
GROUP BY Company_ID
HAVING COUNT(*) > 1;


-- Subsequent load
DECLARE
    v_rows_loaded NUMBER := 0;
BEGIN
    MERGE INTO Delivery_Company_Dim T
	
    USING (
        SELECT
            DeliveryCompanyID,
            CompanyName,
            Status
        FROM Delivery_Companies
    ) S
    ON (T.Company_ID = S.DeliveryCompanyID)
	
    WHEN MATCHED THEN
        UPDATE SET
            T.Company_Name = S.CompanyName,
            T.Status       = S.Status
			
    WHEN NOT MATCHED THEN
        INSERT (
            Delivery_Company_Key,
            Company_ID,
            Company_Name,
            Status
        )
        VALUES (
            Delivery_Company_Dim_Seq.NEXTVAL,
            S.DeliveryCompanyID,
            S.CompanyName,
            S.Status
        );
		
    v_rows_loaded := SQL%ROWCOUNT;
	
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Delivery_Company_Dim subsequent load rows affected: ' || v_rows_loaded);

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Delivery_Company_Dim subsequent load failed: ' || SQLERRM);
        RAISE;
END;
/
