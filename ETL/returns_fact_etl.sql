/*==============================================================================
  ETL SCRIPT: Returns_Fact
  Source     : Return_Requests, Orders
  Target     : Returns_Fact (star schema fact table)
  Platform   : Oracle PL/SQL

  GRAIN OF Returns_Fact:
    One row per Return Request (Return_ID is the true, already-unique
    natural key from the source system). The other PK columns
    (Request_Date_Key, Branch_Key, Staff_Key, Customer_Key, Product_Key)
    are conformed dimension attributes of that same return.

  ASSUMPTIONS (confirm / adjust if wrong):
    1. Returns_Fact.Return_ID is the enforced PRIMARY KEY (it is already
       unique at source). Staff_Key and Customer_Key are ordinary
       NULLABLE foreign key columns - see the STEP 0 schema change below
       for why (Customer_Dim / Staff_Dim reject synthetic "unknown"
       members due to their own constraints).
       - Customer_Key is NULL for guest/walk-in orders
         (Orders.CustomerID IS NULL).
       - Staff_Key is NULL until the return is processed
         (Return_Requests.StaffID IS NULL while Status = 'PENDING',
         per CK_Return_Processing). The incremental MERGE fills this
         in automatically once the return is processed.
    2. Product_Dim is a Type-2 SCD (Effective_Start_Date / Effective_End_Date).
       The Product_Key that applies is the one whose date range contains
       Return_Requests.RequestDate. An open-ended End_Date (NULL) is
       treated as "still current" (defaulted to 31-DEC-9999).
    3. Branch_Dim and Staff_Dim are NOT versioned (no effective-dated
       lookup needed) - a plain natural-key match is used.
    4. Date_Key format is unknown, so it is resolved via a join to
       Date_Dim.Cal_Date rather than assumed/derived (e.g. YYYYMMDD int).
    5. Every RequestDate and (when present) ProcessedDate has a
       corresponding row in Date_Dim already (dates are pre-populated).

  If any of these assumptions don't match your actual dimension design,
  let me know and I'll adjust the lookups accordingly.
==============================================================================*/


/*------------------------------------------------------------------------
  STEP 0: One-time schema change on Returns_Fact
  ---------------------------------------------------------------------
  Customer_Dim.Customer_ID has an FK back to the source Customers table,
  and Staff_Dim.Hire_Date is NOT NULL - so a synthetic "Unknown" member
  row cannot be fabricated in either dimension (confirmed by the
  ORA-02291 / ORA-01400 errors when that was attempted).

  The correct fix: Return_ID is already unique on its own (it's the PK
  of the source Return_Requests table), so it - not the full composite
  of dimension keys - should be the enforced primary key of
  Returns_Fact. Staff_Key and Customer_Key become ordinary NULLABLE FK
  columns, which also matches the real business rules:
    - Staff_Key is genuinely unknown until a return is processed
      (CK_Return_Processing allows StaffID to be NULL while PENDING).
    - Customer_Key is genuinely unknown for guest/walk-in orders.

  Run this block ONCE against your actual Returns_Fact table.
------------------------------------------------------------------------*/
SET SERVEROUTPUT ON   -- Enables DBMS_OUTPUT.PUT_LINE messages to show up
SET ECHO OFF           -- Logs the actual SQL commands being run (highly recommended)
SET TERMOUT OFF       -- Disables terminal output so it runs faster (optional)
SET PAGESIZE 50000   -- Prevents row headers from repeating too often
SET LINESIZE 200     -- Sets width of the line to prevent messy text wrapping
SET FEEDBACK ON

SPOOL "C:\Users\isaac\Downloads\output.log";

DECLARE
  v_pk_constraint_name USER_CONSTRAINTS.CONSTRAINT_NAME%TYPE;
BEGIN
  -- Find the existing composite primary key constraint on Returns_Fact
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

-- Staff_Key / Customer_Key: drop NOT NULL if enforced, so they can hold NULL
ALTER TABLE Returns_Fact MODIFY (Staff_Key    NULL);
ALTER TABLE Returns_Fact MODIFY (Customer_Key NULL);

-- Return_ID alone is the real, already-unique grain of this fact table
ALTER TABLE Returns_Fact ADD CONSTRAINT PK_Returns_Fact PRIMARY KEY (Return_ID);


/*------------------------------------------------------------------------
  STEP 1: Reusable date-key lookup function
------------------------------------------------------------------------*/
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


/*------------------------------------------------------------------------
  STEP 2: Core source-to-target mapping view
  Centralising the mapping logic here means both the initial load and
  the incremental load use exactly the same transformation rules.
------------------------------------------------------------------------*/
CREATE OR REPLACE VIEW vw_returns_fact_source AS
SELECT
    fn_get_date_key(rr.RequestDate)            AS Request_Date_Key,
    bd.Branch_Key                               AS Branch_Key,
    std.Staff_Key                               AS Staff_Key,     -- NULL until return is processed
    cd.Customer_Key                             AS Customer_Key,  -- NULL for guest/walk-in orders
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


/*------------------------------------------------------------------------
  STEP 3: INITIAL (FULL) LOAD
  Empties the fact table and reloads every return from scratch.
  Use this only for the first-ever load or a deliberate full rebuild.
------------------------------------------------------------------------*/
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


/*------------------------------------------------------------------------
  STEP 4: INCREMENTAL LOAD (upsert)
  Since Return_Requests has no last-modified timestamp, a return that
  starts PENDING and later becomes COMPLETED is only detectable by
  re-comparing it against the target, not by a watermark on RequestDate.
  This MERGE re-evaluates every source row, inserts brand-new returns,
  and updates any return whose attributes have since changed
  (status, staff, resolution, refund amount, processed date, etc).
------------------------------------------------------------------------*/
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

  v_updated := SQL%ROWCOUNT;  -- Oracle MERGE reports total matched+inserted rows affected
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

/*------------------------------------------------------------------------
  STEP 5: Example execution
------------------------------------------------------------------------*/
First-time load:
EXEC etl_returns_fact_initial_load;

-- Every subsequent scheduled run:
-- EXEC etl_returns_fact_incremental_load;