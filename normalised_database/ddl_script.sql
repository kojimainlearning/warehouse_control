SET DEFINE OFF
SET SQLBLANKLINES ON
SET ECHO OFF
SET SERVEROUTPUT ON
WHENEVER SQLERROR CONTINUE NONE
WHENEVER OSERROR CONTINUE NONE

BEGIN
    DBMS_OUTPUT.PUT_LINE('======================================');
    DBMS_OUTPUT.PUT_LINE('Dropping old tables and creating fresh tables...');
    DBMS_OUTPUT.PUT_LINE('======================================');
END;
/

DECLARE
    TYPE t_table_list IS TABLE OF VARCHAR2(30);
    v_tables t_table_list := t_table_list(
        'POINT_TRANSACTIONS',
        'FEEDBACKS',
        'RETURN_REQUESTS',
        'DELIVERIES',
        'ORDERED_ITEMS',
        'ORDERS',
        'PURCHASE_ORDER_ITEMS',
        'PURCHASE_ORDERS',
        'STOCKS',
        'ITEMS',
        'STAFFS',
        'MYKASIH_BENEFICIARIES',
        'MEMBER_PROFILES',
        'DELIVERY_COMPANIES',
        'VOUCHERS',
        'SUPPLIERS',
        'PRODUCT_CATEGORIES',
        'BRANCHES',
        'MEMBER_TIERS',
        'CUSTOMERS'
    );
    v_dropped NUMBER := 0;
BEGIN
    FOR i IN 1 .. v_tables.COUNT LOOP
        BEGIN
            EXECUTE IMMEDIATE
                'DROP TABLE ' || v_tables(i) || ' CASCADE CONSTRAINTS PURGE';
            v_dropped := v_dropped + 1;
        EXCEPTION
            WHEN OTHERS THEN
                IF SQLCODE != -942 THEN
                    DBMS_OUTPUT.PUT_LINE(
                        'Warning: unable to drop ' || v_tables(i) ||
                        ' - ' || SQLERRM
                    );
                END IF;
        END;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Previous project tables dropped: ' || v_dropped);
    DBMS_OUTPUT.PUT_LINE('Creating project tables...');
    DBMS_OUTPUT.PUT_LINE('');
END;
/


CREATE TABLE Customers (
    CustomerID      VARCHAR2(10)                         NOT NULL,
    CustomerName    VARCHAR2(100)                        NOT NULL,
    Gender          VARCHAR2(6)                          NOT NULL,
    ICNo            VARCHAR2(12),
    PhoneNo         VARCHAR2(20),
    Email           VARCHAR2(255),
    RegisteredDate  DATE            DEFAULT SYSDATE      NOT NULL,
    CONSTRAINT PK_Customers
        PRIMARY KEY (CustomerID),
    CONSTRAINT UQ_Customers_ICNo
        UNIQUE (ICNo),
    CONSTRAINT UQ_Customers_Email
        UNIQUE (Email),
    CONSTRAINT CK_Customers_Gender
        CHECK (Gender IN ('MALE', 'FEMALE')),
    CONSTRAINT CK_Customers_ICNo_Gender
        CHECK (
            ICNo IS NULL
            OR (
                REGEXP_LIKE(ICNo, '^[0-9]{12}$')
                AND (
                    (Gender = 'MALE'
                     AND SUBSTR(ICNo, -1) IN ('1', '3', '5', '7', '9'))
                    OR
                    (Gender = 'FEMALE'
                     AND SUBSTR(ICNo, -1) IN ('0', '2', '4', '6', '8'))
                )
            )
        ),
    CONSTRAINT CK_Customers_Phone
        CHECK (
            PhoneNo IS NULL
            OR REGEXP_LIKE(PhoneNo, '^[+]60[0-9]{8,10}$')
        ),
    CONSTRAINT CK_Customers_Email
        CHECK (
            Email IS NULL
            OR REGEXP_LIKE(
                Email,
                '^[A-Z0-9._%+-]+@[A-Z0-9.-]+[.][A-Z]{2,}$',
                'i'
            )
        )
);



CREATE TABLE Member_Tiers (
    TierID       VARCHAR2(10)                        NOT NULL,
    TierName     VARCHAR2(50)                        NOT NULL,
    AnnualFee    NUMBER(8,2)    DEFAULT 0            NOT NULL,
    PointRate    NUMBER(6,2)    DEFAULT 0            NOT NULL,
    CONSTRAINT PK_Member_Tiers
        PRIMARY KEY (TierID),
    CONSTRAINT UQ_Member_Tiers_Name
        UNIQUE (TierName),
    CONSTRAINT CK_Member_Tiers_Fee
        CHECK (AnnualFee >= 0),
    CONSTRAINT CK_Member_Tiers_Rate
        CHECK (PointRate >= 0)
);


CREATE TABLE Branches (
    BranchID       VARCHAR2(10)                        NOT NULL,
    BranchName     VARCHAR2(100)                       NOT NULL,
    Address        VARCHAR2(255)                       NOT NULL,
    City           VARCHAR2(80)                        NOT NULL,
    State          VARCHAR2(80)                        NOT NULL,
    PostCode       VARCHAR2(5)                         NOT NULL,
    OpeningDate    DATE                                NOT NULL,
    ClosingDate   DATE,
    CONSTRAINT PK_Branches
        PRIMARY KEY (BranchID),
    CONSTRAINT CK_Branches_PostCode
        CHECK (REGEXP_LIKE(PostCode, '^[0-9]{5}$')),
    CONSTRAINT CK_Branches_ClosingDate
        CHECK (ClosingDate >= OpeningDate)
);


CREATE TABLE Product_Categories (
    CategoryID     VARCHAR2(10)                        NOT NULL,
    CategoryName   VARCHAR2(100)                       NOT NULL,
    Description    VARCHAR2(500),
    CONSTRAINT PK_Product_Categories
        PRIMARY KEY (CategoryID),
    CONSTRAINT UQ_Product_Cat_Name
        UNIQUE (CategoryName)
);


CREATE TABLE Suppliers (
    SupplierID     VARCHAR2(10)                        NOT NULL,
    SupplierName   VARCHAR2(120)                       NOT NULL,
    PhoneNo        VARCHAR2(20)                        NOT NULL,
    Email          VARCHAR2(255),
    Address        VARCHAR2(255),
    City           VARCHAR2(80),
    State          VARCHAR2(80),
    PostCode       VARCHAR2(5),
    Status         VARCHAR2(15)   DEFAULT 'ACTIVE'     NOT NULL,
    CONSTRAINT PK_Suppliers
        PRIMARY KEY (SupplierID),
    CONSTRAINT CK_Suppliers_Phone
        CHECK (REGEXP_LIKE(PhoneNo, '^[+]60[0-9]{8,10}$')),
    CONSTRAINT CK_Suppliers_Email
        CHECK (
            Email IS NULL
            OR REGEXP_LIKE(
                Email,
                '^[A-Z0-9._%+-]+@[A-Z0-9.-]+[.][A-Z]{2,}$',
                'i'
            )
        ),
    CONSTRAINT CK_Suppliers_PostCode
        CHECK (
            PostCode IS NULL
            OR REGEXP_LIKE(PostCode, '^[0-9]{5}$')
        ),
    CONSTRAINT CK_Suppliers_Status
        CHECK (Status IN ('ACTIVE', 'INACTIVE'))
);


CREATE TABLE Vouchers (
    VoucherID        VARCHAR2(10)                         NOT NULL,
    VoucherName      VARCHAR2(100)                        NOT NULL,
    VoucherType      VARCHAR2(20)                         NOT NULL,
    PointsRequired   NUMBER(10)       DEFAULT 0           NOT NULL,
    DiscountAmount   NUMBER(12,2)     DEFAULT 0           NOT NULL,
    MinSpendAmount   NUMBER(12,2)     DEFAULT 0           NOT NULL,
    StartDate        DATE                                 NOT NULL,
    EndDate          DATE                                 NOT NULL,
    Status           VARCHAR2(15)     DEFAULT 'ACTIVE'    NOT NULL,
    CONSTRAINT PK_Vouchers
        PRIMARY KEY (VoucherID),
    CONSTRAINT CK_Vouchers_Type
        CHECK (VoucherType IN ('DISCOUNT', 'FREE_DELIVERY')),
    CONSTRAINT CK_Vouchers_Points
        CHECK (PointsRequired >= 0),
    CONSTRAINT CK_Vouchers_Discount
        CHECK (DiscountAmount >= 0),
    CONSTRAINT CK_Vouchers_MinSpend
        CHECK (MinSpendAmount >= 0),
    CONSTRAINT CK_Vouchers_Dates
        CHECK (EndDate >= StartDate),
    CONSTRAINT CK_Vouchers_Status
        CHECK (Status IN ('ACTIVE', 'INACTIVE', 'EXPIRED'))
);


CREATE TABLE Delivery_Companies (
    DeliveryCompanyID   VARCHAR2(10)                        NOT NULL,
    CompanyName         VARCHAR2(120)                       NOT NULL,
    PhoneNo             VARCHAR2(20)                        NOT NULL,
    Email               VARCHAR2(255),
    Status              VARCHAR2(15)   DEFAULT 'ACTIVE'     NOT NULL,
    CONSTRAINT PK_Delivery_Companies
        PRIMARY KEY (DeliveryCompanyID),
    CONSTRAINT CK_Delivery_Co_Phone
        CHECK (REGEXP_LIKE(PhoneNo, '^[+]60[0-9]{8,10}$')),
    CONSTRAINT CK_Delivery_Co_Email
        CHECK (
            Email IS NULL
            OR REGEXP_LIKE(
                Email,
                '^[A-Z0-9._%+-]+@[A-Z0-9.-]+[.][A-Z]{2,}$',
                'i'
            )
        ),
    CONSTRAINT CK_Delivery_Co_Status
        CHECK (Status IN ('ACTIVE', 'INACTIVE'))
);


-- ============================================================================
-- 2. CUSTOMER MEMBERSHIP AND MYKASIH TABLES
-- ============================================================================

CREATE TABLE Member_Profiles (
    MemberID      VARCHAR2(10)                         NOT NULL,
    JoinDate      DATE                                 NOT NULL,
    ExpiryDate    DATE                                 NOT NULL,
    PointsBalance NUMBER(10)      DEFAULT 0            NOT NULL,
    Status        VARCHAR2(15)    DEFAULT 'ACTIVE'     NOT NULL,
    CustomerID    VARCHAR2(10)                         NOT NULL,
    TierID        VARCHAR2(10)                         NOT NULL,
    CONSTRAINT PK_Member_Profiles
        PRIMARY KEY (MemberID),
    CONSTRAINT UQ_Member_Profile_Cust
        UNIQUE (CustomerID),
    CONSTRAINT CK_Member_Profile_Dates
        CHECK (ExpiryDate >= JoinDate),
    CONSTRAINT CK_Member_Profile_Points
        CHECK (PointsBalance >= 0),
    CONSTRAINT CK_Member_Profile_Status
        CHECK (Status IN ('ACTIVE', 'EXPIRED')),
    CONSTRAINT FK_Member_Profile_Cust
        FOREIGN KEY (CustomerID)
        REFERENCES Customers (CustomerID),
    CONSTRAINT FK_Member_Profile_Tier
        FOREIGN KEY (TierID)
        REFERENCES Member_Tiers (TierID)
);


CREATE TABLE Mykasih_Beneficiaries (
    MyKasihID           VARCHAR2(10)                          NOT NULL,
    MonthlyLimitAmount  NUMBER(12,2)    DEFAULT 100           NOT NULL,
    AmountUsed          NUMBER(12,2)    DEFAULT 0             NOT NULL,
    ValidFrom           DATE                                  NOT NULL,
    ValidUntil          DATE                                  NOT NULL,
    CustomerID          VARCHAR2(10)                          NOT NULL,
    CONSTRAINT PK_Mykasih_Beneficiaries
        PRIMARY KEY (MyKasihID),
    CONSTRAINT UQ_Mykasih_Customer
        UNIQUE (CustomerID),
    CONSTRAINT CK_Mykasih_Limit
        CHECK (MonthlyLimitAmount >= 0),
    CONSTRAINT CK_Mykasih_Used
        CHECK (
            AmountUsed >= 0
            AND AmountUsed <= MonthlyLimitAmount
        ),
    CONSTRAINT CK_Mykasih_Dates
        CHECK (ValidUntil >= ValidFrom),
    CONSTRAINT FK_Mykasih_Customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers (CustomerID)
);


-- ============================================================================
-- 3. BRANCH, STAFF, ITEM, AND STOCK TABLES
-- ============================================================================

CREATE TABLE Staffs (
    StaffID       VARCHAR2(10)                        NOT NULL,
    StaffName     VARCHAR2(100)                       NOT NULL,
    Role          VARCHAR2(20)                        NOT NULL,
    Email         VARCHAR2(255)                       NOT NULL,
    PhoneNo       VARCHAR2(20)                        NOT NULL,
    HireDate      DATE                                NOT NULL,
    ResignedDate  DATE,
    BranchID      VARCHAR2(10)                        NOT NULL,
    CONSTRAINT PK_Staffs
        PRIMARY KEY (StaffID),
    CONSTRAINT UQ_Staffs_Email
        UNIQUE (Email),
    CONSTRAINT CK_Staffs_Role
        CHECK (Role IN ('MANAGER', 'CASHIER', 'STOCK_STAFF', 'ADMIN')),
    CONSTRAINT CK_Staffs_Email
        CHECK (
            REGEXP_LIKE(
                Email,
                '^[A-Z0-9._%+-]+@[A-Z0-9.-]+[.][A-Z]{2,}$',
                'i'
            )
        ),
    CONSTRAINT CK_Staffs_Phone
        CHECK (REGEXP_LIKE(PhoneNo, '^[+]60[0-9]{8,10}$')),
    CONSTRAINT CK_Staffs_ResignedDate
        CHECK (ResignedDate >= HireDate),
    CONSTRAINT FK_Staffs_Branch
        FOREIGN KEY (BranchID)
        REFERENCES Branches (BranchID)
);


CREATE TABLE Items (
    ItemID              VARCHAR2(10)                         NOT NULL,
    ItemName            VARCHAR2(150)                        NOT NULL,
    UnitPrice           NUMBER(10,2)                         NOT NULL,
    UnitMeasure         VARCHAR2(20)                         NOT NULL,
    Description         VARCHAR2(500),
    IsHalal             CHAR(1)         DEFAULT 'N'          NOT NULL,
    IsMyKasihEligible   CHAR(1)         DEFAULT 'N'          NOT NULL,
    CategoryID          VARCHAR2(10)                          NOT NULL,
    CONSTRAINT PK_Items
        PRIMARY KEY (ItemID),
    CONSTRAINT CK_Items_UnitPrice
        CHECK (UnitPrice >= 0),
    CONSTRAINT CK_Items_UnitMeasure
        CHECK (UnitMeasure IN ('BAG', 'BOTTLE', 'BOX', 'CAN', 'TIN', 'PACK', 'PCS')),
    CONSTRAINT CK_Items_IsHalal
        CHECK (IsHalal IN ('Y', 'N')),
    CONSTRAINT CK_Items_IsMyKasih
        CHECK (IsMyKasihEligible IN ('Y', 'N')),
    CONSTRAINT FK_Items_Category
        FOREIGN KEY (CategoryID)
        REFERENCES Product_Categories (CategoryID)
);


CREATE TABLE Stocks (
    BranchID         VARCHAR2(10)                       NOT NULL,
    ItemID           VARCHAR2(10)                       NOT NULL,
    QuantityOnHand   NUMBER(12)   DEFAULT 0             NOT NULL,
    ReorderLevel     NUMBER(12)   		                NOT NULL,
    ReorderQuantity  NUMBER(12)    		                NOT NULL,
    CONSTRAINT PK_Stocks
        PRIMARY KEY (BranchID, ItemID),
    CONSTRAINT CK_Stocks_QtyOnHand
        CHECK (QuantityOnHand >= 0),
    CONSTRAINT CK_Stocks_ReorderLvl
        CHECK (ReorderLevel > 0),
    CONSTRAINT CK_Stocks_ReorderQty
        CHECK (ReorderQuantity > 0),
    CONSTRAINT FK_Stocks_Branch
        FOREIGN KEY (BranchID)
        REFERENCES Branches (BranchID),
    CONSTRAINT FK_Stocks_Item
        FOREIGN KEY (ItemID)
        REFERENCES Items (ItemID)
);


-- ============================================================================
-- 4. PURCHASE ORDER TABLES
-- ============================================================================

CREATE TABLE Purchase_Orders (
    PurchaseOrderID       VARCHAR2(10)                       NOT NULL,
    OrderDate             DATE           DEFAULT SYSDATE     NOT NULL,
    ExpectedDeliveryDate  DATE,
    ReceivedDate          DATE,
    TotalAmount           NUMBER(14,2)   DEFAULT 0           NOT NULL,
    Status                VARCHAR2(25)   DEFAULT 'PENDING'   NOT NULL,
    SupplierID            VARCHAR2(10)                       NOT NULL,
    StaffID               VARCHAR2(10)                       NOT NULL,
    CONSTRAINT PK_Purchase_Orders
        PRIMARY KEY (PurchaseOrderID),
    CONSTRAINT CK_Purchase_Order_Total
        CHECK (TotalAmount >= 0),
    CONSTRAINT CK_Purchase_Order_Status
        CHECK (
            Status IN (
                'PENDING',
                'APPROVED',
                'RECEIVED',
                'CANCELLED'
            )
        ),
    CONSTRAINT CK_PO_Expected_Date
        CHECK (
            ExpectedDeliveryDate IS NULL
            OR ExpectedDeliveryDate >= OrderDate
        ),
    CONSTRAINT CK_PO_Received_Date
        CHECK (
            ReceivedDate IS NULL
            OR ReceivedDate >= OrderDate
        ),
    CONSTRAINT FK_Purchase_Order_Supp
        FOREIGN KEY (SupplierID)
        REFERENCES Suppliers (SupplierID),
    CONSTRAINT FK_Purchase_Order_Staff
        FOREIGN KEY (StaffID)
        REFERENCES Staffs (StaffID)
);


CREATE TABLE Purchase_Order_Items (
    PurchaseOrderID   VARCHAR2(10)                       NOT NULL,
    ItemID            VARCHAR2(10)                       NOT NULL,
    QuantityOrdered   NUMBER(12)                         NOT NULL,
    QuantityReceived  NUMBER(12)   DEFAULT 0             NOT NULL,
    UnitCost          NUMBER(12,2)                       NOT NULL,
    LineTotal         NUMBER(14,2)                       NOT NULL,
    CONSTRAINT PK_Purchase_Order_Items
        PRIMARY KEY (PurchaseOrderID, ItemID),
    CONSTRAINT CK_PO_Items_QtyOrdered
        CHECK (QuantityOrdered > 0),
    CONSTRAINT CK_PO_Items_QtyReceived
        CHECK (
            QuantityReceived >= 0
            AND QuantityReceived <= QuantityOrdered
        ),
    CONSTRAINT CK_PO_Items_UnitCost
        CHECK (UnitCost >= 0),
    CONSTRAINT CK_PO_Items_LineTotal
        CHECK (LineTotal = QuantityOrdered * UnitCost),
    CONSTRAINT FK_PO_Items_Order
        FOREIGN KEY (PurchaseOrderID)
        REFERENCES Purchase_Orders (PurchaseOrderID),
    CONSTRAINT FK_PO_Items_Item
        FOREIGN KEY (ItemID)
        REFERENCES Items (ItemID)
);


-- ============================================================================
-- 5. SALES ORDER TABLES
-- ============================================================================

CREATE TABLE Orders (
    OrderID                   VARCHAR2(10)                         NOT NULL,
    ContactName               VARCHAR2(100),
    ContactPhone              VARCHAR2(20),
    ContactEmail              VARCHAR2(255),
    FulfillmentType           VARCHAR2(15)                         NOT NULL,
    OrderDateTime             TIMESTAMP       DEFAULT SYSTIMESTAMP NOT NULL,
    OrderStatus               VARCHAR2(25)    DEFAULT 'UNPAID'     NOT NULL,
    SubtotalAmount            NUMBER(14,2)    DEFAULT 0            NOT NULL,
    VoucherDiscountAmount     NUMBER(14,2)    DEFAULT 0            NOT NULL,
    MyKasihSubsidyTotal       NUMBER(14,2)    DEFAULT 0            NOT NULL,
    GrandTotal                NUMBER(14,2)    DEFAULT 0            NOT NULL,
    PaymentMethod             VARCHAR2(20)                         NOT NULL,
    PaymentStatus             VARCHAR2(15)    DEFAULT 'PENDING'    NOT NULL,
    PaymentDateTime           TIMESTAMP,
    CustomerID                VARCHAR2(10),
    BranchID                  VARCHAR2(10)                         NOT NULL,
    VoucherID                 VARCHAR2(10),
    StaffID                   VARCHAR2(10),
    CONSTRAINT PK_Orders
        PRIMARY KEY (OrderID),
    CONSTRAINT CK_Orders_ContactPhone
        CHECK (
            ContactPhone IS NULL
            OR REGEXP_LIKE(ContactPhone, '^[+]60[0-9]{8,10}$')
        ),
    CONSTRAINT CK_Orders_ContactEmail
        CHECK (
            ContactEmail IS NULL
            OR REGEXP_LIKE(
                ContactEmail,
                '^[A-Z0-9._%+-]+@[A-Z0-9.-]+[.][A-Z]{2,}$',
                'i'
            )
        ),
    CONSTRAINT CK_Orders_Fulfillment
        CHECK (FulfillmentType IN ('WALK_IN', 'PICKUP', 'DELIVERY')),
    CONSTRAINT CK_Orders_Status
        CHECK (
            OrderStatus IN (
                'UNPAID',
                'IN_PROGRESS',
                'READY_FOR_PICKUP',
                'OUT_FOR_DELIVERY',
                'COMPLETED',
                'CANCELLED'
            )
        ),
    CONSTRAINT CK_Orders_Subtotal
        CHECK (SubtotalAmount >= 0),
    CONSTRAINT CK_Orders_VoucherDisc
        CHECK (VoucherDiscountAmount >= 0),
    CONSTRAINT CK_Orders_Mykasih
        CHECK (
            MyKasihSubsidyTotal >= 0
            AND MyKasihSubsidyTotal <= SubtotalAmount
        ),
    CONSTRAINT CK_Orders_GrandTotal
        CHECK (GrandTotal >= 0),
    CONSTRAINT CK_Orders_PaymentMethod
        CHECK (
            PaymentMethod IN (
                'CASH',
                'CARD',
                'E_WALLET',
                'ONLINE_BANKING',
                'MYKASIH'
            )
        ),
    CONSTRAINT CK_Orders_PaymentStatus
        CHECK (
            PaymentStatus IN ('PENDING', 'PAID', 'FAILED', 'REFUNDED')
        ),
    /*
      A guest walk-in order may remain anonymous.
      A guest pickup or delivery order must provide contact information.
    */
    CONSTRAINT CK_Orders_Guest_Contact
        CHECK (
            CustomerID IS NOT NULL
            OR FulfillmentType = 'WALK_IN'
            OR (
                ContactName IS NOT NULL
                AND ContactPhone IS NOT NULL
                AND ContactEmail IS NOT NULL
            )
        ),
    /*
      Guest orders cannot use a voucher or MyKasih subsidy.
    */
    CONSTRAINT CK_Orders_Guest_Benefit
        CHECK (
            CustomerID IS NOT NULL
            OR (
                VoucherID IS NULL
                AND MyKasihSubsidyTotal = 0
            )
        ),
    CONSTRAINT CK_Orders_Payment_Date
        CHECK (
            PaymentStatus <> 'PAID'
            OR PaymentDateTime IS NOT NULL
        ),
    CONSTRAINT CK_Orders_Customer_Contact
        CHECK (
            (
                CustomerID IS NOT NULL
                AND ContactName IS NULL
                AND ContactPhone IS NULL
                AND ContactEmail IS NULL
            )
            OR
            (
                CustomerID IS NULL
                AND ContactName IS NOT NULL
                AND ContactPhone IS NOT NULL
                AND ContactEmail IS NOT NULL
            )
        ),

    CONSTRAINT FK_Orders_Customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers (CustomerID),
    CONSTRAINT FK_Orders_Branch
        FOREIGN KEY (BranchID)
        REFERENCES Branches (BranchID),
    CONSTRAINT FK_Orders_Voucher
        FOREIGN KEY (VoucherID)
        REFERENCES Vouchers (VoucherID),
    CONSTRAINT FK_Orders_Staff
        FOREIGN KEY (StaffID)
        REFERENCES Staffs (StaffID)
);


CREATE TABLE Ordered_Items (
    OrderID                  VARCHAR2(10)                       NOT NULL,
    ItemID                   VARCHAR2(10)                       NOT NULL,
    Quantity                 NUMBER(12)                         NOT NULL,
    UnitPrice                NUMBER(12,2)                       NOT NULL,
    MyKasihSubsidyAmount     NUMBER(14,2)   DEFAULT 0           NOT NULL,
    LineTotal                NUMBER(14,2)                       NOT NULL,
    CONSTRAINT PK_Ordered_Items
        PRIMARY KEY (OrderID, ItemID),
    CONSTRAINT CK_Ordered_Items_Qty
        CHECK (Quantity > 0),
    CONSTRAINT CK_Ordered_Items_Price
        CHECK (UnitPrice >= 0),
    CONSTRAINT CK_Ordered_Items_Subsidy
        CHECK (
            MyKasihSubsidyAmount >= 0
            AND MyKasihSubsidyAmount <= Quantity * UnitPrice
        ),
    CONSTRAINT CK_Ordered_Items_Total
        CHECK (
            LineTotal =
                (Quantity * UnitPrice) - MyKasihSubsidyAmount
        ),
    CONSTRAINT FK_Ordered_Items_Order
        FOREIGN KEY (OrderID)
        REFERENCES Orders (OrderID),
    CONSTRAINT FK_Ordered_Items_Item
        FOREIGN KEY (ItemID)
        REFERENCES Items (ItemID)
);


-- ============================================================================
-- 6. DELIVERY TABLES
-- ============================================================================

CREATE TABLE Deliveries (
    DeliveryID                VARCHAR2(10)                         NOT NULL,
    DeliveryAddress           VARCHAR2(255)                        NOT NULL,
    City                      VARCHAR2(80)                         NOT NULL,
    State                     VARCHAR2(80)                         NOT NULL,
    PostCode                  NUMBER(5)                            NOT NULL,
    TrackingNo                VARCHAR2(100),
    DeliveryFee               NUMBER(12,2)    DEFAULT 0            NOT NULL,
    ScheduledDeliveryDate     DATE                                 NOT NULL,
    DeliveredDateTime         TIMESTAMP,
    Status                    VARCHAR2(20)    DEFAULT 'PENDING'    NOT NULL,
    OrderID                   VARCHAR2(10)                         NOT NULL,
    DeliveryCompanyID         VARCHAR2(10)                         NOT NULL,
    CONSTRAINT PK_Deliveries
        PRIMARY KEY (DeliveryID),
    CONSTRAINT UQ_Deliveries_Tracking
        UNIQUE (TrackingNo),
    CONSTRAINT UQ_Deliveries_Order
        UNIQUE (OrderID),
    CONSTRAINT CK_Deliveries_PostCode
        CHECK (REGEXP_LIKE(PostCode, '^[0-9]{5}$')),
    CONSTRAINT CK_Deliveries_Fee
        CHECK (DeliveryFee >= 0),
    CONSTRAINT CK_Deliveries_Status
        CHECK (
            Status IN ('PENDING', 'PICKED_UP', 'DELIVERED', 'FAILED')
        ),
    CONSTRAINT CK_Deliveries_Completed
        CHECK (
            Status <> 'DELIVERED'
            OR DeliveredDateTime IS NOT NULL
        ),
    CONSTRAINT FK_Deliveries_Order
        FOREIGN KEY (OrderID)
        REFERENCES Orders (OrderID),
    CONSTRAINT FK_Deliveries_Company
        FOREIGN KEY (DeliveryCompanyID)
        REFERENCES Delivery_Companies (DeliveryCompanyID)
);


-- ============================================================================
-- 7. RETURN, FEEDBACK, AND POINT TABLES
-- ============================================================================

CREATE TABLE Return_Requests (
    ReturnID          VARCHAR2(10)                        NOT NULL,
    RequestDate       DATE           DEFAULT SYSDATE     NOT NULL,
    ReturnReason      VARCHAR2(20)                        NOT NULL,
    QuantityReturned  NUMBER(10)                       NOT NULL,
    ResolutionType    VARCHAR2(15),
    RefundAmount      NUMBER(14,2)    DEFAULT 0,
    ProcessedDate     DATE,
    Remarks           VARCHAR2(500),
    Status            VARCHAR2(15)    DEFAULT 'PENDING'  NOT NULL,
    OrderID           VARCHAR2(10)                        NOT NULL,
    ItemID            VARCHAR2(10)                        NOT NULL,
    StaffID           VARCHAR2(10),
    CONSTRAINT PK_Return_Requests
        PRIMARY KEY (ReturnID),
    CONSTRAINT CK_Return_Reason
        CHECK (
            ReturnReason IN (
                'MISSING',
                'BROKEN',
                'EXPIRED',
                'WRONG_ITEM',
                'OTHER'
            )
        ),
    CONSTRAINT CK_Return_Quantity
        CHECK (QuantityReturned > 0),
    CONSTRAINT CK_Return_Resolution
        CHECK (
            ResolutionType IS NULL
            OR ResolutionType IN ('REFUND', 'REPLACE', 'REJECT')
        ),
    CONSTRAINT CK_Return_Refund
        CHECK (
            RefundAmount IS NULL
            OR RefundAmount >= 0
        ),
    CONSTRAINT CK_Return_Status
        CHECK (
            Status IN (
                'PENDING',
                'APPROVED',
                'REJECTED',
                'COMPLETED',
                'CANCELLED'
            )
        ),
    CONSTRAINT CK_Return_ProcessDate
        CHECK (
            ProcessedDate IS NULL
            OR ProcessedDate >= RequestDate
        ),
    CONSTRAINT CK_Return_Processing
        CHECK (
            Status = 'PENDING'
            OR (
                ResolutionType IS NOT NULL
                AND ProcessedDate IS NOT NULL
                AND StaffID IS NOT NULL
            )
        ),
    CONSTRAINT FK_Return_Ordered_Item
        FOREIGN KEY (OrderID, ItemID)
        REFERENCES Ordered_Items (OrderID, ItemID),
    CONSTRAINT FK_Return_Staff
        FOREIGN KEY (StaffID)
        REFERENCES Staffs (StaffID)
);


CREATE TABLE Feedbacks (
    FeedbackID      VARCHAR2(10)                         NOT NULL,
    FeedbackType    VARCHAR2(20)                         NOT NULL,
    Subject         VARCHAR2(150)                        NOT NULL,
    Message         VARCHAR2(1000)                       NOT NULL,
    RatingScore     NUMBER(1),
    CreatedAt       TIMESTAMP       DEFAULT SYSTIMESTAMP NOT NULL,
    OrderID         VARCHAR2(10),
    DeliveryID      VARCHAR2(10),
    CONSTRAINT PK_Feedbacks
        PRIMARY KEY (FeedbackID),
    CONSTRAINT CK_Feedbacks_Type
        CHECK (
            FeedbackType IN ('ITEM_QUALITY', 'DELIVERY_SERVICE')
        ),
    CONSTRAINT CK_Feedbacks_Rating
        CHECK (
            RatingScore IS NULL
            OR RatingScore BETWEEN 1 AND 5
        ),
    /*
      Item-quality feedback requires an order.
      Delivery-service feedback requires a delivery.
    */
    CONSTRAINT CK_Feedbacks_Reference
        CHECK (
            (
                FeedbackType = 'ITEM_QUALITY'
                AND OrderID IS NOT NULL
            )
            OR
            (
                FeedbackType = 'DELIVERY_SERVICE'
                AND DeliveryID IS NOT NULL
            )
        ),
    CONSTRAINT FK_Feedbacks_Order
        FOREIGN KEY (OrderID)
        REFERENCES Orders (OrderID),
    CONSTRAINT FK_Feedbacks_Delivery
        FOREIGN KEY (DeliveryID)
        REFERENCES Deliveries (DeliveryID)
);


CREATE TABLE Point_Transactions (
    PointTransactionID   VARCHAR2(10)                        NOT NULL,
    TransactionType      VARCHAR2(15)                        NOT NULL,
    Points               NUMBER(10)                          NOT NULL,
    TransactionDate      DATE            DEFAULT SYSDATE     NOT NULL,
    Remarks              VARCHAR2(500),
    MemberID             VARCHAR2(10)                        NOT NULL,
    OrderID              VARCHAR2(10),
    VoucherID            VARCHAR2(10),
    CONSTRAINT PK_Point_Transactions
        PRIMARY KEY (PointTransactionID),
    CONSTRAINT CK_Point_Trans_Type
        CHECK (
            TransactionType IN ('EARN', 'REDEEM', 'REFUND', 'ADJUST', 'EXPIRED')
        ),
    CONSTRAINT CK_Point_Trans_Points
        CHECK (Points <> 0),
    CONSTRAINT FK_Point_Trans_Member
        FOREIGN KEY (MemberID)
        REFERENCES Member_Profiles (MemberID),
    CONSTRAINT FK_Point_Trans_Order
        FOREIGN KEY (OrderID)
        REFERENCES Orders (OrderID),
    CONSTRAINT FK_Point_Trans_Voucher
        FOREIGN KEY (VoucherID)
        REFERENCES Vouchers (VoucherID)
);

DECLARE
    TYPE t_table_list IS TABLE OF VARCHAR2(30);
    v_tables t_table_list := t_table_list(
        'CUSTOMERS',
        'MEMBER_TIERS',
        'BRANCHES',
        'PRODUCT_CATEGORIES',
        'SUPPLIERS',
        'VOUCHERS',
        'DELIVERY_COMPANIES',
        'MEMBER_PROFILES',
        'MYKASIH_BENEFICIARIES',
        'STAFFS',
        'ITEMS',
        'STOCKS',
        'PURCHASE_ORDERS',
        'PURCHASE_ORDER_ITEMS',
        'ORDERS',
        'ORDERED_ITEMS',
        'DELIVERIES',
        'RETURN_REQUESTS',
        'FEEDBACKS',
        'POINT_TRANSACTIONS'
    );
    v_exists  NUMBER;
    v_success NUMBER := 0;
    v_failed  NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('============================================================');
    DBMS_OUTPUT.PUT_LINE('TABLE CREATION SUMMARY');
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
    DBMS_OUTPUT.PUT_LINE('Tables created successfully: ' || v_success);
    DBMS_OUTPUT.PUT_LINE('Tables failed:               ' || v_failed);

    IF v_failed = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Status: SUCCESS - all 20 tables were created.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Status: FAILED - review the ORA- errors above.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('============================================================');
END;
/
