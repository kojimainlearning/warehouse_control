CL SCR;
SET PAGESIZE 100
SET LINESIZE 175
SET NEWPAGE 4
SET VERIFY OFF
SET FEEDBACK OFF
SET DEFINE ON
ACCEPT report_year PROMPT 'Enter the report year (e.g., 2025): '

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'MYKASIH SUBSIDY UTILIZATION BY STATE/BRANCH (Year: &report_year)' SKIP 2

COLUMN state                 HEADING 'STATE'       FORMAT A18
COLUMN branch_name           HEADING 'BRANCH'      FORMAT A20
COLUMN q1_subsidy            HEADING 'Q1 SUBSIDY|(RM)' FORMAT 999,999,990
COLUMN q2_subsidy            HEADING 'Q2 SUBSIDY|(RM)' FORMAT 999,999,990
COLUMN q3_subsidy            HEADING 'Q3 SUBSIDY|(RM)' FORMAT 999,999,990
COLUMN q4_subsidy            HEADING 'Q4 SUBSIDY|(RM)' FORMAT 999,999,990
COLUMN beneficiaries_served  HEADING 'BENEFICIARIES|SERVED' FORMAT 999,990
COLUMN total_subsidy         HEADING 'TOTAL SUBSIDY|(RM)'   FORMAT 999,999,990.00
COLUMN total_sales_value     HEADING 'TOTAL SALES|(RM)'     FORMAT 999,999,990.00
COLUMN subsidy_pct_of_sales  HEADING 'SUBSIDY %|OF SALES'   FORMAT 990.0

BREAK ON state SKIP 1 ON REPORT
COMPUTE SUM LABEL '>> STATE TOTAL' OF q1_subsidy q2_subsidy q3_subsidy q4_subsidy beneficiaries_served total_subsidy total_sales_value ON state
COMPUTE SUM LABEL '>> GRAND TOTAL' OF q1_subsidy q2_subsidy q3_subsidy q4_subsidy beneficiaries_served total_subsidy total_sales_value ON REPORT

SELECT
    bd.State                                                                        AS state,
    bd.Branch_Name                                                                  AS branch_name,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q1' THEN sf.MyKasih_Subsidy_Amount ELSE 0 END)  AS q1_subsidy,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q2' THEN sf.MyKasih_Subsidy_Amount ELSE 0 END)  AS q2_subsidy,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q3' THEN sf.MyKasih_Subsidy_Amount ELSE 0 END)  AS q3_subsidy,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q4' THEN sf.MyKasih_Subsidy_Amount ELSE 0 END)  AS q4_subsidy,
    COUNT(DISTINCT sf.Customer_Key)             AS beneficiaries_served,
    SUM(sf.MyKasih_Subsidy_Amount)              AS total_subsidy,
    SUM(sf.Line_Total)                          AS total_sales_value,
    ROUND(SUM(sf.MyKasih_Subsidy_Amount) / NULLIF(SUM(sf.Line_Total), 0) * 100, 1) AS subsidy_pct_of_sales
FROM Sales_Fact sf
JOIN Customer_Dim cd ON cd.Customer_Key = sf.Customer_Key
JOIN Branch_Dim bd   ON bd.Branch_Key   = sf.Branch_Key
JOIN Date_Dim dd     ON dd.Date_Key     = sf.SO_Date_Key
WHERE cd.Is_Beneficiary = 'Y'
  AND EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
GROUP BY bd.State, bd.Branch_Name
ORDER BY bd.State, total_subsidy DESC;

TTITLE OFF
CLEAR BREAK
CLEAR COMPUTE

----------------------------------------------------------------

SET PAGESIZE 100
SET LINESIZE 160
SET NEWPAGE 4
CLEAR COLUMNS

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'MYKASIH SUBSIDY TREND: YEAR -> QUARTER ROLL-UP' SKIP 2

COLUMN cal_year     HEADING 'YEAR'     FORMAT 9999
COLUMN cal_quarter  HEADING 'QUARTER'  FORMAT A15
COLUMN total_subsidy HEADING 'TOTAL SUBSIDY|(RM)' FORMAT 999,999,990.00
COLUMN beneficiaries_served HEADING 'BENEFICIARIES|SERVED' FORMAT 999,990

BREAK ON cal_year SKIP 1 ON REPORT
COMPUTE SUM LABEL '>> YEAR TOTAL'  OF total_subsidy beneficiaries_served ON cal_year
COMPUTE SUM LABEL '>> GRAND TOTAL' OF total_subsidy beneficiaries_served ON REPORT

SELECT
    EXTRACT(YEAR FROM dd.Cal_Date)          AS cal_year,
    dd.Cal_Quarter                          AS cal_quarter,
    SUM(sf.MyKasih_Subsidy_Amount)          AS total_subsidy,
    COUNT(DISTINCT sf.Customer_Key)         AS beneficiaries_served
FROM Sales_Fact sf
JOIN Customer_Dim cd ON cd.Customer_Key = sf.Customer_Key
JOIN Date_Dim dd     ON dd.Date_Key = sf.SO_Date_Key
WHERE cd.Is_Beneficiary = 'Y'
GROUP BY EXTRACT(YEAR FROM dd.Cal_Date), dd.Cal_Quarter
ORDER BY cal_year, dd.Cal_Quarter;

TTITLE OFF
CLEAR BREAK
CLEAR COMPUTE

SET DEFINE ON
PROMPT
ACCEPT p_year    PROMPT 'Enter YEAR to drill into: '
ACCEPT p_quarter PROMPT 'Enter QUARTER to drill into (e.g., Q1): '

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'MYKASIH SUBSIDY DRILL-DOWN: &p_year &p_quarter BY MONTH' SKIP 2

COLUMN cal_month_name HEADING 'MONTH' FORMAT A15

SELECT
    dd.Cal_Month_Name,
    SUM(sf.MyKasih_Subsidy_Amount)   AS total_subsidy,
    COUNT(DISTINCT sf.Customer_Key)  AS beneficiaries_served
FROM Sales_Fact sf
JOIN Customer_Dim cd ON cd.Customer_Key = sf.Customer_Key
JOIN Date_Dim dd     ON dd.Date_Key = sf.SO_Date_Key
WHERE cd.Is_Beneficiary = 'Y'
  AND EXTRACT(YEAR FROM dd.Cal_Date) = &p_year
  AND dd.Cal_Quarter = '&p_quarter'
GROUP BY dd.Cal_Month_Name, dd.Cal_Year_Month
ORDER BY dd.Cal_Year_Month;

TTITLE OFF

------------------------------------------------------------

SET PAGESIZE 100
SET LINESIZE 170
SET NEWPAGE 4
SET DEFINE ON
ACCEPT report_year PROMPT 'Enter the report year (e.g., 2025): '

TTITLE LEFT - 
'================================================================================================' SKIP 1 -
'ELIGIBLE-CATEGORY UPTAKE: BENEFICIARY VS NON-BENEFICIARY (Year: &report_year)' SKIP 2

COLUMN category_name  HEADING 'CATEGORY'      FORMAT A22
COLUMN is_beneficiary HEADING 'BENEFICIARY?'  FORMAT A12
COLUMN q1_subsidy     HEADING 'Q1|SUBSIDY'    FORMAT 999,990
COLUMN q2_subsidy     HEADING 'Q2|SUBSIDY'    FORMAT 999,990
COLUMN q3_subsidy     HEADING 'Q3|SUBSIDY'    FORMAT 999,990
COLUMN q4_subsidy     HEADING 'Q4|SUBSIDY'    FORMAT 999,990
COLUMN customers      HEADING 'CUSTOMERS'     FORMAT 999,990
COLUMN qty_sold       HEADING 'QTY SOLD'      FORMAT 999,999,990
COLUMN total_subsidy  HEADING 'SUBSIDY (RM)'  FORMAT 999,999,990.00

BREAK ON category_name SKIP 1 ON REPORT
COMPUTE SUM LABEL '>> CATEGORY TOTAL' OF q1_subsidy q2_subsidy q3_subsidy q4_subsidy customers qty_sold total_subsidy ON category_name
COMPUTE SUM LABEL '>> GRAND TOTAL'    OF q1_subsidy q2_subsidy q3_subsidy q4_subsidy customers qty_sold total_subsidy ON REPORT

SELECT
    pd.Category_Name                                                                AS category_name,
    cd.Is_Beneficiary                                                               AS is_beneficiary,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q1' THEN sf.MyKasih_Subsidy_Amount ELSE 0 END)  AS q1_subsidy,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q2' THEN sf.MyKasih_Subsidy_Amount ELSE 0 END)  AS q2_subsidy,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q3' THEN sf.MyKasih_Subsidy_Amount ELSE 0 END)  AS q3_subsidy,
    SUM(CASE WHEN dd.Cal_Quarter = 'Q4' THEN sf.MyKasih_Subsidy_Amount ELSE 0 END)  AS q4_subsidy,
    COUNT(DISTINCT cd.Customer_Key)               AS customers,
    SUM(sf.Quantity)                              AS qty_sold,
    SUM(sf.MyKasih_Subsidy_Amount)                AS total_subsidy
FROM Sales_Fact sf
JOIN Product_Dim pd  ON pd.Product_Key = sf.Product_Key
JOIN Customer_Dim cd ON cd.Customer_Key = sf.Customer_Key
JOIN Date_Dim dd     ON dd.Date_Key = sf.SO_Date_Key
WHERE pd.Is_MyKasih_Eligible = 'Y'
  AND EXTRACT(YEAR FROM dd.Cal_Date) = &report_year
GROUP BY pd.Category_Name, cd.Is_Beneficiary
ORDER BY pd.Category_Name, cd.Is_Beneficiary;

TTITLE OFF
CLEAR BREAK
CLEAR COMPUTE