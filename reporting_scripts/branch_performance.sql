SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET LINESIZE 220;
SET PAGESIZE 100;

CREATE OR REPLACE PROCEDURE branch_perf_rpt (
    p_year IN NUMBER DEFAULT NULL
) AS

    c_line_double CONSTANT VARCHAR2(130) := RPAD('=', 130, '=');
    c_line_single CONSTANT VARCHAR2(130) := RPAD('-', 130, '-');

    v_count             NUMBER;
    v_total_branches    NUMBER := 0;
    v_total_revenue     NUMBER := 0;
    v_total_orders      NUMBER := 0;
    v_total_margin      NUMBER := 0;
    v_total_returns     NUMBER := 0;
    v_top_branch        VARCHAR2(100);
    v_top_branch_rev    NUMBER := 0;
    v_row_count         NUMBER := 0;

    CURSOR c_report IS
        WITH Monthly_Sales AS (
            SELECT
                bd.Branch_Key,
                bd.Branch_Name,
                bd.City,
                dd.Cal_Year_Month,
                dd.Cal_Month_Name,
                EXTRACT(YEAR FROM dd.Cal_Date) AS Cal_Year,
                COUNT(DISTINCT sf.Order_ID) AS Total_Orders,
                SUM(sf.Line_Total) AS Total_Revenue,
                SUM(sf.Quantity * (pd.Selling_Unit_Price - pd.Purchase_Unit_Price)) AS Gross_Margin
            FROM Sales_Fact sf
            JOIN Branch_Dim bd  ON bd.Branch_Key  = sf.Branch_Key
            JOIN Date_Dim dd    ON dd.Date_Key    = sf.SO_Date_Key
            JOIN Product_Dim pd ON pd.Product_Key = sf.Product_Key
            WHERE p_year IS NULL OR EXTRACT(YEAR FROM dd.Cal_Date) = p_year
            GROUP BY bd.Branch_Key, bd.Branch_Name, bd.City, dd.Cal_Year_Month, dd.Cal_Month_Name, EXTRACT(YEAR FROM dd.Cal_Date)
        ),
        Monthly_Returns AS (
            SELECT
                rf.Branch_Key,
                dd.Cal_Year_Month,
                COUNT(rf.Return_ID) AS Total_Returns
            FROM Returns_Fact rf
            JOIN Date_Dim dd ON dd.Date_Key = rf.Request_Date_Key
            GROUP BY rf.Branch_Key, dd.Cal_Year_Month
        )
        SELECT
            ms.Branch_Name,
            ms.City,
            ms.Cal_Year_Month,
            ms.Cal_Month_Name,
            ms.Cal_Year,
            ms.Total_Orders,
            ms.Total_Revenue,
            ROUND(ms.Total_Revenue / NULLIF(ms.Total_Orders, 0), 2) AS Avg_Order_Value,
            ms.Gross_Margin,
            ROUND(100 * ms.Gross_Margin / NULLIF(ms.Total_Revenue, 0), 1) AS Gross_Margin_Pct,
            NVL(mr.Total_Returns, 0) AS Total_Returns,
            ROUND(100 * NVL(mr.Total_Returns, 0) / NULLIF(ms.Total_Orders, 0), 2) AS Return_Rate_Pct
        FROM Monthly_Sales ms
        LEFT JOIN Monthly_Returns mr
            ON mr.Branch_Key = ms.Branch_Key AND mr.Cal_Year_Month = ms.Cal_Year_Month
        ORDER BY ms.Branch_Name, ms.Cal_Year_Month;

	CURSOR c_top_branch IS
		SELECT Branch_Name, Rev
		FROM (
			SELECT
				bd.Branch_Name,
				SUM(sf.Line_Total) AS Rev
			FROM Sales_Fact sf
			JOIN Branch_Dim bd ON bd.Branch_Key = sf.Branch_Key
			JOIN Date_Dim dd   ON dd.Date_Key = sf.SO_Date_Key
			WHERE p_year IS NULL
			   OR EXTRACT(YEAR FROM dd.Cal_Date) = p_year
			GROUP BY bd.Branch_Name
			ORDER BY SUM(sf.Line_Total) DESC
		)
		WHERE ROWNUM = 1;

BEGIN

    -- Basic data validation
    SELECT COUNT(*) INTO v_count FROM Sales_Fact;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Missing data: Sales_Fact is empty.');
    END IF;

    SELECT COUNT(*) INTO v_count FROM Branch_Dim;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Missing data: Branch_Dim is empty.');
    END IF;

    SELECT COUNT(DISTINCT Branch_Key) INTO v_total_branches FROM Branch_Dim;

    FOR r IN c_top_branch LOOP
        v_top_branch     := r.Branch_Name;
        v_top_branch_rev := r.Rev;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('BRANCH PERFORMANCE COMPARISON');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Report Generated On : ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Reporting Period     : ' || NVL(TO_CHAR(p_year), 'All Available History'));
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    -- Executive summary
    DBMS_OUTPUT.PUT_LINE('EXECUTIVE SUMMARY');
    DBMS_OUTPUT.PUT_LINE(c_line_single);
    DBMS_OUTPUT.PUT_LINE('Total Branches Evaluated : ' || v_total_branches);
    DBMS_OUTPUT.PUT_LINE('Top Performing Branch    : ' || v_top_branch || ' (RM ' || TO_CHAR(v_top_branch_rev, 'FM999,999,990.00') || ')');
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    -- Detail table
    DBMS_OUTPUT.PUT_LINE(
        RPAD('BRANCH', 30) || RPAD('CITY', 20) || RPAD('YR-MTH', 10) ||
        LPAD('ORDERS', 9) || LPAD('REVENUE (RM)', 16) || LPAD('AOV (RM)', 12) ||
        LPAD('MARGIN %', 10) || LPAD('RETURNS', 10) || LPAD('RETURN %', 10)
    );
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    FOR r IN c_report LOOP
        v_row_count     := v_row_count + 1;
        v_total_revenue := v_total_revenue + NVL(r.Total_Revenue, 0);
        v_total_orders  := v_total_orders + NVL(r.Total_Orders, 0);
        v_total_margin  := v_total_margin + NVL(r.Gross_Margin, 0);
        v_total_returns := v_total_returns + NVL(r.Total_Returns, 0);

        DBMS_OUTPUT.PUT_LINE(
            RPAD(SUBSTR(r.Branch_Name, 1, 29), 30) ||
            RPAD(SUBSTR(r.City, 1, 19), 20) ||
            RPAD(r.Cal_Year_Month, 10) ||
            LPAD(r.Total_Orders, 9) ||
            LPAD(TO_CHAR(r.Total_Revenue, 'FM999,990.00'), 16) ||
            LPAD(TO_CHAR(r.Avg_Order_Value, 'FM990.00'), 12) ||
            LPAD(TO_CHAR(r.Gross_Margin_Pct, 'FM990.0'), 10) ||
            LPAD(r.Total_Returns, 10) ||
            LPAD(TO_CHAR(r.Return_Rate_Pct, 'FM990.00'), 10)
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(c_line_single);
    DBMS_OUTPUT.PUT_LINE(
        RPAD('GRAND TOTAL', 60) ||
        LPAD(v_total_orders, 9) ||
        LPAD(TO_CHAR(v_total_revenue, 'FM999,999,990.00'), 16) ||
        LPAD('-', 12) ||
        LPAD(TO_CHAR(100 * v_total_margin / NULLIF(v_total_revenue, 0), 'FM990.0'), 10) ||
        LPAD(v_total_returns, 10)
    );
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Rows Returned: ' || v_row_count);
    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
        RAISE;
END branch_perf_rpt;
/
/

SHOW ERRORS PROCEDURE branch_perf_rpt

-- Run for all years:
EXEC branch_perf_rpt(NULL);

-- Or run for a specific year, e.g.:
-- EXEC branch_perf_rpt(2025);