SET DEFINE OFF
SET SQLBLANKLINES ON
SET SERVEROUTPUT ON
SET ECHO OFF
SET FEEDBACK OFF
SET VERIFY OFF

WHENEVER SQLERROR CONTINUE NONE
WHENEVER OSERROR CONTINUE NONE

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Creating 88 Speedmart database');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ddl_script.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Customer data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@"ZcePing/customer_inserts.sql"

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Member Tier data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZcePing/member_tier_inserts.sql


BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Branch data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@WanJin/branch_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Product Category data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@WanJin/product_category_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Supplier data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ShengJie/suppliers_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Voucher data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZhenHao/voucher_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Delivery Company data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ShengJie/delivery_companies_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Member Profile data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZcePing/member_profile_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Mykasih Beneficiaries data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZcePing/mykasih_beneficiaries_inserts.sql


BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Staff data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@WanJin/staff_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Item data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@WanJin/item_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Stock data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@WanJin/stock_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Purchase Order data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ShengJie/purchase_orders_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Purchase Order Items data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ShengJie/purchase_order_items_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Order data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZhenHao/order_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Order Item data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZhenHao/order_item_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Return Requests data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZhenHao/return_request_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Feedback data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZhenHao/feedback_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Point Transactions data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ZcePing/point_transaction_inserts.sql

BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Inserting Delivery data');
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

@@ShengJie/deliveries_inserts.sql

COMMIT;

DECLARE
    TYPE table_list_type IS TABLE OF VARCHAR2(50);

    expected_tables table_list_type := table_list_type(
        'CUSTOMERS',
        'MEMBER_TIERS',
        'MEMBER_PROFILES',
        'MYKASIH_BENEFICIARIES',
        'BRANCHES',
        'STAFFS',
        'PRODUCT_CATEGORIES',
        'ITEMS',
        'STOCKS',
        'SUPPLIERS',
        'PURCHASE_ORDERS',
        'PURCHASE_ORDER_ITEMS',
        'ORDERS',
        'ORDERED_ITEMS',
        'VOUCHERS',
        'POINT_TRANSACTIONS',
        'DELIVERY_COMPANIES',
        'DELIVERIES',
        'RETURN_REQUESTS',
        'FEEDBACKS'
    );

    table_exists NUMBER;
    row_count    NUMBER;
    failed_count NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Checking inserted data');
    DBMS_OUTPUT.PUT_LINE('==========================================');

    FOR i IN 1 .. expected_tables.COUNT LOOP
        SELECT COUNT(*)
        INTO table_exists
        FROM USER_TABLES
        WHERE TABLE_NAME = expected_tables(i);

        IF table_exists = 0 THEN
            DBMS_OUTPUT.PUT_LINE(
                '[FAILED]  ' || expected_tables(i) ||
                ' table does not exist'
            );

            failed_count := failed_count + 1;
        ELSE
            EXECUTE IMMEDIATE
                'SELECT COUNT(*) FROM ' || expected_tables(i)
            INTO row_count;

            IF row_count > 0 THEN
                DBMS_OUTPUT.PUT_LINE(
                    '[SUCCESS] ' ||
                    RPAD(expected_tables(i), 30) ||
                    row_count || ' row(s)'
                );
            ELSE
                DBMS_OUTPUT.PUT_LINE(
                    '[FAILED]  ' ||
                    RPAD(expected_tables(i), 30) ||
                    '0 rows inserted'
                );

                failed_count := failed_count + 1;
            END IF;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('==========================================');

    IF failed_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'ALL TABLES CONTAIN INSERTED DATA'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            failed_count ||
            ' TABLE(S) ARE MISSING OR EMPTY'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/
