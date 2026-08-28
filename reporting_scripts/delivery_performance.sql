SET SERVEROUTPUT ON SIZE UNLIMITED;
SET FEEDBACK OFF;
SET LINESIZE 200;
SET PAGESIZE 100;

CREATE OR REPLACE PROCEDURE delivery_perf_sum (
    p_year IN NUMBER DEFAULT NULL
)
AS
    c_line_double CONSTANT VARCHAR2(130) := RPAD('=', 130, '=');
    c_line_single CONSTANT VARCHAR2(130) := RPAD('-', 130, '-');

    v_total_companies NUMBER := 0;
    v_total_orders NUMBER := 0;
    v_total_fee NUMBER := 0;
    v_total_delivered NUMBER := 0;
    v_total_ontime NUMBER := 0;
    v_row_count NUMBER := 0;

    v_best_company VARCHAR2(120);
    v_best_ontime NUMBER := 0;

BEGIN
    -- Count delivery companies
    SELECT COUNT(DISTINCT d.DeliveryCompanyID)
    INTO v_total_companies
    FROM Deliveries d
    WHERE p_year IS NULL
       OR EXTRACT(YEAR FROM d.ScheduledDeliveryDate) = p_year;

    -- Find best performing delivery company
    BEGIN
        SELECT Company_Name, On_Time_Pct
        INTO v_best_company, v_best_ontime
        FROM
        (
            SELECT
                dc.Company_Name,
                ROUND(
                    100 * SUM(
                        CASE
                            WHEN d.DeliveredDateTime IS NOT NULL
                             AND d.DeliveredDateTime <= d.ScheduledDeliveryDate
                            THEN 1
                            ELSE 0
                        END
                    ) / COUNT(*),
                    1
                ) AS On_Time_Pct
            FROM Deliveries d
            JOIN Delivery_Company_Dim dc
              ON dc.Company_ID = d.DeliveryCompanyID
            WHERE p_year IS NULL
               OR EXTRACT(YEAR FROM d.ScheduledDeliveryDate) = p_year
            GROUP BY dc.Company_Name
            ORDER BY On_Time_Pct DESC
        )
        WHERE ROWNUM = 1;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_best_company := 'N/A';
            v_best_ontime := 0;
    END;

    -- Report header
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('DELIVERY PERFORMANCE SUMMARY (BY COMPANY / YEAR)');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Report Generated On : ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));

    IF p_year IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Reporting Period    : All Available History');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Reporting Period    : ' || p_year);
    END IF;
    DBMS_OUTPUT.PUT_LINE(c_line_single);
	
    -- Executive summary
    DBMS_OUTPUT.PUT_LINE('EXECUTIVE SUMMARY');
    DBMS_OUTPUT.PUT_LINE('Delivery Companies Evaluated : ' || v_total_companies);
    DBMS_OUTPUT.PUT_LINE('Best On-Time Performer       : ' || v_best_company ||
        ' (' || TO_CHAR(v_best_ontime, 'FM990.0') || '%)');
    DBMS_OUTPUT.PUT_LINE(c_line_single);

    -- Table header
    DBMS_OUTPUT.PUT_LINE(
        RPAD('COMPANY', 25) ||
        LPAD('YEAR', 7) ||
        LPAD('ORDERS', 10) ||
        LPAD('FEE (RM)', 15) ||
        LPAD('DELIVERED', 12) ||
        LPAD('ON-TIME', 10) ||
        LPAD('ON-TIME%', 11)
    );
    DBMS_OUTPUT.PUT_LINE(c_line_single);
	
    -- Main report
    FOR r IN
    (
        SELECT
            dc.Company_Name,
            EXTRACT(YEAR FROM d.ScheduledDeliveryDate) AS Delivery_Year,
            COUNT(*) AS Total_Orders,
            SUM(d.DeliveryFee) AS Total_Delivery_Fee,
            COUNT(
                CASE
                    WHEN d.DeliveredDateTime IS NOT NULL
                    THEN 1
                END
            ) AS Delivered_Orders,
            COUNT(
                CASE
                    WHEN d.DeliveredDateTime IS NOT NULL
                     AND d.DeliveredDateTime <= d.ScheduledDeliveryDate
                    THEN 1
                END
            ) AS On_Time_Orders,
            ROUND(
                100 *
                COUNT(
                    CASE
                        WHEN d.DeliveredDateTime IS NOT NULL
                         AND d.DeliveredDateTime <= d.ScheduledDeliveryDate
                        THEN 1
                    END
                ) / COUNT(*),
                1
            ) AS On_Time_Pct
        FROM Deliveries d
        JOIN Delivery_Company_Dim dc
          ON dc.Company_ID = d.DeliveryCompanyID
        WHERE p_year IS NULL
           OR EXTRACT(YEAR FROM d.ScheduledDeliveryDate) = p_year
        GROUP BY
            dc.Company_Name,
            EXTRACT(YEAR FROM d.ScheduledDeliveryDate)
        ORDER BY
            dc.Company_Name,
            Delivery_Year
    )
    LOOP
        v_row_count := v_row_count + 1;

        v_total_orders :=
            v_total_orders + r.Total_Orders;

        v_total_fee :=
            v_total_fee + r.Total_Delivery_Fee;

        v_total_delivered :=
            v_total_delivered + r.Delivered_Orders;

        v_total_ontime :=
            v_total_ontime + r.On_Time_Orders;

        DBMS_OUTPUT.PUT_LINE(
			RPAD(SUBSTR(r.Company_Name, 1, 24), 25) ||
            LPAD(r.Delivery_Year, 7) ||
            LPAD(r.Total_Orders, 10) ||
            LPAD(TO_CHAR(r.Total_Delivery_Fee, 'FM999,990.00'), 15) ||
            LPAD(r.Delivered_Orders, 12) ||
            LPAD(r.On_Time_Orders, 10) ||
            LPAD(TO_CHAR(r.On_Time_Pct, 'FM990.0'), 11)
        );
    END LOOP;
	
    -- Grand total
    DBMS_OUTPUT.PUT_LINE(c_line_single);
    DBMS_OUTPUT.PUT_LINE(
        RPAD('GRAND TOTAL', 32) ||
        LPAD(v_total_orders, 10) ||
        LPAD(TO_CHAR(v_total_fee, 'FM999,999,990.00'), 15) ||
        LPAD(v_total_delivered, 12) ||
        LPAD(v_total_ontime, 10) ||
        LPAD(
            TO_CHAR(
                CASE
                    WHEN v_total_delivered > 0
                    THEN v_total_ontime * 100 / v_total_delivered
                    ELSE 0
                END,
                'FM990.0'
            ), 11
        )
    );

    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Rows Returned: ' || v_row_count);
    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);

END delivery_perf_sum;
/

SHOW ERRORS PROCEDURE delivery_perf_sum

-- Run for all years:
EXEC delivery_perf_sum(NULL);

-- Or run for a specific year, e.g.:
-- EXEC delivery_perf_sum(2025);