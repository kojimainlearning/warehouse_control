CREATE OR REPLACE PROCEDURE stock_optimisation (
    p_analysis_date        IN DATE DEFAULT SYSDATE,
    p_branch_filter        IN VARCHAR2 DEFAULT 'ALL',
    p_product_category     IN VARCHAR2 DEFAULT 'ALL',
    p_low_stock_threshold  IN NUMBER DEFAULT 10
)
IS
    c_line_double   CONSTANT VARCHAR2(157) := RPAD('=', 157, '=');
    c_line_single   CONSTANT VARCHAR2(157) := RPAD('-', 157, '-');
	c_star CONSTANT VARCHAR2(157) := RPAD('*', 157, '*');

    v_prev_branch    Branch_Dim.Branch_Name%TYPE := NULL;
    v_prev_category  Product_Dim.Category_Name%TYPE := NULL;
    v_is_first_rec   BOOLEAN := TRUE;

    -- ACCUMULATORS - CATEGORY LEVEL
    v_cat_item_count    NUMBER := 0;
    v_cat_on_hand       NUMBER := 0;
    v_cat_avg_sales     NUMBER := 0;
    v_cat_critical_cnt  NUMBER := 0;
    v_cat_low_cnt       NUMBER := 0;
    v_cat_excess_cnt    NUMBER := 0;

    -- ACCUMULATORS - BRANCH LEVEL
    v_br_item_count     NUMBER := 0;
    v_br_cat_count      NUMBER := 0;
    v_br_on_hand        NUMBER := 0;
    v_br_avg_sales      NUMBER := 0;
    v_br_critical_cnt   NUMBER := 0;
    v_br_low_cnt        NUMBER := 0;
    v_br_normal_cnt     NUMBER := 0;
    v_br_excess_cnt     NUMBER := 0;

    CURSOR c_stock_data IS
        WITH recent_sales_trend AS (
            SELECT 
                smf.Branch_Key,
                smf.Product_Key,
                AVG(smf.Quantity_Out) as avg_daily_sales,
                STDDEV(smf.Quantity_Out) as sales_volatility
            FROM Stock_Movement_Fact smf
            JOIN Date_Dim d ON smf.Movement_Date_Key = d.Date_Key
            WHERE d.Cal_Date >= ADD_MONTHS(TRUNC(p_analysis_date), -3)
              AND d.Cal_Date <= TRUNC(p_analysis_date)
              AND smf.Movement_Type = 'SALE'
            GROUP BY smf.Branch_Key, smf.Product_Key
        ),
        latest_stock_snapshot AS (
            SELECT 
                mes.Branch_Key,
                mes.Product_Key,
                COALESCE(mes.Quantity_On_Hand, s.Stock_Quantity, 0) AS Quantity_On_Hand,
                bd.Branch_Name,
                pd.Item_Name,
                pd.Category_Name,
                pd.Is_MyKasih_Eligible
            FROM Month_End_Stock_Fact mes
            JOIN Date_Dim d ON mes.Snapshot_Date_Key = d.Date_Key
            JOIN Branch_Dim bd ON mes.Branch_Key = bd.Branch_Key
            JOIN Product_Dim pd ON mes.Product_Key = pd.Product_Key
            LEFT JOIN (
                SELECT BranchID, ItemID, QuantityOnHand as Stock_Quantity
                FROM Stocks
            ) s ON bd.Branch_ID = s.BranchID AND pd.Item_ID = s.ItemID
            WHERE d.Cal_Date = (
                SELECT MAX(d2.Cal_Date) 
                FROM Month_End_Stock_Fact mes2
                JOIN Date_Dim d2 ON mes2.Snapshot_Date_Key = d2.Date_Key
                WHERE d2.Cal_Date <= TRUNC(p_analysis_date)
            )
            AND (p_branch_filter = 'ALL' OR UPPER(bd.Branch_Name) LIKE '%' || UPPER(p_branch_filter) || '%')
            AND (p_product_category = 'ALL' OR UPPER(pd.Category_Name) LIKE '%' || UPPER(p_product_category) || '%')
        ),
        combined_analysis AS (
            SELECT 
                cs.Branch_Name,
                cs.Category_Name,
                cs.Item_Name,
                cs.Quantity_On_Hand,
                cs.Is_MyKasih_Eligible,
                COALESCE(rst.avg_daily_sales, 0) as avg_daily_sales,
                COALESCE(rst.sales_volatility, 0) as sales_volatility,
                CASE 
                    WHEN COALESCE(rst.avg_daily_sales, 0) > 0 THEN 
                        ROUND(cs.Quantity_On_Hand / rst.avg_daily_sales, 1)
                    ELSE 999 
                END as days_of_supply,
                CASE 
                    WHEN COALESCE(rst.avg_daily_sales, 0) > 0 THEN 
                        ROUND((rst.avg_daily_sales * 7) + (rst.sales_volatility * 2), 0)
                    ELSE 0 
                END as suggested_reorder_point,
                CASE 
                    WHEN COALESCE(rst.avg_daily_sales, 0) > 0 THEN 
                        ROUND((rst.avg_daily_sales * 38), 0)
                    ELSE 0 
                END as suggested_max_level,
                CASE 
                    WHEN cs.Quantity_On_Hand <= LEAST(p_low_stock_threshold, COALESCE(rst.avg_daily_sales, 0) * 2) 
                         OR (COALESCE(rst.avg_daily_sales, 0) > 0 AND cs.Quantity_On_Hand <= (rst.avg_daily_sales * 2)) 
                         THEN 'CRITICAL'
                    WHEN cs.Quantity_On_Hand <= (COALESCE(rst.avg_daily_sales, 0) * 7) 
                         THEN 'LOW'
                    WHEN cs.Quantity_On_Hand >= (COALESCE(rst.avg_daily_sales, 0) * 38) AND COALESCE(rst.avg_daily_sales, 0) > 0 
                         THEN 'EXCESS'
                    ELSE 'NORMAL'
                END as stock_status
            FROM latest_stock_snapshot cs
            LEFT JOIN recent_sales_trend rst 
                ON cs.Branch_Key = rst.Branch_Key 
               AND cs.Product_Key = rst.Product_Key
        )
        SELECT 
            Branch_Name,
            Category_Name,
            Item_Name,
            Quantity_On_Hand,
            Is_MyKasih_Eligible,
            ROUND(avg_daily_sales, 2) as avg_daily_sales,
            days_of_supply,
            suggested_reorder_point,
            suggested_max_level,
            stock_status,
            CASE 
                WHEN stock_status = 'CRITICAL' THEN 'ORDER IMMEDIATELY'
                WHEN stock_status = 'LOW' THEN 'PLANNED REORDER'
                WHEN stock_status = 'EXCESS' THEN 'FREEZE PURCHASING'
                ELSE 'MONITOR'
            END as action_required,
            CASE stock_status 
                WHEN 'CRITICAL' THEN 1 
                WHEN 'LOW' THEN 2 
                WHEN 'NORMAL' THEN 3 
                WHEN 'EXCESS' THEN 4 
            END as priority_code
        FROM combined_analysis
        ORDER BY Branch_Name, Category_Name, priority_code, days_of_supply ASC;

    CURSOR c_overall_branch_summary IS
        WITH recent_sales_trend AS (
            SELECT 
                smf.Branch_Key,
                smf.Product_Key,
                AVG(smf.Quantity_Out) as avg_daily_sales
            FROM Stock_Movement_Fact smf
            JOIN Date_Dim d ON smf.Movement_Date_Key = d.Date_Key
            WHERE d.Cal_Date >= ADD_MONTHS(TRUNC(p_analysis_date), -3)
              AND d.Cal_Date <= TRUNC(p_analysis_date)
              AND smf.Movement_Type = 'SALE'
            GROUP BY smf.Branch_Key, smf.Product_Key
        ),
        latest_stock_snapshot AS (
            SELECT 
                mes.Branch_Key,
                mes.Product_Key,
                COALESCE(mes.Quantity_On_Hand, s.Stock_Quantity, 0) AS Quantity_On_Hand,
                bd.Branch_Name
            FROM Month_End_Stock_Fact mes
            JOIN Date_Dim d ON mes.Snapshot_Date_Key = d.Date_Key
            JOIN Branch_Dim bd ON mes.Branch_Key = bd.Branch_Key
            JOIN Product_Dim pd ON mes.Product_Key = pd.Product_Key
            LEFT JOIN (
                SELECT BranchID, ItemID, QuantityOnHand as Stock_Quantity
                FROM Stocks
            ) s ON bd.Branch_ID = s.BranchID AND pd.Item_ID = s.ItemID
            WHERE d.Cal_Date = (
                SELECT MAX(d2.Cal_Date) 
                FROM Month_End_Stock_Fact mes2
                JOIN Date_Dim d2 ON mes2.Snapshot_Date_Key = d2.Date_Key
                WHERE d2.Cal_Date <= TRUNC(p_analysis_date)
            )
            AND (p_product_category = 'ALL' OR UPPER(pd.Category_Name) LIKE '%' || UPPER(p_product_category) || '%')
        ),
        combined_analysis AS (
            SELECT 
                cs.Branch_Name,
                cs.Quantity_On_Hand,
                COALESCE(rst.avg_daily_sales, 0) as avg_daily_sales,
                CASE 
                    WHEN cs.Quantity_On_Hand <= LEAST(p_low_stock_threshold, COALESCE(rst.avg_daily_sales, 0) * 2) THEN 'CRITICAL'
                    WHEN cs.Quantity_On_Hand <= (COALESCE(rst.avg_daily_sales, 0) * 7) THEN 'LOW'
                    WHEN cs.Quantity_On_Hand >= (COALESCE(rst.avg_daily_sales, 0) * 38) THEN 'EXCESS'
                    ELSE 'NORMAL'
                END as stock_status
            FROM latest_stock_snapshot cs
            LEFT JOIN recent_sales_trend rst 
                ON cs.Branch_Key = rst.Branch_Key 
               AND cs.Product_Key = rst.Product_Key
        )
        SELECT 
            Branch_Name,
            COUNT(*) as total_skus,
            SUM(Quantity_On_Hand) as total_on_hand,
            SUM(avg_daily_sales) as total_daily_velocity,
            ROUND((SUM(CASE WHEN stock_status = 'NORMAL' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 1) as stock_health_efficiency
        FROM combined_analysis
        GROUP BY Branch_Name
        ORDER BY stock_health_efficiency DESC, Branch_Name ASC;

    -- CURSOR: SPECIFIC CATEGORY ITEM-LEVEL SUMMARY
    CURSOR c_item_category_summary IS
        WITH recent_sales_trend AS (
            SELECT 
                smf.Branch_Key,
                smf.Product_Key,
                AVG(smf.Quantity_Out) as avg_daily_sales
            FROM Stock_Movement_Fact smf
            JOIN Date_Dim d ON smf.Movement_Date_Key = d.Date_Key
            WHERE d.Cal_Date >= ADD_MONTHS(TRUNC(p_analysis_date), -3)
              AND d.Cal_Date <= TRUNC(p_analysis_date)
              AND smf.Movement_Type = 'SALE'
            GROUP BY smf.Branch_Key, smf.Product_Key
        ),
        latest_stock_snapshot AS (
            SELECT 
                mes.Branch_Key,
                mes.Product_Key,
                COALESCE(mes.Quantity_On_Hand, s.Stock_Quantity, 0) AS Quantity_On_Hand,
                bd.Branch_Name,
                pd.Item_Name
            FROM Month_End_Stock_Fact mes
            JOIN Date_Dim d ON mes.Snapshot_Date_Key = d.Date_Key
            JOIN Branch_Dim bd ON mes.Branch_Key = bd.Branch_Key
            JOIN Product_Dim pd ON mes.Product_Key = pd.Product_Key
            LEFT JOIN (
                SELECT BranchID, ItemID, QuantityOnHand as Stock_Quantity
                FROM Stocks
            ) s ON bd.Branch_ID = s.BranchID AND pd.Item_ID = s.ItemID
            WHERE d.Cal_Date = (
                SELECT MAX(d2.Cal_Date) 
                FROM Month_End_Stock_Fact mes2
                JOIN Date_Dim d2 ON mes2.Snapshot_Date_Key = d2.Date_Key
                WHERE d2.Cal_Date <= TRUNC(p_analysis_date)
            )
            AND (p_branch_filter = 'ALL' OR UPPER(bd.Branch_Name) LIKE '%' || UPPER(p_branch_filter) || '%')
            AND UPPER(pd.Category_Name) LIKE '%' || UPPER(p_product_category) || '%'
        ),
        combined_analysis AS (
            SELECT 
                cs.Item_Name,
                cs.Branch_Name,
                cs.Quantity_On_Hand,
                COALESCE(rst.avg_daily_sales, 0) as avg_daily_sales,
                CASE 
                    WHEN cs.Quantity_On_Hand <= LEAST(p_low_stock_threshold, COALESCE(rst.avg_daily_sales, 0) * 2) THEN 'CRITICAL'
                    WHEN cs.Quantity_On_Hand <= (COALESCE(rst.avg_daily_sales, 0) * 7) THEN 'LOW'
                    WHEN cs.Quantity_On_Hand >= (COALESCE(rst.avg_daily_sales, 0) * 38) THEN 'EXCESS'
                    ELSE 'NORMAL'
                END as stock_status
            FROM latest_stock_snapshot cs
            LEFT JOIN recent_sales_trend rst 
                ON cs.Branch_Key = rst.Branch_Key 
               AND cs.Product_Key = rst.Product_Key
        )
        SELECT 
            Item_Name,
            COUNT(DISTINCT Branch_Name) as branch_count,
            SUM(Quantity_On_Hand) as total_on_hand,
            SUM(avg_daily_sales) as total_daily_velocity,
            ROUND((SUM(CASE WHEN stock_status = 'NORMAL' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 1) as stock_health_efficiency
        FROM combined_analysis
        GROUP BY Item_Name
        ORDER BY stock_health_efficiency DESC, total_daily_velocity DESC, Item_Name ASC;

    --HELPER PROCEDURES
    PROCEDURE print_category_subtotal IS
    BEGIN
        IF v_cat_item_count > 0 THEN
            DBMS_OUTPUT.PUT_LINE(c_line_single);
            DBMS_OUTPUT.PUT_LINE(
                '  ' || RPAD('Subtotal (' || TO_CHAR(v_cat_item_count) || ' SKUs)', 34) || ' | ' ||
                LPAD(TO_CHAR(v_cat_on_hand, 'FM999,999,990'), 11) || ' | ' ||
                LPAD(TO_CHAR(v_cat_avg_sales, 'FM999,990.00'), 10) || ' | ' ||
                LPAD('-', 7) || ' | ' ||
                LPAD('-', 21) || ' | ' ||
                LPAD('-', 24) || ' | ' ||
                RPAD('CRIT/LOW:' || TO_CHAR(v_cat_critical_cnt + v_cat_low_cnt), 12) || ' | ' ||
                RPAD('EXCESS:' || TO_CHAR(v_cat_excess_cnt), 17)
            );
            DBMS_OUTPUT.PUT_LINE(c_line_single);
            DBMS_OUTPUT.PUT_LINE(CHR(10));
        END IF;

        v_cat_item_count    := 0;
        v_cat_on_hand       := 0;
        v_cat_avg_sales     := 0;
        v_cat_critical_cnt  := 0;
        v_cat_low_cnt       := 0;
        v_cat_excess_cnt    := 0;
    END print_category_subtotal;

    PROCEDURE print_branch_summary IS
        v_br_efficiency NUMBER := 0;
    BEGIN
        IF v_br_item_count > 0 THEN
            v_br_efficiency := ROUND((v_br_normal_cnt / NVL(NULLIF(v_br_item_count, 0), 1)) * 100, 1);

            DBMS_OUTPUT.PUT_LINE('>>> [INDIVIDUAL BRANCH] INVENTORY HEALTH <<<');
            DBMS_OUTPUT.PUT_LINE(c_line_single);
            DBMS_OUTPUT.PUT_LINE(
                'Total Unique SKUs        : ' || LPAD(TO_CHAR(v_br_item_count), 14) || 
                '  |  Aggregate On-Hand Stock : ' || LPAD(TO_CHAR(v_br_on_hand, 'FM999,999,990'), 11) || ' Units'
            );
            DBMS_OUTPUT.PUT_LINE(
                'Overall Daily Velocity   : ' || LPAD(TO_CHAR(v_br_avg_sales, 'FM999,990.00'), 10) || '/day' ||
                '  |  Stock Health Efficiency : ' || LPAD(TO_CHAR(v_br_efficiency, 'FM990.0'), 10) || '% Optimal'
            );
            DBMS_OUTPUT.PUT_LINE(c_line_single);
            DBMS_OUTPUT.PUT_LINE('>>> [STOCK STATUS BREAKDOWN] <<<');
            DBMS_OUTPUT.PUT_LINE('<> Critical StockOut Risk : ' || LPAD(TO_CHAR(v_br_critical_cnt), 10) || ' SKU(s)  (ORDER IMMEDIATELY)');
            DBMS_OUTPUT.PUT_LINE('<> Low Stock Reorder      : ' || LPAD(TO_CHAR(v_br_low_cnt), 10) || ' SKU(s)  (PLANNED REORDER)');
            DBMS_OUTPUT.PUT_LINE('<> Normal Healthy Stock   : ' || LPAD(TO_CHAR(v_br_normal_cnt), 10) || ' SKU(s)  (MONITOR)');
            DBMS_OUTPUT.PUT_LINE('<> Excess / Overstocked   : ' || LPAD(TO_CHAR(v_br_excess_cnt), 10) || ' SKU(s)  (FREEZE PURCHASING)');
            DBMS_OUTPUT.PUT_LINE(c_line_double);
            DBMS_OUTPUT.PUT_LINE(CHR(10));
        END IF;

        v_br_item_count    := 0;
        v_br_cat_count     := 0;
        v_br_on_hand       := 0;
        v_br_avg_sales     := 0;
        v_br_critical_cnt  := 0;
        v_br_low_cnt       := 0;
        v_br_normal_cnt    := 0;
        v_br_excess_cnt    := 0;
    END print_branch_summary;

    PROCEDURE print_headers (p_cat_name VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('PRODUCT CATEGORY: ' || UPPER(p_cat_name));
        DBMS_OUTPUT.PUT_LINE(c_line_single);
        DBMS_OUTPUT.PUT_LINE(
            '  ' || RPAD('Item Name', 34) || ' | ' ||
            LPAD('Qty On Hand', 11) || ' | ' ||
            LPAD('Avg Sales', 10) || ' | ' ||
            LPAD('DOS', 7) || ' | ' ||
            LPAD('Suggested Reorder Lv', 21) || ' | ' ||
            LPAD('Suggested Inventory Cap', 24) || ' | ' ||
            RPAD('Status', 12) || ' | ' ||
            RPAD('Action Required', 15)
        );
        DBMS_OUTPUT.PUT_LINE(c_line_single);
    END print_headers;

BEGIN
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE(RPAD(' ', 35) || 'ENTERPRISE STOCK OPTIMIZATION AND INVENTORY HEALTH REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('Analysis Date        : ' || TO_CHAR(p_analysis_date, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Branch Filter        : ' || UPPER(p_branch_filter));
    DBMS_OUTPUT.PUT_LINE('Category Filter      : ' || UPPER(p_product_category));
    DBMS_OUTPUT.PUT_LINE('Critical Threshold   : <= ' || TO_CHAR(p_low_stock_threshold) || ' units');
    DBMS_OUTPUT.PUT_LINE('Execution Timestamp  : ' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE(chr(10));

    FOR r IN c_stock_data LOOP
        IF v_is_first_rec OR r.Branch_Name <> v_prev_branch THEN
            IF NOT v_is_first_rec THEN
                print_category_subtotal;
                print_branch_summary;
            END IF;

            v_prev_branch    := r.Branch_Name;
            v_prev_category  := r.Category_Name;
            v_br_cat_count   := v_br_cat_count + 1;

            DBMS_OUTPUT.PUT_LINE(c_star);
            DBMS_OUTPUT.PUT_LINE('BRANCH > ' || UPPER(r.Branch_Name));
            DBMS_OUTPUT.PUT_LINE(c_star);
            print_headers(r.Category_Name);

        ELSIF r.Category_Name <> v_prev_category THEN
            print_category_subtotal;
            v_prev_category := r.Category_Name;
            v_br_cat_count  := v_br_cat_count + 1;

            print_headers(r.Category_Name);
        END IF;

        v_is_first_rec := FALSE;

        DBMS_OUTPUT.PUT_LINE(
            '  ' || RPAD(SUBSTR(r.Item_Name, 1, 34), 34) || ' | ' ||
            LPAD(TO_CHAR(r.Quantity_On_Hand, 'FM999,999,990'), 11) || ' | ' ||
            LPAD(TO_CHAR(r.avg_daily_sales, 'FM999,990.00'), 10) || ' | ' ||
            LPAD(TO_CHAR(LEAST(r.days_of_supply, 999.9), 'FM999,990.0'), 7) || ' | ' ||
            LPAD(TO_CHAR(r.suggested_reorder_point, 'FM999,999,990'), 21) || ' | ' ||
            LPAD(TO_CHAR(r.suggested_max_level, 'FM999,999,990'), 24) || ' | ' ||
            RPAD(r.stock_status, 12) || ' | ' ||
            RPAD(r.action_required, 17)
        );

        v_cat_item_count := v_cat_item_count + 1;
        v_cat_on_hand    := v_cat_on_hand + r.Quantity_On_Hand;
        v_cat_avg_sales  := v_cat_avg_sales + r.avg_daily_sales;

        IF r.stock_status = 'CRITICAL' THEN v_cat_critical_cnt := v_cat_critical_cnt + 1;
        ELSIF r.stock_status = 'LOW' THEN v_cat_low_cnt := v_cat_low_cnt + 1;
        ELSIF r.stock_status = 'EXCESS' THEN v_cat_excess_cnt := v_cat_excess_cnt + 1;
        END IF;

        v_br_item_count := v_br_item_count + 1;
        v_br_on_hand    := v_br_on_hand + r.Quantity_On_Hand;
        v_br_avg_sales  := v_br_avg_sales + r.avg_daily_sales;

        IF r.stock_status = 'CRITICAL' THEN v_br_critical_cnt := v_br_critical_cnt + 1;
        ELSIF r.stock_status = 'LOW' THEN v_br_low_cnt := v_br_low_cnt + 1;
        ELSIF r.stock_status = 'NORMAL' THEN v_br_normal_cnt := v_br_normal_cnt + 1;
        ELSIF r.stock_status = 'EXCESS' THEN v_br_excess_cnt := v_br_excess_cnt + 1;
        END IF;

    END LOOP;

    IF NOT v_is_first_rec THEN
        print_category_subtotal;
        print_branch_summary;
    ELSE
        DBMS_OUTPUT.PUT_LINE('*** No stock optimization records found matching the specified filter criteria. ***');
    END IF;

    --EXECUTIVE SUMMARY 1: ALL BRANCHES INVENTORY HEALTH
    IF UPPER(p_branch_filter) = 'ALL' AND NOT v_is_first_rec THEN
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('>>> [EXEC SUMMARY 1] ALL BRANCHES INVENTORY HEALTH COMPARATIVE');
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE(
            '  ' || RPAD('Rank', 6) || ' | ' ||
            RPAD('Branch Name', 37) || ' | ' ||
            LPAD('Total SKUs', 12) || ' | ' ||
            LPAD('On-Hand Qty', 14) || ' | ' ||
            LPAD('Daily Velocity', 21) || ' | ' ||
            LPAD('Health Efficiency', 50)
        );
        DBMS_OUTPUT.PUT_LINE(c_line_single);

        DECLARE
            v_rank NUMBER := 0;
        BEGIN
            FOR b IN c_overall_branch_summary LOOP
                v_rank := v_rank + 1;
                DBMS_OUTPUT.PUT_LINE(
                    '  ' || RPAD(TO_CHAR(v_rank), 6) || ' | ' ||
                    RPAD(SUBSTR(b.Branch_Name, 1, 37), 37) || ' | ' ||
                    LPAD(TO_CHAR(b.total_skus, 'FM999,999,990'), 12) || ' | ' ||
                    LPAD(TO_CHAR(b.total_on_hand, 'FM999,999,990'), 14) || ' | ' ||
                    LPAD(TO_CHAR(b.total_daily_velocity, 'FM999,990.00'), 21) || ' | ' ||
                    LPAD(TO_CHAR(b.stock_health_efficiency, 'FM990.0') || '% Optimal', 50)
                );
            END LOOP;
        END;

        DBMS_OUTPUT.PUT_LINE(c_line_double);
    END IF;

    -- EXECUTIVE SUMMARY 2: CATEGORY ITEM HEALTH COMPARATIVE SUMMARY(Triggers when user specifies a single product category)
    IF UPPER(p_product_category) <> 'ALL' AND NOT v_is_first_rec AND UPPER(p_branch_filter) != 'ALL' THEN
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE('>>> [EXECUTIVE SUMMARY 2] CATEGORY ITEM HEALTH COMPARATIVE (' || UPPER(p_product_category) || ')');
        DBMS_OUTPUT.PUT_LINE(c_line_double);
        DBMS_OUTPUT.PUT_LINE(
            '  ' || RPAD('Rank', 6) || ' | ' ||
            RPAD('Item Name', 37) || ' | ' ||
            LPAD('Branches', 12) || ' | ' ||
            LPAD('On-Hand Qty', 14) || ' | ' ||
            LPAD('Daily Velocity', 21) || ' | ' ||
            LPAD('Health Efficiency', 50)
        );
        DBMS_OUTPUT.PUT_LINE(c_line_single);

        DECLARE
            v_item_rank NUMBER := 0;
        BEGIN
            FOR i IN c_item_category_summary LOOP
                v_item_rank := v_item_rank + 1;
                DBMS_OUTPUT.PUT_LINE(
                    '  ' || RPAD(TO_CHAR(v_item_rank), 6) || ' | ' ||
                    RPAD(SUBSTR(i.Item_Name, 1, 37), 37) || ' | ' ||
                    LPAD(TO_CHAR(i.branch_count, 'FM999,999,990'), 12) || ' | ' ||
                    LPAD(TO_CHAR(i.total_on_hand, 'FM999,999,990'), 14) || ' | ' ||
                    LPAD(TO_CHAR(i.total_daily_velocity, 'FM999,990.00'), 21) || ' | ' ||
                    LPAD(TO_CHAR(i.stock_health_efficiency, 'FM990.0') || '% Optimal', 50)
                );
            END LOOP;
        END;

        DBMS_OUTPUT.PUT_LINE(c_line_double);
    END IF;

    DBMS_OUTPUT.PUT_LINE(c_line_double);
    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(c_line_double);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR in stock_optimisation: ' || SQLERRM);
        RAISE;
END stock_optimisation;
/

-- Display Overall Branches Executive Summary 1 (Ranking of Each Branch stock Inventory Health Condition)
EXEC stock_optimisation(p_analysis_date => SYSDATE, p_branch_filter => 'ALL', p_product_category => 'Stationery and Daily Needs');

-- Only display the Default Executive Summary (Individual Branch Inventory Health Executive Summary)
EXEC stock_optimisation(p_analysis_date => SYSDATE, p_branch_filter => 'PETALING JAYA 88 SPEEDMART');

-- Diplay All Executive Summary Include Default Executive Summary, Executive Summary 1, Executive Summary 2 (The Drill Down Of the Product Category to View the Item Health Condition)
EXEC stock_optimisation(p_analysis_date => SYSDATE, p_branch_filter => 'PETALING JAYA 88 SPEEDMART', p_product_category => 'Stationery and Daily Needs');


