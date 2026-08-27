CL SCR;
SET PAGESIZE 100
SET LINESIZE 170
SET NEWPAGE 4
SET VERIFY OFF
SET FEEDBACK OFF
SET DEFINE ON

ACCEPT report_year PROMPT 'Enter the report year (e.g., 2025): '

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'RETURN RATE ANALYSIS BY CATEGORY (Year: &report_year)' SKIP 2

COLUMN category_name    HEADING 'CATEGORY'     FORMAT A24
COLUMN item_name        HEADING 'ITEM'         FORMAT A26
COLUMN q1_returned      HEADING 'Q1|RETURNED'  FORMAT 999,990
COLUMN q2_returned      HEADING 'Q2|RETURNED'  FORMAT 999,990
COLUMN q3_returned      HEADING 'Q3|RETURNED'  FORMAT 999,990
COLUMN q4_returned      HEADING 'Q4|RETURNED'  FORMAT 999,990
COLUMN qty_sold         HEADING 'QTY|SOLD'      FORMAT 999,999,990
COLUMN requested_qty    HEADING 'REQUESTED|QTY' FORMAT 999,999,990
COLUMN confirmed_qty    HEADING 'CONFIRMED|QTY' FORMAT 999,999,990
COLUMN requested_rate_pct HEADING 'REQUESTED|RATE %' FORMAT 990.0
COLUMN confirmed_rate_pct HEADING 'CONFIRMED|RATE %' FORMAT 990.0

BREAK ON category_name SKIP 1 ON REPORT
COMPUTE SUM LABEL '>> CATEGORY TOTAL' OF q1_returned q2_returned q3_returned q4_returned qty_sold requested_qty confirmed_qty ON category_name
COMPUTE SUM LABEL '>> GRAND TOTAL'    OF q1_returned q2_returned q3_returned q4_returned qty_sold requested_qty confirmed_qty ON REPORT

WITH sales_qty AS (
    SELECT pd.Category_Name, pd.Item_Name, pd.Product_Key, SUM(sf.Quantity) AS qty_sold
    FROM Sales_Fact sf
    JOIN Product_Dim pd ON pd.Product_Key = sf.Product_Key
    JOIN Date_Dim dd    ON dd.Date_Key = sf.SO_Date_Key
    WHERE EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
    GROUP BY pd.Category_Name, pd.Item_Name, pd.Product_Key
),
returns_qty AS (
    SELECT
        pd.Product_Key,
        SUM(CASE WHEN dd.Cal_Quarter = 'Q1' THEN rf.Quantity_Returned ELSE 0 END) AS q1_returned,
        SUM(CASE WHEN dd.Cal_Quarter = 'Q2' THEN rf.Quantity_Returned ELSE 0 END) AS q2_returned,
        SUM(CASE WHEN dd.Cal_Quarter = 'Q3' THEN rf.Quantity_Returned ELSE 0 END) AS q3_returned,
        SUM(CASE WHEN dd.Cal_Quarter = 'Q4' THEN rf.Quantity_Returned ELSE 0 END) AS q4_returned,
        SUM(rf.Quantity_Returned)                                                 AS requested_qty,
        SUM(CASE WHEN rf.Return_Status NOT IN ('CANCELLED', 'REJECTED')
                  AND rf.Resolution_Type IN ('REFUND', 'REPLACE')
                 THEN rf.Quantity_Returned ELSE 0 END)                            AS confirmed_qty
    FROM Returns_Fact rf
    JOIN Product_Dim pd ON pd.Product_Key = rf.Product_Key
    JOIN Date_Dim dd    ON dd.Date_Key = rf.Request_Date_Key
    WHERE EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
    GROUP BY pd.Product_Key
)
SELECT
    s.Category_Name                                                            AS category_name,
    s.Item_Name                                                                AS item_name,
    SUM(NVL(r.q1_returned, 0))                                                 AS q1_returned,
    SUM(NVL(r.q2_returned, 0))                                                 AS q2_returned,
    SUM(NVL(r.q3_returned, 0))                                                 AS q3_returned,
    SUM(NVL(r.q4_returned, 0))                                                 AS q4_returned,
    SUM(s.qty_sold)                                                            AS qty_sold,
    SUM(NVL(r.requested_qty, 0))                                               AS requested_qty,
    SUM(NVL(r.confirmed_qty, 0))                                               AS confirmed_qty,
    ROUND(SUM(NVL(r.requested_qty, 0)) / NULLIF(SUM(s.qty_sold), 0) * 100, 1)  AS requested_rate_pct,
    ROUND(SUM(NVL(r.confirmed_qty, 0)) / NULLIF(SUM(s.qty_sold), 0) * 100, 1)  AS confirmed_rate_pct
FROM sales_qty s
LEFT JOIN returns_qty r ON r.Product_Key = s.Product_Key
GROUP BY s.Category_Name, s.Item_Name
ORDER BY s.Category_Name, confirmed_rate_pct DESC NULLS LAST;

TTITLE OFF
CLEAR BREAK
CLEAR COMPUTE

------------------------------------------------------------------------------

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'RETURN ROOT-CAUSE BREAKDOWN BY CATEGORY (Year: &report_year)' SKIP 2

COLUMN category_name   HEADING 'CATEGORY'      FORMAT A30
COLUMN q1_returned     HEADING 'Q1|QTY'        FORMAT 999,990
COLUMN q2_returned     HEADING 'Q2|QTY'        FORMAT 999,990
COLUMN q3_returned     HEADING 'Q3|QTY'        FORMAT 999,990
COLUMN q4_returned     HEADING 'Q4|QTY'        FORMAT 999,990
COLUMN missing         HEADING 'MISSING'       FORMAT 999,990
COLUMN wrong_item      HEADING 'WRONG|ITEM'    FORMAT 999,990
COLUMN broken          HEADING 'BROKEN'        FORMAT 999,990
COLUMN expired         HEADING 'EXPIRED'       FORMAT 999,990
COLUMN other_reason    HEADING 'OTHER'         FORMAT 999,990
COLUMN total_requested HEADING 'TOTAL|REQUESTED' FORMAT 999,990
COLUMN total_confirmed HEADING 'TOTAL|CONFIRMED' FORMAT 999,990

BREAK ON REPORT
COMPUTE SUM LABEL '>> GRAND TOTAL' OF q1_returned q2_returned q3_returned q4_returned missing wrong_item broken expired other_reason total_requested total_confirmed ON REPORT

SELECT
    pd.Category_Name                                                                       AS category_name,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q1' THEN rf.Quantity_Returned ELSE 0 END)                AS q1_returned,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q2' THEN rf.Quantity_Returned ELSE 0 END)                AS q2_returned,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q3' THEN rf.Quantity_Returned ELSE 0 END)                AS q3_returned,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q4' THEN rf.Quantity_Returned ELSE 0 END)                AS q4_returned,
    SUM(CASE WHEN rf.Return_Reason = 'MISSING'     THEN rf.Quantity_Returned ELSE 0 END)    AS missing,
    SUM(CASE WHEN rf.Return_Reason = 'WRONG_ITEM'  THEN rf.Quantity_Returned ELSE 0 END)    AS wrong_item,
    SUM(CASE WHEN rf.Return_Reason = 'BROKEN'      THEN rf.Quantity_Returned ELSE 0 END)    AS broken,
    SUM(CASE WHEN rf.Return_Reason = 'EXPIRED'     THEN rf.Quantity_Returned ELSE 0 END)    AS expired,
    SUM(CASE WHEN rf.Return_Reason = 'OTHER'       THEN rf.Quantity_Returned ELSE 0 END)    AS other_reason,
    SUM(rf.Quantity_Returned)                                                                AS total_requested,
    SUM(CASE WHEN rf.Return_Status NOT IN ('CANCELLED', 'REJECTED')
              AND rf.Resolution_Type IN ('REFUND', 'REPLACE')
             THEN rf.Quantity_Returned ELSE 0 END)                                          AS total_confirmed
FROM Returns_Fact rf
JOIN Product_Dim pd ON pd.Product_Key = rf.Product_Key
JOIN Date_Dim dd    ON dd.Date_Key = rf.Request_Date_Key
WHERE EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
GROUP BY pd.Category_Name
ORDER BY pd.Category_Name;

TTITLE OFF
CLEAR BREAK
CLEAR COMPUTE

--------------------------------------------------------------------------------
CLEAR COLUMNS
CLEAR BREAK
SET DEFINE ON
PROMPT
ACCEPT report_year PROMPT 'Enter the report year (e.g., 2025): '
ACCEPT p_category  CHAR PROMPT 'Enter category name to investigate: '

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'RETURNS DRILL-DOWN: &p_category BY STATE / BRANCH / STAFF / STATUS (Year: &report_year)' SKIP 2

COLUMN state          HEADING 'STATE'         FORMAT A16
COLUMN branch_name    HEADING 'BRANCH'        FORMAT A18
COLUMN staff_name     HEADING 'STAFF'         FORMAT A16
COLUMN return_status  HEADING 'STATUS'        FORMAT A11
COLUMN return_count   HEADING 'RETURN|COUNT'  FORMAT 999,990
COLUMN qty_returned   HEADING 'REQUESTED|QTY'  FORMAT 999,990
COLUMN confirmed_qty  HEADING 'CONFIRMED|QTY'  FORMAT 999,990
COLUMN total_refund   HEADING 'REFUND|(RM)'   FORMAT 999,999,990.00

BREAK ON state SKIP 1 ON branch_name SKIP 1
COMPUTE SUM LABEL 'Branch Total:' OF return_count qty_returned confirmed_qty total_refund ON branch_name
COMPUTE SUM LABEL 'State Total:'  OF return_count qty_returned confirmed_qty total_refund ON state

SELECT
    bd.State,
    bd.Branch_Name,
    st.Staff_Name,
    rf.Return_Status                        AS return_status,
    COUNT(rf.Return_ID)                     AS return_count,
    SUM(rf.Quantity_Returned)               AS qty_returned,
    SUM(CASE WHEN rf.Return_Status NOT IN ('CANCELLED', 'REJECTED')
              AND rf.Resolution_Type IN ('REFUND', 'REPLACE')
             THEN rf.Quantity_Returned ELSE 0 END) AS confirmed_qty,
    SUM(rf.Refund_Amount)                   AS total_refund
FROM Returns_Fact rf
JOIN Product_Dim pd ON pd.Product_Key = rf.Product_Key
JOIN Branch_Dim bd  ON bd.Branch_Key  = rf.Branch_Key
JOIN Staff_Dim st   ON st.Staff_Key   = rf.Staff_Key
JOIN Date_Dim dd    ON dd.Date_Key    = rf.Request_Date_Key
WHERE UPPER(pd.Category_Name) = UPPER('&p_category')
  AND EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
GROUP BY bd.State, bd.Branch_Name, st.Staff_Name, rf.Return_Status
ORDER BY bd.State, bd.Branch_Name, total_refund DESC;

TTITLE OFF
CLEAR BREAK