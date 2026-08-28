WHENEVER SQLERROR EXIT SQL.SQLCODE

SET ECHO OFF
SET FEEDBACK OFF
SET TERMOUT ON
SET SERVEROUTPUT ON SIZE UNLIMITED
SET LINESIZE 220
SET PAGESIZE 100
SET NEWPAGE 0
SET TRIMSPOOL ON
SET DEFINE OFF

VARIABLE b_start_year NUMBER
VARIABLE b_end_year NUMBER
VARIABLE b_period_type VARCHAR2(10)

-- Edit these values before running the report
BEGIN
    :b_start_year  := 2020;
    :b_end_year    := 2025;
    :b_period_type := 'YEAR';
END;
/

CREATE OR REPLACE PROCEDURE generate_sales_executive_report (
    p_start_year  IN NUMBER   DEFAULT NULL,
    p_end_year    IN NUMBER   DEFAULT NULL,
    p_period_type IN VARCHAR2 DEFAULT 'YEAR'
) AS

    v_period_type   VARCHAR2(10);
    v_start_year    NUMBER;
    v_end_year      NUMBER;
    v_count         NUMBER;
    v_period_desc   VARCHAR2(200);
    v_line          VARCHAR2(4000);
    v_row_count     NUMBER := 0;

    

    CURSOR c_report IS
    WITH params AS (
        SELECT
            v_period_type AS period_type,
            v_start_year  AS start_year,
            v_end_year    AS end_year
        FROM dual
    ),
    sales AS (
        SELECT
            EXTRACT(YEAR FROM d.Cal_Date) AS period_year,
            CASE p.period_type
                WHEN 'QUARTER' THEN CEIL(EXTRACT(MONTH FROM d.Cal_Date) / 3)
                WHEN 'MONTH'   THEN EXTRACT(MONTH FROM d.Cal_Date)
                ELSE 1
            END AS period_num,
            sf.Order_ID,
            (
                (sf.Quantity * sf.Unit_Price)
                - sf.Voucher_Discount_Amount
                - sf.MyKasih_Subsidy_Amount
            ) AS net_amount,
            sf.Quantity
        FROM Sales_Fact sf
        JOIN Date_Dim d
            ON d.Date_Key = sf.SO_Date_Key
        CROSS JOIN params p
        WHERE UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
        )
        AND (
            p.start_year IS NULL
            OR EXTRACT(YEAR FROM d.Cal_Date) >= (p.start_year - 1)
        )
        AND (
            p.end_year IS NULL
            OR EXTRACT(YEAR FROM d.Cal_Date) <= p.end_year
        )
    ),
    period_agg AS (
        SELECT
            period_year,
            period_num,
            ROUND(SUM(net_amount), 2) AS total_revenue,
            SUM(Quantity)              AS total_quantity,
            COUNT(DISTINCT Order_ID)   AS order_count
        FROM sales
        GROUP BY
            period_year,
            period_num
    )
    SELECT
        a.period_year,
        a.period_num,
        CASE v_period_type
            WHEN 'MONTH' THEN
                UPPER(
                    TO_CHAR(
                        TO_DATE(
                            TO_CHAR(a.period_year, 'FM0000') ||
                            TO_CHAR(a.period_num, 'FM00'),
                            'YYYYMM'
                        ),
                        'MON-YYYY'
                    )
                )
            WHEN 'QUARTER' THEN
                'Q' || a.period_num || '-' || a.period_year
            ELSE
                TO_CHAR(a.period_year, 'FM0000')
        END AS period_label,
        a.total_revenue,
        a.total_quantity,
        CASE
            WHEN a.order_count = 0 THEN NULL
            ELSE ROUND(a.total_revenue / a.order_count, 2)
        END AS average_order_value,
        CASE
            WHEN NVL(prev.total_revenue, 0) = 0 THEN NULL
            ELSE ROUND(
                ((a.total_revenue - prev.total_revenue) / prev.total_revenue) * 100,
                2
            )
        END AS growth_pct
    FROM period_agg a
    LEFT JOIN period_agg prev
        ON prev.period_year = a.period_year - 1
       AND prev.period_num  = a.period_num
    WHERE a.period_year >= NVL(v_start_year, a.period_year)
      AND a.period_year <= NVL(v_end_year, a.period_year)
    ORDER BY
        a.period_year,
        a.period_num;
        
    FUNCTION fmt_money (
        p_amount IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        IF p_amount IS NULL THEN
            RETURN 'N/A';
        END IF;

        RETURN TO_CHAR(
            p_amount,
            'FM999G999G999G999G990D00',
            q'[NLS_NUMERIC_CHARACTERS='.,']'
        );
    END fmt_money;

    FUNCTION fmt_int (
        p_amount IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        IF p_amount IS NULL THEN
            RETURN 'N/A';
        END IF;

        RETURN TO_CHAR(
            p_amount,
            'FM999G999G999G999G990',
            q'[NLS_NUMERIC_CHARACTERS='.,']'
        );
    END fmt_int;

    FUNCTION fmt_pct (
        p_amount IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        IF p_amount IS NULL THEN
            RETURN 'N/A';
        END IF;

        RETURN TO_CHAR(
            p_amount,
            'FM999G999G999G990D00',
            q'[NLS_NUMERIC_CHARACTERS='.,']'
        ) || '%';
    END fmt_pct;
    
    
BEGIN
    v_period_type := UPPER(TRIM(NVL(p_period_type, 'YEAR')));

    IF v_period_type IS NULL THEN
        v_period_type := 'YEAR';
    END IF;

    IF v_period_type NOT IN ('YEAR', 'QUARTER', 'MONTH') THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Invalid period type. Allowed values are YEAR, QUARTER, MONTH.'
        );
    END IF;

    IF p_start_year IS NOT NULL AND p_start_year <> TRUNC(p_start_year) THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Start year must be a whole number.'
        );
    END IF;

    IF p_end_year IS NOT NULL AND p_end_year <> TRUNC(p_end_year) THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'End year must be a whole number.'
        );
    END IF;

    v_start_year := p_start_year;
    v_end_year   := p_end_year;

    IF v_start_year IS NOT NULL AND v_start_year <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20004,
            'Start year must be greater than zero.'
        );
    END IF;

    IF v_end_year IS NOT NULL AND v_end_year <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20005,
            'End year must be greater than zero.'
        );
    END IF;

    IF v_start_year IS NOT NULL
       AND v_end_year IS NOT NULL
       AND v_start_year > v_end_year THEN
        RAISE_APPLICATION_ERROR(
            -20006,
            'Start year cannot be greater than end year.'
        );
    END IF;
    
    SELECT COUNT(*)
      INTO v_count
      FROM Date_Dim;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20007,
            'Missing data: Date_Dim is empty.'
        );
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM Sales_Fact;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20008,
            'Missing data: Sales_Fact is empty.'
        );
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM Date_Dim
     WHERE Cal_Date IS NULL
        OR Date_Key IS NULL;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20009,
            'Missing data: Date_Dim contains NULL Date_Key or Cal_Date values.'
        );
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM (
            SELECT Date_Key
              FROM Date_Dim
             GROUP BY Date_Key
            HAVING COUNT(*) > 1
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20010,
            'Invalid data: Date_Dim contains duplicate Date_Key values.'
        );
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM Sales_Fact sf
     WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
       AND NOT EXISTS (
                SELECT 1
                  FROM Date_Dim d
                 WHERE d.Date_Key = sf.SO_Date_Key
            );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20011,
            'Missing data: Qualifying Sales_Fact rows exist without matching Date_Dim SO_Date_Key.'
        );
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM Sales_Fact
     WHERE UPPER(TRIM(SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
       AND (
                Order_ID IS NULL
             OR Quantity IS NULL
             OR Unit_Price IS NULL
             OR Voucher_Discount_Amount IS NULL
             OR MyKasih_Subsidy_Amount IS NULL
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20012,
            'Missing data: Qualifying Sales_Fact rows contain NULL required fields.'
        );
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM Sales_Fact sf
      JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
     WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
       AND (
                v_start_year IS NULL
             OR EXTRACT(YEAR FROM d.Cal_Date) >= v_start_year
           )
       AND (
                v_end_year IS NULL
             OR EXTRACT(YEAR FROM d.Cal_Date) <= v_end_year
           );

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20013,
            'No qualifying sales data found for the selected reporting period.'
        );
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM Sales_Fact sf
      JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
     WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
       AND (
                (sf.Quantity * sf.Unit_Price)
                - sf.Voucher_Discount_Amount
                - sf.MyKasih_Subsidy_Amount
            ) < 0;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20014,
            'Invalid data: Negative net revenue lines found in qualifying Sales_Fact rows.'
        );
    END IF;

    IF v_start_year IS NULL AND v_end_year IS NULL THEN
        v_period_desc := 'All Available History';
    ELSIF v_start_year IS NULL THEN
        v_period_desc := 'Up To Year ' || v_end_year;
    ELSIF v_end_year IS NULL THEN
        v_period_desc := 'From Year ' || v_start_year;
    ELSE
        v_period_desc := 'Year ' || v_start_year || ' To Year ' || v_end_year;
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD('=', 100, '='));
    DBMS_OUTPUT.PUT_LINE('SALES PERFORMANCE AND REVENUE ANALYSIS');
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 100, '='));
    DBMS_OUTPUT.PUT_LINE('Report Generated On : ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Reporting Period    : ' || v_period_desc);
    DBMS_OUTPUT.PUT_LINE('Period Type         : ' || v_period_type);
    DBMS_OUTPUT.PUT_LINE('Included SO Status  : COMPLETED, OUT_FOR_DELIVERY, READY_FOR_PICKUP');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 100, '-'));

    v_line :=
        RPAD('PERIOD', 12) ||
        LPAD('TOTAL_REVENUE', 26) ||
        LPAD('TOTAL_QTY', 18) ||
        LPAD('AVG_ORDER_VALUE', 26) ||
        LPAD('GROWTH %', 14);

    DBMS_OUTPUT.PUT_LINE(v_line);
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 100, '-'));

    FOR r_report IN c_report LOOP
        v_row_count := v_row_count + 1;

        v_line :=
            RPAD(r_report.period_label, 12) ||
            LPAD(
                CASE
                    WHEN r_report.total_revenue IS NULL THEN 'N/A'
                    ELSE 'RM ' || fmt_money(r_report.total_revenue)
                END,
                26
            ) ||
            LPAD(fmt_int(r_report.total_quantity), 18) ||
            LPAD(
                CASE
                    WHEN r_report.average_order_value IS NULL THEN 'N/A'
                    ELSE 'RM ' || fmt_money(r_report.average_order_value)
                END,
                26
            ) ||
            LPAD(fmt_pct(r_report.growth_pct), 14);

        DBMS_OUTPUT.PUT_LINE(v_line);
    END LOOP;

    IF v_row_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No report rows found.');
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 100, '-'));
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 100, '='));
    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 100, '='));

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
        RAISE;
END generate_sales_executive_report;
/

SHOW ERRORS PROCEDURE generate_sales_executive_report

DECLARE
    v_error_count NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO v_error_count
      FROM USER_ERRORS
     WHERE name = 'GENERATE_SALES_EXECUTIVE_REPORT'
       AND type = 'PROCEDURE';

    IF v_error_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20015,
            'Procedure GENERATE_SALES_EXECUTIVE_REPORT has compilation errors. Please check SHOW ERRORS output.'
        );
    END IF;
END;
/


SPOOL 'report_output/sales_performance_revenue_analysis.txt'

EXEC generate_sales_executive_report(:b_start_year, :b_end_year, :b_period_type);

SPOOL OFF


SET MARKUP CSV ON DELIMIT ',' QUOTE ON
SET PAGESIZE 50000
SET LINESIZE 1000
SET HEADING ON
SET FEEDBACK OFF
SET TERMOUT OFF
SET TRIMSPOOL ON

SPOOL 'report_output/sales_performance_revenue_analysis.csv'

WITH params AS (
    SELECT
        NVL(UPPER(TRIM(:b_period_type)), 'YEAR') AS period_type,
        :b_start_year AS start_year,
        :b_end_year   AS end_year
    FROM dual
),
sales AS (
    SELECT
        EXTRACT(YEAR FROM d.Cal_Date) AS period_year,
        CASE p.period_type
            WHEN 'QUARTER' THEN CEIL(EXTRACT(MONTH FROM d.Cal_Date) / 3)
            WHEN 'MONTH'   THEN EXTRACT(MONTH FROM d.Cal_Date)
            ELSE 1
        END AS period_num,
        sf.Order_ID,
        (
            (sf.Quantity * sf.Unit_Price)
            - sf.Voucher_Discount_Amount
            - sf.MyKasih_Subsidy_Amount
        ) AS net_amount,
        sf.Quantity
    FROM Sales_Fact sf
    JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
    CROSS JOIN params p
    WHERE UPPER(TRIM(sf.SO_Status)) IN (
        'COMPLETED',
        'OUT_FOR_DELIVERY',
        'READY_FOR_PICKUP'
    )
    AND (
        p.start_year IS NULL
        OR EXTRACT(YEAR FROM d.Cal_Date) >= (p.start_year - 1)
    )
    AND (
        p.end_year IS NULL
        OR EXTRACT(YEAR FROM d.Cal_Date) <= p.end_year
    )
),
period_agg AS (
    SELECT
        period_year,
        period_num,
        ROUND(SUM(net_amount), 2) AS total_revenue,
        SUM(Quantity)              AS total_quantity,
        COUNT(DISTINCT Order_ID)   AS order_count
    FROM sales
    GROUP BY
        period_year,
        period_num
    )
SELECT
    p.period_type AS PERIOD_TYPE,
    CASE p.period_type
        WHEN 'MONTH' THEN
            UPPER(
                TO_CHAR(
                    TO_DATE(
                        TO_CHAR(a.period_year, 'FM0000') ||
                        TO_CHAR(a.period_num, 'FM00'),
                        'YYYYMM'
                    ),
                    'MON-YYYY'
                )
            )
        WHEN 'QUARTER' THEN
            'Q' || a.period_num || '-' || a.period_year
        ELSE
            TO_CHAR(a.period_year, 'FM0000')
    END AS PERIOD_LABEL,
    a.period_year AS PERIOD_YEAR,
    a.period_num AS PERIOD_NUMBER,
    a.total_revenue AS TOTAL_REVENUE,
    a.total_quantity AS TOTAL_QUANTITY_SOLD,
    CASE
        WHEN a.order_count = 0 THEN NULL
        ELSE ROUND(a.total_revenue / a.order_count, 2)
    END AS AVERAGE_ORDER_VALUE,
    CASE
        WHEN NVL(prev.total_revenue, 0) = 0 THEN NULL
        ELSE ROUND(
            ((a.total_revenue - prev.total_revenue) / prev.total_revenue) * 100,
            2
        )
    END AS SALES_GROWTH_PCT
FROM period_agg a
CROSS JOIN params p
LEFT JOIN period_agg prev
    ON prev.period_year = a.period_year - 1
   AND prev.period_num  = a.period_num
WHERE a.period_year >= NVL(p.start_year, a.period_year)
  AND a.period_year <= NVL(p.end_year, a.period_year)
ORDER BY
    a.period_year,
    a.period_num;

SPOOL OFF

SET MARKUP CSV OFF
SET TERMOUT ON

PROMPT
PROMPT Report generation completed.
PROMPT Text report : sales_performance_revenue_analysis.txt
PROMPT CSV report  : sales_performance_revenue_analysis.csv
PROMPT
