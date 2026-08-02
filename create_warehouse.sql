-- ============================================================================
-- DATA WAREHOUSE DIMENSION AND FACT TABLES CREATION SCRIPT
-- Oracle SQL - Galaxy Schema Design
-- ============================================================================

SET DEFINE OFF
SET SQLBLANKLINES ON
SET ECHO OFF
SET SERVEROUTPUT ON
WHENEVER SQLERROR CONTINUE NONE
WHENEVER OSERROR CONTINUE NONE

BEGIN
    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('Dropping existing DW tables...');
    DBMS_OUTPUT.PUT_LINE('======================================');
END;
/

-- Drop existing tables in reverse order (facts first, then dimensions)
DECLARE
    TYPE t_table_list IS TABLE OF VARCHAR2(30);
    v_tables t_table_list := t_table_list(
        'SALES_FACT',
        'PURCHASES_FACT',
        'INVENTORY_FACT',
        'RETURNS_FACT',
        'DATE_DIM',
        'BRANCH_DIM',
        'STAFF_DIM',
        'CUSTOMER_DIM',
        'SUPPLIER_DIM',
        'PRODUCT_DIM'
    );
    v_dropped NUMBER := 0;
BEGIN
    FOR i IN 1 .. v_tables.COUNT LOOP
        BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE ' || v_tables(i) || ' CASCADE CONSTRAINTS PURGE';
            v_dropped := v_dropped + 1;
        EXCEPTION
            WHEN OTHERS THEN
                IF SQLCODE != -942 THEN
                    DBMS_OUTPUT.PUT_LINE('Warning: unable to drop ' || v_tables(i) || ' - ' || SQLERRM);
                END IF;
        END;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('DW tables dropped: ' || v_dropped);
END;
/

-- ============================================================================
-- DIMENSION TABLES
-- ============================================================================

-- 1. DATE_DIMENSION
CREATE TABLE Date_Dim (
    Date_Key              NUMBER(8)      NOT NULL,  -- Format: YYYYMMDD
    Full_Date             DATE           NOT NULL,
    Day_Of_Week           VARCHAR2(9)    NOT NULL,
    Day_Num_Week          NUMBER(2)      NOT NULL,
    Day_Num_Month         NUMBER(2)      NOT NULL,
    Day_Num_Year          NUMBER(3)      NOT NULL,
    Last_Day_Ind          CHAR(1)        NOT NULL,
    Cal_Week_End_Date     DATE           NOT NULL,
    Cal_Week_Year         NUMBER(6)      NOT NULL,
    Cal_Month_Name        VARCHAR2(9)    NOT NULL,
    Cal_Month_Year        VARCHAR2(7)    NOT NULL,
    Cal_Year_Month        VARCHAR2(7)    NOT NULL,
    Cal_Quarter           NUMBER(1)      NOT NULL,
    Cal_Year_Quarter      VARCHAR2(7)    NOT NULL,
    Cal_Year              NUMBER(4)      NOT NULL,
    Holiday_Ind           CHAR(1)        NOT NULL,
    Weekday_Ind           CHAR(1)        NOT NULL,
    Festive_Event         VARCHAR2(50),
    CONSTRAINT PK_Date_Dim PRIMARY KEY (Date_Key),
    CONSTRAINT UQ_Date_Dim_Full_Date UNIQUE (Full_Date),
    CONSTRAINT CK_Date_Dim_Last_Day CHECK (Last_Day_Ind IN ('Y', 'N')),
    CONSTRAINT CK_Date_Dim_Holiday CHECK (Holiday_Ind IN ('Y', 'N')),
    CONSTRAINT CK_Date_Dim_Weekday CHECK (Weekday_Ind IN ('Y', 'N'))
);

CREATE INDEX IDX_Date_Dim_Year ON Date_Dim(Cal_Year);
CREATE INDEX IDX_Date_Dim_Month ON Date_Dim(Cal_Month_Year);
CREATE INDEX IDX_Date_Dim_Quarter ON Date_Dim(Cal_Year_Quarter);

-- 2. BRANCH_DIMENSION
CREATE TABLE Branch_Dim (
    Branch_Key         NUMBER(10)     GENERATED ALWAYS AS IDENTITY NOT NULL,
    Branch_ID          VARCHAR2(10)   NOT NULL,
    Branch_Name        VARCHAR2(100)  NOT NULL,
    Address            VARCHAR2(255)  NOT NULL,
    City               VARCHAR2(80)   NOT NULL,
    State              VARCHAR2(80)   NOT NULL,
    Post_Code          VARCHAR2(5)    NOT NULL,
    Opening_Date       DATE           NOT NULL,
    Closing_Date       DATE,
    Status             VARCHAR2(15)   NOT NULL,
    Effective_From     DATE           DEFAULT SYSDATE NOT NULL,
    Effective_To       DATE,
    Current_Record_Ind CHAR(1)        DEFAULT 'Y' NOT NULL,
    CONSTRAINT PK_Branch_Dim PRIMARY KEY (Branch_Key),
    CONSTRAINT CK_Branch_Dim_Status CHECK (Status IN ('ACTIVE', 'INACTIVE', 'CLOSED')),
    CONSTRAINT CK_Branch_Dim_Current CHECK (Current_Record_Ind IN ('Y', 'N'))
);

CREATE INDEX IDX_Branch_Dim_ID ON Branch_Dim(Branch_ID);
CREATE INDEX IDX_Branch_Dim_State ON Branch_Dim(State);
CREATE INDEX IDX_Branch_Dim_Current ON Branch_Dim(Current_Record_Ind);

-- 3. STAFF_DIMENSION
CREATE TABLE Staff_Dim (
    Staff_Key          NUMBER(10)     GENERATED ALWAYS AS IDENTITY NOT NULL,
    Staff_ID           VARCHAR2(10)   NOT NULL,
    Staff_Name         VARCHAR2(100)  NOT NULL,
    Role               VARCHAR2(20)   NOT NULL,
    Email              VARCHAR2(255)  NOT NULL,
    Phone_No           VARCHAR2(20)   NOT NULL,
    Hire_Date          DATE           NOT NULL,
    Resigned_Date      DATE,
    Branch_Key         NUMBER(10)     NOT NULL,
    Branch_Name        VARCHAR2(100)  NOT NULL,  -- Denormalized for performance
    Effective_From     DATE           DEFAULT SYSDATE NOT NULL,
    Effective_To       DATE,
    Current_Record_Ind CHAR(1)        DEFAULT 'Y' NOT NULL,
    CONSTRAINT PK_Staff_Dim PRIMARY KEY (Staff_Key),
    CONSTRAINT FK_Staff_Dim_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT CK_Staff_Dim_Role CHECK (Role IN ('MANAGER', 'CASHIER', 'STOCK_STAFF', 'ADMIN')),
    CONSTRAINT CK_Staff_Dim_Current CHECK (Current_Record_Ind IN ('Y', 'N'))
);

CREATE INDEX IDX_Staff_Dim_ID ON Staff_Dim(Staff_ID);
CREATE INDEX IDX_Staff_Dim_Branch ON Staff_Dim(Branch_Key);
CREATE INDEX IDX_Staff_Dim_Current ON Staff_Dim(Current_Record_Ind);

-- 4. CUSTOMER_DIMENSION
CREATE TABLE Customer_Dim (
    Customer_Key              NUMBER(10)     GENERATED ALWAYS AS IDENTITY NOT NULL,
    Customer_ID               VARCHAR2(10)   NOT NULL,
    Customer_Name             VARCHAR2(100)  NOT NULL,
    Gender                    VARCHAR2(6)    NOT NULL,
    IC_No                     VARCHAR2(12),
    Phone_No                  VARCHAR2(20),
    Email                     VARCHAR2(255),
    Registered_Date           DATE           NOT NULL,
    Member_ID                 VARCHAR2(10),
    Tier_Name                 VARCHAR2(50),
    Join_Date                 DATE,
    Expiry_Date               DATE,
    Points_Balance            NUMBER(10)     DEFAULT 0,
    Membership_Status         VARCHAR2(15),
    Is_Beneficiary            CHAR(1)        DEFAULT 'N' NOT NULL,
    Beneficiary_Registration_Date DATE,
    MyKasih_Monthly_Limit     NUMBER(12,2),
    MyKasih_Valid_From        DATE,
    MyKasih_Valid_Until       DATE,
    Effective_From            DATE           DEFAULT SYSDATE NOT NULL,
    Effective_To              DATE,
    Current_Record_Ind        CHAR(1)        DEFAULT 'Y' NOT NULL,
    CONSTRAINT PK_Customer_Dim PRIMARY KEY (Customer_Key),
    CONSTRAINT CK_Customer_Dim_Gender CHECK (Gender IN ('MALE', 'FEMALE')),
    CONSTRAINT CK_Customer_Dim_Beneficiary CHECK (Is_Beneficiary IN ('Y', 'N')),
    CONSTRAINT CK_Customer_Dim_Membership_Status CHECK (Membership_Status IN ('ACTIVE', 'EXPIRED', 'SUSPENDED', NULL)),
    CONSTRAINT CK_Customer_Dim_Current CHECK (Current_Record_Ind IN ('Y', 'N'))
);

CREATE INDEX IDX_Customer_Dim_ID ON Customer_Dim(Customer_ID);
CREATE INDEX IDX_Customer_Dim_Member ON Customer_Dim(Member_ID);
CREATE INDEX IDX_Customer_Dim_Tier ON Customer_Dim(Tier_Name);
CREATE INDEX IDX_Customer_Dim_Current ON Customer_Dim(Current_Record_Ind);

-- 5. SUPPLIER_DIMENSION
CREATE TABLE Supplier_Dim (
    Supplier_Key         NUMBER(10)     GENERATED ALWAYS AS IDENTITY NOT NULL,
    Supplier_ID          VARCHAR2(10)   NOT NULL,
    Supplier_Name        VARCHAR2(120)  NOT NULL,
    Phone_No             VARCHAR2(20)   NOT NULL,
    Email                VARCHAR2(255),
    Address              VARCHAR2(255),
    City                 VARCHAR2(80),
    State                VARCHAR2(80),
    Post_Code            VARCHAR2(5),
    Status               VARCHAR2(15)   DEFAULT 'ACTIVE' NOT NULL,
    Effective_From       DATE           DEFAULT SYSDATE NOT NULL,
    Effective_To         DATE,
    Current_Record_Ind   CHAR(1)        DEFAULT 'Y' NOT NULL,
    CONSTRAINT PK_Supplier_Dim PRIMARY KEY (Supplier_Key),
    CONSTRAINT CK_Supplier_Dim_Status CHECK (Status IN ('ACTIVE', 'INACTIVE')),
    CONSTRAINT CK_Supplier_Dim_Current CHECK (Current_Record_Ind IN ('Y', 'N'))
);

CREATE INDEX IDX_Supplier_Dim_ID ON Supplier_Dim(Supplier_ID);
CREATE INDEX IDX_Supplier_Dim_State ON Supplier_Dim(State);
CREATE INDEX IDX_Supplier_Dim_Current ON Supplier_Dim(Current_Record_Ind);

-- 6. PRODUCT_DIMENSION
CREATE TABLE Product_Dim (
    Product_Key           NUMBER(10)     GENERATED ALWAYS AS IDENTITY NOT NULL,
    Item_ID               VARCHAR2(10)   NOT NULL,
    Item_Name             VARCHAR2(150)  NOT NULL,
    Unit_Price            NUMBER(10,2)   NOT NULL,
    Unit_Cost             NUMBER(12,2),  -- For margin calculation
    Unit_Measure          VARCHAR2(20)   NOT NULL,
    Description           VARCHAR2(500),
    Is_Halal              CHAR(1)        DEFAULT 'N' NOT NULL,
    Is_MyKasih_Eligible   CHAR(1)        DEFAULT 'N' NOT NULL,
    Category_ID           VARCHAR2(10)   NOT NULL,
    Category_Name         VARCHAR2(100)  NOT NULL,  -- Denormalized
    Category_Description  VARCHAR2(500),
    Effective_From        DATE           DEFAULT SYSDATE NOT NULL,
    Effective_To          DATE,
    Current_Record_Ind    CHAR(1)        DEFAULT 'Y' NOT NULL,
    CONSTRAINT PK_Product_Dim PRIMARY KEY (Product_Key),
    CONSTRAINT CK_Product_Dim_Unit_Measure CHECK (Unit_Measure IN ('BAG', 'BOTTLE', 'BOX', 'CAN', 'TIN', 'PACK', 'PCS')),
    CONSTRAINT CK_Product_Dim_Halal CHECK (Is_Halal IN ('Y', 'N')),
    CONSTRAINT CK_Product_Dim_MyKasih CHECK (Is_MyKasih_Eligible IN ('Y', 'N')),
    CONSTRAINT CK_Product_Dim_Current CHECK (Current_Record_Ind IN ('Y', 'N'))
);

CREATE INDEX IDX_Product_Dim_ID ON Product_Dim(Item_ID);
CREATE INDEX IDX_Product_Dim_Category ON Product_Dim(Category_ID);
CREATE INDEX IDX_Product_Dim_Halal ON Product_Dim(Is_Halal);
CREATE INDEX IDX_Product_Dim_MyKasih ON Product_Dim(Is_MyKasih_Eligible);
CREATE INDEX IDX_Product_Dim_Current ON Product_Dim(Current_Record_Ind);

-- ============================================================================
-- FACT TABLES
-- ============================================================================

-- 1. SALES_FACT
CREATE TABLE Sales_Fact (
    Sale_Date_Key                NUMBER(8)      NOT NULL,
    Customer_Key                 NUMBER(10)     NOT NULL,
    Branch_Key                   NUMBER(10)     NOT NULL,
    Product_Key                  NUMBER(10)     NOT NULL,
    Staff_Key                    NUMBER(10),    -- HandledBy staff (can be null for online orders)
    Order_ID                     VARCHAR2(10)   NOT NULL,  -- Degenerate dimension
    Delivery_Company_ID          VARCHAR2(10),  -- Degenerate dimension
    Scheduled_Delivery_Date_Key  NUMBER(8),     -- Only for delivery orders
    Delivered_Date_Key           NUMBER(8),     -- Only for delivered orders
    Quantity                     NUMBER(12)     NOT NULL,
    Unit_Price                   NUMBER(12,2)   NOT NULL,
    MyKasih_Subsidy_Amount       NUMBER(14,2)   DEFAULT 0 NOT NULL,
    Line_Total                   NUMBER(14,2)   NOT NULL,
    Delivery_Fee                 NUMBER(12,2)   DEFAULT 0,
    Order_Status                 VARCHAR2(25)   NOT NULL,
    Payment_Method               VARCHAR2(20)   NOT NULL,
    Payment_Status               VARCHAR2(15)   NOT NULL,
    Fulfillment_Type             VARCHAR2(15)   NOT NULL,
    CONSTRAINT FK_Sales_Fact_Date FOREIGN KEY (Sale_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Sales_Fact_Customer FOREIGN KEY (Customer_Key) REFERENCES Customer_Dim(Customer_Key),
    CONSTRAINT FK_Sales_Fact_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Sales_Fact_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Sales_Fact_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key),
    CONSTRAINT FK_Sales_Fact_Sched_Date FOREIGN KEY (Scheduled_Delivery_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Sales_Fact_Delivered_Date FOREIGN KEY (Delivered_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT CK_Sales_Fact_Qty CHECK (Quantity > 0),
    CONSTRAINT CK_Sales_Fact_Price CHECK (Unit_Price >= 0),
    CONSTRAINT CK_Sales_Fact_Subsidy CHECK (MyKasih_Subsidy_Amount >= 0),
    CONSTRAINT CK_Sales_Fact_Total CHECK (Line_Total >= 0),
    CONSTRAINT CK_Sales_Fact_Delivery_Fee CHECK (Delivery_Fee >= 0)
);

-- Composite index for common query patterns
CREATE INDEX IDX_Sales_Fact_Order ON Sales_Fact(Order_ID);
CREATE INDEX IDX_Sales_Fact_Date_Product ON Sales_Fact(Sale_Date_Key, Product_Key);
CREATE INDEX IDX_Sales_Fact_Date_Customer ON Sales_Fact(Sale_Date_Key, Customer_Key);
CREATE INDEX IDX_Sales_Fact_Date_Branch ON Sales_Fact(Sale_Date_Key, Branch_Key);
CREATE INDEX IDX_Sales_Fact_Status ON Sales_Fact(Order_Status);

-- 2. PURCHASES_FACT
CREATE TABLE Purchases_Fact (
    Supplier_Key           NUMBER(10)     NOT NULL,
    Branch_Key             NUMBER(10)     NOT NULL,
    Order_Date_Key         NUMBER(8)      NOT NULL,
    Product_Key            NUMBER(10)     NOT NULL,
    Staff_Key              NUMBER(10)     NOT NULL,
    Purchase_Order_ID      VARCHAR2(10)   NOT NULL,  -- Degenerate dimension
    Received_Date_Key      NUMBER(8),     -- Null if not yet received
    Quantity_Ordered       NUMBER(12)     NOT NULL,
    Quantity_Received      NUMBER(12)     DEFAULT 0 NOT NULL,
    Unit_Cost              NUMBER(12,2)   NOT NULL,
    Line_Total             NUMBER(14,2)   NOT NULL,
    Order_Status           VARCHAR2(25)   NOT NULL,
    CONSTRAINT FK_Purchases_Fact_Supplier FOREIGN KEY (Supplier_Key) REFERENCES Supplier_Dim(Supplier_Key),
    CONSTRAINT FK_Purchases_Fact_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Purchases_Fact_Order_Date FOREIGN KEY (Order_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Purchases_Fact_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Purchases_Fact_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key),
    CONSTRAINT FK_Purchases_Fact_Received_Date FOREIGN KEY (Received_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT CK_Purchases_Fact_Qty_Ordered CHECK (Quantity_Ordered > 0),
    CONSTRAINT CK_Purchases_Fact_Qty_Received CHECK (Quantity_Received >= 0 AND Quantity_Received <= Quantity_Ordered),
    CONSTRAINT CK_Purchases_Fact_Unit_Cost CHECK (Unit_Cost >= 0),
    CONSTRAINT CK_Purchases_Fact_Line_Total CHECK (Line_Total >= 0)
);

CREATE INDEX IDX_Purchases_Fact_PO ON Purchases_Fact(Purchase_Order_ID);
CREATE INDEX IDX_Purchases_Fact_Supplier_Date ON Purchases_Fact(Supplier_Key, Order_Date_Key);
CREATE INDEX IDX_Purchases_Fact_Branch_Date ON Purchases_Fact(Branch_Key, Order_Date_Key);
CREATE INDEX IDX_Purchases_Fact_Status ON Purchases_Fact(Order_Status);

-- 3. INVENTORY_FACT
CREATE TABLE Inventory_Fact (
    Branch_Key           NUMBER(10)     NOT NULL,
    Snapshot_Date_Key    NUMBER(8)      NOT NULL,
    Product_Key          NUMBER(10)     NOT NULL,
    Quantity_On_Hand     NUMBER(12)     DEFAULT 0 NOT NULL,
    Reorder_Level        NUMBER(12)     NOT NULL,
    Reorder_Quantity     NUMBER(12)     NOT NULL,
    CONSTRAINT FK_Inventory_Fact_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Inventory_Fact_Date FOREIGN KEY (Snapshot_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Inventory_Fact_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT CK_Inventory_Fact_Qty CHECK (Quantity_On_Hand >= 0),
    CONSTRAINT CK_Inventory_Fact_Reorder_Lvl CHECK (Reorder_Level > 0),
    CONSTRAINT CK_Inventory_Fact_Reorder_Qty CHECK (Reorder_Quantity > 0)
);

-- Composite primary key
ALTER TABLE Inventory_Fact ADD CONSTRAINT PK_Inventory_Fact 
    PRIMARY KEY (Branch_Key, Snapshot_Date_Key, Product_Key);

CREATE INDEX IDX_Inventory_Fact_Date ON Inventory_Fact(Snapshot_Date_Key);
CREATE INDEX IDX_Inventory_Fact_Product ON Inventory_Fact(Product_Key);

-- 4. RETURNS_FACT
CREATE TABLE Returns_Fact (
    Branch_Key           NUMBER(10)     NOT NULL,
    Request_Date_Key     NUMBER(8)      NOT NULL,
    Customer_Key         NUMBER(10)     NOT NULL,
    Product_Key          NUMBER(10)     NOT NULL,
    Staff_Key            NUMBER(10),    -- Processing staff (can be null if pending)
    Return_ID            VARCHAR2(10)   NOT NULL,  -- Degenerate dimension
    Processed_Date_Key   NUMBER(8),     -- Null if not yet processed
    Return_Reason        VARCHAR2(20)   NOT NULL,
    Quantity_Returned    NUMBER(10)     NOT NULL,
    Resolution_Type      VARCHAR2(15),
    Refund_Amount        NUMBER(14,2)   DEFAULT 0,
    Return_Status        VARCHAR2(15)   NOT NULL,
    Remarks              VARCHAR2(500),
    CONSTRAINT FK_Returns_Fact_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Returns_Fact_Request_Date FOREIGN KEY (Request_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Returns_Fact_Customer FOREIGN KEY (Customer_Key) REFERENCES Customer_Dim(Customer_Key),
    CONSTRAINT FK_Returns_Fact_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Returns_Fact_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key),
    CONSTRAINT FK_Returns_Fact_Processed_Date FOREIGN KEY (Processed_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT CK_Returns_Fact_Reason CHECK (Return_Reason IN ('MISSING', 'BROKEN', 'EXPIRED', 'WRONG_ITEM', 'OTHER')),
    CONSTRAINT CK_Returns_Fact_Qty CHECK (Quantity_Returned > 0),
    CONSTRAINT CK_Returns_Fact_Resolution CHECK (ResolutionType IS NULL OR Resolution_Type IN ('REFUND', 'REPLACE', 'REJECT')),
    CONSTRAINT CK_Returns_Fact_Refund CHECK (Refund_Amount IS NULL OR Refund_Amount >= 0),
    CONSTRAINT CK_Returns_Fact_Status CHECK (Return_Status IN ('PENDING', 'APPROVED', 'REJECTED', 'COMPLETED', 'CANCELLED'))
);

CREATE INDEX IDX_Returns_Fact_Return_ID ON Returns_Fact(Return_ID);
CREATE INDEX IDX_Returns_Fact_Customer_Date ON Returns_Fact(Customer_Key, Request_Date_Key);
CREATE INDEX IDX_Returns_Fact_Product_Date ON Returns_Fact(Product_Key, Request_Date_Key);
CREATE INDEX IDX_Returns_Fact_Status ON Returns_Fact(Return_Status);

-- ============================================================================
-- SUMMARY
-- ============================================================================
DECLARE
    TYPE t_table_list IS TABLE OF VARCHAR2(30);
    v_tables t_table_list := t_table_list(
        'DATE_DIM',
        'BRANCH_DIM',
        'STAFF_DIM',
        'CUSTOMER_DIM',
        'SUPPLIER_DIM',
        'PRODUCT_DIM',
        'SALES_FACT',
        'PURCHASES_FACT',
        'INVENTORY_FACT',
        'RETURNS_FACT'
    );
    v_exists  NUMBER;
    v_success NUMBER := 0;
    v_failed  NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('============================================================');
    DBMS_OUTPUT.PUT_LINE('DATA WAREHOUSE TABLE CREATION SUMMARY');
    DBMS_OUTPUT.PUT_LINE('============================================================');
    FOR i IN 1 .. v_tables.COUNT LOOP
        SELECT COUNT(*)
        INTO v_exists
        FROM user_tables
        WHERE table_name = v_tables(i);
        IF v_exists = 1 THEN
            v_success := v_success + 1;
        ELSE
            v_failed := v_failed + 1;
            DBMS_OUTPUT.PUT_LINE('FAILED: ' || v_tables(i));
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Dimension tables created: 6');
    DBMS_OUTPUT.PUT_LINE('Fact tables created: 4');
    DBMS_OUTPUT.PUT_LINE('Total tables created successfully: ' || v_success);
    DBMS_OUTPUT.PUT_LINE('Tables failed: ' || v_failed);
    IF v_failed = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Status: SUCCESS - All 10 DW tables were created.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Status: FAILED - Review the ORA- errors above.');
    END IF;
    DBMS_OUTPUT.PUT_LINE('============================================================');
END;
/