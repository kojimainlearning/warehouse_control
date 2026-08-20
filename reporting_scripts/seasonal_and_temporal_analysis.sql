--------------------------------------------------------------------------------
-- SEASONAL AND TEMPORAL SALES PATTERNS
--
-- Company-level temporal sales pattern report.
--
-- Outputs:
-- 1. seasonal_temporal_sales_report.txt
-- 2. temporal_company_pattern.csv
--
-- Scope:
-- - Company-level only
-- - No branch analytics
-- - No product/category analytics
-- - No hourly analysis
-- - No promotional analysis
--
-- Sales amount:
-- Net sales = (Quantity * Unit_Price)
--           - Voucher_Discount_Amount
--           - MyKasih_Subsidy_Amount
--
-- Refunds:
-- Completed refunds are deducted by Processed_Date_Key.
--
-- Included SO_Status:
-- COMPLETED, OUT_FOR_DELIVERY, READY_FOR_PICKUP
--------------------------------------------------------------------------------

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


--------------------------------------------------------------------------------
-- REPORT PARAMETERS
--
-- Leave all four values NULL to use all available sales history.
-- If any value is provided, all four must be provided.
--
-- Example full period:
-- :b_start_year  := 2020;
-- :b_start_month := 1;
-- :b_end_year    := 2026;
-- :b_end_month   := 6;
--------------------------------------------------------------------------------

VARIABLE b_start_year NUMBER
VARIABLE b_start_month NUMBER
VARIABLE b_end_year NUMBER
VARIABLE b_end_month NUMBER

BEGIN
    :b_start_year  := NULL;
    :b_start_month := NULL;
    :b_end_year    := NULL;
    :b_end_month   := NULL;
END;
/


--------------------------------------------------------------------------------
-- STORED PROCEDURE
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE generate_temporal_sales_report (
    p_start_year  IN NUMBER DEFAULT NULL,
    p_start_month IN NUMBER DEFAULT NULL,
    p_end_year    IN NUMBER DEFAULT NULL,
    p_end_month   IN NUMBER DEFAULT NULL
) AS

    v_all_null             CHAR(1);
    v_start_date           DATE;
    v_end_date             DATE;
    v_min_sale_date        DATE;
    v_max_sale_date        DATE;
    v_month_count          NUMBER;
    v_expected_days        NUMBER;
    v_count                NUMBER;

    v_total_days           NUMBER;
    v_total_sales          NUMBER;
    v_total_refunds        NUMBER;
    v_total_net            NUMBER;
    v_total_orders         NUMBER;
    v_total_quantity       NUMBER;
    v_avg_daily_net        NUMBER;

    v_peak_day_label       VARCHAR2(100);
    v_peak_day_net         NUMBER;
    v_peak_month_label     VARCHAR2(100);
    v_peak_month_net       NUMBER;

    v_weekend_net          NUMBER;
    v_weekend_pct          NUMBER;

    v_holiday_avg          NUMBER;
    v_nonholiday_avg       NUMBER;
    v_holiday_lift         NUMBER;

    v_top_season_label     VARCHAR2(100);
    v_top_season_lift      NUMBER;

    v_line                 VARCHAR2(4000);
    v_row_count            NUMBER;

    FUNCTION fmt_money (
        p_amount IN NUMBER
    ) RETURN VARCHAR2 IS
    BEGIN
        IF p_amount IS NULL THEN
            RETURN 'N/A';
        END IF;

        RETURN TO_CHAR(
            p_amount,
            'FM999G999G999G999G999G990D00',
            q'[NLS_NUMERIC_CHARACTERS='.,']'
        );
    END fmt_money;

    FUNCTION fmt_number (
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
    END fmt_number;

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

    ----------------------------------------------------------------------------
    -- Parameter validation
    ----------------------------------------------------------------------------

    IF p_start_year IS NULL
       AND p_start_month IS NULL
       AND p_end_year IS NULL
       AND p_end_month IS NULL THEN
        v_all_null := 'Y';
    ELSE
        v_all_null := 'N';
    END IF;

    IF v_all_null = 'N'
       AND (
            p_start_year IS NULL
         OR p_start_month IS NULL
         OR p_end_year IS NULL
         OR p_end_month IS NULL
           ) THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Parameter error: Either all four parameters must be NULL, or all four must be provided.'
        );
    END IF;

    IF v_all_null = 'N' THEN

        IF p_start_year <> TRUNC(p_start_year)
           OR p_start_month <> TRUNC(p_start_month)
           OR p_end_year <> TRUNC(p_end_year)
           OR p_end_month <> TRUNC(p_end_month) THEN
            RAISE_APPLICATION_ERROR(
                -20002,
                'Parameter error: Year and month values must be whole numbers.'
            );
        END IF;

        IF p_start_year <= 0 OR p_end_year <= 0 THEN
            RAISE_APPLICATION_ERROR(
                -20003,
                'Parameter error: Year values must be greater than zero.'
            );
        END IF;

        IF p_start_month NOT BETWEEN 1 AND 12
           OR p_end_month NOT BETWEEN 1 AND 12 THEN
            RAISE_APPLICATION_ERROR(
                -20004,
                'Parameter error: Month values must be between 1 and 12.'
            );
        END IF;

        v_start_date := TO_DATE(
            LPAD(TRUNC(p_start_year), 4, '0') ||
            LPAD(TRUNC(p_start_month), 2, '0'),
            'YYYYMM'
        );

        v_end_date := LAST_DAY(
            TO_DATE(
                LPAD(TRUNC(p_end_year), 4, '0') ||
                LPAD(TRUNC(p_end_month), 2, '0'),
                'YYYYMM'
            )
        );

        IF v_start_date > v_end_date THEN
            RAISE_APPLICATION_ERROR(
                -20005,
                'Parameter error: Start period cannot be after end period.'
            );
        END IF;

        v_month_count :=
            (TRUNC(p_end_year) - TRUNC(p_start_year)) * 12
            + (TRUNC(p_end_month) - TRUNC(p_start_month))
            + 1;

        IF v_month_count < 12 THEN
            RAISE_APPLICATION_ERROR(
                -20006,
                'Period error: The selected reporting period must contain at least 12 months.'
            );
        END IF;

    ELSE

        SELECT COUNT(*) INTO v_count FROM Date_Dim;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20007, 'Missing data: Date_Dim is empty.');
        END IF;

        SELECT COUNT(*) INTO v_count FROM Sales_Fact;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20008, 'Missing data: Sales_Fact is empty.');
        END IF;

        SELECT
            MIN(TRUNC(d.Cal_Date)),
            MAX(TRUNC(d.Cal_Date))
        INTO
            v_min_sale_date,
            v_max_sale_date
        FROM Sales_Fact sf
        JOIN Date_Dim d
            ON d.Date_Key = sf.SO_Date_Key
        WHERE UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
        );

        IF v_min_sale_date IS NULL OR v_max_sale_date IS NULL THEN
            RAISE_APPLICATION_ERROR(
                -20009,
                'No qualifying sales found in the warehouse.'
            );
        END IF;

        v_start_date := TRUNC(v_min_sale_date);
        v_end_date   := TRUNC(v_max_sale_date);

        v_month_count :=
            MONTHS_BETWEEN(
                TRUNC(v_end_date, 'MM'),
                TRUNC(v_start_date, 'MM')
            ) + 1;

        IF v_month_count < 12 THEN
            RAISE_APPLICATION_ERROR(
                -20010,
                'Period error: Available sales history must contain at least 12 months.'
            );
        END IF;

    END IF;


    ----------------------------------------------------------------------------
    -- Validate Date_Dim basic integrity
    ----------------------------------------------------------------------------

    SELECT COUNT(*) INTO v_count
      FROM Date_Dim
     WHERE Date_Key IS NULL
        OR Cal_Date IS NULL;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20011,
            'Missing data: Date_Dim contains NULL Date_Key or Cal_Date values.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM (
            SELECT Date_Key
              FROM Date_Dim
             GROUP BY Date_Key
            HAVING COUNT(*) > 1
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20012,
            'Invalid data: Date_Dim contains duplicate Date_Key values.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM (
            SELECT TRUNC(Cal_Date)
              FROM Date_Dim
             GROUP BY TRUNC(Cal_Date)
            HAVING COUNT(*) > 1
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20013,
            'Invalid data: Date_Dim contains duplicate Cal_Date values.'
        );
    END IF;


    ----------------------------------------------------------------------------
    -- Validate selected calendar coverage
    ----------------------------------------------------------------------------

    v_expected_days := v_end_date - v_start_date + 1;

    SELECT COUNT(DISTINCT TRUNC(Cal_Date)) INTO v_count
      FROM Date_Dim
     WHERE TRUNC(Cal_Date) BETWEEN v_start_date AND v_end_date;

    IF v_count <> v_expected_days THEN
        RAISE_APPLICATION_ERROR(
            -20014,
            'Missing data: Date_Dim does not contain a complete calendar for the selected reporting period.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Date_Dim
     WHERE TRUNC(Cal_Date) BETWEEN v_start_date AND v_end_date
       AND (
            Date_Key IS NULL
         OR Cal_Date IS NULL
         OR Day_Week IS NULL
         OR TRIM(Day_Week) IS NULL
         OR Weekday_Ind IS NULL
         OR Holiday_Ind IS NULL
         OR Cal_Month_Name IS NULL
         OR Cal_Quarter IS NULL
         OR UPPER(TRIM(Weekday_Ind)) NOT IN ('Y', 'N')
         OR UPPER(TRIM(Holiday_Ind)) NOT IN ('Y', 'N')
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20015,
            'Missing or invalid data: Date_Dim contains NULL or invalid temporal attributes in the selected reporting period.'
        );
    END IF;


    ----------------------------------------------------------------------------
    -- Validate Sales_Fact required fields
    ----------------------------------------------------------------------------

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
     WHERE UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
           )
       AND (
            sf.SO_Date_Key IS NULL
         OR sf.Order_ID IS NULL
         OR sf.Quantity IS NULL
         OR sf.Unit_Price IS NULL
         OR sf.Voucher_Discount_Amount IS NULL
         OR sf.MyKasih_Subsidy_Amount IS NULL
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20016,
            'Missing data: Qualifying Sales_Fact rows contain NULL mandatory fields.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
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
            -20017,
            'Invalid data: Negative net sales lines found in qualifying Sales_Fact rows.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
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
            -20018,
            'Missing data: Qualifying Sales_Fact rows contain SO_Date_Key values not found in Date_Dim.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
      JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
     WHERE UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
           )
       AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20019,
            'No qualifying sales found in the selected reporting period.'
        );
    END IF;


    ----------------------------------------------------------------------------
    -- Validate completed refunds
    ----------------------------------------------------------------------------

    SELECT COUNT(*) INTO v_count
      FROM Returns_Fact rf
     WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
       AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
       AND (
            rf.Processed_Date_Key IS NULL
         OR rf.Refund_Amount IS NULL
         OR rf.Refund_Amount < 0
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20020,
            'Missing or invalid data: Completed refund rows contain NULL or negative Processed_Date_Key / Refund_Amount values.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Returns_Fact rf
     WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
       AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
       AND NOT EXISTS (
            SELECT 1
              FROM Date_Dim d
             WHERE d.Date_Key = rf.Processed_Date_Key
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20021,
            'Missing data: Completed refund rows contain Processed_Date_Key values not found in Date_Dim.'
        );
    END IF;


    ----------------------------------------------------------------------------
    -- Executive summary values
    ----------------------------------------------------------------------------

    WITH selected_dates AS (
        SELECT
            d.Date_Key,
            TRUNC(d.Cal_Date) AS cal_date,
            d.Day_Week,
            TRUNC(d.Cal_Date) - TRUNC(d.Cal_Date, 'IW') + 1 AS iso_day,
            CASE
                WHEN UPPER(TRIM(d.Weekday_Ind)) = 'Y' THEN 'Weekday'
                ELSE 'Weekend'
            END AS day_type,
            EXTRACT(YEAR FROM d.Cal_Date) AS cal_year,
            EXTRACT(MONTH FROM d.Cal_Date) AS cal_month,
            CEIL(EXTRACT(MONTH FROM d.Cal_Date) / 3) AS cal_quarter,
            d.Cal_Month_Name,
            CASE
                WHEN d.Festive_Event IS NOT NULL AND TRIM(d.Festive_Event) IS NOT NULL THEN
                    TRIM(d.Festive_Event)
                WHEN UPPER(TRIM(d.Holiday_Ind)) = 'Y' THEN
                    'Public Holiday'
                ELSE
                    'Normal Period'
            END AS season_name,
            CASE
                WHEN UPPER(TRIM(d.Holiday_Ind)) = 'Y' THEN 'Holiday'
                ELSE 'Non-Holiday'
            END AS holiday_flag,
            CASE
                WHEN UPPER(TRIM(d.Holiday_Ind)) = 'N'
                 AND (d.Festive_Event IS NULL OR TRIM(d.Festive_Event) IS NULL) THEN
                    'Y'
                ELSE
                    'N'
            END AS normal_day_flag
        FROM Date_Dim d
        WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
    ),
    sales_by_date AS (
        SELECT
            sf.SO_Date_Key AS date_key,
            SUM(
                (sf.Quantity * sf.Unit_Price)
                - sf.Voucher_Discount_Amount
                - sf.MyKasih_Subsidy_Amount
            ) AS sales_amount,
            COUNT(DISTINCT sf.Order_ID) AS total_orders,
            SUM(sf.Quantity) AS total_quantity
        FROM Sales_Fact sf
        JOIN Date_Dim d
            ON d.Date_Key = sf.SO_Date_Key
        WHERE UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
        )
        AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        GROUP BY sf.SO_Date_Key
    ),
    refunds_by_date AS (
        SELECT
            rf.Processed_Date_Key AS date_key,
            SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
        FROM Returns_Fact rf
        JOIN Date_Dim d
            ON d.Date_Key = rf.Processed_Date_Key
        WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
          AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
          AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        GROUP BY rf.Processed_Date_Key
    ),
    daily AS (
        SELECT
            sd.*,
            NVL(s.sales_amount, 0) AS sales_amount,
            NVL(s.total_orders, 0) AS total_orders,
            NVL(s.total_quantity, 0) AS total_quantity,
            NVL(r.refund_amount, 0) AS refund_amount,
            NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
        FROM selected_dates sd
        LEFT JOIN sales_by_date s
            ON s.date_key = sd.Date_Key
        LEFT JOIN refunds_by_date r
            ON r.date_key = sd.Date_Key
    )
    SELECT
        COUNT(*),
        NVL(SUM(sales_amount), 0),
        NVL(SUM(refund_amount), 0),
        NVL(SUM(net_amount), 0),
        NVL(SUM(total_orders), 0),
        NVL(SUM(total_quantity), 0),
        CASE
            WHEN COUNT(*) = 0 THEN NULL
            ELSE NVL(SUM(net_amount), 0) / COUNT(*)
        END
    INTO
        v_total_days,
        v_total_sales,
        v_total_refunds,
        v_total_net,
        v_total_orders,
        v_total_quantity,
        v_avg_daily_net
    FROM daily;


    ----------------------------------------------------------------------------
    -- Peak day
    ----------------------------------------------------------------------------

    FOR r_peak_day IN (
        WITH selected_dates AS (
            SELECT
                d.Date_Key,
                TRUNC(d.Cal_Date) AS cal_date,
                d.Day_Week,
                TRUNC(d.Cal_Date) - TRUNC(d.Cal_Date, 'IW') + 1 AS iso_day
            FROM Date_Dim d
            WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        ),
        sales_by_date AS (
            SELECT
                sf.SO_Date_Key AS date_key,
                SUM(
                    (sf.Quantity * sf.Unit_Price)
                    - sf.Voucher_Discount_Amount
                    - sf.MyKasih_Subsidy_Amount
                ) AS sales_amount
            FROM Sales_Fact sf
            JOIN Date_Dim d
                ON d.Date_Key = sf.SO_Date_Key
            WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
            AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY sf.SO_Date_Key
        ),
        refunds_by_date AS (
            SELECT
                rf.Processed_Date_Key AS date_key,
                SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
            FROM Returns_Fact rf
            JOIN Date_Dim d
                ON d.Date_Key = rf.Processed_Date_Key
            WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
              AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
              AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY rf.Processed_Date_Key
        ),
        daily AS (
            SELECT
                sd.iso_day,
                sd.Day_Week,
                NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
            FROM selected_dates sd
            LEFT JOIN sales_by_date s
                ON s.date_key = sd.Date_Key
            LEFT JOIN refunds_by_date r
                ON r.date_key = sd.Date_Key
        )
        SELECT
            Day_Week,
            SUM(net_amount) AS net_amount
        FROM daily
        GROUP BY Day_Week
        ORDER BY
            net_amount DESC,
            Day_Week ASC
    ) LOOP
        v_peak_day_label := r_peak_day.Day_Week;
        v_peak_day_net   := r_peak_day.net_amount;
        EXIT;
    END LOOP;


    ----------------------------------------------------------------------------
    -- Peak month
    ----------------------------------------------------------------------------

    FOR r_peak_month IN (
        WITH selected_dates AS (
            SELECT
                d.Date_Key,
                TRUNC(d.Cal_Date) AS cal_date,
                EXTRACT(MONTH FROM d.Cal_Date) AS cal_month,
                d.Cal_Month_Name
            FROM Date_Dim d
            WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        ),
        sales_by_date AS (
            SELECT
                sf.SO_Date_Key AS date_key,
                SUM(
                    (sf.Quantity * sf.Unit_Price)
                    - sf.Voucher_Discount_Amount
                    - sf.MyKasih_Subsidy_Amount
                ) AS sales_amount
            FROM Sales_Fact sf
            JOIN Date_Dim d
                ON d.Date_Key = sf.SO_Date_Key
            WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
            AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY sf.SO_Date_Key
        ),
        refunds_by_date AS (
            SELECT
                rf.Processed_Date_Key AS date_key,
                SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
            FROM Returns_Fact rf
            JOIN Date_Dim d
                ON d.Date_Key = rf.Processed_Date_Key
            WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
              AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
              AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY rf.Processed_Date_Key
        ),
        daily AS (
            SELECT
                sd.cal_month,
                sd.Cal_Month_Name,
                NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
            FROM selected_dates sd
            LEFT JOIN sales_by_date s
                ON s.date_key = sd.Date_Key
            LEFT JOIN refunds_by_date r
                ON r.date_key = sd.Date_Key
        )
        SELECT
            Cal_Month_Name,
            SUM(net_amount) AS net_amount
        FROM daily
        GROUP BY Cal_Month_Name
        ORDER BY
            net_amount DESC,
            Cal_Month_Name ASC
    ) LOOP
        v_peak_month_label := r_peak_month.Cal_Month_Name;
        v_peak_month_net   := r_peak_month.net_amount;
        EXIT;
    END LOOP;


    ----------------------------------------------------------------------------
    -- Weekend contribution
    ----------------------------------------------------------------------------

    WITH selected_dates AS (
        SELECT
            d.Date_Key,
            TRUNC(d.Cal_Date) AS cal_date,
            CASE
                WHEN UPPER(TRIM(d.Weekday_Ind)) = 'Y' THEN 'Weekday'
                ELSE 'Weekend'
            END AS day_type
        FROM Date_Dim d
        WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
    ),
    sales_by_date AS (
        SELECT
            sf.SO_Date_Key AS date_key,
            SUM(
                (sf.Quantity * sf.Unit_Price)
                - sf.Voucher_Discount_Amount
                - sf.MyKasih_Subsidy_Amount
            ) AS sales_amount
        FROM Sales_Fact sf
        JOIN Date_Dim d
            ON d.Date_Key = sf.SO_Date_Key
        WHERE UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
        )
        AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        GROUP BY sf.SO_Date_Key
    ),
    refunds_by_date AS (
        SELECT
            rf.Processed_Date_Key AS date_key,
            SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
        FROM Returns_Fact rf
        JOIN Date_Dim d
            ON d.Date_Key = rf.Processed_Date_Key
        WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
          AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
          AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        GROUP BY rf.Processed_Date_Key
    ),
    daily AS (
        SELECT
            sd.day_type,
            NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
        FROM selected_dates sd
        LEFT JOIN sales_by_date s
            ON s.date_key = sd.Date_Key
        LEFT JOIN refunds_by_date r
            ON r.date_key = sd.Date_Key
    )
    SELECT
        NVL(SUM(CASE WHEN day_type = 'Weekend' THEN net_amount ELSE 0 END), 0),
        NVL(SUM(net_amount), 0)
    INTO
        v_weekend_net,
        v_total_net
    FROM daily;

    IF NVL(v_total_net, 0) = 0 THEN
        v_weekend_pct := NULL;
    ELSE
        v_weekend_pct := v_weekend_net * 100 / v_total_net;
    END IF;


    ----------------------------------------------------------------------------
    -- Holiday lift
    ----------------------------------------------------------------------------

    WITH selected_dates AS (
        SELECT
            d.Date_Key,
            TRUNC(d.Cal_Date) AS cal_date,
            CASE
                WHEN UPPER(TRIM(d.Holiday_Ind)) = 'Y' THEN 'Holiday'
                ELSE 'Non-Holiday'
            END AS holiday_flag
        FROM Date_Dim d
        WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
    ),
    sales_by_date AS (
        SELECT
            sf.SO_Date_Key AS date_key,
            SUM(
                (sf.Quantity * sf.Unit_Price)
                - sf.Voucher_Discount_Amount
                - sf.MyKasih_Subsidy_Amount
            ) AS sales_amount
        FROM Sales_Fact sf
        JOIN Date_Dim d
            ON d.Date_Key = sf.SO_Date_Key
        WHERE UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
        )
        AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        GROUP BY sf.SO_Date_Key
    ),
    refunds_by_date AS (
        SELECT
            rf.Processed_Date_Key AS date_key,
            SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
        FROM Returns_Fact rf
        JOIN Date_Dim d
            ON d.Date_Key = rf.Processed_Date_Key
        WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
          AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
          AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        GROUP BY rf.Processed_Date_Key
    ),
    daily AS (
        SELECT
            sd.holiday_flag,
            NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
        FROM selected_dates sd
        LEFT JOIN sales_by_date s
            ON s.date_key = sd.Date_Key
        LEFT JOIN refunds_by_date r
            ON r.date_key = sd.Date_Key
    )
    SELECT
        CASE
            WHEN SUM(CASE WHEN holiday_flag = 'Holiday' THEN 1 ELSE 0 END) = 0 THEN NULL
            ELSE SUM(CASE WHEN holiday_flag = 'Holiday' THEN net_amount ELSE 0 END)
                 / SUM(CASE WHEN holiday_flag = 'Holiday' THEN 1 ELSE 0 END)
        END,
        CASE
            WHEN SUM(CASE WHEN holiday_flag = 'Non-Holiday' THEN 1 ELSE 0 END) = 0 THEN NULL
            ELSE SUM(CASE WHEN holiday_flag = 'Non-Holiday' THEN net_amount ELSE 0 END)
                 / SUM(CASE WHEN holiday_flag = 'Non-Holiday' THEN 1 ELSE 0 END)
        END
    INTO
        v_holiday_avg,
        v_nonholiday_avg
    FROM daily;

    IF v_holiday_avg IS NULL OR v_nonholiday_avg IS NULL OR v_nonholiday_avg <= 0 THEN
        v_holiday_lift := NULL;
    ELSE
        v_holiday_lift := (v_holiday_avg / v_nonholiday_avg - 1) * 100;
    END IF;


    ----------------------------------------------------------------------------
    -- Top festive season lift
    ----------------------------------------------------------------------------

    FOR r_top_season IN (
        WITH selected_dates AS (
            SELECT
                d.Date_Key,
                TRUNC(d.Cal_Date) AS cal_date,
                CASE
                    WHEN d.Festive_Event IS NOT NULL AND TRIM(d.Festive_Event) IS NOT NULL THEN
                        TRIM(d.Festive_Event)
                    WHEN UPPER(TRIM(d.Holiday_Ind)) = 'Y' THEN
                        'Public Holiday'
                    ELSE
                        'Normal Period'
                END AS season_name,
                CASE
                    WHEN UPPER(TRIM(d.Holiday_Ind)) = 'N'
                     AND (d.Festive_Event IS NULL OR TRIM(d.Festive_Event) IS NULL) THEN
                        'Y'
                    ELSE
                        'N'
                END AS normal_day_flag
            FROM Date_Dim d
            WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        ),
        sales_by_date AS (
            SELECT
                sf.SO_Date_Key AS date_key,
                SUM(
                    (sf.Quantity * sf.Unit_Price)
                    - sf.Voucher_Discount_Amount
                    - sf.MyKasih_Subsidy_Amount
                ) AS sales_amount
            FROM Sales_Fact sf
            JOIN Date_Dim d
                ON d.Date_Key = sf.SO_Date_Key
            WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
            AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY sf.SO_Date_Key
        ),
        refunds_by_date AS (
            SELECT
                rf.Processed_Date_Key AS date_key,
                SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
            FROM Returns_Fact rf
            JOIN Date_Dim d
                ON d.Date_Key = rf.Processed_Date_Key
            WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
              AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
              AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY rf.Processed_Date_Key
        ),
        daily AS (
            SELECT
                sd.season_name,
                sd.normal_day_flag,
                NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
            FROM selected_dates sd
            LEFT JOIN sales_by_date s
                ON s.date_key = sd.Date_Key
            LEFT JOIN refunds_by_date r
                ON r.date_key = sd.Date_Key
        ),
        normal_avg AS (
            SELECT
                CASE
                    WHEN SUM(CASE WHEN normal_day_flag = 'Y' THEN 1 ELSE 0 END) = 0 THEN NULL
                    ELSE SUM(CASE WHEN normal_day_flag = 'Y' THEN net_amount ELSE 0 END)
                         / SUM(CASE WHEN normal_day_flag = 'Y' THEN 1 ELSE 0 END)
                END AS avg_daily_net
            FROM daily
        ),
        season_agg AS (
            SELECT
                d.season_name,
                COUNT(*) AS total_days,
                SUM(d.net_amount) AS net_amount,
                CASE
                    WHEN COUNT(*) = 0 THEN NULL
                    ELSE SUM(d.net_amount) / COUNT(*)
                END AS avg_daily_net,
                n.avg_daily_net AS normal_avg_daily
            FROM daily d
            CROSS JOIN normal_avg n
            WHERE d.season_name <> 'Normal Period'
            GROUP BY
                d.season_name,
                n.avg_daily_net
        )
        SELECT
            season_name,
            CASE
                WHEN avg_daily_net IS NULL OR normal_avg_daily IS NULL OR normal_avg_daily <= 0 THEN NULL
                ELSE (avg_daily_net / normal_avg_daily - 1) * 100
            END AS lift_pct
        FROM season_agg
        ORDER BY
            CASE
                WHEN avg_daily_net IS NULL OR normal_avg_daily IS NULL OR normal_avg_daily <= 0 THEN 1
                ELSE 0
            END,
            lift_pct DESC,
            net_amount DESC
    ) LOOP
        v_top_season_label := r_top_season.season_name;
        v_top_season_lift  := r_top_season.lift_pct;
        EXIT;
    END LOOP;


    ----------------------------------------------------------------------------
    -- Print report header
    ----------------------------------------------------------------------------

    DBMS_OUTPUT.PUT_LINE(RPAD('=', 120, '='));
    DBMS_OUTPUT.PUT_LINE('SEASONAL AND TEMPORAL SALES PATTERNS');
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 120, '='));
    DBMS_OUTPUT.PUT_LINE('Report Generated On : ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Reporting Period    : ' || TO_CHAR(v_start_date, 'DD-MON-YYYY') || ' To ' || TO_CHAR(v_end_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Analysis Level      : Company-Wide Only');
    DBMS_OUTPUT.PUT_LINE('Sales Statuses      : COMPLETED, OUT_FOR_DELIVERY, READY_FOR_PICKUP');
    DBMS_OUTPUT.PUT_LINE('Guest Sales         : Included');
    DBMS_OUTPUT.PUT_LINE('Refunds             : Completed refunds deducted by processed date');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));


    ----------------------------------------------------------------------------
    -- Print executive summary
    ----------------------------------------------------------------------------

    DBMS_OUTPUT.PUT_LINE('EXECUTIVE SUMMARY');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));
    DBMS_OUTPUT.PUT_LINE('Total Calendar Days              : ' || fmt_int(v_total_days));
    DBMS_OUTPUT.PUT_LINE('Total Sales Before Refunds       : RM ' || fmt_money(v_total_sales));
    DBMS_OUTPUT.PUT_LINE('Total Completed Refunds          : RM ' || fmt_money(v_total_refunds));
    DBMS_OUTPUT.PUT_LINE('Total Net Sales                  : RM ' || fmt_money(v_total_net));
    DBMS_OUTPUT.PUT_LINE('Total Orders                     : ' || fmt_int(v_total_orders));
    DBMS_OUTPUT.PUT_LINE('Total Quantity Sold              : ' || fmt_int(v_total_quantity));
    DBMS_OUTPUT.PUT_LINE('Average Daily Net Sales          : RM ' || fmt_money(v_avg_daily_net));
    DBMS_OUTPUT.PUT_LINE('Peak Day Of Week                 : ' || NVL(v_peak_day_label, 'N/A') || ' (' || fmt_money(v_peak_day_net) || ')');
    DBMS_OUTPUT.PUT_LINE('Peak Month                       : ' || NVL(v_peak_month_label, 'N/A') || ' (' || fmt_money(v_peak_month_net) || ')');
    DBMS_OUTPUT.PUT_LINE('Weekend Sales Contribution       : ' || fmt_pct(v_weekend_pct));
    DBMS_OUTPUT.PUT_LINE('Holiday Sales Lift               : ' || fmt_pct(v_holiday_lift));
    DBMS_OUTPUT.PUT_LINE('Top Festive Period Lift          : ' || NVL(v_top_season_label, 'N/A') || ' (' || fmt_pct(v_top_season_lift) || ')');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));


    ----------------------------------------------------------------------------
    -- Print day-of-week pattern
    ----------------------------------------------------------------------------

    DBMS_OUTPUT.PUT_LINE('DAY OF WEEK PATTERN');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_line :=
        RPAD('DAY', 15) ||
        LPAD('DAYS', 8) ||
        LPAD('NET SALES', 24) ||
        LPAD('AVG DAILY', 24) ||
        LPAD('% TOTAL', 12) ||
        LPAD('INDEX', 10);

    DBMS_OUTPUT.PUT_LINE(v_line);
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_row_count := 0;

    FOR r_day IN (
        WITH selected_dates AS (
            SELECT
                d.Date_Key,
                TRUNC(d.Cal_Date) AS cal_date,
                d.Day_Week,
                TRUNC(d.Cal_Date) - TRUNC(d.Cal_Date, 'IW') + 1 AS iso_day
            FROM Date_Dim d
            WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        ),
        sales_by_date AS (
            SELECT
                sf.SO_Date_Key AS date_key,
                SUM(
                    (sf.Quantity * sf.Unit_Price)
                    - sf.Voucher_Discount_Amount
                    - sf.MyKasih_Subsidy_Amount
                ) AS sales_amount
            FROM Sales_Fact sf
            JOIN Date_Dim d
                ON d.Date_Key = sf.SO_Date_Key
            WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
            AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY sf.SO_Date_Key
        ),
        refunds_by_date AS (
            SELECT
                rf.Processed_Date_Key AS date_key,
                SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
            FROM Returns_Fact rf
            JOIN Date_Dim d
                ON d.Date_Key = rf.Processed_Date_Key
            WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
              AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
              AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY rf.Processed_Date_Key
        ),
        daily AS (
            SELECT
                sd.iso_day,
                sd.Day_Week,
                NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
            FROM selected_dates sd
            LEFT JOIN sales_by_date s
                ON s.date_key = sd.Date_Key
            LEFT JOIN refunds_by_date r
                ON r.date_key = sd.Date_Key
        ),
        total AS (
            SELECT
                NVL(SUM(net_amount), 0) AS total_net,
                CASE
                    WHEN COUNT(*) = 0 THEN NULL
                    ELSE NVL(SUM(net_amount), 0) / COUNT(*)
                END AS overall_avg_daily
            FROM daily
        )
        SELECT
            d.iso_day,
            MIN(d.Day_Week) AS Day_Week,
            COUNT(*) AS total_days,
            SUM(d.net_amount) AS net_amount,
            CASE
                WHEN COUNT(*) = 0 THEN NULL
                ELSE SUM(d.net_amount) / COUNT(*)
            END AS avg_daily_net,
            CASE
                WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
                ELSE SUM(d.net_amount) * 100 / MAX(t.total_net)
            END AS pct_total,
            CASE
                WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
                ELSE (SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily)
            END AS seasonal_index
        FROM daily d
        CROSS JOIN total t
        GROUP BY d.iso_day
        ORDER BY d.iso_day
    ) LOOP
        v_row_count := v_row_count + 1;

        v_line :=
            RPAD(r_day.Day_Week, 15) ||
            LPAD(fmt_int(r_day.total_days), 8) ||
            LPAD('RM ' || fmt_money(r_day.net_amount), 24) ||
            LPAD('RM ' || fmt_money(r_day.avg_daily_net), 24) ||
            LPAD(fmt_pct(r_day.pct_total), 12) ||
            LPAD(fmt_number(r_day.seasonal_index), 10);

        DBMS_OUTPUT.PUT_LINE(v_line);
    END LOOP;

    IF v_row_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No day-of-week data found.');
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));


    ----------------------------------------------------------------------------
    -- Print weekend / weekday pattern
    ----------------------------------------------------------------------------

    DBMS_OUTPUT.PUT_LINE('WEEKEND / WEEKDAY PATTERN');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_line :=
        RPAD('DAY TYPE', 15) ||
        LPAD('DAYS', 8) ||
        LPAD('NET SALES', 24) ||
        LPAD('AVG DAILY', 24) ||
        LPAD('% TOTAL', 12) ||
        LPAD('INDEX', 10);

    DBMS_OUTPUT.PUT_LINE(v_line);
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_row_count := 0;

    FOR r_day_type IN (
        WITH selected_dates AS (
            SELECT
                d.Date_Key,
                TRUNC(d.Cal_Date) AS cal_date,
                CASE
                    WHEN UPPER(TRIM(d.Weekday_Ind)) = 'Y' THEN 'Weekday'
                    ELSE 'Weekend'
                END AS day_type
            FROM Date_Dim d
            WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        ),
        sales_by_date AS (
            SELECT
                sf.SO_Date_Key AS date_key,
                SUM(
                    (sf.Quantity * sf.Unit_Price)
                    - sf.Voucher_Discount_Amount
                    - sf.MyKasih_Subsidy_Amount
                ) AS sales_amount
            FROM Sales_Fact sf
            JOIN Date_Dim d
                ON d.Date_Key = sf.SO_Date_Key
            WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
            AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY sf.SO_Date_Key
        ),
        refunds_by_date AS (
            SELECT
                rf.Processed_Date_Key AS date_key,
                SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
            FROM Returns_Fact rf
            JOIN Date_Dim d
                ON d.Date_Key = rf.Processed_Date_Key
            WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
              AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
              AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY rf.Processed_Date_Key
        ),
        daily AS (
            SELECT
                sd.day_type,
                NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
            FROM selected_dates sd
            LEFT JOIN sales_by_date s
                ON s.date_key = sd.Date_Key
            LEFT JOIN refunds_by_date r
                ON r.date_key = sd.Date_Key
        ),
        total AS (
            SELECT
                NVL(SUM(net_amount), 0) AS total_net,
                CASE
                    WHEN COUNT(*) = 0 THEN NULL
                    ELSE NVL(SUM(net_amount), 0) / COUNT(*)
                END AS overall_avg_daily
            FROM daily
        )
        SELECT
            d.day_type,
            COUNT(*) AS total_days,
            SUM(d.net_amount) AS net_amount,
            CASE
                WHEN COUNT(*) = 0 THEN NULL
                ELSE SUM(d.net_amount) / COUNT(*)
            END AS avg_daily_net,
            CASE
                WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
                ELSE SUM(d.net_amount) * 100 / MAX(t.total_net)
            END AS pct_total,
            CASE
                WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
                ELSE (SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily)
            END AS seasonal_index
        FROM daily d
        CROSS JOIN total t
        GROUP BY d.day_type
        ORDER BY
            CASE d.day_type WHEN 'Weekday' THEN 1 ELSE 2 END
    ) LOOP
        v_row_count := v_row_count + 1;

        v_line :=
            RPAD(r_day_type.day_type, 15) ||
            LPAD(fmt_int(r_day_type.total_days), 8) ||
            LPAD('RM ' || fmt_money(r_day_type.net_amount), 24) ||
            LPAD('RM ' || fmt_money(r_day_type.avg_daily_net), 24) ||
            LPAD(fmt_pct(r_day_type.pct_total), 12) ||
            LPAD(fmt_number(r_day_type.seasonal_index), 10);

        DBMS_OUTPUT.PUT_LINE(v_line);
    END LOOP;

    IF v_row_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No weekend/weekday data found.');
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));


    ----------------------------------------------------------------------------
    -- Print monthly seasonal pattern
    ----------------------------------------------------------------------------

    DBMS_OUTPUT.PUT_LINE('MONTHLY SEASONAL PATTERN');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_line :=
        RPAD('MONTH', 15) ||
        LPAD('DAYS', 8) ||
        LPAD('NET SALES', 24) ||
        LPAD('AVG DAILY', 24) ||
        LPAD('% TOTAL', 12) ||
        LPAD('SEASONAL INDEX', 16);

    DBMS_OUTPUT.PUT_LINE(v_line);
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_row_count := 0;

    FOR r_month IN (
        WITH selected_dates AS (
            SELECT
                d.Date_Key,
                TRUNC(d.Cal_Date) AS cal_date,
                EXTRACT(MONTH FROM d.Cal_Date) AS cal_month,
                d.Cal_Month_Name
            FROM Date_Dim d
            WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        ),
        sales_by_date AS (
            SELECT
                sf.SO_Date_Key AS date_key,
                SUM(
                    (sf.Quantity * sf.Unit_Price)
                    - sf.Voucher_Discount_Amount
                    - sf.MyKasih_Subsidy_Amount
                ) AS sales_amount
            FROM Sales_Fact sf
            JOIN Date_Dim d
                ON d.Date_Key = sf.SO_Date_Key
            WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
            AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY sf.SO_Date_Key
        ),
        refunds_by_date AS (
            SELECT
                rf.Processed_Date_Key AS date_key,
                SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
            FROM Returns_Fact rf
            JOIN Date_Dim d
                ON d.Date_Key = rf.Processed_Date_Key
            WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
              AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
              AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY rf.Processed_Date_Key
        ),
        daily AS (
            SELECT
                sd.cal_month,
                sd.Cal_Month_Name,
                NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
            FROM selected_dates sd
            LEFT JOIN sales_by_date s
                ON s.date_key = sd.Date_Key
            LEFT JOIN refunds_by_date r
                ON r.date_key = sd.Date_Key
        ),
        total AS (
            SELECT
                NVL(SUM(net_amount), 0) AS total_net,
                CASE
                    WHEN COUNT(*) = 0 THEN NULL
                    ELSE NVL(SUM(net_amount), 0) / COUNT(*)
                END AS overall_avg_daily
            FROM daily
        )
        SELECT
            d.cal_month,
            MIN(d.Cal_Month_Name) AS Cal_Month_Name,
            COUNT(*) AS total_days,
            SUM(d.net_amount) AS net_amount,
            CASE
                WHEN COUNT(*) = 0 THEN NULL
                ELSE SUM(d.net_amount) / COUNT(*)
            END AS avg_daily_net,
            CASE
                WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
                ELSE SUM(d.net_amount) * 100 / MAX(t.total_net)
            END AS pct_total,
            CASE
                WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
                ELSE (SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily)
            END AS seasonal_index
        FROM daily d
        CROSS JOIN total t
        GROUP BY d.cal_month
        ORDER BY d.cal_month
    ) LOOP
        v_row_count := v_row_count + 1;

        v_line :=
            RPAD(r_month.Cal_Month_Name, 15) ||
            LPAD(fmt_int(r_month.total_days), 8) ||
            LPAD('RM ' || fmt_money(r_month.net_amount), 24) ||
            LPAD('RM ' || fmt_money(r_month.avg_daily_net), 24) ||
            LPAD(fmt_pct(r_month.pct_total), 12) ||
            LPAD(fmt_number(r_month.seasonal_index), 16);

        DBMS_OUTPUT.PUT_LINE(v_line);
    END LOOP;

    IF v_row_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No monthly data found.');
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));


    ----------------------------------------------------------------------------
    -- Print festive / holiday season pattern
    ----------------------------------------------------------------------------

    DBMS_OUTPUT.PUT_LINE('FESTIVE / HOLIDAY SEASON PATTERN');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_line :=
        RPAD('SEASON', 35) ||
        LPAD('DAYS', 8) ||
        LPAD('NET SALES', 24) ||
        LPAD('AVG DAILY', 24) ||
        LPAD('LIFT VS NORMAL', 18);

    DBMS_OUTPUT.PUT_LINE(v_line);
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_row_count := 0;

    FOR r_season IN (
        WITH selected_dates AS (
            SELECT
                d.Date_Key,
                TRUNC(d.Cal_Date) AS cal_date,
                CASE
                    WHEN d.Festive_Event IS NOT NULL AND TRIM(d.Festive_Event) IS NOT NULL THEN
                        TRIM(d.Festive_Event)
                    WHEN UPPER(TRIM(d.Holiday_Ind)) = 'Y' THEN
                        'Public Holiday'
                    ELSE
                        'Normal Period'
                END AS season_name,
                CASE
                    WHEN UPPER(TRIM(d.Holiday_Ind)) = 'N'
                     AND (d.Festive_Event IS NULL OR TRIM(d.Festive_Event) IS NULL) THEN
                        'Y'
                    ELSE
                        'N'
                END AS normal_day_flag
            FROM Date_Dim d
            WHERE TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
        ),
        sales_by_date AS (
            SELECT
                sf.SO_Date_Key AS date_key,
                SUM(
                    (sf.Quantity * sf.Unit_Price)
                    - sf.Voucher_Discount_Amount
                    - sf.MyKasih_Subsidy_Amount
                ) AS sales_amount
            FROM Sales_Fact sf
            JOIN Date_Dim d
                ON d.Date_Key = sf.SO_Date_Key
            WHERE UPPER(TRIM(sf.SO_Status)) IN (
                'COMPLETED',
                'OUT_FOR_DELIVERY',
                'READY_FOR_PICKUP'
            )
            AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY sf.SO_Date_Key
        ),
        refunds_by_date AS (
            SELECT
                rf.Processed_Date_Key AS date_key,
                SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
            FROM Returns_Fact rf
            JOIN Date_Dim d
                ON d.Date_Key = rf.Processed_Date_Key
            WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
              AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
              AND TRUNC(d.Cal_Date) BETWEEN v_start_date AND v_end_date
            GROUP BY rf.Processed_Date_Key
        ),
        daily AS (
            SELECT
                sd.season_name,
                sd.normal_day_flag,
                NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
            FROM selected_dates sd
            LEFT JOIN sales_by_date s
                ON s.date_key = sd.Date_Key
            LEFT JOIN refunds_by_date r
                ON r.date_key = sd.Date_Key
        ),
        normal_avg AS (
            SELECT
                CASE
                    WHEN SUM(CASE WHEN normal_day_flag = 'Y' THEN 1 ELSE 0 END) = 0 THEN NULL
                    ELSE SUM(CASE WHEN normal_day_flag = 'Y' THEN net_amount ELSE 0 END)
                         / SUM(CASE WHEN normal_day_flag = 'Y' THEN 1 ELSE 0 END)
                END AS avg_daily_net
            FROM daily
        )
        SELECT
            d.season_name,
            COUNT(*) AS total_days,
            SUM(d.net_amount) AS net_amount,
            CASE
                WHEN COUNT(*) = 0 THEN NULL
                ELSE SUM(d.net_amount) / COUNT(*)
            END AS avg_daily_net,
            CASE
                WHEN d.season_name = 'Normal Period' THEN NULL
                WHEN MAX(n.avg_daily_net) IS NULL OR MAX(n.avg_daily_net) <= 0 THEN NULL
                ELSE ((SUM(d.net_amount) / COUNT(*)) / MAX(n.avg_daily_net) - 1) * 100
            END AS lift_pct
        FROM daily d
        CROSS JOIN normal_avg n
        GROUP BY d.season_name
        ORDER BY
            CASE
                WHEN d.season_name = 'Normal Period' THEN 3
                WHEN d.season_name = 'Public Holiday' THEN 2
                ELSE 1
            END,
            SUM(d.net_amount) DESC
    ) LOOP
        v_row_count := v_row_count + 1;

        v_line :=
            RPAD(r_season.season_name, 35) ||
            LPAD(fmt_int(r_season.total_days), 8) ||
            LPAD('RM ' || fmt_money(r_season.net_amount), 24) ||
            LPAD('RM ' || fmt_money(r_season.avg_daily_net), 24) ||
            LPAD(fmt_pct(r_season.lift_pct), 18);

        DBMS_OUTPUT.PUT_LINE(v_line);
    END LOOP;

    IF v_row_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No festive/holiday season data found.');
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 120, '='));
    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 120, '='));

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
        RAISE;
END generate_temporal_sales_report;
/

SHOW ERRORS PROCEDURE generate_temporal_sales_report

DECLARE
    v_error_count NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO v_error_count
      FROM USER_ERRORS
     WHERE name = 'GENERATE_TEMPORAL_SALES_REPORT'
       AND type = 'PROCEDURE';

    IF v_error_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20022,
            'Procedure GENERATE_TEMPORAL_SALES_REPORT has compilation errors. Please check SHOW ERRORS output.'
        );
    END IF;
END;
/


--------------------------------------------------------------------------------
-- SPOOL FORMATTED EXECUTIVE REPORT
--------------------------------------------------------------------------------

SPOOL 'report_output/seasonal_temporal_sales_report.txt'

EXEC generate_temporal_sales_report(:b_start_year, :b_start_month, :b_end_year, :b_end_month);

SPOOL OFF


--------------------------------------------------------------------------------
-- SPOOL RAW CSV FOR VISUALISATION
--------------------------------------------------------------------------------

SET MARKUP CSV ON DELIMIT ',' QUOTE ON
SET PAGESIZE 50000
SET LINESIZE 32767
SET HEADING ON
SET FEEDBACK OFF
SET TERMOUT OFF
SET TRIMSPOOL ON

SPOOL 'report_output/temporal_company_pattern.csv'

WITH input_params AS (
    SELECT
        :b_start_year  AS start_year,
        :b_start_month AS start_month,
        :b_end_year    AS end_year,
        :b_end_month   AS end_month
    FROM dual
),
all_history AS (
    SELECT
        MIN(TRUNC(d.Cal_Date)) AS min_date,
        MAX(TRUNC(d.Cal_Date)) AS max_date
    FROM Sales_Fact sf
    JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
    WHERE UPPER(TRIM(sf.SO_Status)) IN (
        'COMPLETED',
        'OUT_FOR_DELIVERY',
        'READY_FOR_PICKUP'
    )
),
report_params AS (
    SELECT
        CASE
            WHEN ip.start_year IS NULL THEN TRUNC(ah.min_date)
            ELSE TO_DATE(
                LPAD(ip.start_year, 4, '0') ||
                LPAD(ip.start_month, 2, '0'),
                'YYYYMM'
            )
        END AS start_date,
        CASE
            WHEN ip.end_year IS NULL THEN TRUNC(ah.max_date)
            ELSE LAST_DAY(
                TO_DATE(
                    LPAD(ip.end_year, 4, '0') ||
                    LPAD(ip.end_month, 2, '0'),
                    'YYYYMM'
                )
            )
        END AS end_date
    FROM input_params ip
    CROSS JOIN all_history ah
),
selected_dates AS (
    SELECT
        d.Date_Key,
        TRUNC(d.Cal_Date) AS cal_date,
        d.Day_Week,
        TRUNC(d.Cal_Date) - TRUNC(d.Cal_Date, 'IW') + 1 AS iso_day,
        CASE
            WHEN UPPER(TRIM(d.Weekday_Ind)) = 'Y' THEN 'Weekday'
            ELSE 'Weekend'
        END AS day_type,
        EXTRACT(YEAR FROM d.Cal_Date) AS cal_year,
        EXTRACT(MONTH FROM d.Cal_Date) AS cal_month,
        CEIL(EXTRACT(MONTH FROM d.Cal_Date) / 3) AS cal_quarter,
        d.Cal_Month_Name,
        CASE
            WHEN d.Festive_Event IS NOT NULL AND TRIM(d.Festive_Event) IS NOT NULL THEN
                TRIM(d.Festive_Event)
            WHEN UPPER(TRIM(d.Holiday_Ind)) = 'Y' THEN
                'Public Holiday'
            ELSE
                'Normal Period'
            END AS season_name,
        CASE
            WHEN UPPER(TRIM(d.Holiday_Ind)) = 'Y' THEN 'Holiday'
            ELSE 'Non-Holiday'
        END AS holiday_flag,
        CASE
            WHEN UPPER(TRIM(d.Holiday_Ind)) = 'N'
             AND (d.Festive_Event IS NULL OR TRIM(d.Festive_Event) IS NULL) THEN
                'Y'
            ELSE
                'N'
        END AS normal_day_flag
    FROM Date_Dim d
    CROSS JOIN report_params p
    WHERE TRUNC(d.Cal_Date) BETWEEN p.start_date AND p.end_date
),
sales_by_date AS (
    SELECT
        sf.SO_Date_Key AS date_key,
        SUM(
            (sf.Quantity * sf.Unit_Price)
            - sf.Voucher_Discount_Amount
            - sf.MyKasih_Subsidy_Amount
        ) AS sales_amount,
        COUNT(DISTINCT sf.Order_ID) AS total_orders,
        SUM(sf.Quantity) AS total_quantity
    FROM Sales_Fact sf
    JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
    CROSS JOIN report_params p
    WHERE UPPER(TRIM(sf.SO_Status)) IN (
        'COMPLETED',
        'OUT_FOR_DELIVERY',
        'READY_FOR_PICKUP'
    )
    AND TRUNC(d.Cal_Date) BETWEEN p.start_date AND p.end_date
    GROUP BY sf.SO_Date_Key
),
refunds_by_date AS (
    SELECT
        rf.Processed_Date_Key AS date_key,
        SUM(NVL(rf.Refund_Amount, 0)) AS refund_amount
    FROM Returns_Fact rf
    JOIN Date_Dim d
        ON d.Date_Key = rf.Processed_Date_Key
    CROSS JOIN report_params p
    WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
      AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
      AND TRUNC(d.Cal_Date) BETWEEN p.start_date AND p.end_date
    GROUP BY rf.Processed_Date_Key
),
daily AS (
    SELECT
        sd.*,
        NVL(s.sales_amount, 0) AS sales_amount,
        NVL(s.total_orders, 0) AS total_orders,
        NVL(s.total_quantity, 0) AS total_quantity,
        NVL(r.refund_amount, 0) AS refund_amount,
        NVL(s.sales_amount, 0) - NVL(r.refund_amount, 0) AS net_amount
    FROM selected_dates sd
    LEFT JOIN sales_by_date s
        ON s.date_key = sd.Date_Key
    LEFT JOIN refunds_by_date r
        ON r.date_key = sd.Date_Key
),
total AS (
    SELECT
        COUNT(*) AS total_days,
        NVL(SUM(sales_amount), 0) AS total_sales,
        NVL(SUM(refund_amount), 0) AS total_refunds,
        NVL(SUM(net_amount), 0) AS total_net,
        NVL(SUM(total_orders), 0) AS total_orders,
        NVL(SUM(total_quantity), 0) AS total_quantity,
        CASE
            WHEN COUNT(*) = 0 THEN NULL
            ELSE NVL(SUM(net_amount), 0) / COUNT(*)
        END AS overall_avg_daily
    FROM daily
),
normal_avg AS (
    SELECT
        CASE
            WHEN SUM(CASE WHEN normal_day_flag = 'Y' THEN 1 ELSE 0 END) = 0 THEN NULL
            ELSE SUM(CASE WHEN normal_day_flag = 'Y' THEN net_amount ELSE 0 END)
                 / SUM(CASE WHEN normal_day_flag = 'Y' THEN 1 ELSE 0 END)
        END AS avg_daily_net
    FROM daily
),
nonholiday_avg AS (
    SELECT
        CASE
            WHEN SUM(CASE WHEN holiday_flag = 'Non-Holiday' THEN 1 ELSE 0 END) = 0 THEN NULL
            ELSE SUM(CASE WHEN holiday_flag = 'Non-Holiday' THEN net_amount ELSE 0 END)
                 / SUM(CASE WHEN holiday_flag = 'Non-Holiday' THEN 1 ELSE 0 END)
        END AS avg_daily_net
    FROM daily
),
patterns AS (
    SELECT
        'DAY_OF_WEEK' AS PATTERN_TYPE,
        d.iso_day AS PERIOD_KEY,
        MIN(d.Day_Week) AS PERIOD_LABEL,
        d.iso_day AS SORT_ORDER,
        COUNT(*) AS TOTAL_DAYS,
        ROUND(SUM(d.sales_amount), 2) AS SALES_AMOUNT_BEFORE_REFUNDS,
        ROUND(SUM(d.refund_amount), 2) AS REFUND_AMOUNT,
        ROUND(SUM(d.net_amount), 2) AS NET_SALES,
        SUM(d.total_orders) AS TOTAL_ORDERS,
        SUM(d.total_quantity) AS TOTAL_QUANTITY,
        CASE
            WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
            ELSE ROUND(SUM(d.net_amount) * 100 / MAX(t.total_net), 2)
        END AS PERCENT_OF_TOTAL_NET_SALES,
        ROUND(SUM(d.net_amount) / COUNT(*), 2) AS AVG_DAILY_NET_SALES,
        CASE
            WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
            ELSE ROUND((SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily), 4)
        END AS SEASONAL_INDEX,
        CAST(NULL AS NUMBER) AS SALES_LIFT_PCT
    FROM daily d
    CROSS JOIN total t
    GROUP BY d.iso_day

    UNION ALL

    SELECT
        'WEEKEND_WEEKDAY',
        CASE d.day_type WHEN 'Weekday' THEN 1 ELSE 2 END,
        d.day_type,
        CASE d.day_type WHEN 'Weekday' THEN 1 ELSE 2 END,
        COUNT(*),
        ROUND(SUM(d.sales_amount), 2),
        ROUND(SUM(d.refund_amount), 2),
        ROUND(SUM(d.net_amount), 2),
        SUM(d.total_orders),
        SUM(d.total_quantity),
        CASE
            WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
            ELSE ROUND(SUM(d.net_amount) * 100 / MAX(t.total_net), 2)
        END,
        ROUND(SUM(d.net_amount) / COUNT(*), 2),
        CASE
            WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
            ELSE ROUND((SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily), 4)
        END,
        CAST(NULL AS NUMBER)
    FROM daily d
    CROSS JOIN total t
    GROUP BY d.day_type

    UNION ALL

    SELECT
        'MONTH_OF_YEAR',
        d.cal_month,
        MIN(d.Cal_Month_Name),
        d.cal_month,
        COUNT(*),
        ROUND(SUM(d.sales_amount), 2),
        ROUND(SUM(d.refund_amount), 2),
        ROUND(SUM(d.net_amount), 2),
        SUM(d.total_orders),
        SUM(d.total_quantity),
        CASE
            WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
            ELSE ROUND(SUM(d.net_amount) * 100 / MAX(t.total_net), 2)
        END,
        ROUND(SUM(d.net_amount) / COUNT(*), 2),
        CASE
            WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
            ELSE ROUND((SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily), 4)
        END,
        CAST(NULL AS NUMBER)
    FROM daily d
    CROSS JOIN total t
    GROUP BY d.cal_month

    UNION ALL

    SELECT
        'YEAR_MONTH',
        d.cal_year * 100 + d.cal_month,
        MIN(TO_CHAR(d.cal_date, 'YYYY-MM')),
        d.cal_year * 100 + d.cal_month,
        COUNT(*),
        ROUND(SUM(d.sales_amount), 2),
        ROUND(SUM(d.refund_amount), 2),
        ROUND(SUM(d.net_amount), 2),
        SUM(d.total_orders),
        SUM(d.total_quantity),
        CASE
            WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
            ELSE ROUND(SUM(d.net_amount) * 100 / MAX(t.total_net), 2)
        END,
        ROUND(SUM(d.net_amount) / COUNT(*), 2),
        CASE
            WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
            ELSE ROUND((SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily), 4)
        END,
        CAST(NULL AS NUMBER)
    FROM daily d
    CROSS JOIN total t
    GROUP BY
        d.cal_year,
        d.cal_month

    UNION ALL

    SELECT
        'QUARTER_OF_YEAR',
        d.cal_quarter,
        'Q' || d.cal_quarter,
        d.cal_quarter,
        COUNT(*),
        ROUND(SUM(d.sales_amount), 2),
        ROUND(SUM(d.refund_amount), 2),
        ROUND(SUM(d.net_amount), 2),
        SUM(d.total_orders),
        SUM(d.total_quantity),
        CASE
            WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
            ELSE ROUND(SUM(d.net_amount) * 100 / MAX(t.total_net), 2)
        END,
        ROUND(SUM(d.net_amount) / COUNT(*), 2),
        CASE
            WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
            ELSE ROUND((SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily), 4)
        END,
        CAST(NULL AS NUMBER)
    FROM daily d
    CROSS JOIN total t
    GROUP BY d.cal_quarter

    UNION ALL

    SELECT
        'YEAR_QUARTER',
        d.cal_year * 10 + d.cal_quarter,
        MIN(TO_CHAR(d.cal_date, 'YYYY')) || '-Q' || MIN(d.cal_quarter),
        d.cal_year * 10 + d.cal_quarter,
        COUNT(*),
        ROUND(SUM(d.sales_amount), 2),
        ROUND(SUM(d.refund_amount), 2),
        ROUND(SUM(d.net_amount), 2),
        SUM(d.total_orders),
        SUM(d.total_quantity),
        CASE
            WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
            ELSE ROUND(SUM(d.net_amount) * 100 / MAX(t.total_net), 2)
        END,
        ROUND(SUM(d.net_amount) / COUNT(*), 2),
        CASE
            WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
            ELSE ROUND((SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily), 4)
        END,
        CAST(NULL AS NUMBER)
    FROM daily d
    CROSS JOIN total t
    GROUP BY
        d.cal_year,
        d.cal_quarter

    UNION ALL

    SELECT
        'HOLIDAY_FLAG',
        CASE d.holiday_flag WHEN 'Holiday' THEN 1 ELSE 2 END,
        d.holiday_flag,
        CASE d.holiday_flag WHEN 'Holiday' THEN 1 ELSE 2 END,
        COUNT(*),
        ROUND(SUM(d.sales_amount), 2),
        ROUND(SUM(d.refund_amount), 2),
        ROUND(SUM(d.net_amount), 2),
        SUM(d.total_orders),
        SUM(d.total_quantity),
        CASE
            WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
            ELSE ROUND(SUM(d.net_amount) * 100 / MAX(t.total_net), 2)
        END,
        ROUND(SUM(d.net_amount) / COUNT(*), 2),
        CASE
            WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
            ELSE ROUND((SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily), 4)
        END,
        CASE
            WHEN d.holiday_flag = 'Holiday'
             AND MAX(nh.avg_daily_net) IS NOT NULL
             AND MAX(nh.avg_daily_net) > 0 THEN
                ROUND(((SUM(d.net_amount) / COUNT(*)) / MAX(nh.avg_daily_net) - 1) * 100, 2)
            ELSE NULL
        END
    FROM daily d
    CROSS JOIN total t
    CROSS JOIN nonholiday_avg nh
    GROUP BY d.holiday_flag

    UNION ALL

    SELECT
        'SEASON',
        CAST(NULL AS NUMBER),
        d.season_name,
        CASE
            WHEN d.season_name = 'Normal Period' THEN 999999
            WHEN d.season_name = 'Public Holiday' THEN 999998
            ELSE 1
        END,
        COUNT(*),
        ROUND(SUM(d.sales_amount), 2),
        ROUND(SUM(d.refund_amount), 2),
        ROUND(SUM(d.net_amount), 2),
        SUM(d.total_orders),
        SUM(d.total_quantity),
        CASE
            WHEN MAX(t.total_net) IS NULL OR MAX(t.total_net) = 0 THEN NULL
            ELSE ROUND(SUM(d.net_amount) * 100 / MAX(t.total_net), 2)
        END,
        ROUND(SUM(d.net_amount) / COUNT(*), 2),
        CASE
            WHEN MAX(t.overall_avg_daily) IS NULL OR MAX(t.overall_avg_daily) <= 0 THEN NULL
            ELSE ROUND((SUM(d.net_amount) / COUNT(*)) / MAX(t.overall_avg_daily), 4)
        END,
        CASE
            WHEN d.season_name <> 'Normal Period'
             AND MAX(n.avg_daily_net) IS NOT NULL
             AND MAX(n.avg_daily_net) > 0 THEN
                ROUND(((SUM(d.net_amount) / COUNT(*)) / MAX(n.avg_daily_net) - 1) * 100, 2)
            ELSE NULL
        END
    FROM daily d
    CROSS JOIN total t
    CROSS JOIN normal_avg n
    GROUP BY d.season_name
)
SELECT *
  FROM patterns
 ORDER BY
    CASE PATTERN_TYPE
        WHEN 'DAY_OF_WEEK' THEN 1
        WHEN 'WEEKEND_WEEKDAY' THEN 2
        WHEN 'MONTH_OF_YEAR' THEN 3
        WHEN 'YEAR_MONTH' THEN 4
        WHEN 'QUARTER_OF_YEAR' THEN 5
        WHEN 'YEAR_QUARTER' THEN 6
        WHEN 'HOLIDAY_FLAG' THEN 7
        WHEN 'SEASON' THEN 8
        ELSE 9
    END,
    SORT_ORDER,
    PERIOD_LABEL;

SPOOL OFF

SET MARKUP CSV OFF
SET TERMOUT ON

PROMPT
PROMPT Seasonal and temporal sales pattern report generation completed.
PROMPT Text report : seasonal_temporal_sales_report.txt
PROMPT CSV report  : temporal_company_pattern.csv
PROMPT

SET FEEDBACK ON