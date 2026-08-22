-- Run this once against the shared schema before running the ETL below.
-- CREATE TABLE Delivery_Company_Dim (
--     Delivery_Company_Key   NUMBER NOT NULL,
--     Company_ID             VARCHAR2(10) NOT NULL,
--     Company_Name           VARCHAR2(120) NOT NULL,
--     Status                 VARCHAR2(15) DEFAULT 'ACTIVE' NOT NULL,
--     CONSTRAINT PK_Delivery_Company_Dim PRIMARY KEY (Delivery_Company_Key),
--     CONSTRAINT FK_DC_Dim_Company_ID FOREIGN KEY (Company_ID) REFERENCES Delivery_Companies(DeliveryCompanyID)
-- );

SET SERVEROUTPUT ON;
SET SQLBLANKLINES ON;
SET DEFINE OFF;

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
SELECT COUNT(*) AS delivery_company_dim_count
FROM Delivery_Company_Dim;

SELECT Status, COUNT(*) AS company_count
FROM Delivery_Company_Dim
GROUP BY Status
ORDER BY Status;

SELECT DISTINCT sf.Delivery_Company_Name
FROM Sales_Fact sf
WHERE sf.Delivery_Company_Name IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM Delivery_Company_Dim dcd
      WHERE dcd.Company_Name = sf.Delivery_Company_Name
  );