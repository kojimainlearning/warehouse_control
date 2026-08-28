CREATE OR REPLACE PROCEDURE inventory_turnover(
    p_period_type        VARCHAR2 DEFAULT 'MONTH',
    p_periods_back       NUMBER DEFAULT 12,
    p_branch_filter      VARCHAR2 DEFAULT 'ALL',
    p_product_category   VARCHAR2 DEFAULT 'ALL',
    p_start_date         DATE DEFAULT NULL,
    p_end_date           DATE DEFAULT NULL
)
IS
    c_line_double   CONSTANT VARCHAR2(145) := RPAD('=', 145, '=');
    c_line_single   CONSTANT VARCHAR2(145) := RPAD('-', 145, '-');
	c_star CONSTANT VARCHAR2(145) := RPAD('*', 145, '*');
	
    v_start_date       DATE;
    v_end_date         DATE;
    v_total_months     NUMBER := 1;
    v_cursor           SYS_REFCURSOR;
    v_turnover_label   VARCHAR2(20); -- Dynamic Header Variable

    -- Control Break Variables
    v_prev_branch        VARCHAR2(100) := NULL;
    v_prev_branch_id     VARCHAR2(50)  := NULL;
    v_prev_period        VARCHAR2(50)  := NULL;
    v_prev_category      VARCHAR2(100) := NULL;

    -- Category Accumulators
    v_cat_total_items    NUMBER := 0;
    v_cat_total_sales    NUMBER := 0;
    v_cat_total_purchase NUMBER := 0;
    v_cat_avg_stock      NUMBER := 0;

    -- Period Accumulators
    v_prd_total_items    NUMBER := 0;
    v_prd_total_sales    NUMBER := 0;
    v_prd_total_purchase NUMBER := 0;
    v_prd_avg_stock      NUMBER := 0;
    v_prd_fast_count     NUMBER := 0;
    v_prd_normal_count   NUMBER := 0;
    v_prd_slow_count     NUMBER := 0;
    v_prd_dead_count     NUMBER := 0;
    v_prd_inactive_count NUMBER := 0;

    -- Period Summary Record Collection
    TYPE r_period_summary IS RECORD (
        period_label   VARCHAR2(50),
        total_items    NUMBER,
        total_sales    NUMBER,
        total_purchase NUMBER,
        avg_stock      NUMBER,
        fast_count     NUMBER,
        normal_count   NUMBER,
        slow_count     NUMBER,
        dead_count     NUMBER,
        inactive_count NUMBER
    );
    TYPE t_period_summary_list IS TABLE OF r_period_summary INDEX BY PLS_INTEGER;
    v_branch_period_list t_period_summary_list;
    v_period_idx         NUMBER := 0;

    -- Branch Accumulators
    v_branch_total_sales    NUMBER := 0;
    v_branch_total_purchase NUMBER := 0;
    v_branch_avg_stock_sum  NUMBER := 0;
    v_branch_period_count   NUMBER := 0;
    v_branch_dead_count     NUMBER := 0;
    v_branch_slow_count     NUMBER := 0;
    v_branch_normal_count   NUMBER := 0;
    v_branch_fast_count     NUMBER := 0;
    v_branch_inactive_count NUMBER := 0;

    -- Cursor Record Variables
    v_branch_name          VARCHAR2(100);
    v_branch_id            VARCHAR2(50);
    v_period_label         VARCHAR2(50);
    v_category_name        VARCHAR2(100);
    v_item_name            VARCHAR2(200);
    v_avg_stock_on_hand    NUMBER(15,0);
    v_inventory_turnover   NUMBER(10,2);
    v_efficiency_cat       VARCHAR2(20);
    v_total_sales          NUMBER(15,2);
    v_total_purchase       NUMBER(15,2);
    v_months_in_period     NUMBER;

    -- Formatting Helpers
    FUNCTION format_currency_safe(p_amount NUMBER) RETURN VARCHAR2 IS
    BEGIN
        IF p_amount IS NULL THEN RETURN '0.00';
        ELSIF p_amount >= 999999999999 THEN RETURN 'Too Large';
        ELSE RETURN TO_CHAR(p_amount, 'FM999,990.00');
        END IF;
    END;

    FUNCTION format_integer_safe(p_amount NUMBER) RETURN VARCHAR2 IS
    BEGIN
        IF p_amount IS NULL THEN RETURN '0';
        ELSIF p_amount >= 999999999999 THEN RETURN 'Too Large';
        ELSE RETURN TO_CHAR(ROUND(p_amount), 'FM999,990');
        END IF;
    END;

    -- Display Helper Procedures
    PROCEDURE print_branch_header(p_bname VARCHAR2, p_bid VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(c_star);
        DBMS_OUTPUT.PUT_LINE('BRANCH ID: ' || p_bid || ' | BRANCH NAME: ' || p_bname);
        DBMS_OUTPUT.PUT_LINE(c_star);
    END;

    PROCEDURE print_period_header(p_period VARCHAR2) IS
        v_text    VARCHAR2(100) := ' EVALUATION PERIOD: ' || p_period || ' ';
        c_width   CONSTANT NUMBER := 145;
        v_pad_len NUMBER;
    BEGIN
        v_pad_len := TRUNC((c_width - LENGTH(v_text)) / 2);
        DBMS_OUTPUT.PUT_LINE(RPAD(LPAD(v_text, LENGTH(v_text) + v_pad_len, '> '), c_width, ' <'));
    END print_period_header;

    PROCEDURE print_category_header(p_cname VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('PRODUCT CATEGORY: ' || p_cname);
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE(c_line_single);
        DBMS_OUTPUT.PUT_LINE(
            '  ' || RPAD('Item Name', 31) || ' | ' ||
            LPAD('Sales (RM)', 16) || ' | ' ||
            LPAD('Purchase (RM)', 15) || ' | ' ||
            LPAD('Avg Stock', 11) || ' | ' ||
            LPAD(v_turnover_label, 14) || ' | ' ||
            LPAD('Efficiency', 42)
        );
        DBMS_OUTPUT.PUT_LINE(c_line_single);
    END;

    PROCEDURE print_category_subtotal IS
        v_cat_turnover NUMBER := 0;
    BEGIN
        IF v_cat_total_items > 0 THEN
            IF v_cat_avg_stock > 0 THEN
                -- Period-specific Turnover (Sales / Avg Stock)
                v_cat_turnover := ROUND(v_cat_total_sales / v_cat_avg_stock, 2);
            END IF;

            DBMS_OUTPUT.PUT_LINE(c_line_single);
            DBMS_OUTPUT.PUT_LINE(
                '  ' || RPAD('Subtotal (' || v_cat_total_items || ' Items)', 31) || ' | ' ||
                LPAD(format_currency_safe(v_cat_total_sales), 16) || ' | ' ||
                LPAD(format_currency_safe(v_cat_total_purchase), 15) || ' | ' ||
                LPAD(format_integer_safe(v_cat_avg_stock), 11) || ' | ' ||
                LPAD(TO_CHAR(v_cat_turnover, 'FM999,990.00'), 14) || ' | '
            );
            DBMS_OUTPUT.PUT_LINE(c_line_single);
        END IF;
    END;

    PROCEDURE print_period_subtotal IS
        v_prd_turnover NUMBER := 0;
    BEGIN
        IF v_prd_total_items > 0 THEN
            IF v_prd_avg_stock > 0 THEN
                v_prd_turnover := ROUND(v_prd_total_sales / v_prd_avg_stock, 2);
            END IF;

            v_period_idx := v_period_idx + 1;
            v_branch_period_list(v_period_idx).period_label   := v_prev_period;
            v_branch_period_list(v_period_idx).total_items    := v_prd_total_items;
            v_branch_period_list(v_period_idx).total_sales    := v_prd_total_sales;
            v_branch_period_list(v_period_idx).total_purchase := v_prd_total_purchase;
            v_branch_period_list(v_period_idx).avg_stock      := ROUND(v_prd_avg_stock);
            v_branch_period_list(v_period_idx).fast_count     := v_prd_fast_count;
            v_branch_period_list(v_period_idx).normal_count   := v_prd_normal_count;
            v_branch_period_list(v_period_idx).slow_count     := v_prd_slow_count;
            v_branch_period_list(v_period_idx).dead_count     := v_prd_dead_count;
            v_branch_period_list(v_period_idx).inactive_count := v_prd_inactive_count;

            v_branch_total_sales    := v_branch_total_sales + v_prd_total_sales;
            v_branch_total_purchase := v_branch_total_purchase + v_prd_total_purchase;
            v_branch_avg_stock_sum  := v_branch_avg_stock_sum + v_prd_avg_stock;
            v_branch_period_count   := v_branch_period_count + 1;

            DBMS_OUTPUT.PUT_LINE(c_line_double);
            DBMS_OUTPUT.PUT_LINE(CHR(10));
        END IF;
    END;

    PROCEDURE print_period_summary_table IS
        v_p_turnover NUMBER := 0;
    BEGIN
        IF v_branch_period_list.COUNT > 0 THEN
            DBMS_OUTPUT.PUT_LINE(CHR(10) || c_line_double);
            DBMS_OUTPUT.PUT_LINE('>>> [INDIVIDUAL BRANCH] PERIODIC INVENTORY PERFORMANCE SUMMARY OF ' || v_prev_branch || ' <<<');
            DBMS_OUTPUT.PUT_LINE(c_line_double);
			DBMS_OUTPUT.PUT_LINE(c_line_single);
            DBMS_OUTPUT.PUT_LINE(
                RPAD('Period', 12) || ' | ' ||
                LPAD('Items', 5) || ' | ' ||
                LPAD('Total Sales', 14) || ' | ' ||
                LPAD('Total Purchase', 14) || ' | ' ||
                LPAD('Avg Stock On Hand', 17) || ' | ' ||
                LPAD(v_turnover_label, 14) || ' | ' ||
                LPAD('Fast', 4) || ' | ' ||
                LPAD('Normal', 8) || ' | ' ||
                LPAD('Slow', 9) || ' | ' ||
                LPAD('Dead', 9) || ' | ' ||
                LPAD('Inactive', 8)
            );
            DBMS_OUTPUT.PUT_LINE(c_line_single);

            FOR i IN 1 .. v_branch_period_list.COUNT LOOP
                v_p_turnover := 0;
                IF v_branch_period_list(i).avg_stock > 0 THEN
                    v_p_turnover := ROUND(v_branch_period_list(i).total_sales / v_branch_period_list(i).avg_stock, 2);
                END IF;

                DBMS_OUTPUT.PUT_LINE(
                    RPAD(v_branch_period_list(i).period_label, 12) || ' | ' ||
                    LPAD(TO_CHAR(v_branch_period_list(i).total_items), 5) || ' | ' ||
                    LPAD(format_currency_safe(v_branch_period_list(i).total_sales), 14) || ' | ' ||
                    LPAD(format_currency_safe(v_branch_period_list(i).total_purchase), 14) || ' | ' ||
                    LPAD(format_integer_safe(v_branch_period_list(i).avg_stock), 17) || ' | ' ||
                    LPAD(TO_CHAR(v_p_turnover, 'FM999,990.00'), 14) || ' | ' ||
                    LPAD(TO_CHAR(v_branch_period_list(i).fast_count), 4) || ' | ' ||
                    LPAD(TO_CHAR(v_branch_period_list(i).normal_count), 8) || ' | ' ||
                    LPAD(TO_CHAR(v_branch_period_list(i).slow_count), 9) || ' | ' ||
                    LPAD(TO_CHAR(v_branch_period_list(i).dead_count), 9) || ' | ' ||
                    LPAD(TO_CHAR(v_branch_period_list(i).inactive_count), 8)
                );
            END LOOP;
			DBMS_OUTPUT.PUT_LINE(c_line_single);
            DBMS_OUTPUT.PUT_LINE(c_line_double);
        END IF;
    END;

    PROCEDURE print_branch_summary IS
        v_br_avg_stock NUMBER := 0;
        v_br_turnover  NUMBER := 0;
        v_total_skus   NUMBER := 0;
        v_active_skus  NUMBER := 0;
        v_action_count NUMBER := 0;
    BEGIN
        IF v_branch_period_count > 0 THEN
            v_br_avg_stock := ROUND(v_branch_avg_stock_sum / v_branch_period_count);
            IF v_br_avg_stock > 0 THEN
                v_br_turnover := ROUND(v_branch_total_sales / v_br_avg_stock, 2);
            END IF;

            v_total_skus  := v_branch_fast_count + v_branch_normal_count + v_branch_slow_count + v_branch_dead_count + v_branch_inactive_count;
            v_active_skus := v_total_skus - v_branch_inactive_count;

            DBMS_OUTPUT.PUT_LINE(CHR(10) || c_line_double);
            DBMS_OUTPUT.PUT_LINE('>>> [INDIVIDUAL BRANCH] OVERALL EXECUTIVE SUMMARY OF ' || v_prev_branch || ' <<<');
            DBMS_OUTPUT.PUT_LINE(c_line_double);
            DBMS_OUTPUT.PUT_LINE('Total Period Sales   : RM ' || format_currency_safe(v_branch_total_sales));
            DBMS_OUTPUT.PUT_LINE('Total Period Purchase: RM ' || format_currency_safe(v_branch_total_purchase));
            DBMS_OUTPUT.PUT_LINE('Mean Period Avg Stock: ' || format_integer_safe(v_br_avg_stock) || ' Units');
            DBMS_OUTPUT.PUT_LINE('Branch ' || v_turnover_label || ' : ' || TO_CHAR(v_br_turnover, 'FM999,990.00'));
            DBMS_OUTPUT.PUT_LINE('Efficiency Counts    : Fast (' || v_branch_fast_count || 
                                 '), Normal (' || v_branch_normal_count || 
                                 '), Slow (' || v_branch_slow_count || 
                                 '), Dead (' || v_branch_dead_count || 
                                 '), Inactive (' || v_branch_inactive_count || ')');

            -- BI RECOMMENDATIONS AND ACTIONS SECTION
            DBMS_OUTPUT.PUT_LINE(CHR(10) || c_line_double);
            DBMS_OUTPUT.PUT_LINE('>>> [INVIDUAL BRANCH] BUSINESS INTELLIGENCE AND RECOMMENDED ACTIONS' || ' <<<');
            DBMS_OUTPUT.PUT_LINE(c_line_double);

            IF v_branch_total_purchase > v_branch_total_sales THEN
                v_action_count := v_action_count + 1;
                DBMS_OUTPUT.PUT_LINE(v_action_count || '. [CRITICAL CASH FLOW RISK] Purchasing total (RM ' || 
                    format_currency_safe(v_branch_total_purchase) || ') exceeds sales (RM ' || 
                    format_currency_safe(v_branch_total_sales) || ').');
                DBMS_OUTPUT.PUT_LINE('<> Recommend Action: Implement an immediate freeze on non-essential procurement purchase orders.');
                DBMS_OUTPUT.PUT_LINE(CHR(10));
            END IF;

            IF v_br_turnover < 0.50 THEN
                v_action_count := v_action_count + 1;
                DBMS_OUTPUT.PUT_LINE(v_action_count || '. [LOW TURNOVER ALERT] Overall branch turnover ratio (' || 
                    TO_CHAR(v_br_turnover, 'FM999,990.00') || ') is below optimal baseline.');
                DBMS_OUTPUT.PUT_LINE('<> Recommend Action: Reduce holding stock levels and adjust Reorder Points (ROP) downwards.');
                DBMS_OUTPUT.PUT_LINE(CHR(10));
            END IF;

            IF v_branch_dead_count > 0 THEN
                v_action_count := v_action_count + 1;
                DBMS_OUTPUT.PUT_LINE(v_action_count || '. [DEAD STOCK CAPITAL LOCK] Identified ' || v_branch_dead_count || 
                    ' Dead Stock SKU(s) with zero sales.');
                DBMS_OUTPUT.PUT_LINE('<> Recommend Action: Execute targeted clearance sales or write down stock.');
                DBMS_OUTPUT.PUT_LINE(CHR(10));
            END IF;

            IF v_active_skus > 0 AND (v_branch_slow_count / v_active_skus) >= 0.25 THEN
                v_action_count := v_action_count + 1;
                DBMS_OUTPUT.PUT_LINE(v_action_count || '. [SLOW STOCK BLOAT] ' || 
                    TO_CHAR(ROUND((v_branch_slow_count / v_active_skus) * 100, 1), 'FM990.0') || 
                    '% of active SKUs are slow-moving.');
                DBMS_OUTPUT.PUT_LINE('<> Recommend Action: Bundle slow items with fast-moving goods.');
                DBMS_OUTPUT.PUT_LINE(CHR(10));
            END IF;

            IF v_active_skus > 0 AND (v_branch_fast_count / v_active_skus) >= 0.35 THEN
                v_action_count := v_action_count + 1;
                DBMS_OUTPUT.PUT_LINE(v_action_count || '. [STOCKOUT RISK] ' || 
                    TO_CHAR(ROUND((v_branch_fast_count / v_active_skus) * 100, 1), 'FM990.0') || 
                    '% of items are fast-moving.');
                DBMS_OUTPUT.PUT_LINE('<> Recommend Action: Increase buffer stock levels.');
                DBMS_OUTPUT.PUT_LINE(CHR(10));
            END IF;

            IF v_branch_inactive_count > 0 THEN
                v_action_count := v_action_count + 1;
                DBMS_OUTPUT.PUT_LINE(v_action_count || '. [CATALOG CLEANUP] Identified ' || v_branch_inactive_count || ' inactive SKU(s).');
                DBMS_OUTPUT.PUT_LINE('<> Recommend Action: De-list dormant items.');
                DBMS_OUTPUT.PUT_LINE(CHR(10));
            END IF;

            IF v_action_count = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Inventory health is healthy. Turnover levels are within normal limits.');
            END IF;
			DBMS_OUTPUT.PUT_LINE(c_line_double);
        END IF;

    END;

BEGIN
    -- 1. Configure Dynamic Turnover Column Label based on Period Selection
    IF UPPER(p_period_type) = 'QUARTER' THEN
        v_turnover_label := 'Turnover (Qtr)';
    ELSIF UPPER(p_period_type) = 'YEAR' THEN
        v_turnover_label := 'Turnover (Yr)';
    ELSE
        v_turnover_label := 'Turnover (Mth)';
    END IF;

    -- 2. Date Range Setup
    IF p_start_date IS NOT NULL AND p_end_date IS NOT NULL THEN
        v_start_date := TRUNC(p_start_date);
        v_end_date   := TRUNC(p_end_date);
    ELSIF p_start_date IS NOT NULL AND p_end_date IS NULL THEN
        v_start_date := TRUNC(p_start_date);
        IF UPPER(p_period_type) = 'MONTH' THEN v_end_date := ADD_MONTHS(v_start_date, p_periods_back) - 1;
        ELSIF UPPER(p_period_type) = 'QUARTER' THEN v_end_date := ADD_MONTHS(v_start_date, p_periods_back * 3) - 1;
        ELSIF UPPER(p_period_type) = 'YEAR' THEN v_end_date := ADD_MONTHS(v_start_date, p_periods_back * 12) - 1;
        ELSE RAISE_APPLICATION_ERROR(-20001, 'Invalid period type.');
        END IF;
    ELSE
        v_start_date := TRUNC(ADD_MONTHS(SYSDATE, -p_periods_back + 1), 'MM');
        v_end_date   := LAST_DAY(SYSDATE);
    END IF;

    v_total_months := GREATEST(ROUND(MONTHS_BETWEEN(TRUNC(v_end_date, 'MM'), TRUNC(v_start_date, 'MM')) + 1), 1);

    -- 3. Query Execution
    OPEN v_cursor FOR
    WITH monthly_movement AS (
        SELECT 
            smf.Branch_Key,
            smf.Product_Key,
            CASE UPPER(p_period_type)
                WHEN 'QUARTER' THEN TO_CHAR(d.Cal_Date, 'YYYY-"Q"Q')
                WHEN 'YEAR'    THEN TO_CHAR(d.Cal_Date, 'YYYY')
                ELSE TO_CHAR(d.Cal_Date, 'YYYY-MM')
            END AS period_label,
            SUM(DECODE(smf.Movement_Type, 'SALE', smf.Quantity_Out, 0)) as total_sales_period,
            SUM(DECODE(smf.Movement_Type, 'PURCHASE', smf.Quantity_In, 0)) as total_purchase_period
        FROM Stock_Movement_Fact smf
        JOIN Date_Dim d ON smf.Movement_Date_Key = d.Date_Key
        WHERE d.Cal_Date BETWEEN v_start_date AND v_end_date
        AND (p_branch_filter = 'ALL' OR EXISTS (
            SELECT 1 FROM Branch_Dim bd WHERE bd.Branch_Key = smf.Branch_Key 
            AND bd.Branch_Name LIKE '%' || p_branch_filter || '%'
        ))
        GROUP BY smf.Branch_Key, smf.Product_Key, 
                 CASE UPPER(p_period_type)
                     WHEN 'QUARTER' THEN TO_CHAR(d.Cal_Date, 'YYYY-"Q"Q')
                     WHEN 'YEAR'    THEN TO_CHAR(d.Cal_Date, 'YYYY')
                     ELSE TO_CHAR(d.Cal_Date, 'YYYY-MM')
                 END
    ),
    monthly_stock AS (
        SELECT 
            M.Branch_Key,
            M.Product_Key,
            CASE UPPER(p_period_type)
                WHEN 'QUARTER' THEN TO_CHAR(d.Cal_Date, 'YYYY-"Q"Q')
                WHEN 'YEAR'    THEN TO_CHAR(d.Cal_Date, 'YYYY')
                ELSE TO_CHAR(d.Cal_Date, 'YYYY-MM')
            END AS period_label,
            SUM(M.Quantity_On_Hand) as sum_end_stock,
            COUNT(DISTINCT TRUNC(d.Cal_Date, 'MM')) as months_in_period
        FROM Month_End_Stock_Fact M
        JOIN Date_Dim d ON M.Snapshot_Date_Key = d.Date_Key
        WHERE d.Cal_Date BETWEEN v_start_date AND v_end_date
        AND (p_branch_filter = 'ALL' OR EXISTS (
            SELECT 1 FROM Branch_Dim bd WHERE bd.Branch_Key = M.Branch_Key 
            AND bd.Branch_Name LIKE '%' || p_branch_filter || '%'
        ))
        GROUP BY M.Branch_Key, M.Product_Key,
                 CASE UPPER(p_period_type)
                     WHEN 'QUARTER' THEN TO_CHAR(d.Cal_Date, 'YYYY-"Q"Q')
                     WHEN 'YEAR'    THEN TO_CHAR(d.Cal_Date, 'YYYY')
                     ELSE TO_CHAR(d.Cal_Date, 'YYYY-MM')
                 END
    ),
    all_keys AS (
        SELECT Branch_Key, Product_Key, period_label FROM monthly_movement
        UNION
        SELECT Branch_Key, Product_Key, period_label FROM monthly_stock
    ),
    inventory_metrics AS (
        SELECT 
            k.Branch_Key,
            k.period_label,
            pd.Item_ID,
            MAX(pd.Item_Name) AS Item_Name,
            MAX(pd.Category_Name) AS Category_Name,
            bd.Branch_Name,
            bd.Branch_ID,
            NVL(SUM(mm.total_sales_period), 0) as total_sales_period,
            NVL(SUM(mm.total_purchase_period), 0) as total_purchase_period,
            GREATEST(NVL(MAX(ms.months_in_period), 1), 1) as months_in_period,
            ROUND(NVL(SUM(ms.sum_end_stock), 0) / GREATEST(NVL(MAX(ms.months_in_period), 1), 1), 0) as avg_stock_on_hand
        FROM all_keys k
        JOIN Product_Dim pd ON k.Product_Key = pd.Product_Key
        JOIN Branch_Dim bd ON k.Branch_Key = bd.Branch_Key
        LEFT JOIN monthly_movement mm ON k.Branch_Key = mm.Branch_Key AND k.Product_Key = mm.Product_Key AND k.period_label = mm.period_label
        LEFT JOIN monthly_stock ms ON k.Branch_Key = ms.Branch_Key AND k.Product_Key = ms.Product_Key AND k.period_label = ms.period_label
        WHERE (p_product_category = 'ALL' OR pd.Category_Name = p_product_category)
        GROUP BY k.Branch_Key, k.period_label, pd.Item_ID, bd.Branch_Name, bd.Branch_ID
    )
    SELECT 
        Branch_Name,
        Branch_ID,
        period_label,
        Category_Name,
        Item_Name,
        avg_stock_on_hand,
        -- Period-specific Turnover Ratio (Direct Sales / Avg Stock)
        CASE 
            WHEN avg_stock_on_hand > 0 THEN ROUND(total_sales_period / avg_stock_on_hand, 2)
            ELSE 0 
        END as inventory_turnover_ratio,
        -- Standardized Stock Efficiency Velocity Check (Annualized internally for threshold consistency)
        CASE 
            WHEN total_sales_period = 0 AND total_purchase_period = 0 AND avg_stock_on_hand = 0 THEN 'Inactive'
            WHEN total_sales_period = 0 AND (avg_stock_on_hand > 0 OR total_purchase_period > 0) THEN 'Dead Stock'
            WHEN avg_stock_on_hand = 0 AND total_sales_period > 0 THEN 'Fast Moving'
            WHEN ((total_sales_period / avg_stock_on_hand) * (12 / months_in_period)) >= 6.0 THEN 'Fast Moving'
            WHEN ((total_sales_period / avg_stock_on_hand) * (12 / months_in_period)) BETWEEN 2.0 AND 5.99 THEN 'Normal'
            ELSE 'Slow Moving'
        END as stock_efficiency_category,
        total_sales_period,
        total_purchase_period,
        months_in_period
    FROM inventory_metrics
    ORDER BY Branch_Name, period_label, Category_Name, total_sales_period DESC;

    -- Report Header
    DBMS_OUTPUT.PUT_LINE(CHR(10) || c_line_double);
    DBMS_OUTPUT.PUT_LINE(' INVENTORY TURNOVER AND EFFICIENCY REPORT (BRANCH ISOLATED PERIODS)');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Analysis Period : ' || TO_CHAR(v_start_date, 'YYYY-MM-DD') || ' to ' || TO_CHAR(v_end_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Branch Filter   : ' || p_branch_filter);
    DBMS_OUTPUT.PUT_LINE('Category Filter : ' || p_product_category || CHR(10));

    -- Loop Control Break
    LOOP
        FETCH v_cursor INTO v_branch_name, v_branch_id, v_period_label, v_category_name, v_item_name,
                            v_avg_stock_on_hand, v_inventory_turnover, v_efficiency_cat, 
                            v_total_sales, v_total_purchase, v_months_in_period;
        EXIT WHEN v_cursor%NOTFOUND;

        IF v_prev_branch IS NULL THEN
            v_prev_branch   := v_branch_name;
            v_prev_branch_id:= v_branch_id;
            v_prev_period   := v_period_label;
            v_prev_category := v_category_name;

            print_branch_header(v_branch_name, v_branch_id);
            print_period_header(v_period_label);
            print_category_header(v_category_name);

        ELSIF v_branch_name != v_prev_branch THEN
            print_category_subtotal;
            print_period_subtotal;
            print_period_summary_table;
            print_branch_summary;

            v_cat_total_items := 0; v_cat_total_sales := 0; v_cat_total_purchase := 0; v_cat_avg_stock := 0;
            v_prd_total_items := 0; v_prd_total_sales := 0; v_prd_total_purchase := 0; v_prd_avg_stock := 0;
            v_prd_fast_count := 0; v_prd_normal_count := 0; v_prd_slow_count := 0; v_prd_dead_count := 0; v_prd_inactive_count := 0;

            v_branch_total_sales := 0; v_branch_total_purchase := 0; v_branch_avg_stock_sum := 0; v_branch_period_count := 0;
            v_branch_slow_count := 0; v_branch_fast_count := 0; v_branch_dead_count := 0; v_branch_normal_count := 0; v_branch_inactive_count := 0;

            v_branch_period_list.DELETE;
            v_period_idx := 0;

            v_prev_branch   := v_branch_name;
            v_prev_branch_id:= v_branch_id;
            v_prev_period   := v_period_label;
            v_prev_category := v_category_name;

            print_branch_header(v_branch_name, v_branch_id);
            print_period_header(v_period_label);
            print_category_header(v_category_name);

        ELSIF v_period_label != v_prev_period THEN
            print_category_subtotal;
            print_period_subtotal;

            v_cat_total_items := 0; v_cat_total_sales := 0; v_cat_total_purchase := 0; v_cat_avg_stock := 0;
            v_prd_total_items := 0; v_prd_total_sales := 0; v_prd_total_purchase := 0; v_prd_avg_stock := 0;
            v_prd_fast_count := 0; v_prd_normal_count := 0; v_prd_slow_count := 0; v_prd_dead_count := 0; v_prd_inactive_count := 0;

            v_prev_period   := v_period_label;
            v_prev_category := v_category_name;

            print_period_header(v_period_label);
            print_category_header(v_category_name);

        ELSIF v_category_name != v_prev_category THEN
            print_category_subtotal;

            v_cat_total_items := 0; v_cat_total_sales := 0; v_cat_total_purchase := 0; v_cat_avg_stock := 0;
            v_prev_category := v_category_name;

            print_category_header(v_category_name);
        END IF;

        -- Print Item Detail Line
        DBMS_OUTPUT.PUT_LINE(
            '  ' || RPAD(SUBSTR(v_item_name, 1, 31), 31) || ' | ' || 
            LPAD(format_currency_safe(v_total_sales), 16) || ' | ' || 
            LPAD(format_currency_safe(v_total_purchase), 15) || ' | ' || 
            LPAD(format_integer_safe(v_avg_stock_on_hand), 11) || ' | ' || 
            LPAD(TO_CHAR(v_inventory_turnover, 'FM999,990.00'), 14) || ' | ' || 
            LPAD(v_efficiency_cat, 42)
        );

        -- Accumulate Category
        v_cat_total_items    := v_cat_total_items + 1;
        v_cat_total_sales    := v_cat_total_sales + v_total_sales;
        v_cat_total_purchase := v_cat_total_purchase + v_total_purchase;
        v_cat_avg_stock      := v_cat_avg_stock + NVL(v_avg_stock_on_hand, 0);

        -- Accumulate Period
        v_prd_total_items    := v_prd_total_items + 1;
        v_prd_total_sales    := v_prd_total_sales + v_total_sales;
        v_prd_total_purchase := v_prd_total_purchase + v_total_purchase;
        v_prd_avg_stock      := v_prd_avg_stock + NVL(v_avg_stock_on_hand, 0);

        -- Accumulate Efficiency Counts
        IF v_efficiency_cat = 'Fast Moving' THEN v_prd_fast_count := v_prd_fast_count + 1; v_branch_fast_count := v_branch_fast_count + 1;
        ELSIF v_efficiency_cat = 'Normal' THEN v_prd_normal_count := v_prd_normal_count + 1; v_branch_normal_count := v_branch_normal_count + 1;
        ELSIF v_efficiency_cat = 'Slow Moving' THEN v_prd_slow_count := v_prd_slow_count + 1; v_branch_slow_count := v_branch_slow_count + 1;
        ELSIF v_efficiency_cat = 'Dead Stock' THEN v_prd_dead_count := v_prd_dead_count + 1; v_branch_dead_count := v_branch_dead_count + 1;
        ELSIF v_efficiency_cat = 'Inactive' THEN v_prd_inactive_count := v_prd_inactive_count + 1; v_branch_inactive_count := v_branch_inactive_count + 1;
        END IF;

    END LOOP;
    CLOSE v_cursor;

    -- Final Tail Execution
    IF v_prev_branch IS NOT NULL THEN
        print_category_subtotal;
        print_period_subtotal;
        print_period_summary_table;
        print_branch_summary;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No inventory data found matching criteria.');
    END IF;
	
	DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('END OF THE REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);

EXCEPTION
    WHEN OTHERS THEN
        IF v_cursor%ISOPEN THEN
            CLOSE v_cursor;
        END IF;
        RAISE_APPLICATION_ERROR(-20002, 'Error in inventory_turnover procedure: ' || SQLERRM);
END inventory_turnover;
/
-- Runs for exactly first 3 year starting from a specific Branch
EXEC inventory_turnover(p_period_type => 'YEAR', p_start_date => DATE '2023-01-01', p_end_date => DATE '2025-12-31', p_branch_filter=>'Klang 88 Speedmart',p_product_category=>'Alcoholic Beverages');

EXEC inventory_turnover(p_period_type => 'YEAR', p_start_date => DATE '2023-01-01', p_end_date => DATE '2025-12-31',p_product_category=>'Alcoholic Beverages');