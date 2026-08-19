--------------------------------------------------------------------------------
-- CUSTOMER SEGMENTATION AND RFM ANALYSIS
--
-- Outputs:
-- 1. Formatted executive TXT report using DBMS_OUTPUT.PUT_LINE
-- 2. customer_rfm_detail.csv
-- 3. customer_rfm_segment_summary.csv
--
-- Assumptions:
-- - Actual column names are corrected without spaces, e.g. MyKasih_Subsidy_Amount
-- - Customer spending is customer out-of-pocket amount:
--   (Quantity * Unit_Price) - Voucher_Discount_Amount - MyKasih_Subsidy_Amount
-- - Completed refunds reduce customer spending / lifetime value
-- - Customers with no qualifying purchases are included as prospects
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
-- REPORT PARAMETER
--
-- Change this date if needed.
-- Format: YYYY-MM-DD
--------------------------------------------------------------------------------

VARIABLE b_as_of_date VARCHAR2(10)

BEGIN
    :b_as_of_date := '2026-06-30';
END;
/


--------------------------------------------------------------------------------
-- STORED PROCEDURE
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE generate_customer_rfm_report (
    p_as_of_date IN DATE DEFAULT DATE '2026-06-30'
) AS

    v_as_of_date             DATE;
    v_count                  NUMBER;
    v_total_customers        NUMBER := 0;
    v_purchasing_customers   NUMBER := 0;
    v_prospects              NUMBER := 0;
    v_total_sales_amount     NUMBER := 0;
    v_total_refund_amount    NUMBER := 0;
    v_total_net_amount       NUMBER := 0;
    v_recency_sum            NUMBER := 0;
    v_recency_count          NUMBER := 0;
    v_frequency_sum          NUMBER := 0;
    v_monetary_sum           NUMBER := 0;
    v_avg_recency            NUMBER;
    v_avg_frequency          NUMBER;
    v_avg_monetary           NUMBER;
    v_line                   VARCHAR2(4000);
    v_segment                VARCHAR2(100);
    v_segment_customers      NUMBER;
    v_segment_pct            NUMBER;
    v_segment_avg_days       NUMBER;
    v_segment_avg_purchases  NUMBER;
    v_segment_avg_spending   NUMBER;
    v_segment_total_spending NUMBER;

    TYPE t_num IS TABLE OF NUMBER INDEX BY VARCHAR2(100);

    seg_count      t_num;
    seg_days_sum   t_num;
    seg_days_cnt   t_num;
    seg_purch_sum  t_num;
    seg_spend_sum  t_num;
    seg_clv_sum    t_num;

    TYPE t_seg_order IS TABLE OF VARCHAR2(100);
    v_seg_order t_seg_order := t_seg_order(
        'Champions',
        'Loyal Customers',
        'Potential Loyal',
        'New Customers',
        'At Risk',
        'Need Attention',
        'Hibernating',
        'Lost',
        'Prospect'
    );    

    CURSOR c_detail IS
    WITH params AS (
        SELECT v_as_of_date AS as_of_date
          FROM dual
    ),
    customers AS (
        SELECT
            c.Customer_Key,
            c.Customer_ID,
            c.Customer_Name,
            c.Is_Beneficiary,
            c.Tier_Name,
            c.Join_Date,
            CASE
                WHEN c.Join_Date IS NULL THEN NULL
                ELSE TRUNC(p.as_of_date - TRUNC(c.Join_Date))
            END AS tenure_days
        FROM Customer_Dim c
        CROSS JOIN params p
        WHERE c.Join_Date IS NULL
           OR TRUNC(c.Join_Date) <= p.as_of_date
    ),
    sales AS (
        SELECT
            sf.Customer_Key,
            TRUNC(d.Cal_Date) AS sales_date,
            sf.Order_ID,
            (
                (sf.Quantity * sf.Unit_Price)
                - sf.Voucher_Discount_Amount
                - sf.MyKasih_Subsidy_Amount
            ) AS sales_net_amount,
            sf.Product_Key,
            sf.Branch_Key
        FROM Sales_Fact sf
        JOIN Date_Dim d
            ON d.Date_Key = sf.SO_Date_Key
        CROSS JOIN params p
        WHERE UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
        )
        AND sf.Customer_Key IS NOT NULL
        AND TRUNC(d.Cal_Date) <= p.as_of_date
    ),
    sales_agg AS (
        SELECT
            Customer_Key,
            MAX(sales_date) AS last_purchase_date,
            COUNT(DISTINCT Order_ID) AS total_purchases,
            SUM(sales_net_amount) AS gross_customer_amount
        FROM sales
        GROUP BY Customer_Key
    ),
    refunds AS (
        SELECT
            rf.Customer_Key,
            SUM(NVL(rf.Refund_Amount, 0)) AS total_refund_amount
        FROM Returns_Fact rf
        JOIN Date_Dim pd
            ON pd.Date_Key = rf.Processed_Date_Key
        CROSS JOIN params p
        WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
          AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
          AND TRUNC(pd.Cal_Date) <= p.as_of_date
        GROUP BY rf.Customer_Key
    ),
    customer_base AS (
        SELECT
            c.Customer_Key,
            c.Customer_ID,
            c.Customer_Name,
            c.Is_Beneficiary,
            c.Tier_Name,
            c.Join_Date,
            c.tenure_days,
            s.last_purchase_date,
            NVL(s.total_purchases, 0) AS total_purchases,
            NVL(s.gross_customer_amount, 0) AS gross_customer_amount,
            NVL(r.total_refund_amount, 0) AS total_refund_amount,
            GREATEST(
                NVL(s.gross_customer_amount, 0) - NVL(r.total_refund_amount, 0),
                0
            ) AS net_customer_amount,
            CASE
                WHEN NVL(s.total_purchases, 0) = 0 THEN NULL
                ELSE TRUNC(p.as_of_date - s.last_purchase_date)
            END AS days_since_last_purchase,
            CASE
                WHEN NVL(s.total_purchases, 0) = 0 THEN NULL
                ELSE GREATEST(
                    NVL(s.gross_customer_amount, 0) - NVL(r.total_refund_amount, 0),
                    0
                ) / s.total_purchases
            END AS average_order_value
        FROM customers c
        CROSS JOIN params p
        LEFT JOIN sales_agg s
            ON s.Customer_Key = c.Customer_Key
        LEFT JOIN refunds r
            ON r.Customer_Key = c.Customer_Key
    ),
    purchaser_scores AS (
        SELECT
            Customer_Key,
            NTILE(5) OVER (
                ORDER BY total_purchases ASC, Customer_Key ASC
            ) AS frequency_score,
            NTILE(5) OVER (
                ORDER BY net_customer_amount ASC, Customer_Key ASC
            ) AS monetary_score
        FROM customer_base
        WHERE total_purchases > 0
    ),
    scored AS (
        SELECT
            cb.*,
            CASE
                WHEN cb.total_purchases = 0 THEN 0
                WHEN cb.days_since_last_purchase <= 30 THEN 5
                WHEN cb.days_since_last_purchase <= 60 THEN 4
                WHEN cb.days_since_last_purchase <= 90 THEN 3
                WHEN cb.days_since_last_purchase <= 180 THEN 2
                ELSE 1
            END AS recency_score,
            NVL(ps.frequency_score, 0) AS frequency_score,
            NVL(ps.monetary_score, 0) AS monetary_score
        FROM customer_base cb
        LEFT JOIN purchaser_scores ps
            ON ps.Customer_Key = cb.Customer_Key
    ),
    category_stats AS (
        SELECT
            s.Customer_Key,
            p.Category_Name,
            COUNT(DISTINCT s.Order_ID) AS category_order_count,
            SUM(s.sales_net_amount) AS category_spending
        FROM sales s
        JOIN Product_Dim p
            ON p.Product_Key = s.Product_Key
        GROUP BY
            s.Customer_Key,
            p.Category_Name
    ),
    category_rank AS (
        SELECT
            Customer_Key,
            preferred_category
        FROM (
            SELECT
                Customer_Key,
                Category_Name AS preferred_category,
                ROW_NUMBER() OVER (
                    PARTITION BY Customer_Key
                    ORDER BY
                        category_order_count DESC,
                        category_spending DESC,
                        Category_Name ASC
                ) AS rn
            FROM category_stats
        )
        WHERE rn = 1
    ),
    branch_stats AS (
        SELECT
            s.Customer_Key,
            b.Branch_Key,
            b.Branch_Name,
            b.City,
            b.State,
            COUNT(DISTINCT s.Order_ID) AS branch_order_count,
            MAX(s.sales_date) AS branch_last_date
        FROM sales s
        JOIN Branch_Dim b
            ON b.Branch_Key = s.Branch_Key
        GROUP BY
            s.Customer_Key,
            b.Branch_Key,
            b.Branch_Name,
            b.City,
            b.State
    ),
    branch_rank AS (
        SELECT
            Customer_Key,
            preferred_branch,
            preferred_branch_city,
            preferred_branch_state
        FROM (
            SELECT
                Customer_Key,
                Branch_Name AS preferred_branch,
                City AS preferred_branch_city,
                State AS preferred_branch_state,
                ROW_NUMBER() OVER (
                    PARTITION BY Customer_Key
                    ORDER BY
                        branch_order_count DESC,
                        branch_last_date DESC,
                        Branch_Name ASC
                ) AS rn
            FROM branch_stats
        )
        WHERE rn = 1
    ),
    final AS (
        SELECT
            s.Customer_Key,
            s.Customer_ID,
            s.Customer_Name,
            s.Is_Beneficiary,
            s.Tier_Name,
            s.Join_Date,
            s.tenure_days,
            s.last_purchase_date,
            s.days_since_last_purchase,
            s.total_purchases,
            s.gross_customer_amount,
            s.total_refund_amount,
            s.net_customer_amount,
            s.average_order_value,
            s.recency_score,
            s.frequency_score,
            s.monetary_score,
            CASE
                WHEN s.total_purchases = 0 THEN
                    'Prospect'
                WHEN s.recency_score >= 4 AND s.frequency_score >= 4 AND s.monetary_score >= 4 THEN
                    'Champions'
                WHEN s.frequency_score >= 4 AND s.monetary_score >= 3 AND s.recency_score >= 3 THEN
                    'Loyal Customers'
                WHEN s.recency_score >= 4 AND s.frequency_score >= 2 AND s.monetary_score >= 2 THEN
                    'Potential Loyal'
                WHEN s.recency_score >= 4 AND s.frequency_score <= 2 AND s.monetary_score <= 2 THEN
                    'New Customers'
                WHEN s.frequency_score >= 3 AND s.monetary_score >= 3 AND s.recency_score <= 2 THEN
                    'At Risk'
                WHEN s.recency_score = 3 AND s.frequency_score <= 2 AND s.monetary_score <= 3 THEN
                    'Need Attention'
                WHEN s.recency_score <= 2 AND s.frequency_score <= 2 AND s.monetary_score <= 2 THEN
                    'Hibernating'
                WHEN s.recency_score = 1 AND s.frequency_score <= 2 THEN
                    'Lost'
                WHEN s.recency_score >= 4 THEN
                    'Potential Loyal'
                WHEN s.recency_score = 3 THEN
                    'Need Attention'
                WHEN s.frequency_score >= 3 OR s.monetary_score >= 3 THEN
                    'At Risk'
                ELSE
                    'Hibernating'
            END AS rfm_segment,
            CASE
                WHEN s.total_purchases = 0 THEN
                    'Prospect'
                WHEN s.days_since_last_purchase <= 90 THEN
                    'Low Risk'
                WHEN s.days_since_last_purchase <= 180 THEN
                    'Medium Risk'
                WHEN s.days_since_last_purchase <= 365 THEN
                    'High Risk'
                ELSE
                    'Churned'
            END AS churn_risk,
            cat.preferred_category,
            br.preferred_branch,
            br.preferred_branch_city,
            br.preferred_branch_state
        FROM scored s
        LEFT JOIN category_rank cat
            ON cat.Customer_Key = s.Customer_Key
        LEFT JOIN branch_rank br
            ON br.Customer_Key = s.Customer_Key
    )
    SELECT *
      FROM final
     ORDER BY Customer_Key;


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
    -- Initialise analysis date
    ----------------------------------------------------------------------------

    v_as_of_date := TRUNC(NVL(p_as_of_date, DATE '2026-06-30'));


    ----------------------------------------------------------------------------
    -- Validate required tables
    ----------------------------------------------------------------------------

    SELECT COUNT(*) INTO v_count FROM Date_Dim;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Missing data: Date_Dim is empty.');
    END IF;

    SELECT COUNT(*) INTO v_count FROM Sales_Fact;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Missing data: Sales_Fact is empty.');
    END IF;

    SELECT COUNT(*) INTO v_count FROM Customer_Dim;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Missing data: Customer_Dim is empty.');
    END IF;

    SELECT COUNT(*) INTO v_count FROM Product_Dim;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Missing data: Product_Dim is empty.');
    END IF;

    SELECT COUNT(*) INTO v_count FROM Branch_Dim;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Missing data: Branch_Dim is empty.');
    END IF;


    ----------------------------------------------------------------------------
    -- Validate Date_Dim
    ----------------------------------------------------------------------------

    SELECT COUNT(*) INTO v_count
      FROM Date_Dim
     WHERE Date_Key IS NULL
        OR Cal_Date IS NULL;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20006,
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
            -20007,
            'Invalid data: Date_Dim contains duplicate Date_Key values.'
        );
    END IF;


    ----------------------------------------------------------------------------
    -- Validate Customer_Dim
    ----------------------------------------------------------------------------

    SELECT COUNT(*) INTO v_count
      FROM Customer_Dim
     WHERE Customer_Key IS NULL
        OR Customer_ID IS NULL
        OR Customer_Name IS NULL
        OR Is_Beneficiary IS NULL
        OR Tier_Name IS NULL;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20008,
            'Missing data: Customer_Dim contains NULL mandatory fields.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM (
            SELECT Customer_Key
              FROM Customer_Dim
             GROUP BY Customer_Key
            HAVING COUNT(*) > 1
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20009,
            'Invalid data: Customer_Dim contains duplicate Customer_Key values.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Customer_Dim
     WHERE Join_Date IS NULL
        OR TRUNC(Join_Date) <= v_as_of_date;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20010,
            'No customer base found on or before the selected analysis date.'
        );
    END IF;


    ----------------------------------------------------------------------------
    -- Validate qualifying Sales_Fact rows
    ----------------------------------------------------------------------------

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
     WHERE sf.Customer_Key IS NOT NULL
       AND UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
           )
       AND (
            sf.SO_Date_Key IS NULL
         OR sf.Branch_Key IS NULL
         OR sf.Product_Key IS NULL
         OR sf.Customer_Key IS NULL
         OR sf.Order_ID IS NULL
         OR sf.Quantity IS NULL
         OR sf.Unit_Price IS NULL
         OR sf.Voucher_Discount_Amount IS NULL
         OR sf.MyKasih_Subsidy_Amount IS NULL
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20011,
            'Missing data: Qualifying customer Sales_Fact rows contain NULL mandatory fields.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
     WHERE sf.Customer_Key IS NOT NULL
       AND UPPER(TRIM(sf.SO_Status)) IN (
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
            -20012,
            'Invalid data: Negative customer spending lines found in qualifying Sales_Fact rows.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
     WHERE sf.Customer_Key IS NOT NULL
       AND UPPER(TRIM(sf.SO_Status)) IN (
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
            -20013,
            'Missing data: Qualifying Sales_Fact rows contain SO_Date_Key values not found in Date_Dim.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
     WHERE sf.Customer_Key IS NOT NULL
       AND UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
           )
       AND NOT EXISTS (
            SELECT 1
              FROM Customer_Dim c
             WHERE c.Customer_Key = sf.Customer_Key
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20014,
            'Missing data: Qualifying Sales_Fact rows contain Customer_Key values not found in Customer_Dim.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
     WHERE sf.Customer_Key IS NOT NULL
       AND UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
           )
       AND NOT EXISTS (
            SELECT 1
              FROM Product_Dim p
             WHERE p.Product_Key = sf.Product_Key
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20015,
            'Missing data: Qualifying Sales_Fact rows contain Product_Key values not found in Product_Dim.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
     WHERE sf.Customer_Key IS NOT NULL
       AND UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
           )
       AND NOT EXISTS (
            SELECT 1
              FROM Branch_Dim b
             WHERE b.Branch_Key = sf.Branch_Key
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20016,
            'Missing data: Qualifying Sales_Fact rows contain Branch_Key values not found in Branch_Dim.'
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
         OR rf.Customer_Key IS NULL
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20017,
            'Missing data: Completed refund rows contain NULL Processed_Date_Key, Refund_Amount or Customer_Key.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Returns_Fact rf
     WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
       AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
       AND rf.Refund_Amount < 0;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20018,
            'Invalid data: Negative refund amounts found in completed refund rows.'
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
            -20019,
            'Missing data: Completed refund rows contain Processed_Date_Key values not found in Date_Dim.'
        );
    END IF;

    SELECT COUNT(*) INTO v_count
      FROM Returns_Fact rf
     WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
       AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
       AND NOT EXISTS (
            SELECT 1
              FROM Customer_Dim c
             WHERE c.Customer_Key = rf.Customer_Key
           );

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20020,
            'Missing data: Completed refund rows contain Customer_Key values not found in Customer_Dim.'
        );
    END IF;


    ----------------------------------------------------------------------------
    -- Validate qualifying customer-linked sales up to analysis date
    ----------------------------------------------------------------------------

    SELECT COUNT(*) INTO v_count
      FROM Sales_Fact sf
      JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
      JOIN Customer_Dim c
        ON c.Customer_Key = sf.Customer_Key
       AND (
            c.Join_Date IS NULL
            OR TRUNC(c.Join_Date) <= v_as_of_date
           )
     WHERE sf.Customer_Key IS NOT NULL
       AND UPPER(TRIM(sf.SO_Status)) IN (
            'COMPLETED',
            'OUT_FOR_DELIVERY',
            'READY_FOR_PICKUP'
           )
       AND TRUNC(d.Cal_Date) <= v_as_of_date;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(
            -20021,
            'No qualifying customer-linked sales found on or before the selected analysis date.'
        );
    END IF;


    ----------------------------------------------------------------------------
    -- Accumulate report data
    ----------------------------------------------------------------------------

    FOR r_detail IN c_detail LOOP

        v_total_customers := v_total_customers + 1;

        IF r_detail.total_purchases > 0 THEN
            v_purchasing_customers := v_purchasing_customers + 1;
            v_frequency_sum := v_frequency_sum + r_detail.total_purchases;
            v_monetary_sum := v_monetary_sum + NVL(r_detail.net_customer_amount, 0);
        ELSE
            v_prospects := v_prospects + 1;
        END IF;

        v_total_sales_amount := v_total_sales_amount + NVL(r_detail.gross_customer_amount, 0);
        v_total_refund_amount := v_total_refund_amount + NVL(r_detail.total_refund_amount, 0);
        v_total_net_amount := v_total_net_amount + NVL(r_detail.net_customer_amount, 0);

        IF r_detail.days_since_last_purchase IS NOT NULL THEN
            v_recency_sum := v_recency_sum + r_detail.days_since_last_purchase;
            v_recency_count := v_recency_count + 1;
        END IF;

        IF NOT seg_count.EXISTS(r_detail.rfm_segment) THEN
            seg_count(r_detail.rfm_segment) := 0;
            seg_days_sum(r_detail.rfm_segment) := 0;
            seg_days_cnt(r_detail.rfm_segment) := 0;
            seg_purch_sum(r_detail.rfm_segment) := 0;
            seg_spend_sum(r_detail.rfm_segment) := 0;
            seg_clv_sum(r_detail.rfm_segment) := 0;
        END IF;

        seg_count(r_detail.rfm_segment) := seg_count(r_detail.rfm_segment) + 1;

        IF r_detail.days_since_last_purchase IS NOT NULL THEN
            seg_days_sum(r_detail.rfm_segment) := seg_days_sum(r_detail.rfm_segment) + r_detail.days_since_last_purchase;
            seg_days_cnt(r_detail.rfm_segment) := seg_days_cnt(r_detail.rfm_segment) + 1;
        END IF;

        seg_purch_sum(r_detail.rfm_segment) := seg_purch_sum(r_detail.rfm_segment) + NVL(r_detail.total_purchases, 0);
        seg_spend_sum(r_detail.rfm_segment) := seg_spend_sum(r_detail.rfm_segment) + NVL(r_detail.net_customer_amount, 0);
        seg_clv_sum(r_detail.rfm_segment) := seg_clv_sum(r_detail.rfm_segment) + NVL(r_detail.net_customer_amount, 0);

    END LOOP;


    ----------------------------------------------------------------------------
    -- Calculate executive averages
    ----------------------------------------------------------------------------

    IF v_recency_count > 0 THEN
        v_avg_recency := v_recency_sum / v_recency_count;
    END IF;

    IF v_purchasing_customers > 0 THEN
        v_avg_frequency := v_frequency_sum / v_purchasing_customers;
        v_avg_monetary := v_monetary_sum / v_purchasing_customers;
    END IF;


    ----------------------------------------------------------------------------
    -- Print executive summary
    ----------------------------------------------------------------------------

    DBMS_OUTPUT.PUT_LINE(RPAD('=', 120, '='));
    DBMS_OUTPUT.PUT_LINE('CUSTOMER SEGMENTATION AND RFM ANALYSIS');
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 120, '='));
    DBMS_OUTPUT.PUT_LINE('Report Generated On : ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Analysis As Of Date : ' || TO_CHAR(v_as_of_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Sales Statuses      : COMPLETED, OUT_FOR_DELIVERY, READY_FOR_PICKUP');
    DBMS_OUTPUT.PUT_LINE('Customer Scope      : Registered customers only, excluding guest sales');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    DBMS_OUTPUT.PUT_LINE('EXECUTIVE SUMMARY');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));
    DBMS_OUTPUT.PUT_LINE('Total Customers                   : ' || fmt_int(v_total_customers));
    DBMS_OUTPUT.PUT_LINE('Purchasing Customers              : ' || fmt_int(v_purchasing_customers));
    DBMS_OUTPUT.PUT_LINE('Prospects                         : ' || fmt_int(v_prospects));
    DBMS_OUTPUT.PUT_LINE('Total Customer Sales Amount       : RM ' || fmt_money(v_total_sales_amount));
    DBMS_OUTPUT.PUT_LINE('Total Refund Amount               : RM ' || fmt_money(v_total_refund_amount));
    DBMS_OUTPUT.PUT_LINE('Total Net Customer Spending / CLV : RM ' || fmt_money(v_total_net_amount));
    DBMS_OUTPUT.PUT_LINE('Average Days Since Last Purchase  : ' || fmt_number(v_avg_recency));
    DBMS_OUTPUT.PUT_LINE('Average Purchases Per Customer    : ' || fmt_number(v_avg_frequency));
    DBMS_OUTPUT.PUT_LINE('Average Net Spending Per Customer : RM ' || fmt_money(v_avg_monetary));
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    DBMS_OUTPUT.PUT_LINE('RFM SEGMENT SUMMARY');
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    v_line :=
        RPAD('SEGMENT', 20) ||
        LPAD('CUSTOMERS', 12) ||
        LPAD('%', 10) ||
        LPAD('AVG RECENCY', 15) ||
        LPAD('AVG PURCHASES', 17) ||
        LPAD('AVG SPENDING', 22) ||
        LPAD('TOTAL SPENDING', 24);

    DBMS_OUTPUT.PUT_LINE(v_line);
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));

    FOR i IN 1 .. v_seg_order.COUNT LOOP

        v_segment := v_seg_order(i);

        v_segment_customers := 0;
        v_segment_avg_days := NULL;
        v_segment_avg_purchases := NULL;
        v_segment_avg_spending := NULL;
        v_segment_total_spending := 0;

        IF seg_count.EXISTS(v_segment) THEN
            v_segment_customers := seg_count(v_segment);
        END IF;

        IF seg_days_cnt.EXISTS(v_segment) AND seg_days_cnt(v_segment) > 0 THEN
            v_segment_avg_days := seg_days_sum(v_segment) / seg_days_cnt(v_segment);
        END IF;

        IF v_segment_customers > 0 THEN
            v_segment_avg_purchases := seg_purch_sum(v_segment) / v_segment_customers;
            v_segment_avg_spending := seg_spend_sum(v_segment) / v_segment_customers;
            v_segment_total_spending := seg_spend_sum(v_segment);
        END IF;

        IF v_total_customers > 0 THEN
            v_segment_pct := v_segment_customers * 100 / v_total_customers;
        ELSE
            v_segment_pct := NULL;
        END IF;

        v_line :=
            RPAD(v_segment, 20) ||
            LPAD(fmt_int(v_segment_customers), 12) ||
            LPAD(fmt_pct(v_segment_pct), 10) ||
            LPAD(fmt_number(v_segment_avg_days), 15) ||
            LPAD(fmt_number(v_segment_avg_purchases), 17) ||
            LPAD('RM ' || fmt_money(v_segment_avg_spending), 22) ||
            LPAD('RM ' || fmt_money(v_segment_total_spending), 24);

        DBMS_OUTPUT.PUT_LINE(v_line);

    END LOOP;

    DBMS_OUTPUT.PUT_LINE(RPAD('-', 120, '-'));
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 120, '='));
    DBMS_OUTPUT.PUT_LINE('END OF REPORT');
    DBMS_OUTPUT.PUT_LINE(RPAD('=', 120, '='));

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
        RAISE;
END generate_customer_rfm_report;
/

SHOW ERRORS PROCEDURE generate_customer_rfm_report

DECLARE
    v_error_count NUMBER;
BEGIN
    SELECT COUNT(*)
      INTO v_error_count
      FROM USER_ERRORS
     WHERE name = 'GENERATE_CUSTOMER_RFM_REPORT'
       AND type = 'PROCEDURE';

    IF v_error_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20022,
            'Procedure GENERATE_CUSTOMER_RFM_REPORT has compilation errors. Please check SHOW ERRORS output.'
        );
    END IF;
END;
/


--------------------------------------------------------------------------------
-- SPOOL FORMATTED EXECUTIVE REPORT
--------------------------------------------------------------------------------

SPOOL 'report_output/customer_rfm_report.txt'

EXEC generate_customer_rfm_report(COALESCE(TO_DATE(:b_as_of_date, 'YYYY-MM-DD'), DATE '2026-06-30'));

SPOOL OFF


--------------------------------------------------------------------------------
-- SPOOL CUSTOMER RFM DETAIL CSV
--------------------------------------------------------------------------------

SET MARKUP CSV ON DELIMIT ',' QUOTE ON
SET PAGESIZE 50000
SET LINESIZE 32767
SET HEADING ON
SET FEEDBACK OFF
SET TERMOUT OFF
SET TRIMSPOOL ON

SPOOL 'report_output/customer_rfm_detail.csv'

WITH params AS (
    SELECT COALESCE(
        TO_DATE(:b_as_of_date, 'YYYY-MM-DD'),
        DATE '2026-06-30'
    ) AS as_of_date
      FROM dual
),
customers AS (
    SELECT
        c.Customer_Key,
        c.Customer_ID,
        c.Customer_Name,
        c.Is_Beneficiary,
        c.Tier_Name,
        c.Join_Date,
        CASE
            WHEN c.Join_Date IS NULL THEN NULL
            ELSE TRUNC(p.as_of_date - TRUNC(c.Join_Date))
        END AS tenure_days
    FROM Customer_Dim c
    CROSS JOIN params p
    WHERE c.Join_Date IS NULL
       OR TRUNC(c.Join_Date) <= p.as_of_date
),
sales AS (
    SELECT
        sf.Customer_Key,
        TRUNC(d.Cal_Date) AS sales_date,
        sf.Order_ID,
        (
            (sf.Quantity * sf.Unit_Price)
            - sf.Voucher_Discount_Amount
            - sf.MyKasih_Subsidy_Amount
        ) AS sales_net_amount,
        sf.Product_Key,
        sf.Branch_Key
    FROM Sales_Fact sf
    JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
    CROSS JOIN params p
    WHERE UPPER(TRIM(sf.SO_Status)) IN (
        'COMPLETED',
        'OUT_FOR_DELIVERY',
        'READY_FOR_PICKUP'
    )
    AND sf.Customer_Key IS NOT NULL
    AND TRUNC(d.Cal_Date) <= p.as_of_date
),
sales_agg AS (
    SELECT
        Customer_Key,
        MAX(sales_date) AS last_purchase_date,
        COUNT(DISTINCT Order_ID) AS total_purchases,
        SUM(sales_net_amount) AS gross_customer_amount
    FROM sales
    GROUP BY Customer_Key
),
refunds AS (
    SELECT
        rf.Customer_Key,
        SUM(NVL(rf.Refund_Amount, 0)) AS total_refund_amount
    FROM Returns_Fact rf
    JOIN Date_Dim pd
        ON pd.Date_Key = rf.Processed_Date_Key
    CROSS JOIN params p
    WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
      AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
      AND TRUNC(pd.Cal_Date) <= p.as_of_date
    GROUP BY rf.Customer_Key
),
customer_base AS (
    SELECT
        c.Customer_Key,
        c.Customer_ID,
        c.Customer_Name,
        c.Is_Beneficiary,
        c.Tier_Name,
        c.Join_Date,
        c.tenure_days,
        s.last_purchase_date,
        NVL(s.total_purchases, 0) AS total_purchases,
        NVL(s.gross_customer_amount, 0) AS gross_customer_amount,
        NVL(r.total_refund_amount, 0) AS total_refund_amount,
        GREATEST(
            NVL(s.gross_customer_amount, 0) - NVL(r.total_refund_amount, 0),
            0
        ) AS net_customer_amount,
        CASE
            WHEN NVL(s.total_purchases, 0) = 0 THEN NULL
            ELSE TRUNC(p.as_of_date - s.last_purchase_date)
        END AS days_since_last_purchase,
        CASE
            WHEN NVL(s.total_purchases, 0) = 0 THEN NULL
            ELSE GREATEST(
                NVL(s.gross_customer_amount, 0) - NVL(r.total_refund_amount, 0),
                0
            ) / s.total_purchases
        END AS average_order_value
    FROM customers c
    CROSS JOIN params p
    LEFT JOIN sales_agg s
        ON s.Customer_Key = c.Customer_Key
    LEFT JOIN refunds r
        ON r.Customer_Key = c.Customer_Key
),
purchaser_scores AS (
    SELECT
        Customer_Key,
        NTILE(5) OVER (
            ORDER BY total_purchases ASC, Customer_Key ASC
        ) AS frequency_score,
        NTILE(5) OVER (
            ORDER BY net_customer_amount ASC, Customer_Key ASC
        ) AS monetary_score
    FROM customer_base
    WHERE total_purchases > 0
),
scored AS (
    SELECT
        cb.*,
        CASE
            WHEN cb.total_purchases = 0 THEN 0
            WHEN cb.days_since_last_purchase <= 30 THEN 5
            WHEN cb.days_since_last_purchase <= 60 THEN 4
            WHEN cb.days_since_last_purchase <= 90 THEN 3
            WHEN cb.days_since_last_purchase <= 180 THEN 2
            ELSE 1
        END AS recency_score,
        NVL(ps.frequency_score, 0) AS frequency_score,
        NVL(ps.monetary_score, 0) AS monetary_score
    FROM customer_base cb
    LEFT JOIN purchaser_scores ps
        ON ps.Customer_Key = cb.Customer_Key
),
category_stats AS (
    SELECT
        s.Customer_Key,
        p.Category_Name,
        COUNT(DISTINCT s.Order_ID) AS category_order_count,
        SUM(s.sales_net_amount) AS category_spending
    FROM sales s
    JOIN Product_Dim p
        ON p.Product_Key = s.Product_Key
    GROUP BY
        s.Customer_Key,
        p.Category_Name
),
category_rank AS (
    SELECT
        Customer_Key,
        preferred_category
    FROM (
        SELECT
            Customer_Key,
            Category_Name AS preferred_category,
            ROW_NUMBER() OVER (
                PARTITION BY Customer_Key
                ORDER BY
                    category_order_count DESC,
                    category_spending DESC,
                    Category_Name ASC
            ) AS rn
        FROM category_stats
    )
    WHERE rn = 1
),
branch_stats AS (
    SELECT
        s.Customer_Key,
        b.Branch_Key,
        b.Branch_Name,
        b.City,
        b.State,
        COUNT(DISTINCT s.Order_ID) AS branch_order_count,
        MAX(s.sales_date) AS branch_last_date
    FROM sales s
    JOIN Branch_Dim b
        ON b.Branch_Key = s.Branch_Key
    GROUP BY
        s.Customer_Key,
        b.Branch_Key,
        b.Branch_Name,
        b.City,
        b.State
),
branch_rank AS (
    SELECT
        Customer_Key,
        preferred_branch,
        preferred_branch_city,
        preferred_branch_state
    FROM (
        SELECT
            Customer_Key,
            Branch_Name AS preferred_branch,
            City AS preferred_branch_city,
            State AS preferred_branch_state,
            ROW_NUMBER() OVER (
                PARTITION BY Customer_Key
                ORDER BY
                    branch_order_count DESC,
                    branch_last_date DESC,
                    Branch_Name ASC
            ) AS rn
        FROM branch_stats
    )
    WHERE rn = 1
),
final AS (
    SELECT
        s.Customer_Key,
        s.Customer_ID,
        s.Customer_Name,
        s.Is_Beneficiary,
        s.Tier_Name,
        s.Join_Date,
        s.tenure_days,
        s.last_purchase_date,
        s.days_since_last_purchase,
        s.total_purchases,
        s.gross_customer_amount,
        s.total_refund_amount,
        s.net_customer_amount,
        s.average_order_value,
        s.recency_score,
        s.frequency_score,
        s.monetary_score,
        CASE
            WHEN s.total_purchases = 0 THEN
                'Prospect'
            WHEN s.recency_score >= 4 AND s.frequency_score >= 4 AND s.monetary_score >= 4 THEN
                'Champions'
            WHEN s.frequency_score >= 4 AND s.monetary_score >= 3 AND s.recency_score >= 3 THEN
                'Loyal Customers'
            WHEN s.recency_score >= 4 AND s.frequency_score >= 2 AND s.monetary_score >= 2 THEN
                'Potential Loyal'
            WHEN s.recency_score >= 4 AND s.frequency_score <= 2 AND s.monetary_score <= 2 THEN
                'New Customers'
            WHEN s.frequency_score >= 3 AND s.monetary_score >= 3 AND s.recency_score <= 2 THEN
                'At Risk'
            WHEN s.recency_score = 3 AND s.frequency_score <= 2 AND s.monetary_score <= 3 THEN
                'Need Attention'
            WHEN s.recency_score <= 2 AND s.frequency_score <= 2 AND s.monetary_score <= 2 THEN
                'Hibernating'
            WHEN s.recency_score = 1 AND s.frequency_score <= 2 THEN
                'Lost'
            WHEN s.recency_score >= 4 THEN
                'Potential Loyal'
            WHEN s.recency_score = 3 THEN
                'Need Attention'
            WHEN s.frequency_score >= 3 OR s.monetary_score >= 3 THEN
                'At Risk'
            ELSE
                'Hibernating'
        END AS rfm_segment,
        CASE
            WHEN s.total_purchases = 0 THEN
                'Prospect'
            WHEN s.days_since_last_purchase <= 90 THEN
                'Low Risk'
            WHEN s.days_since_last_purchase <= 180 THEN
                'Medium Risk'
            WHEN s.days_since_last_purchase <= 365 THEN
                'High Risk'
            ELSE
                'Churned'
        END AS churn_risk,
        cat.preferred_category,
        br.preferred_branch,
        br.preferred_branch_city,
        br.preferred_branch_state
    FROM scored s
    LEFT JOIN category_rank cat
        ON cat.Customer_Key = s.Customer_Key
    LEFT JOIN branch_rank br
        ON br.Customer_Key = s.Customer_Key
)
SELECT
    Customer_Key,
    Customer_ID,
    Customer_Name,
    Is_Beneficiary,
    Tier_Name,
    TO_CHAR(TRUNC(Join_Date), 'YYYY-MM-DD') AS Join_Date,
    tenure_days AS Customer_Tenure_Days,
    TO_CHAR(TRUNC(last_purchase_date), 'YYYY-MM-DD') AS Last_Purchase_Date,
    days_since_last_purchase AS Days_Since_Last_Purchase,
    total_purchases AS Total_Purchases,
    ROUND(gross_customer_amount, 2) AS Total_Sales_Amount,
    ROUND(total_refund_amount, 2) AS Total_Refund_Amount,
    ROUND(net_customer_amount, 2) AS Total_Spending,
    ROUND(net_customer_amount, 2) AS Customer_Lifetime_Value,
    ROUND(average_order_value, 2) AS Average_Order_Value,
    recency_score AS Recency_Score,
    frequency_score AS Frequency_Score,
    monetary_score AS Monetary_Score,
    rfm_segment AS RFM_Segment,
    churn_risk AS Churn_Risk,
    preferred_category AS Preferred_Category,
    preferred_branch AS Preferred_Branch,
    preferred_branch_city AS Preferred_Branch_City,
    preferred_branch_state AS Preferred_Branch_State
FROM final
ORDER BY Customer_Key;

SPOOL OFF


--------------------------------------------------------------------------------
-- SPOOL RFM SEGMENT SUMMARY CSV
--------------------------------------------------------------------------------

SPOOL 'report_output/customer_rfm_segment_summary.csv'

WITH params AS (
    SELECT COALESCE(
        TO_DATE(:b_as_of_date, 'YYYY-MM-DD'),
        DATE '2026-06-30'
    ) AS as_of_date
      FROM dual
),
customers AS (
    SELECT
        c.Customer_Key,
        c.Customer_ID,
        c.Customer_Name,
        c.Is_Beneficiary,
        c.Tier_Name,
        c.Join_Date,
        CASE
            WHEN c.Join_Date IS NULL THEN NULL
            ELSE TRUNC(p.as_of_date - TRUNC(c.Join_Date))
        END AS tenure_days
    FROM Customer_Dim c
    CROSS JOIN params p
    WHERE c.Join_Date IS NULL
       OR TRUNC(c.Join_Date) <= p.as_of_date
),
sales AS (
    SELECT
        sf.Customer_Key,
        TRUNC(d.Cal_Date) AS sales_date,
        sf.Order_ID,
        (
            (sf.Quantity * sf.Unit_Price)
            - sf.Voucher_Discount_Amount
            - sf.MyKasih_Subsidy_Amount
        ) AS sales_net_amount,
        sf.Product_Key,
        sf.Branch_Key
    FROM Sales_Fact sf
    JOIN Date_Dim d
        ON d.Date_Key = sf.SO_Date_Key
    CROSS JOIN params p
    WHERE UPPER(TRIM(sf.SO_Status)) IN (
        'COMPLETED',
        'OUT_FOR_DELIVERY',
        'READY_FOR_PICKUP'
    )
    AND sf.Customer_Key IS NOT NULL
    AND TRUNC(d.Cal_Date) <= p.as_of_date
),
sales_agg AS (
    SELECT
        Customer_Key,
        MAX(sales_date) AS last_purchase_date,
        COUNT(DISTINCT Order_ID) AS total_purchases,
        SUM(sales_net_amount) AS gross_customer_amount
    FROM sales
    GROUP BY Customer_Key
),
refunds AS (
    SELECT
        rf.Customer_Key,
        SUM(NVL(rf.Refund_Amount, 0)) AS total_refund_amount
    FROM Returns_Fact rf
    JOIN Date_Dim pd
        ON pd.Date_Key = rf.Processed_Date_Key
    CROSS JOIN params p
    WHERE UPPER(TRIM(rf.Return_Status)) = 'COMPLETED'
      AND UPPER(TRIM(rf.Resolution_Type)) = 'REFUND'
      AND TRUNC(pd.Cal_Date) <= p.as_of_date
    GROUP BY rf.Customer_Key
),
customer_base AS (
    SELECT
        c.Customer_Key,
        c.Customer_ID,
        c.Customer_Name,
        c.Is_Beneficiary,
        c.Tier_Name,
        c.Join_Date,
        c.tenure_days,
        s.last_purchase_date,
        NVL(s.total_purchases, 0) AS total_purchases,
        NVL(s.gross_customer_amount, 0) AS gross_customer_amount,
        NVL(r.total_refund_amount, 0) AS total_refund_amount,
        GREATEST(
            NVL(s.gross_customer_amount, 0) - NVL(r.total_refund_amount, 0),
            0
        ) AS net_customer_amount,
        CASE
            WHEN NVL(s.total_purchases, 0) = 0 THEN NULL
            ELSE TRUNC(p.as_of_date - s.last_purchase_date)
        END AS days_since_last_purchase,
        CASE
            WHEN NVL(s.total_purchases, 0) = 0 THEN NULL
            ELSE GREATEST(
                NVL(s.gross_customer_amount, 0) - NVL(r.total_refund_amount, 0),
                0
            ) / s.total_purchases
        END AS average_order_value
    FROM customers c
    CROSS JOIN params p
    LEFT JOIN sales_agg s
        ON s.Customer_Key = c.Customer_Key
    LEFT JOIN refunds r
        ON r.Customer_Key = c.Customer_Key
),
purchaser_scores AS (
    SELECT
        Customer_Key,
        NTILE(5) OVER (
            ORDER BY total_purchases ASC, Customer_Key ASC
        ) AS frequency_score,
        NTILE(5) OVER (
            ORDER BY net_customer_amount ASC, Customer_Key ASC
        ) AS monetary_score
    FROM customer_base
    WHERE total_purchases > 0
),
scored AS (
    SELECT
        cb.*,
        CASE
            WHEN cb.total_purchases = 0 THEN 0
            WHEN cb.days_since_last_purchase <= 30 THEN 5
            WHEN cb.days_since_last_purchase <= 60 THEN 4
            WHEN cb.days_since_last_purchase <= 90 THEN 3
            WHEN cb.days_since_last_purchase <= 180 THEN 2
            ELSE 1
        END AS recency_score,
        NVL(ps.frequency_score, 0) AS frequency_score,
        NVL(ps.monetary_score, 0) AS monetary_score
    FROM customer_base cb
    LEFT JOIN purchaser_scores ps
        ON ps.Customer_Key = cb.Customer_Key
),
category_stats AS (
    SELECT
        s.Customer_Key,
        p.Category_Name,
        COUNT(DISTINCT s.Order_ID) AS category_order_count,
        SUM(s.sales_net_amount) AS category_spending
    FROM sales s
    JOIN Product_Dim p
        ON p.Product_Key = s.Product_Key
    GROUP BY
        s.Customer_Key,
        p.Category_Name
),
category_rank AS (
    SELECT
        Customer_Key,
        preferred_category
    FROM (
        SELECT
            Customer_Key,
            Category_Name AS preferred_category,
            ROW_NUMBER() OVER (
                PARTITION BY Customer_Key
                ORDER BY
                    category_order_count DESC,
                    category_spending DESC,
                    Category_Name ASC
            ) AS rn
        FROM category_stats
    )
    WHERE rn = 1
),
branch_stats AS (
    SELECT
        s.Customer_Key,
        b.Branch_Key,
        b.Branch_Name,
        b.City,
        b.State,
        COUNT(DISTINCT s.Order_ID) AS branch_order_count,
        MAX(s.sales_date) AS branch_last_date
    FROM sales s
    JOIN Branch_Dim b
        ON b.Branch_Key = s.Branch_Key
    GROUP BY
        s.Customer_Key,
        b.Branch_Key,
        b.Branch_Name,
        b.City,
        b.State
),
branch_rank AS (
    SELECT
        Customer_Key,
        preferred_branch,
        preferred_branch_city,
        preferred_branch_state
    FROM (
        SELECT
            Customer_Key,
            Branch_Name AS preferred_branch,
            City AS preferred_branch_city,
            State AS preferred_branch_state,
            ROW_NUMBER() OVER (
                PARTITION BY Customer_Key
                ORDER BY
                    branch_order_count DESC,
                    branch_last_date DESC,
                    Branch_Name ASC
            ) AS rn
        FROM branch_stats
    )
    WHERE rn = 1
),
final AS (
    SELECT
        s.Customer_Key,
        s.total_purchases,
        s.days_since_last_purchase,
        s.net_customer_amount,
        CASE
            WHEN s.total_purchases = 0 THEN
                'Prospect'
            WHEN s.recency_score >= 4 AND s.frequency_score >= 4 AND s.monetary_score >= 4 THEN
                'Champions'
            WHEN s.frequency_score >= 4 AND s.monetary_score >= 3 AND s.recency_score >= 3 THEN
                'Loyal Customers'
            WHEN s.recency_score >= 4 AND s.frequency_score >= 2 AND s.monetary_score >= 2 THEN
                'Potential Loyal'
            WHEN s.recency_score >= 4 AND s.frequency_score <= 2 AND s.monetary_score <= 2 THEN
                'New Customers'
            WHEN s.frequency_score >= 3 AND s.monetary_score >= 3 AND s.recency_score <= 2 THEN
                'At Risk'
            WHEN s.recency_score = 3 AND s.frequency_score <= 2 AND s.monetary_score <= 3 THEN
                'Need Attention'
            WHEN s.recency_score <= 2 AND s.frequency_score <= 2 AND s.monetary_score <= 2 THEN
                'Hibernating'
            WHEN s.recency_score = 1 AND s.frequency_score <= 2 THEN
                'Lost'
            WHEN s.recency_score >= 4 THEN
                'Potential Loyal'
            WHEN s.recency_score = 3 THEN
                'Need Attention'
            WHEN s.frequency_score >= 3 OR s.monetary_score >= 3 THEN
                'At Risk'
            ELSE
                'Hibernating'
        END AS rfm_segment
    FROM scored s
    LEFT JOIN category_rank cat
        ON cat.Customer_Key = s.Customer_Key
    LEFT JOIN branch_rank br
        ON br.Customer_Key = s.Customer_Key
),
segment_dim AS (
    SELECT 'Champions' AS rfm_segment, 1 AS sort_order FROM dual
    UNION ALL
    SELECT 'Loyal Customers', 2 FROM dual
    UNION ALL
    SELECT 'Potential Loyal', 3 FROM dual
    UNION ALL
    SELECT 'New Customers', 4 FROM dual
    UNION ALL
    SELECT 'At Risk', 5 FROM dual
    UNION ALL
    SELECT 'Need Attention', 6 FROM dual
    UNION ALL
    SELECT 'Hibernating', 7 FROM dual
    UNION ALL
    SELECT 'Lost', 8 FROM dual
    UNION ALL
    SELECT 'Prospect', 9 FROM dual
),
segment_agg AS (
    SELECT
        rfm_segment,
        COUNT(*) AS customer_count,
        AVG(days_since_last_purchase) AS avg_days_since_last_purchase,
        AVG(total_purchases) AS avg_total_purchases,
        AVG(net_customer_amount) AS avg_net_spending,
        SUM(net_customer_amount) AS total_net_spending
    FROM final
    GROUP BY rfm_segment
),
total_customers AS (
    SELECT COUNT(*) AS total_count
      FROM final
)
SELECT
    d.rfm_segment AS RFM_Segment,
    NVL(a.customer_count, 0) AS Customer_Count,
    CASE
        WHEN t.total_count = 0 THEN 0
        ELSE ROUND(NVL(a.customer_count, 0) * 100 / t.total_count, 2)
    END AS Segment_Distribution_Pct,
    ROUND(a.avg_days_since_last_purchase, 0) AS Avg_Days_Since_Last_Purchase,
    ROUND(a.avg_total_purchases, 2) AS Avg_Total_Purchases,
    ROUND(a.avg_net_spending, 2) AS Avg_Net_Spending,
    ROUND(NVL(a.total_net_spending, 0), 2) AS Total_Net_Spending,
    ROUND(NVL(a.total_net_spending, 0), 2) AS Total_Customer_Lifetime_Value,
    ROUND(a.avg_net_spending, 2) AS Avg_Customer_Lifetime_Value
FROM segment_dim d
LEFT JOIN segment_agg a
    ON a.rfm_segment = d.rfm_segment
CROSS JOIN total_customers t
ORDER BY d.sort_order;

SPOOL OFF

SET MARKUP CSV OFF
SET TERMOUT ON

PROMPT
PROMPT Customer RFM report generation completed.
PROMPT Text report : customer_rfm_report.txt
PROMPT CSV detail  : customer_rfm_detail.csv
PROMPT CSV summary : customer_rfm_segment_summary.csv
PROMPT
