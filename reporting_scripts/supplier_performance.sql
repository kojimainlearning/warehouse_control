CREATE OR REPLACE PROCEDURE supplier_performance(
    p_period_type        VARCHAR2 DEFAULT 'MONTH',
    p_periods_back       NUMBER   DEFAULT 12,
    p_supplier_filter    VARCHAR2 DEFAULT 'ALL',
    p_branch_filter      VARCHAR2 DEFAULT 'ALL',
    p_product_category   VARCHAR2 DEFAULT 'ALL',
    p_is_cumulative      VARCHAR2 DEFAULT 'N',
    p_start_date         DATE     DEFAULT NULL,
    p_end_date           DATE     DEFAULT NULL
)
IS
    c_line_double CONSTANT VARCHAR2(140) := RPAD('=', 140, '=');
    c_line_single CONSTANT VARCHAR2(140) := RPAD('-', 140, '-');
    c_star        CONSTANT VARCHAR2(140) := RPAD('*', 140, '*');

    v_start_date        DATE;
    v_end_date          DATE;
    v_cursor            SYS_REFCURSOR;
    v_date_format_str   VARCHAR2(30);

    -- Control Break Tracking (Hierarchy: Supplier -> Period -> Category)
    v_prev_supplier VARCHAR2(100) := NULL;
    v_prev_period   VARCHAR2(50)  := NULL;
    v_prev_category VARCHAR2(100) := NULL;

    -- Category Level Accumulators
    v_cat_total_orders     NUMBER := 0;
    v_cat_completed_orders NUMBER := 0;
    v_cat_ontime_orders    NUMBER := 0;
    v_cat_total_value      NUMBER := 0;
    v_cat_lead_sum         NUMBER := 0;
    v_cat_row_count        NUMBER := 0;

    -- Supplier Level Accumulators
    v_supp_total_orders     NUMBER := 0;
    v_supp_completed_orders NUMBER := 0;
    v_supp_ontime_orders    NUMBER := 0;
    v_supp_total_value      NUMBER := 0;
    v_supp_lead_sum         NUMBER := 0;
    v_supp_row_count        NUMBER := 0;

    -- Grand Total Accumulators
    v_grand_supplier_count   NUMBER := 0;
    v_grand_total_orders     NUMBER := 0;
    v_grand_completed_orders NUMBER := 0;
    v_grand_ontime_orders    NUMBER := 0;
    v_grand_total_value      NUMBER := 0;
    v_grand_lead_sum         NUMBER := 0;
    v_grand_excellent_cnt    NUMBER := 0;
    v_grand_good_cnt         NUMBER := 0;
    v_grand_avg_cnt          NUMBER := 0;
    v_grand_poor_cnt         NUMBER := 0;

    -- Cursor Loop Record Variables
    v_period_code      VARCHAR2(50);
    v_supplier_name    VARCHAR2(100);
    v_category_name    VARCHAR2(100);
    v_branch_name      VARCHAR2(100);
    v_branch_id        VARCHAR2(50);
    v_total_orders     NUMBER;
    v_completed_orders NUMBER;
    v_ontime_orders    NUMBER;
    v_on_time_rate     NUMBER(10,2);
    v_total_value      NUMBER(30,2);
    v_avg_lead_days    NUMBER(10,2);

    FUNCTION format_currency_safe(p_amount NUMBER) RETURN VARCHAR2 IS
    BEGIN
        IF p_amount IS NULL THEN RETURN '0.00';
        ELSIF p_amount >= 999999999999 THEN RETURN 'Too Large';
        ELSE RETURN TO_CHAR(p_amount, 'FM999,999,999,990.00');
        END IF;
    END format_currency_safe;

    FUNCTION format_pct_safe(p_pct NUMBER) RETURN VARCHAR2 IS
    BEGIN
        IF p_pct IS NULL THEN RETURN '0.00%';
        ELSE RETURN TO_CHAR(p_pct, 'FM990.00') || '%';
        END IF;
    END format_pct_safe;

    PROCEDURE print_supplier_header(p_sname VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(CHR(10));
        DBMS_OUTPUT.PUT_LINE(c_star);
        DBMS_OUTPUT.PUT_LINE('SUPPLIER: ' || p_sname);
        DBMS_OUTPUT.PUT_LINE(c_star);
    END print_supplier_header;

	PROCEDURE print_period_header(p_pcode VARCHAR2) IS
		v_text    VARCHAR2(100) := ' EVALUATION PERIOD: ' || p_pcode || ' ';
		c_width   CONSTANT NUMBER := 140;
		v_pad_len NUMBER;
	BEGIN
		v_pad_len := TRUNC((c_width - LENGTH(v_text)) / 2);
		
		-- Pads '=' to the left, then fills the remaining right side up to 140 chars with '='
		DBMS_OUTPUT.PUT_LINE(RPAD(LPAD(v_text, LENGTH(v_text) + v_pad_len, '> '), c_width, ' <'));
	END print_period_header;

    PROCEDURE print_category_header(p_cname VARCHAR2) IS
    BEGIN
		DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('PRODUCT CATEGORY: ' || p_cname);
		DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE(c_line_single);
        DBMS_OUTPUT.PUT_LINE(
            RPAD('Branch Name (ID)', 42) || ' | ' ||
            LPAD('Total POs', 9) || ' | ' ||
            LPAD('Completed', 9) || ' | ' ||
            LPAD('On-Time', 8) || ' | ' ||
            LPAD('On Time Delivery %', 23) || ' | ' ||
            LPAD('Lead (Days)', 15) || ' | ' ||
            LPAD('PO Amount (RM)', 15)
        );
        DBMS_OUTPUT.PUT_LINE(c_line_single);
    END print_category_header;

    PROCEDURE print_category_subtotal IS
        v_cat_otd_pct NUMBER := 0;
    BEGIN
        IF v_cat_row_count > 0 THEN
            IF v_cat_total_orders > 0 THEN
                v_cat_otd_pct := ROUND((v_cat_completed_orders / v_cat_total_orders) * 100, 2);
            END IF;

            DBMS_OUTPUT.PUT_LINE(c_line_single);
            DBMS_OUTPUT.PUT_LINE(
                '  ' || RPAD('Subtotal (' || TO_CHAR(v_cat_row_count) || ')', 42) || ' | ' ||
                LPAD(TO_CHAR(v_cat_total_orders), 9) || ' | ' ||
                LPAD(TO_CHAR(v_cat_completed_orders), 9) || ' | ' ||
                LPAD(TO_CHAR(v_cat_ontime_orders), 8) || ' | ' ||
                LPAD(format_pct_safe(v_cat_otd_pct), 23) || ' | ' ||
                LPAD(' ', 15) || ' | ' ||
                LPAD(format_currency_safe(v_cat_total_value), 14)
            );
            DBMS_OUTPUT.PUT_LINE(c_line_single);
			DBMS_OUTPUT.PUT_LINE(c_line_double);
            DBMS_OUTPUT.PUT_LINE(CHR(10));
        END IF;
    END print_category_subtotal;

    -- Aggregates ALL product categories supplied by the supplier across periods
    PROCEDURE print_period_summary(p_sname VARCHAR2) IS
        v_p_code            VARCHAR2(20);
        v_p_total_orders    NUMBER;
        v_p_completed       NUMBER;
        v_p_ontime          NUMBER;
        v_p_total_val       NUMBER;
        v_p_avg_lead        NUMBER;
        v_p_otd_pct         NUMBER;

        v_period_cursor     SYS_REFCURSOR;
    BEGIN
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('[INDIVIDUAL SUPPLIER] PERIOD-BY-PERIOD TREND COMPARISON ' || '(' || UPPER(p_period_type) || ') OF ' || p_sname );
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE(c_line_single);
        DBMS_OUTPUT.PUT_LINE(
            RPAD('Period', 12) || ' | ' ||
            LPAD('Total Orders', 12) || ' | ' ||
            LPAD('Completed', 10) || ' | ' ||
            LPAD('On-Time', 9) || ' | ' ||
            LPAD('On Time Delivery %', 23) || ' | ' ||
            LPAD('Lead (Days)', 26) || ' | ' ||
            LPAD('PO Amount (RM)', 29)
        );
        DBMS_OUTPUT.PUT_LINE(c_line_single);

        OPEN v_period_cursor FOR
            SELECT 
                TO_CHAR(dd_po.Cal_Date, v_date_format_str) AS period_code,
                COUNT(DISTINCT pf.Purchase_Order_ID) AS total_orders,
                COUNT(DISTINCT CASE WHEN pf.Received_Date_Key IS NOT NULL THEN pf.Purchase_Order_ID END) AS completed_orders,
                COUNT(DISTINCT CASE WHEN pf.Received_Date_Key IS NOT NULL AND pf.PO_Status = 'RECEIVED' THEN pf.Purchase_Order_ID END) AS ontime_orders,
                SUM(pf.Line_Total) AS total_value,
                AVG(CASE WHEN pf.Received_Date_Key IS NOT NULL THEN (dd_rec.Cal_Date - dd_po.Cal_Date) END) AS avg_lead
            FROM Purchases_Fact pf
            JOIN Date_Dim dd_po ON pf.PO_Date_Key = dd_po.Date_Key
            LEFT JOIN Date_Dim dd_rec ON pf.Received_Date_Key = dd_rec.Date_Key
            JOIN Supplier_Dim sd ON pf.Supplier_Key = sd.Supplier_Key
            JOIN Branch_Dim bd ON pf.Branch_Key = bd.Branch_Key
            WHERE dd_po.Cal_Date BETWEEN v_start_date AND v_end_date
              AND sd.Supplier_Name = p_sname
              AND (UPPER(p_branch_filter) = 'ALL' OR UPPER(bd.Branch_Name) LIKE '%' || UPPER(TRIM(p_branch_filter)) || '%')
            GROUP BY TO_CHAR(dd_po.Cal_Date, v_date_format_str)
            ORDER BY period_code;

        LOOP
            FETCH v_period_cursor INTO v_p_code, v_p_total_orders, v_p_completed, v_p_ontime, v_p_total_val, v_p_avg_lead;
            EXIT WHEN v_period_cursor%NOTFOUND;

            v_p_otd_pct := CASE WHEN v_p_total_orders > 0 THEN ROUND((v_p_completed / v_p_total_orders) * 100, 2) ELSE 0 END;

            DBMS_OUTPUT.PUT_LINE(
                RPAD(v_p_code, 12) || ' | ' ||
                LPAD(TO_CHAR(v_p_total_orders), 12) || ' | ' ||
                LPAD(TO_CHAR(v_p_completed), 10) || ' | ' ||
                LPAD(TO_CHAR(v_p_ontime), 9) || ' | ' ||
                LPAD(format_pct_safe(v_p_otd_pct), 23) || ' | ' ||
                LPAD(TO_CHAR(NVL(v_p_avg_lead,0), 'FM990.0'), 26) || ' | ' ||
                LPAD(format_currency_safe(v_p_total_val), 29)
            );
        END LOOP;
        CLOSE v_period_cursor;
        DBMS_OUTPUT.PUT_LINE(c_line_single);        
        DBMS_OUTPUT.PUT_LINE(c_line_double);
    END print_period_summary;

    -- Executed strictly after ALL periods and categories under the supplier are done displaying
    PROCEDURE print_supplier_summary IS
        v_supp_otd_pct NUMBER := 0;
        v_supp_avg_lead NUMBER := 0;
        v_perf_rating VARCHAR2(15);
    BEGIN
        IF v_supp_row_count > 0 THEN
            IF v_supp_total_orders > 0 THEN
                v_supp_otd_pct := ROUND((v_supp_completed_orders / v_supp_total_orders) * 100, 2);
            END IF;
            v_supp_avg_lead := ROUND(v_supp_lead_sum / v_supp_row_count, 1);

            IF v_supp_total_orders = 0 THEN v_perf_rating := 'No Orders';
            ELSIF (v_supp_completed_orders / v_supp_total_orders) >= 0.95 THEN 
                v_perf_rating := 'Excellent'; v_grand_excellent_cnt := v_grand_excellent_cnt + 1;
            ELSIF (v_supp_completed_orders / v_supp_total_orders) >= 0.85 THEN 
                v_perf_rating := 'Good'; v_grand_good_cnt := v_grand_good_cnt + 1;
            ELSIF (v_supp_completed_orders / v_supp_total_orders) >= 0.70 THEN 
                v_perf_rating := 'Average'; v_grand_avg_cnt := v_grand_avg_cnt + 1;
            ELSE 
                v_perf_rating := 'Poor'; v_grand_poor_cnt := v_grand_poor_cnt + 1;
            END IF;

            DBMS_OUTPUT.PUT_LINE(c_line_double);
            DBMS_OUTPUT.PUT_LINE('[INDIVIDUAL SUPPLIER] EVALUATION SUMMARY OF ' || v_prev_supplier);
            DBMS_OUTPUT.PUT_LINE(c_line_double);
            DBMS_OUTPUT.PUT_LINE('Supplier Name        : ' || v_prev_supplier);
            DBMS_OUTPUT.PUT_LINE('Total Orders Placed  : ' || v_supp_total_orders);
            DBMS_OUTPUT.PUT_LINE('Completed Deliveries : ' || v_supp_completed_orders);
            DBMS_OUTPUT.PUT_LINE('On-Time Deliveries   : ' || v_supp_ontime_orders);
            DBMS_OUTPUT.PUT_LINE('On-Time Delivery Rate: ' || format_pct_safe(v_supp_otd_pct));
            DBMS_OUTPUT.PUT_LINE('Avg Lead Time (Days) : ' || TO_CHAR(v_supp_avg_lead, 'FM990.0'));
            DBMS_OUTPUT.PUT_LINE('Total Purchase Value : RM ' || format_currency_safe(v_supp_total_value));
            DBMS_OUTPUT.PUT_LINE('Overall Rating       : ' || v_perf_rating);
            DBMS_OUTPUT.PUT_LINE(c_line_double);

            -- Trend summary printed as the final overview block for this supplier
            print_period_summary(v_prev_supplier);
            DBMS_OUTPUT.PUT_LINE(CHR(10));
        END IF;
    END print_supplier_summary;

    PROCEDURE print_analysis_summary IS
        v_overall_otd_pct NUMBER := 0;
        v_overall_avg_lead NUMBER := 0;
        v_recommendation VARCHAR2(500);
        v_health_status VARCHAR2(50);
    BEGIN
        IF v_grand_total_orders > 0 THEN
            v_overall_otd_pct := ROUND((v_grand_completed_orders / v_grand_total_orders) * 100, 2);
        END IF;
        IF v_grand_supplier_count > 0 THEN
            v_overall_avg_lead := ROUND(v_grand_lead_sum / v_grand_supplier_count, 1);
        END IF;

        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('>>> [OVERALL SUPPLIER] GRAND PROCUREMENT SUMMARY <<<');
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('Supplier Evaluations Count : ' || v_grand_supplier_count);
        DBMS_OUTPUT.PUT_LINE('Total Purchase Value       : RM ' || format_currency_safe(v_grand_total_value));
        DBMS_OUTPUT.PUT_LINE('Total Orders Placed        : ' || v_grand_total_orders);
        DBMS_OUTPUT.PUT_LINE('Overall On-Time Delivery   : ' || format_pct_safe(v_overall_otd_pct));
        DBMS_OUTPUT.PUT_LINE('Overall Avg Lead Time      : ' || TO_CHAR(v_overall_avg_lead, 'FM990.0') || ' Days');
        DBMS_OUTPUT.PUT_LINE(CHR(10));
        DBMS_OUTPUT.PUT_LINE('Supplier Performance Breakdown:');
        DBMS_OUTPUT.PUT_LINE(c_line_single);
        DBMS_OUTPUT.PUT_LINE('  Excellent : ' || v_grand_excellent_cnt || ' (' || ROUND((v_grand_excellent_cnt/NVL(NULLIF(v_grand_supplier_count,0),1))*100, 1) || '%)');
        DBMS_OUTPUT.PUT_LINE('  Good      : ' || v_grand_good_cnt || ' (' || ROUND((v_grand_good_cnt/NVL(NULLIF(v_grand_supplier_count,0),1))*100, 1) || '%)');
        DBMS_OUTPUT.PUT_LINE('  Average   : ' || v_grand_avg_cnt || ' (' || ROUND((v_grand_avg_cnt/NVL(NULLIF(v_grand_supplier_count,0),1))*100, 1) || '%)');
        DBMS_OUTPUT.PUT_LINE('  Poor      : ' || v_grand_poor_cnt || ' (' || ROUND((v_grand_poor_cnt/NVL(NULLIF(v_grand_supplier_count,0),1))*100, 1) || '%)');
        DBMS_OUTPUT.PUT_LINE(c_line_double);

        IF v_grand_poor_cnt > (v_grand_supplier_count * 0.25) THEN
            v_recommendation := 'CRITICAL. High proportion of poor-performing suppliers (' || 
                                ROUND((v_grand_poor_cnt/NVL(NULLIF(v_grand_supplier_count,0),1))*100, 1) || '%). ' ||
                                'Initiate SLA reviews and backup contracts.';
            v_health_status := 'POOR';
        ELSIF v_overall_otd_pct < 85.0 THEN
            v_recommendation := 'WARNING. On-Time Delivery rate is below target (' || format_pct_safe(v_overall_otd_pct) || '). ' ||
                                'Review procurement lead times and logistics bottlenecks.';
            v_health_status := 'FAIR';
        ELSE
            v_recommendation := 'HEALTHY. Strong vendor fulfillment with OTD rate at ' || format_pct_safe(v_overall_otd_pct) || '.';
            v_health_status := 'EXCELLENT';
        END IF;
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('>>> [OVERALL SUPPLIER] BUSINESS ANALYSIS AND RECOMMENDATIONS <<<');
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('Procurement Status : ' || v_health_status);
        DBMS_OUTPUT.PUT_LINE('Recommendation     : ' || v_recommendation);
        DBMS_OUTPUT.PUT_LINE(c_line_double);
    END print_analysis_summary;

BEGIN
    -- Configure Date Formatting Strategy
    IF UPPER(p_period_type) = 'YEAR' THEN
        v_date_format_str := 'YYYY';
    ELSIF UPPER(p_period_type) = 'QUARTER' THEN
        v_date_format_str := 'YYYY-"Q"Q';
    ELSE
        v_date_format_str := 'YYYY-MM';
    END IF;

    -- Date Range Calculation
    IF p_start_date IS NOT NULL AND p_end_date IS NOT NULL THEN
        v_start_date := p_start_date;
        v_end_date   := p_end_date;
    ELSIF p_start_date IS NOT NULL THEN
        v_start_date := p_start_date;
        IF UPPER(p_period_type) = 'MONTH' THEN v_end_date := ADD_MONTHS(p_start_date, 1) - 1;
        ELSIF UPPER(p_period_type) = 'QUARTER' THEN v_end_date := ADD_MONTHS(p_start_date, 3) - 1;
        ELSIF UPPER(p_period_type) = 'YEAR' THEN v_end_date := ADD_MONTHS(p_start_date, 12) - 1;
        ELSE RAISE_APPLICATION_ERROR(-20001, 'Invalid period type. Use MONTH, QUARTER, or YEAR');
        END IF;
    ELSE
        IF UPPER(p_period_type) = 'MONTH' THEN v_start_date := TRUNC(ADD_MONTHS(SYSDATE, -p_periods_back), 'MM');
        ELSIF UPPER(p_period_type) = 'QUARTER' THEN v_start_date := TRUNC(ADD_MONTHS(SYSDATE, -(p_periods_back * 3)), 'Q');
        ELSIF UPPER(p_period_type) = 'YEAR' THEN v_start_date := TRUNC(ADD_MONTHS(SYSDATE, -(p_periods_back * 12)), 'YYYY');
        ELSE RAISE_APPLICATION_ERROR(-20001, 'Invalid period type. Use MONTH, QUARTER, or YEAR');
        END IF;

        IF UPPER(p_is_cumulative) = 'Y' OR p_periods_back > 1 THEN v_end_date := TRUNC(SYSDATE);
        ELSE v_end_date := LAST_DAY(v_start_date);
        END IF;
    END IF;

    -- Main Cursor Query (Grouped primarily by Supplier_Name)
    OPEN v_cursor FOR
    WITH supplier_metrics AS (
        SELECT 
            TO_CHAR(dd_po.Cal_Date, v_date_format_str) AS period_code,
            MIN(dd_po.Cal_Date) AS period_sort_date,
            sd.Supplier_Name,
            NVL(pd.Category_Name, 'General Procurement') AS Category_Name,
            bd.Branch_Name,
            bd.Branch_ID,
            COUNT(DISTINCT pf.Purchase_Order_ID) AS total_orders,
            COUNT(DISTINCT CASE WHEN pf.Received_Date_Key IS NOT NULL THEN pf.Purchase_Order_ID END) AS completed_orders,
            COUNT(DISTINCT CASE WHEN pf.Received_Date_Key IS NOT NULL AND pf.PO_Status = 'RECEIVED' THEN pf.Purchase_Order_ID END) AS ontime_orders,
            SUM(pf.Line_Total) AS total_purchase_value,
            AVG(CASE 
                WHEN pf.Received_Date_Key IS NOT NULL 
                THEN (dd_rec.Cal_Date - dd_po.Cal_Date) 
                ELSE NULL 
            END) AS avg_lead_time_days
        FROM Purchases_Fact pf
        JOIN Supplier_Dim sd ON pf.Supplier_Key = sd.Supplier_Key
        JOIN Branch_Dim bd ON pf.Branch_Key = bd.Branch_Key
        JOIN Date_Dim dd_po ON pf.PO_Date_Key = dd_po.Date_Key
        LEFT JOIN Date_Dim dd_rec ON pf.Received_Date_Key IS NOT NULL AND pf.Received_Date_Key = dd_rec.Date_Key
        LEFT JOIN Product_Dim pd ON pf.Product_Key = pd.Product_Key
        WHERE dd_po.Cal_Date BETWEEN v_start_date AND v_end_date
          AND (UPPER(p_supplier_filter) = 'ALL' OR UPPER(sd.Supplier_Name) LIKE '%' || UPPER(TRIM(p_supplier_filter)) || '%')
          AND (UPPER(p_branch_filter) = 'ALL' OR UPPER(bd.Branch_Name) LIKE '%' || UPPER(TRIM(p_branch_filter)) || '%')
          AND (UPPER(p_product_category) = 'ALL' OR UPPER(NVL(pd.Category_Name, 'General Procurement')) = UPPER(TRIM(p_product_category)))
        GROUP BY TO_CHAR(dd_po.Cal_Date, v_date_format_str), sd.Supplier_Name, NVL(pd.Category_Name, 'General Procurement'), bd.Branch_Name, bd.Branch_ID
    )
    SELECT 
        period_code,
        Supplier_Name,
        Category_Name,
        Branch_Name,
        Branch_ID,
        total_orders,
        completed_orders,
        ontime_orders,
        CASE 
            WHEN total_orders > 0 THEN ROUND((completed_orders / total_orders) * 100, 2)
            ELSE 0 
        END AS on_time_delivery_rate,
        total_purchase_value,
        NVL(ROUND(avg_lead_time_days, 1), 0) AS avg_lead_time_days
    FROM supplier_metrics
    ORDER BY Supplier_Name, period_sort_date, Category_Name, Branch_Name;

    -- Report Header
    DBMS_OUTPUT.PUT_LINE(CHR(10));
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('SUPPLIER PERFORMANCE AND PROCUREMENT ANALYSIS REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Analysis Period : ' || TO_CHAR(v_start_date, 'YYYY-MM-DD') || ' to ' || TO_CHAR(v_end_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Period Type     : ' || UPPER(p_period_type));
    DBMS_OUTPUT.PUT_LINE('Supplier Filter : ' || p_supplier_filter);
    DBMS_OUTPUT.PUT_LINE('Category Filter : ' || p_product_category);
    DBMS_OUTPUT.PUT_LINE('Branch Filter   : ' || p_branch_filter);

    -- Control Break Loop (Hierarchy: Supplier -> Period -> Category)
    LOOP
        FETCH v_cursor INTO v_period_code, v_supplier_name, v_category_name, v_branch_name, v_branch_id,
                            v_total_orders, v_completed_orders, v_ontime_orders,
                            v_on_time_rate, v_total_value, v_avg_lead_days;
        EXIT WHEN v_cursor%NOTFOUND;

        IF v_prev_supplier IS NULL THEN
            v_prev_supplier := v_supplier_name;
            v_prev_period   := v_period_code;
            v_prev_category := v_category_name;

            v_grand_supplier_count := v_grand_supplier_count + 1;

            print_supplier_header(v_supplier_name);
            print_period_header(v_period_code);
            print_category_header(v_category_name);

        ELSIF v_supplier_name != v_prev_supplier THEN
            -- Supplier Break: Print last category subtotal and entire supplier overview
            print_category_subtotal;
            print_supplier_summary;

            v_cat_total_orders := 0; v_cat_completed_orders := 0; v_cat_ontime_orders := 0;
            v_cat_total_value := 0;  v_cat_lead_sum := 0;        v_cat_row_count := 0;

            v_supp_total_orders := 0; v_supp_completed_orders := 0; v_supp_ontime_orders := 0;
            v_supp_total_value := 0;  v_supp_lead_sum := 0;        v_supp_row_count := 0;

            v_grand_supplier_count := v_grand_supplier_count + 1;

            v_prev_supplier := v_supplier_name;
            v_prev_period   := v_period_code;
            v_prev_category := v_category_name;

            print_supplier_header(v_supplier_name);
            print_period_header(v_period_code);
            print_category_header(v_category_name);

        ELSIF v_period_code != v_prev_period THEN
            -- Period Break (Within same supplier)
            print_category_subtotal;

            v_cat_total_orders := 0; v_cat_completed_orders := 0; v_cat_ontime_orders := 0;
            v_cat_total_value := 0;  v_cat_lead_sum := 0;        v_cat_row_count := 0;

            v_prev_period   := v_period_code;
            v_prev_category := v_category_name;

            print_period_header(v_period_code);
            print_category_header(v_category_name);

        ELSIF v_category_name != v_prev_category THEN
            -- Category Break (Within same period and supplier)
            print_category_subtotal;

            v_cat_total_orders := 0; v_cat_completed_orders := 0; v_cat_ontime_orders := 0;
            v_cat_total_value := 0;  v_cat_lead_sum := 0;        v_cat_row_count := 0;

            v_prev_category := v_category_name;

            print_category_header(v_category_name);
        END IF;

        -- Detail Row
        DBMS_OUTPUT.PUT_LINE(
            '  ' || RPAD(SUBSTR(v_branch_name || ' (' || v_branch_id || ')', 1, 42), 42) || ' | ' || 
            LPAD(TO_CHAR(v_total_orders), 9) || ' | ' || 
            LPAD(TO_CHAR(v_completed_orders), 9) || ' | ' || 
            LPAD(TO_CHAR(v_ontime_orders), 8) || ' | ' || 
            LPAD(format_pct_safe(v_on_time_rate), 23) || ' | ' || 
            LPAD(TO_CHAR(v_avg_lead_days, 'FM990.0'), 15) || ' | ' || 
            LPAD(format_currency_safe(v_total_value), 14)
        );

        -- Accumulators
        v_cat_total_orders     := v_cat_total_orders + v_total_orders;
        v_cat_completed_orders := v_cat_completed_orders + v_completed_orders;
        v_cat_ontime_orders    := v_cat_ontime_orders + v_ontime_orders;
        v_cat_total_value      := v_cat_total_value + v_total_value;
        v_cat_lead_sum         := v_cat_lead_sum + v_avg_lead_days;
        v_cat_row_count        := v_cat_row_count + 1;

        v_supp_total_orders     := v_supp_total_orders + v_total_orders;
        v_supp_completed_orders := v_supp_completed_orders + v_completed_orders;
        v_supp_ontime_orders    := v_supp_ontime_orders + v_ontime_orders;
        v_supp_total_value      := v_supp_total_value + v_total_value;
        v_supp_lead_sum         := v_supp_lead_sum + v_avg_lead_days;
        v_supp_row_count        := v_supp_row_count + 1;

        v_grand_total_orders     := v_grand_total_orders + v_total_orders;
        v_grand_completed_orders := v_grand_completed_orders + v_completed_orders;
        v_grand_ontime_orders    := v_grand_ontime_orders + v_ontime_orders;
        v_grand_total_value      := v_grand_total_value + v_total_value;
        v_grand_lead_sum         := v_grand_lead_sum + v_avg_lead_days;

    END LOOP;

    -- Final Report Flush
    IF v_grand_supplier_count > 0 THEN
        print_category_subtotal;
        print_supplier_summary;
        print_analysis_summary;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No supplier records found for the specified parameters.');
    END IF;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
END supplier_performance;
/
--Procurement needs to calculate June ALL vendors' scores for SLA penalties and payouts.
EXEC supplier_performance(p_period_type=> 'MONTH',p_periods_back=> 2, p_supplier_filter => 'ALL', p_branch_filter => 'ALL', p_is_cumulative=> 'N');

--The COO requests a LIVE assessment of company-wide procurement commitments and overall supply chain health during a mid-month meeting.
EXEC supplier_performance(p_period_type => 'MONTH', p_periods_back => 7, p_supplier_filter => 'ALL', p_branch_filter => 'ALL', p_is_cumulative => 'Y');
