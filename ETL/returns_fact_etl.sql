
SET SERVEROUTPUT ON   
SET ECHO OFF           
SET TERMOUT OFF       
SET PAGESIZE 50000   
SET LINESIZE 200    
SET FEEDBACK ON

SPOOL "C:\Users\isaac\Downloads\output.log";

DECLARE
  v_pk_constraint_name USER_CONSTRAINTS.CONSTRAINT_NAME%TYPE;
BEGIN
  SELECT constraint_name
    INTO v_pk_constraint_name
    FROM user_constraints
   WHERE table_name = 'RETURNS_FACT'
     AND constraint_type = 'P';

  EXECUTE IMMEDIATE 'ALTER TABLE Returns_Fact DROP CONSTRAINT ' || v_pk_constraint_name;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No existing PK constraint found on Returns_Fact - skipping drop.');
END;
/


CREATE OR REPLACE FUNCTION fn_get_date_key(p_date IN DATE)
RETURN Date_Dim.Date_Key%TYPE
IS
  v_date_key Date_Dim.Date_Key%TYPE;
BEGIN
  IF p_date IS NULL THEN
    RETURN NULL;
  END IF;

  SELECT Date_Key
    INTO v_date_key
    FROM Date_Dim
   WHERE Cal_Date = TRUNC(p_date);

  RETURN v_date_key;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001,
      'fn_get_date_key: no Date_Dim row for ' || TO_CHAR(p_date, 'YYYY-MM-DD'));
END fn_get_date_key;
/



CREATE OR REPLACE VIEW vw_returns_fact_source AS
SELECT
    fn_get_date_key(rr.RequestDate)            AS Request_Date_Key,
    bd.Branch_Key                               AS Branch_Key,
    std.Staff_Key                               AS Staff_Key,   
    cd.Customer_Key                             AS Customer_Key,  
    pd.Product_Key                              AS Product_Key,
    rr.ReturnID                                 AS Return_ID,
    fn_get_date_key(rr.ProcessedDate)           AS Processed_Date_Key,
    rr.ReturnReason                             AS Return_Reason,
    rr.QuantityReturned                         AS Quantity_Returned,
    rr.ResolutionType                           AS Resolution_Type,
    rr.RefundAmount                             AS Refund_Amount,
    rr.Status                                   AS Return_Status
FROM Return_Requests rr
JOIN Orders          o   ON o.OrderID    = rr.OrderID
JOIN Branch_Dim      bd  ON bd.Branch_ID = o.BranchID
JOIN Product_Dim     pd  ON pd.Item_ID   = rr.ItemID
                         AND rr.RequestDate >= pd.Effective_Start_Date
                         AND rr.RequestDate <  NVL(pd.Effective_End_Date, DATE '9999-12-31')
LEFT JOIN Staff_Dim    std ON std.Staff_ID    = rr.StaffID
LEFT JOIN Customer_Dim cd  ON cd.Customer_ID  = o.CustomerID;



CREATE OR REPLACE PROCEDURE etl_returns_fact_initial_load
IS
  v_row_count PLS_INTEGER;
BEGIN
  EXECUTE IMMEDIATE 'TRUNCATE TABLE Returns_Fact';

  INSERT INTO Returns_Fact (
      Request_Date_Key, Branch_Key, Staff_Key, Customer_Key, Product_Key,
      Return_ID, Processed_Date_Key, Return_Reason, Quantity_Returned,
      Resolution_Type, Refund_Amount, Return_Status
  )
  SELECT
      Request_Date_Key, Branch_Key, Staff_Key, Customer_Key, Product_Key,
      Return_ID, Processed_Date_Key, Return_Reason, Quantity_Returned,
      Resolution_Type, Refund_Amount, Return_Status
  FROM vw_returns_fact_source;

  v_row_count := SQL%ROWCOUNT;
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Returns_Fact initial load complete. Rows inserted: ' || v_row_count);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Returns_Fact initial load FAILED: ' || SQLERRM);
    RAISE;
END etl_returns_fact_initial_load;
/


CREATE OR REPLACE PROCEDURE etl_returns_fact_incremental_load
IS
  v_inserted PLS_INTEGER;
  v_updated  PLS_INTEGER;
BEGIN
  MERGE INTO Returns_Fact tgt
  USING vw_returns_fact_source src
     ON (tgt.Return_ID = src.Return_ID)
  WHEN MATCHED THEN
    UPDATE SET
      tgt.Request_Date_Key    = src.Request_Date_Key,
      tgt.Branch_Key          = src.Branch_Key,
      tgt.Staff_Key           = src.Staff_Key,
      tgt.Customer_Key        = src.Customer_Key,
      tgt.Product_Key         = src.Product_Key,
      tgt.Processed_Date_Key  = src.Processed_Date_Key,
      tgt.Return_Reason       = src.Return_Reason,
      tgt.Quantity_Returned   = src.Quantity_Returned,
      tgt.Resolution_Type     = src.Resolution_Type,
      tgt.Refund_Amount       = src.Refund_Amount,
      tgt.Return_Status       = src.Return_Status
    WHERE
         NVL(tgt.Staff_Key,-1)          != NVL(src.Staff_Key,-1)
      OR NVL(tgt.Customer_Key,-1)       != NVL(src.Customer_Key,-1)
      OR NVL(tgt.Product_Key,-1)        != NVL(src.Product_Key,-1)
      OR NVL(tgt.Processed_Date_Key,-1) != NVL(src.Processed_Date_Key,-1)
      OR NVL(tgt.Resolution_Type,'~')   != NVL(src.Resolution_Type,'~')
      OR NVL(tgt.Refund_Amount,-1)      != NVL(src.Refund_Amount,-1)
      OR tgt.Return_Status              != src.Return_Status
      OR tgt.Quantity_Returned          != src.Quantity_Returned
  WHEN NOT MATCHED THEN
    INSERT (
      Request_Date_Key, Branch_Key, Staff_Key, Customer_Key, Product_Key,
      Return_ID, Processed_Date_Key, Return_Reason, Quantity_Returned,
      Resolution_Type, Refund_Amount, Return_Status
    )
    VALUES (
      src.Request_Date_Key, src.Branch_Key, src.Staff_Key, src.Customer_Key, src.Product_Key,
      src.Return_ID, src.Processed_Date_Key, src.Return_Reason, src.Quantity_Returned,
      src.Resolution_Type, src.Refund_Amount, src.Return_Status
    );

  v_updated := SQL%ROWCOUNT;  
  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Returns_Fact incremental load complete. Rows affected (inserted+updated): ' || v_updated);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Returns_Fact incremental load FAILED: ' || SQLERRM);
    RAISE;
END etl_returns_fact_incremental_load;
/

SPOOL OFF;


First-time load:
EXEC etl_returns_fact_initial_load;
