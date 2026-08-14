--DROP TABLES
-- Drop tables (reverse order of creation)
DROP TABLE Stock_Movement_Fact CASCADE CONSTRAINTS;
DROP TABLE Returns_Fact CASCADE CONSTRAINTS;
DROP TABLE Sales_Fact CASCADE CONSTRAINTS;
DROP TABLE Purchases_Fact CASCADE CONSTRAINTS;
DROP TABLE Product_Dim CASCADE CONSTRAINTS;
DROP TABLE Supplier_Dim CASCADE CONSTRAINTS;
DROP TABLE Branch_Dim CASCADE CONSTRAINTS;
DROP TABLE Customer_Dim CASCADE CONSTRAINTS;
DROP TABLE Staff_Dim CASCADE CONSTRAINTS;
DROP TABLE Date_Dim CASCADE CONSTRAINTS;

-- DIMENSION TABLES
-- Date Dimension
CREATE TABLE Date_Dim (
    Date_Key            NUMBER NOT NULL,
    Cal_Date            DATE NOT NULL,
    Day_Week            VARCHAR2(20),
    Day_Num_Month       NUMBER(2),
    Day_Num_Year        NUMBER(3),
    Cal_Week_End_Date   DATE,
    Cal_Week_Year       VARCHAR2(10),
    Cal_Month_Name      VARCHAR2(20),
    Cal_Month_Year      VARCHAR2(20),
    Cal_Quarter         VARCHAR2(10),
    Cal_Year_Quarter    VARCHAR2(20),
    Cal_Year_Month      VARCHAR2(20),
    Holiday_Ind         VARCHAR2(1),
    Weekday_Ind         VARCHAR2(1),
    Festive_Event       VARCHAR2(50),
    Last_Day_Ind        VARCHAR2(1),
    CONSTRAINT PK_Date_Dim PRIMARY KEY (Date_Key)
);

-- Branch Dimension
CREATE TABLE Branch_Dim (
    Branch_Key      NUMBER NOT NULL,
    Branch_ID       VARCHAR2(50) NOT NULL,
    Branch_Name     VARCHAR2(100) NOT NULL,
    City            VARCHAR2(100) NOT NULL,
    State           VARCHAR2(100) NOT NULL,
    Post_Code       VARCHAR2(20) NOT NULL,
    Opening_Date    DATE NOT NULL,
    Closing_Date    DATE,
    CONSTRAINT PK_Branch_Dim PRIMARY KEY (Branch_Key),
    CONSTRAINT FK_Branch_Dim_Branch_ID FOREIGN KEY (Branch_ID) REFERENCES Branches(BranchID)
);

-- Supplier Dimension
CREATE TABLE Supplier_Dim (
    Supplier_Key    NUMBER NOT NULL,
    Supplier_ID     VARCHAR2(50) NOT NULL,
    Supplier_Name   VARCHAR2(100) NOT NULL,
    Supplier_Status VARCHAR2(15) DEFAULT 'ACTIVE' NOT NULL,
    City            VARCHAR2(80),
    State           VARCHAR2(80),
    PostCode        VARCHAR2(5),
    CONSTRAINT PK_Supplier_Dim PRIMARY KEY (Supplier_Key),
    CONSTRAINT FK_Supplier_Dim_Supplier_ID FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(SupplierID),
    CONSTRAINT CK_Supplier_Dim_Status CHECK (Supplier_Status IN ('ACTIVE', 'INACTIVE')),
    CONSTRAINT CK_Supplier_Dim_PostCode CHECK (REGEXP_LIKE(PostCode, '^[0-9]{5}$'))
);

-- Customer Dimension
CREATE TABLE Customer_Dim (
    Customer_Key        NUMBER NOT NULL,
    Customer_ID         VARCHAR2(50) NOT NULL,
    Customer_Name       VARCHAR2(100) NOT NULL,
    Is_Beneficiary      VARCHAR2(1) DEFAULT 'N' NOT NULL,
    Tier_Name           VARCHAR2(50) NOT NULL,
    Join_Date           DATE,
    CONSTRAINT PK_Customer_Dim PRIMARY KEY (Customer_Key),
    CONSTRAINT FK_Customer_Dim_Customer_ID FOREIGN KEY (Customer_ID) REFERENCES Customers(CustomerID),
    CONSTRAINT MyKasih_Beneficiary CHECK (Is_Beneficiary in ('Y', 'N'))
);

-- Product Dimension
CREATE TABLE Product_Dim (
    Product_Key             NUMBER          NOT NULL,
    Item_ID                 VARCHAR2(10)    NOT NULL,
    Item_Name               VARCHAR2(100)   NOT NULL,
    Unit_Measure            VARCHAR2(20)    NOT NULL,
    Selling_Unit_Price      NUMBER(10,2)    NOT NULL,
    Purchase_Unit_Price     NUMBER(10,2)    NOT NULL,
    Is_Halal                CHAR(1)         DEFAULT 'N' NOT NULL,
    Category_Name           VARCHAR2(100)   NOT NULL,
    Effective_Start_Date    DATE            DEFAULT SYSDATE NOT NULL,
    Effective_End_Date      DATE            DEFAULT TO_DATE('31-DEC-9999','DD-MON-YYYY') NOT NULL,
    Current_Flag            CHAR(1)         DEFAULT 'Y' NOT NULL,
    CONSTRAINT PK_Product_Dim PRIMARY KEY (Product_Key),
    CONSTRAINT FK_Product_Dim_Item FOREIGN KEY (Item_ID) REFERENCES Items (ItemID),
    CONSTRAINT CK_Product_Dim_Unit_Measure CHECK (Unit_Measure IN ('BAG', 'BOTTLE', 'BOX', 'CAN', 'TIN', 'PACK', 'PCS')),
    CONSTRAINT CK_Product_Dim_Is_Halal CHECK (Is_Halal IN ('Y', 'N')),
    CONSTRAINT CK_Product_Dim_Current_Flag CHECK (Current_Flag IN ('Y', 'N')),
    CONSTRAINT CK_Product_Dim_Date CHECK (Effective_Start_Date <= Effective_End_Date)
);

-- Staff Dimension
CREATE TABLE Staff_Dim (
    Staff_Key       NUMBER NOT NULL,
    Staff_ID        VARCHAR2(50) NOT NULL,
    Staff_Name      VARCHAR2(100) NOT NULL,
    Role            VARCHAR2(50) NOT NULL,
    Hire_Date       DATE NOT NULL,
    Resigned_Date   DATE,
    CONSTRAINT PK_Staff_Dim PRIMARY KEY (Staff_Key),
    CONSTRAINT FK_Staff_Dim_Staff_ID FOREIGN KEY (Staff_ID) REFERENCES Staffs(StaffID),
    CONSTRAINT CK_Staff_Dim_Role CHECK (Role IN ('MANAGER', 'CASHIER', 'STOCK_STAFF', 'ADMIN'))
);

-- FACT TABLES
-- Purchases Fact
CREATE TABLE Purchases_Fact (
    Supplier_Key        NUMBER NOT NULL,
    PO_Date_Key         NUMBER NOT NULL,
    Branch_Key          NUMBER NOT NULL,
    Product_Key         NUMBER NOT NULL,
    Staff_Key           NUMBER NOT NULL,
    Purchase_Order_ID   VARCHAR2(10) NOT NULL,
    Received_Date_Key	NUMBER,
    Quantity_Ordered	NUMBER(12) NOT NULL,
    Quantity_Received   NUMBER(12) DEFAULT 0 NOT NULL,
    Unit_Cost           NUMBER(12,2) NOT NULL,
    Line_Total          NUMBER(14,2) NOT NULL,
    PO_Status		VARCHAR2(20),
    CONSTRAINT PK_Purchases_Fact PRIMARY KEY (Supplier_Key, PO_Date_Key, Branch_Key, Product_Key, Staff_Key, Purchase_Order_ID),
    CONSTRAINT FK_Purch_Supplier FOREIGN KEY (Supplier_Key) REFERENCES Supplier_Dim(Supplier_Key),
    CONSTRAINT FK_Purch_PO_Date FOREIGN KEY (PO_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Purch_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Purch_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Purch_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key),
    CONSTRAINT FK_Purch_PO_ID FOREIGN KEY (Purchase_Order_ID) REFERENCES Purchase_Orders(PurchaseOrderID),
    CONSTRAINT FK_Purch_Received_Date FOREIGN KEY (Received_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT CK_Purch_Qty_Ordered CHECK (Quantity_Ordered > 0),
    CONSTRAINT CK_Purch_Qty_Received
        CHECK (
            Quantity_Received >= 0
            AND Quantity_Received <= Quantity_Ordered
        ),
    CONSTRAINT CK_Purch_Order_Status CHECK (
    	PO_Status IS NULL
    	OR PO_Status IN ('PENDING', 'APPROVED', 'RECEIVED', 'CANCELLED')
    ),
    CONSTRAINT CK_Purch_Unit_Cost CHECK (Unit_Cost >= 0),
    CONSTRAINT CK_Purch_Line_Total CHECK (Line_Total = Quantity_Ordered * Unit_Cost)
);

-- Sales Fact
CREATE TABLE Sales_Fact (
    SO_Date_Key            	        NUMBER NOT NULL,
    Branch_Key          	        NUMBER NOT NULL,
    Product_Key         	        NUMBER NOT NULL,
    Customer_Key        	        NUMBER NOT NULL,
    Staff_Key           	        NUMBER NOT NULL,
    Order_ID          	   	        VARCHAR2(10) NOT NULL,
    Delivery_Company_Name	        VARCHAR2(10),
    Scheduled_Delivery_Date_Key	    	NUMBER,
    Delivered_Date_Key		        NUMBER,
    Quantity            	        NUMBER(12) NOT NULL,
    Unit_Price          	        NUMBER(12,2) NOT NULL,
    MyKasih_Subsidy_Amount	        NUMBER(14,2) DEFAULT 0 NOT NULL,
    Voucher_Discount_Amount 	    	NUMBER(14,2) DEFAULT 0 NOT NULL, -- Split the amount from Order level to Order Items level, use SUM() to compute full amount
    Line_Total         		        NUMBER(14,2) NOT NULL,
    Delivery_Fee        	        NUMBER(12,2) DEFAULT 0 NOT NULL, -- Record the Order level amount, use MAX() to get the value instead of SUM()
    City 			        VARCHAR2(80),
    State			        VARCHAR2(80),
    PostCode			        NUMBER(5),
    SO_Status		                VARCHAR2(20),
    CONSTRAINT PK_Sales_Fact PRIMARY KEY (SO_Date_Key, Branch_Key, Product_Key, Customer_Key, Staff_Key, Order_ID),
    CONSTRAINT FK_Sales_SO_Date FOREIGN KEY (SO_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Sales_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Sales_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Sales_Customer FOREIGN KEY (Customer_Key) REFERENCES Customer_Dim(Customer_Key),
    CONSTRAINT FK_Sales_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key),
    CONSTRAINT FK_Sales_Order_ID FOREIGN KEY (Order_ID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_Scheduled_Delivery_Date FOREIGN KEY (Scheduled_Delivery_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Delivered_Date FOREIGN KEY (Delivered_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT CK_Sales_Qty CHECK (Quantity > 0),
    CONSTRAINT CK_Sales_Unit_Price CHECK (Unit_Price >= 0),
    CONSTRAINT MyKasih_Subsidy_Amount
        CHECK (
            MyKasih_Subsidy_Amount >= 0
            AND MyKasih_Subsidy_Amount <= (Quantity * Unit_Price) - Voucher_Discount_Amount
        ),
    CONSTRAINT Voucher_Discount_Amount
        CHECK (
            Voucher_Discount_Amount >= 0
            AND Voucher_Discount_Amount <= Quantity * Unit_Price
        ),
    CONSTRAINT CK_Sales_Line_Total
        CHECK (
            Line_Total =
                (Quantity * Unit_Price) - Voucher_Discount_Amount - MyKasih_Subsidy_Amount
        ),
    CONSTRAINT CK_Sales_Delivery_Fee CHECK (Delivery_Fee >= 0),
    CONSTRAINT CK_Sales_PostCode CHECK (REGEXP_LIKE(PostCode, '^[0-9]{5}$')),
    CONSTRAINT CK_Sales_Order_Status CHECK (
    	SO_Status IS NULL
    	OR SO_Status IN ('PENDING', 'PICKED_UP', 'DELIVERED', 'FAILED')
    )
);

-- Returns Fact
CREATE TABLE Returns_Fact (
    Request_Date_Key	NUMBER NOT NULL,
    Branch_Key          NUMBER NOT NULL,
    Product_Key         NUMBER NOT NULL,
    Customer_Key        NUMBER NOT NULL,
    Staff_Key           NUMBER NOT NULL,
    Return_ID           VARCHAR2(10) NOT NULL,
    Processed_Date_Key  NUMBER,
    Quantity_Returned   NUMBER(10) NOT NULL,
    Resolution_Type 	VARCHAR2(15),
    Refund_Amount       NUMBER(15,2) NOT NULL,
    Return_Reason       VARCHAR2(20) NOT NULL,
    Return_Status	VARCHAR2(15) DEFAULT 'PENDING' NOT NULL,
    CONSTRAINT PK_Returns_Fact PRIMARY KEY (Request_Date_Key, Branch_Key, Customer_Key, Staff_Key, Product_Key, Return_ID),
    CONSTRAINT FK_Returns_Date FOREIGN KEY (Request_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Returns_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Returns_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Returns_Customer FOREIGN KEY (Customer_Key) REFERENCES Customer_Dim(Customer_Key),
    CONSTRAINT FK_Returns_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key),
    CONSTRAINT FK_Returns_Return_ID FOREIGN KEY (Return_ID) REFERENCES Return_Requests(ReturnID),
    CONSTRAINT FK_Returns_Processed_Date FOREIGN KEY (Processed_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT CK_Returns_Quantity_Returned CHECK (Quantity_Returned >= 0),
    CONSTRAINT CK_Returns_Resolution_Type CHECK (
            Resolution_Type IS NULL
            OR Resolution_Type IN ('REFUND', 'REPLACE', 'REJECT')
        ),
    CONSTRAINT CK_Returns_Refund_Amount
        CHECK (
            Refund_Amount IS NULL
            OR Refund_Amount >= 0
        ),
    CONSTRAINT CK_Returns_Return_Reason 
        CHECK (Return_Reason IN ('MISSING', 'BROKEN', 'EXPIRED', 'WRONG_ITEM', 'OTHER')),
    CONSTRAINT CK_Returns_Return_Status
        CHECK (Return_Status IN ('PENDING', 'APPROVED', 'REJECTED', 'COMPLETED', 'CANCELLED'))
);

-- Stock Movement Fact
CREATE TABLE Stock_Movement_Fact (
    Movement_Date_Key   NUMBER NOT NULL,
    Product_Key         NUMBER NOT NULL,
    Branch_Key          NUMBER NOT NULL,
    Staff_Key           NUMBER NOT NULL,
    Reference_ID        VARCHAR2(10) NOT NULL,
    Movement_Type       VARCHAR2(15) NOT NULL,
    Quantity_In         NUMBER(12) DEFAULT 0 NOT NULL,
    Quantity_Out        NUMBER(12) DEFAULT 0 NOT NULL,
    CONSTRAINT PK_Stock_Movement_Fact
        PRIMARY KEY (
            Movement_Date_Key,
            Product_Key,
            Branch_Key,
            Staff_Key,
            Reference_ID
        ),
    CONSTRAINT FK_SMF_Date FOREIGN KEY (Movement_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_SMF_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_SMF_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_SMF_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key),
    CONSTRAINT CK_SMF_Movement_Type CHECK (Movement_Type IN('SALE', 'PURCHASE', 'RETURN')),
    CONSTRAINT CK_SMF_Quantity_In CHECK (Quantity_In >= 0),
    CONSTRAINT CK_SMF_Quantity_Out CHECK (Quantity_Out >= 0),
    CONSTRAINT CK_SMF_In_Out 
            CHECK ((Movement_Type = 'SALE' AND Quantity_In = 0 AND Quantity_Out > 0)
            OR (Movement_Type = 'PURCHASE' AND Quantity_In > 0 AND Quantity_Out = 0)
            OR (Movement_Type = 'RETURN' AND Quantity_In > 0 AND Quantity_Out = 0)
        )
);
