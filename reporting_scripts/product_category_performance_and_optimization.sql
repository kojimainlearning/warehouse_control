CL SCR
SET PAGESIZE 100
SET LINESIZE 170
SET NEWPAGE 4
SET VERIFY OFF
SET FEEDBACK OFF
SET DEFINE ON

ACCEPT report_year PROMPT 'Enter the report year (e.g., 2025): '

COLUMN category_name  HEADING 'CATEGORY'      FORMAT A26
COLUMN item_name      HEADING 'ITEM'          FORMAT A28
COLUMN q1_qty          HEADING 'Q1|QTY'        FORMAT 999,990
COLUMN q2_qty          HEADING 'Q2|QTY'        FORMAT 999,990
COLUMN q3_qty          HEADING 'Q3|QTY'        FORMAT 999,990
COLUMN q4_qty          HEADING 'Q4|QTY'        FORMAT 999,990
COLUMN qty_sold        HEADING 'TOTAL|QTY'     FORMAT 999,999,990
COLUMN revenue         HEADING 'REVENUE|(RM)'  FORMAT 999,990.00
COLUMN cost            HEADING 'COST|(RM)'     FORMAT 999,990.00
COLUMN margin          HEADING 'MARGIN|(RM)'   FORMAT 999,990.00
COLUMN margin_pct      HEADING 'MARGIN|%'      FORMAT 990.0

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'PRODUCT CATEGORY PERFORMANCE (Year: &report_year)' SKIP 2

BREAK ON category_name SKIP 1 ON REPORT

COMPUTE SUM LABEL '>> CATEGORY TOTAL' OF q1_qty q2_qty q3_qty q4_qty qty_sold revenue cost margin ON category_name
COMPUTE SUM LABEL '>> GRAND TOTAL'    OF q1_qty q2_qty q3_qty q4_qty qty_sold revenue cost margin ON REPORT

SELECT
    pd.Category_Name                                                     AS category_name,
    pd.Item_Name                                                         AS item_name,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q1' THEN sf.Quantity ELSE 0 END)     AS q1_qty,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q2' THEN sf.Quantity ELSE 0 END)     AS q2_qty,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q3' THEN sf.Quantity ELSE 0 END)     AS q3_qty,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q4' THEN sf.Quantity ELSE 0 END)     AS q4_qty,
    SUM(sf.Quantity)                                                     AS qty_sold,
    SUM(sf.Line_Total)                                                   AS revenue,
    SUM(sf.Quantity * pd.Purchase_Unit_Price)                            AS cost,
    SUM(sf.Line_Total) - SUM(sf.Quantity * pd.Purchase_Unit_Price)       AS margin,
    ROUND( (SUM(sf.Line_Total) - SUM(sf.Quantity * pd.Purchase_Unit_Price))
           / NULLIF(SUM(sf.Line_Total), 0) * 100, 1)                    AS margin_pct
FROM Sales_Fact sf
JOIN Product_Dim pd ON pd.Product_Key = sf.Product_Key
JOIN Date_Dim dd    ON dd.Date_Key    = sf.SO_Date_Key
WHERE EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
  AND sf.SO_Status = 'COMPLETED'
GROUP BY pd.Category_Name, pd.Item_Name
ORDER BY pd.Category_Name, revenue DESC;

TTITLE OFF
CLEAR BREAK
CLEAR COMPUTE

-----------------------------------------------------------------
SET PAGESIZE 100
SET LINESIZE 160
SET NEWPAGE 4
SET VERIFY OFF
SET FEEDBACK OFF
SET DEFINE ON

COLUMN pair_rank       HEADING 'RANK'              FORMAT 990
COLUMN category_a      HEADING 'CATEGORY A'        FORMAT A24
COLUMN category_b      HEADING 'CATEGORY B'        FORMAT A24
COLUMN basket_count    HEADING 'ORDERS|TOGETHER'   FORMAT 999,990
COLUMN combined_value  HEADING 'COMBINED|VALUE (RM)' FORMAT 999,999,990.00
COLUMN avg_pair_value  HEADING 'AVG VALUE|PER ORDER (RM)' FORMAT 999,990.00

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'TOP 10 CROSS-SELLING CATEGORY PAIRS (Year: &report_year)' SKIP 2

WITH order_pairs AS (
    SELECT
        a.Order_ID,
        pd1.Category_Name AS category_a,
        pd2.Category_Name AS category_b,
        a.Line_Total       AS value_a,
        b.Line_Total       AS value_b
    FROM Sales_Fact a
    JOIN Sales_Fact b   ON a.Order_ID = b.Order_ID AND a.Product_Key < b.Product_Key
    JOIN Product_Dim pd1 ON pd1.Product_Key = a.Product_Key
    JOIN Product_Dim pd2 ON pd2.Product_Key = b.Product_Key
    JOIN Date_Dim dd     ON dd.Date_Key = a.SO_Date_Key
    WHERE EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
      AND pd1.Category_Name <> pd2.Category_Name
)
SELECT
    ROW_NUMBER() OVER (ORDER BY COUNT(DISTINCT Order_ID) DESC,
                                 SUM(value_a + value_b) DESC)  AS pair_rank,
    category_a,
    category_b,
    COUNT(DISTINCT Order_ID)              AS basket_count,
    SUM(value_a + value_b)                AS combined_value,
    ROUND(AVG(value_a + value_b), 2)      AS avg_pair_value
FROM order_pairs
GROUP BY category_a, category_b
ORDER BY pair_rank
FETCH FIRST 10 ROWS ONLY;

TTITLE OFF

SET DEFINE ON
PROMPT
ACCEPT p_rank NUMBER PROMPT 'Enter the RANK number of the pair to drill into (see list above): '

COLUMN item_a          HEADING 'ITEM A'            FORMAT A26
COLUMN item_b          HEADING 'ITEM B'            FORMAT A26
COLUMN pair_count      HEADING 'ORDERS|TOGETHER'   FORMAT 999,990
COLUMN combined_value  HEADING 'COMBINED|VALUE (RM)' FORMAT 999,999,990.00

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'TOP 10 ITEM-LEVEL DRILL-DOWN FOR RANK #&p_rank' SKIP 2

WITH order_pairs AS (
    SELECT
        a.Order_ID,
        pd1.Category_Name AS category_a,
        pd2.Category_Name AS category_b,
        a.Line_Total       AS value_a,
        b.Line_Total       AS value_b
    FROM Sales_Fact a
    JOIN Sales_Fact b   ON a.Order_ID = b.Order_ID AND a.Product_Key < b.Product_Key
    JOIN Product_Dim pd1 ON pd1.Product_Key = a.Product_Key
    JOIN Product_Dim pd2 ON pd2.Product_Key = b.Product_Key
    JOIN Date_Dim dd     ON dd.Date_Key = a.SO_Date_Key
    WHERE EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
      AND pd1.Category_Name <> pd2.Category_Name
),
ranked_pairs AS (
    SELECT
        category_a,
        category_b,
        ROW_NUMBER() OVER (ORDER BY COUNT(DISTINCT Order_ID) DESC,
                                     SUM(value_a + value_b) DESC) AS pair_rank
    FROM order_pairs
    GROUP BY category_a, category_b
),
chosen_pair AS (
    SELECT category_a, category_b
    FROM ranked_pairs
    WHERE pair_rank = &p_rank
)
SELECT
    pd1.Item_Name                          AS item_a,
    pd2.Item_Name                          AS item_b,
    COUNT(DISTINCT a.Order_ID)             AS pair_count,
    SUM(a.Line_Total + b.Line_Total)       AS combined_value
FROM Sales_Fact a
JOIN Sales_Fact b    ON a.Order_ID = b.Order_ID AND a.Product_Key < b.Product_Key
JOIN Product_Dim pd1 ON pd1.Product_Key = a.Product_Key
JOIN Product_Dim pd2 ON pd2.Product_Key = b.Product_Key
JOIN Date_Dim dd     ON dd.Date_Key = a.SO_Date_Key
JOIN chosen_pair cp  ON ( (pd1.Category_Name = cp.category_a AND pd2.Category_Name = cp.category_b)
                       OR (pd1.Category_Name = cp.category_b AND pd2.Category_Name = cp.category_a) )
WHERE EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
GROUP BY pd1.Item_Name, pd2.Item_Name
ORDER BY pair_count DESC
FETCH FIRST 10 ROWS ONLY;

PROMPT;

TTITLE OFF