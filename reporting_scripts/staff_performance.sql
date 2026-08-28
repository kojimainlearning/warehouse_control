SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET LINESIZE 200;
SET PAGESIZE 100;

CREATE OR REPLACE PROCEDURE staff_perf_rpt (
    p_year IN NUMBER DEFAULT NULL
) AS

    c_line_double CONSTANT VARCHAR2(130) := RPAD('=', 130, '=');
    c_line_single CONSTANT VARCHAR2(130) := RPAD('-', 130, '-');

    v_count           NUMBER;
    v_total_staff     NUMBER := 0;
    v_active_staff    NUMBER := 0;
    v_resigned_staff  NUMBER := 0;
    v_total_revenue   NUMBER := 0;
    v_total_orders    NUMBER := 0;
    v_row_count       NUMBER := 0;
    v_top_staff       VARCHAR2(100);
    v_top_staff_rev   NUMBER := 0;

    CURSOR c_report IS
        SELECT
            std.Staff_Name,
            std.Role,
            bd.Branch_Name,
            EXTRACT(YEAR FROM dd.Cal_Date) AS Cal_Year,
            COUNT(DISTINCT sf.Order_ID) AS Orders_Processed,
            SUM(sf.Line_Total) AS Revenue_Handled,
            ROUND(SUM(sf.Line_Total) / NULLIF(COUNT(DISTINCT sf.Order_ID), 0), 2) AS Avg_Revenue_Per_Order,
            CASE WHEN std.Resigned_Date IS NULL THEN 'ACTIVE' ELSE 'RESIGNED' END AS Employment_Status
        FROM Sales_Fact sf
        JOIN Staff_Dim std ON std.Staff_Key = sf.Staff_Key
        JOIN Branch_Dim bd ON bd.Branch_Key = sf.Branch_Key
        JOIN Date_Dim dd   ON dd.Date_Key   = sf.SO_Date_Key
        WHERE p_year IS NULL OR EXTRACT(YEAR FROM dd.Cal_Date) = p_year
        GROUP BY std.Staff_Name, std.Role, bd.Branch_Name, EXTRACT(YEAR FROM dd.Cal_Date),
                 CASE WHEN std.Resigned_Date IS NULL THEN 'ACTIVE' ELSE 'RESIGNED' END
        ORDER BY std.Staff_Name, Cal_Year;

	CURSOR c_top_staff IS
		SELECT Staff_Name, Rev
		FROM (
			SELECT
				std.Staff_Name,
				SUM(sf.Line_Total) AS Rev
			FROM Sales_Fact sf
			JOIN Staff_Dim std ON std.Staff_Key = sf.Staff_Key
			JOIN Date_Dim dd   ON dd.Date_Key = sf.SO_Date_Key
			WHERE p_year IS NULL
			   OR EXTRACT(YEAR FROM dd.Cal_Date) = p_year
			GROUP BY std.Staff_Name
			ORDER BY SUM(sf.Line_Total) DESC
		)
		WHERE ROWNUM = 1;

BEGIN

    SELECT COUNT(*) INTO v_count FROM Staff_Dim;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Missing data: Staff_Dim is empty.');
    END IF;

    SELECT COUNT(*), SUM(CASE WHEN Resigned_Date IS NULL THEN 1 ELSE 0 END),
           SUM(CASE WHEN Resigned_Date IS NOT NULL THEN 1 ELSE 0 END)
    INTO v_total_staff, v_active_staff, v_resigned_staff
    FROM Staff_Dim;

    FOR r IN c_top_staff LOOP
        v_top_staff     := r.Staff_Name;
        v_top_staff_rev := r.Rev;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('STAFF PERFORMANCE AND PRODUCTIVITY ANALYSIS');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Report Generated On : ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Reporting Period     : ' || NVL(TO_CHAR(p_year), 'All Available History'));
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    DBMS_OUTPUT.PUT_LINE('EXECUTIVE SUMMARY');
    DBMS_OUTPUT.PUT_LINE(c_line_single);
    DBMS_OUTPUT.PUT_LINE('Total Staff (All Time)  : ' || v_total_staff);
    DBMS_OUTPUT.PUT_LINE('Active Staff            : ' || v_active_staff);
    DBMS_OUTPUT.PUT_LINE('Resigned Staff          : ' || v_resigned_staff);
    DBMS_OUTPUT.PUT_LINE('Top Revenue Generator   : ' || v_top_staff || ' (RM ' || TO_CHAR(v_top_staff_rev, 'FM999,999,990.00') || ')');
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    DBMS_OUTPUT.PUT_LINE(
        RPAD('STAFF NAME', 20) || RPAD('ROLE', 14) || RPAD('BRANCH', 30) ||
        LPAD('YEAR', 6) || LPAD('ORDERS', 9) || LPAD('REVENUE (RM)', 15) ||
        LPAD('AVG/ORDER', 12) || '  ' || RPAD('STATUS', 10)
    );
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    FOR r IN c_report LOOP
        v_row_count     := v_row_count + 1;
        v_total_revenue := v_total_revenue + NVL(r.Revenue_Handled, 0);
        v_total_orders  := v_total_orders + NVL(r.Orders_Processed, 0);

        DBMS_OUTPUT.PUT_LINE(
            RPAD(SUBSTR(r.Staff_Name, 1, 19), 20) ||
            RPAD(SUBSTR(r.Role, 1, 13), 14) ||
            RPAD(SUBSTR(r.Branch_Name, 1, 29), 30) ||
            LPAD(r.Cal_Year, 6) ||
            LPAD(r.Orders_Processed, 9) ||
            LPAD(TO_CHAR(r.Revenue_Handled, 'FM999,990.00'), 15) ||
            LPAD(TO_CHAR(r.Avg_Revenue_Per_Order, 'FM990.00'), 12) ||
			'  ' ||
            RPAD(r.Employment_Status, 10)
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(c_line_single);
    DBMS_OUTPUT.PUT_LINE(
        RPAD('GRAND TOTAL', 70) ||
        LPAD(v_total_orders, 9) ||
        LPAD(TO_CHAR(v_total_revenue, 'FM999,999,990.00'), 15)
    );
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Rows Returned: ' || v_row_count);
    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
        RAISE;
END staff_perf_rpt;
/

SHOW ERRORS PROCEDURE staff_perf_rpt

-- Run for all years:
EXEC staff_perf_rpt(NULL);

-- Or run for a specific year, e.g.:
-- EXEC staff_perf_rpt(2025);