SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET LINESIZE 220;
SET PAGESIZE 100;

CREATE OR REPLACE PROCEDURE delivery_perf_rpt (
    p_year IN NUMBER DEFAULT NULL
) AS

    c_line_double CONSTANT VARCHAR2(130) := RPAD('=', 130, '=');
    c_line_single CONSTANT VARCHAR2(130) := RPAD('-', 130, '-');

    v_count              NUMBER := 0;
    v_total_companies    NUMBER := 0;
    v_total_orders       NUMBER := 0;
    v_total_fee          NUMBER := 0;
    v_overall_ontime_num NUMBER := 0;
    v_overall_ontime_den NUMBER := 0;
    v_row_count          NUMBER := 0;
    v_best_company       VARCHAR2(100);
    v_best_ontime        NUMBER := 0;

    -- MAIN REPORT CURSOR
    CURSOR c_report IS

        WITH Order_Delivery AS (
            SELECT
                sf.Order_ID,
                sf.Branch_Key,
                sf.Delivery_Company_Key,
                sf.Scheduled_Delivery_Date_Key,
                sf.Delivered_Date_Key,
                MAX(sf.Delivery_Fee) AS Delivery_Fee,
                MAX(sf.SO_Status) AS SO_Status
            FROM Sales_Fact sf
            JOIN Date_Dim dd
                ON dd.Date_Key = sf.SO_Date_Key
            WHERE sf.Delivery_Company_Key IS NOT NULL
              AND (
                    p_year IS NULL
                    OR EXTRACT(YEAR FROM dd.Cal_Date) = p_year
                  )
            GROUP BY
                sf.Order_ID,
                sf.Branch_Key,
                sf.Delivery_Company_Key,
                sf.Scheduled_Delivery_Date_Key,
                sf.Delivered_Date_Key
        )

        SELECT
            dcd.Company_Name AS Delivery_Company_Name,
            dcd.Status AS Company_Status,
            bd.Branch_Name,
            sdd.Cal_Year_Month,

            COUNT(*) AS Total_Orders,

            ROUND(
                SUM(NVL(od.Delivery_Fee, 0)),
                2
            ) AS Total_Delivery_Fee,

            ROUND(
                AVG(
                    CASE
                        WHEN od.Delivered_Date_Key IS NOT NULL
                        THEN dld.Cal_Date - sdd.Cal_Date
                    END
                ),
                1
            ) AS Avg_Delay_Days,

            -- ON-TIME DELIVERY %
            ROUND(
                CASE
                    WHEN COUNT(
                        CASE
                            WHEN od.Delivered_Date_Key IS NOT NULL
                            THEN 1
                        END
                    ) > 0
                    THEN
                        100 *
                        SUM(
                            CASE
                                WHEN od.Delivered_Date_Key IS NOT NULL
                                 AND dld.Cal_Date <= sdd.Cal_Date
                                THEN 1
                                ELSE 0
                            END
                        ) / COUNT(
                            CASE
                                WHEN od.Delivered_Date_Key IS NOT NULL
                                THEN 1
                            END
                        )
                    ELSE 0
                END,
                1
            ) AS On_Time_Pct,

            SUM(
                CASE
                    WHEN od.Delivered_Date_Key IS NOT NULL
                     AND dld.Cal_Date <= sdd.Cal_Date
                    THEN 1
                    ELSE 0
                END
            ) AS Ontime_Count,

            COUNT(
                CASE
                    WHEN od.Delivered_Date_Key IS NOT NULL
                    THEN 1
                END
            ) AS Delivered_Count

        FROM Order_Delivery od

        JOIN Branch_Dim bd
            ON bd.Branch_Key = od.Branch_Key

        JOIN Date_Dim sdd
            ON sdd.Date_Key = od.Scheduled_Delivery_Date_Key

        LEFT JOIN Date_Dim dld
            ON dld.Date_Key = od.Delivered_Date_Key

        LEFT JOIN Delivery_Company_Dim dcd
            ON dcd.Delivery_Company_Key = od.Delivery_Company_Key

        GROUP BY
            dcd.Company_Name,
            dcd.Status,
            bd.Branch_Name,
            sdd.Cal_Year_Month

        ORDER BY
            dcd.Company_Name,
            sdd.Cal_Year_Month;

    -- FIND BEST DELIVERY COMPANY
    CURSOR c_best_company IS

        SELECT
            Company_Name,
            Ontime_Pct
        FROM
        (
            SELECT
                dcd.Company_Name,

                ROUND(
                    CASE
                        WHEN COUNT(*) > 0
                        THEN
                            100 *
                            SUM(
                                CASE
                                    WHEN dld.Cal_Date <= sdd.Cal_Date
                                    THEN 1
                                    ELSE 0
                                END
                            ) / COUNT(*)
                        ELSE 0
                    END,
                    1
                ) AS Ontime_Pct

            FROM Sales_Fact sf

            JOIN Date_Dim sdd
                ON sdd.Date_Key = sf.Scheduled_Delivery_Date_Key

            LEFT JOIN Date_Dim dld
                ON dld.Date_Key = sf.Delivered_Date_Key

            JOIN Delivery_Company_Dim dcd
                ON dcd.Delivery_Company_Key =
                   sf.Delivery_Company_Key

            WHERE sf.Delivery_Company_Key IS NOT NULL
              AND sf.Delivered_Date_Key IS NOT NULL

            GROUP BY
                dcd.Company_Name

            ORDER BY
                Ontime_Pct DESC
        )
        WHERE ROWNUM = 1;

BEGIN
    -- CHECK DELIVERY DATA
    SELECT COUNT(*)
    INTO v_count
    FROM Sales_Fact
    WHERE Delivery_Company_Key IS NOT NULL;


    IF v_count = 0 THEN

        RAISE_APPLICATION_ERROR(
            -20001,
            'Missing data: no delivery orders found in Sales_Fact.'
        );

    END IF;

    -- COUNT DELIVERY COMPANIES
    SELECT COUNT(DISTINCT Delivery_Company_Key)
    INTO v_total_companies
    FROM Sales_Fact
    WHERE Delivery_Company_Key IS NOT NULL;

    -- FIND BEST COMPANY
    FOR r IN c_best_company LOOP

        v_best_company := r.Company_Name;
        v_best_ontime  := r.Ontime_Pct;

    END LOOP;

    -- REPORT HEADER
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('DELIVERY PERFORMANCE AND FULFILLMENT ANALYSIS');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Report Generated On : ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Reporting Period     : ' || NVL(TO_CHAR(p_year), 'All Available History'));
    DBMS_OUTPUT.PUT_LINE(c_line_single);
	
    -- EXECUTIVE SUMMARY
    DBMS_OUTPUT.PUT_LINE('EXECUTIVE SUMMARY');
    DBMS_OUTPUT.PUT_LINE(c_line_single);
    DBMS_OUTPUT.PUT_LINE('Delivery Companies Evaluated : ' || v_total_companies);
    DBMS_OUTPUT.PUT_LINE('Best On-Time Performer       : ' || NVL(v_best_company, 'N/A') 
		||' (' || TO_CHAR(v_best_ontime, 'FM990.0') || '%)');
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    -- COLUMN HEADINGS
    DBMS_OUTPUT.PUT_LINE(
        RPAD('COMPANY', 25) ||
        RPAD('BRANCH', 30) ||
        RPAD('YR-MTH', 10) ||
        LPAD('ORDERS', 8) ||
        LPAD('FEE (RM)', 14) ||
        LPAD('DELAY', 8) ||
        LPAD('ON-TIME%', 10)
    );
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    -- REPORT ROWS
    FOR r IN c_report LOOP
        v_row_count := v_row_count + 1;
		
        v_total_orders :=
            v_total_orders +
            NVL(r.Total_Orders, 0);

        v_total_fee :=
            v_total_fee +
            NVL(r.Total_Delivery_Fee, 0);

        v_overall_ontime_num :=
            v_overall_ontime_num +
            NVL(r.Ontime_Count, 0);

        v_overall_ontime_den :=
            v_overall_ontime_den +
            NVL(r.Delivered_Count, 0);

        DBMS_OUTPUT.PUT_LINE(
            RPAD(SUBSTR(NVL(r.Delivery_Company_Name, 'N/A'), 1, 24), 25) ||
            RPAD(SUBSTR(NVL(r.Branch_Name, 'N/A'), 1, 29), 30) ||
			RPAD(r.Cal_Year_Month, 10) ||
            LPAD(TO_CHAR(r.Total_Orders), 8) ||
            LPAD(TO_CHAR(NVL(r.Total_Delivery_Fee, 0), 'FM999,990.00'), 14) ||
            LPAD(TO_CHAR(NVL(r.Avg_Delay_Days, 0), 'FM990.0'), 8) ||
            LPAD(TO_CHAR(NVL(r.On_Time_Pct, 0), 'FM990.0'), 10)
        );
    END LOOP;

    -- GRAND TOTAL
    DBMS_OUTPUT.PUT_LINE(c_line_single);
    DBMS_OUTPUT.PUT_LINE(RPAD('GRAND TOTAL', 65) ||
        LPAD(TO_CHAR(v_total_orders), 8) ||
        LPAD(TO_CHAR(v_total_fee, 'FM999,999,990.00'), 14) ||
        LPAD('-', 8) ||
        LPAD(
            TO_CHAR(
                CASE
                    WHEN v_overall_ontime_den > 0
                    THEN 100 * v_overall_ontime_num / v_overall_ontime_den
                    ELSE 0
                END,
                'FM990.0'
            ),
            10
        )
    );

    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Rows Returned: ' || v_row_count);
    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
        RAISE;
END delivery_perf_rpt;
/

-- Run for all years:
EXEC delivery_perf_rpt(NULL);

-- Or run for a specific year, e.g.:
-- EXEC delivery_perf_rpt(2025);