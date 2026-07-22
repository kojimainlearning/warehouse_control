-- ==========================================
-- DIMENSION TABLES
-- ==========================================

-- 1. Date Dimension
CREATE TABLE Date_Dim (
    Date_Key            NUMBER NOT NULL,
    Cal_Date            DATE NOT NULL,
    Day_Week            VARCHAR2(20),
    Day_Num_Month       NUMBER(2),,
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

-- 2. Branch Dimension
CREATE TABLE Branch_Dim (
    Branch_Key      NUMBER NOT NULL,
    Branch_ID       VARCHAR2(50) NOT NULL,
    Branch_Name     VARCHAR2(100) NOT NULL,
    Full_Address    VARCHAR2(255) NOT NULL,
    City            VARCHAR2(100) NOT NULL,
    State           VARCHAR2(100) NOT NULL,
    Post_Code       VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_Branch_Dim PRIMARY KEY (Branch_Key)
);

-- 3. Delivery Company Dimension
CREATE TABLE Delivery_Company_Dim (
    Delivery_Company_Key    NUMBER NOT NULL,
    Company_ID              VARCHAR2(50) NOT NULL,
    Company_Name            VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_Delivery_Company_Dim PRIMARY KEY (Delivery_Company_Key)
);

-- 4. Supplier Dimension
CREATE TABLE Supplier_Dim (
    Supplier_Key    NUMBER NOT NULL,
    Supplier_ID     VARCHAR2(50) NOT NULL,
    Supplier_Name   VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_Supplier_Dim PRIMARY KEY (Supplier_Key)
);

-- 5. Customer Dimension
CREATE TABLE Customer_Dim (
    Customer_Key        NUMBER NOT NULL,
    Customer_ID         VARCHAR2(50) NOT NULL,
    Customer_Name       VARCHAR2(100) NOT NULL,
    Full_Address        VARCHAR2(255) NOT NULL,
    City                VARCHAR2(100),
    State               VARCHAR2(100),
    Post_Code           VARCHAR2(20),
    Is_Beneficiary      VARCHAR2(1) NOT NULL,
    Tier_Name           VARCHAR2(50) NOT NULL,
    Point_Rate          NUMBER(5,2),
    CONSTRAINT PK_Customer_Dim PRIMARY KEY (Customer_Key)
);

-- 6. Product Dimension
CREATE TABLE Product_Dim (
    Product_Key         NUMBER NOT NULL,
    Item_ID             VARCHAR2(50) NOT NULL,
    Item_Name           VARCHAR2(100) NOT NULL,
    Description         VARCHAR2(255),
    Unit_Measure        VARCHAR2(50) NOT NULL,
    Unit_Cost           NUMBER(10,2) NOT NULL,
    Is_Halal            VARCHAR2(1) NOT NULL,
    Is_Mykasih_Eligible VARCHAR2(1) NOT NULL,
    Category_Name       VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_Product_Dim PRIMARY KEY (Product_Key)
);

-- 7. Staff Dimension
CREATE TABLE Staff_Dim (
    Staff_Key       NUMBER NOT NULL,
    Staff_ID        VARCHAR2(50) NOT NULL,
    Staff_Name      VARCHAR2(100) NOT NULL,
    Role            VARCHAR2(50) NOT NULL,
    Hire_Date       DATE NOT NULL,
    Branch_Key      NUMBER NOT NULL,
    CONSTRAINT PK_Staff_Dim PRIMARY KEY (Staff_Key),
    CONSTRAINT FK_Staff_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key)
);

-- 8. Voucher Dimension
CREATE TABLE Voucher_Dim (
    Voucher_Key         NUMBER NOT NULL,
    Voucher_ID          VARCHAR2(50) NOT NULL,
    Voucher_Name        VARCHAR2(100) NOT NULL,
    Voucher_Type        VARCHAR2(50) NOT NULL,
    Point_Required      NUMBER(10) NOT NULL,
    Discount_Amount     NUMBER(10,2) NOT NULL,
    Min_Spend_Amount    NUMBER(10,2) NOT NULL,
    Full_Desc           VARCHAR2(255),
    Start_Date          DATE NOT NULL,
    End_Date            DATE NOT NULL,
    CONSTRAINT PK_Voucher_Dim PRIMARY KEY (Voucher_Key)
);


-- ==========================================
-- FACT TABLES
-- ==========================================

-- 9. Purchases Fact
CREATE TABLE Purchases_Fact (
    Purchase_ID         NUMBER NOT NULL,
    Supplier_Key        NUMBER NOT NULL,
    Date_Key            NUMBER NOT NULL,
    Branch_Key          NUMBER NOT NULL,
    Product_Key         NUMBER NOT NULL,
    Staff_Key           NUMBER NOT NULL,
    Quantity_Received   NUMBER(10) NOT NULL,
    Unit_Cost           NUMBER(10,2) NOT NULL,
    Line_Total          NUMBER(15,2) NOT NULL,
    CONSTRAINT PK_Purchases_Fact PRIMARY KEY (Purchase_ID),
    CONSTRAINT FK_Purch_Supplier FOREIGN KEY (Supplier_Key) REFERENCES Supplier_Dim(Supplier_Key),
    CONSTRAINT FK_Purch_Date FOREIGN KEY (Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Purch_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Purch_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Purch_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key)
);

-- 10. Sales Fact
CREATE TABLE Sales_Fact (
    Sale_ID          	   	NUMBER NOT NULL,
    Date_Key            	NUMBER NOT NULL,
    Branch_Key          	NUMBER NOT NULL,
    Product_Key         	NUMBER NOT NULL,
    Customer_Key        	NUMBER NOT NULL,
    Voucher_Key         	NUMBER, -- Nullable as not all sales use vouchers
    Delivery_Company_Key	NUMBER, -- Nullable as not every single sales require delivery
    Delivery_Date_Key		NUMBER,
    Staff_Key           	NUMBER NOT NULL,
    Quantity            	NUMBER(10) NOT NULL,
    Unit_Price          	NUMBER(10,2) NOT NULL,
    Line_Total         		NUMBER(15,2) NOT NULL,
    Delivery_Fee        	NUMBER(10,2) NOT NULL,
    Item_Discount       	NUMBER(10,2) NOT NULL,
    MyKasih_Subsidy     	NUMBER(10,2) NOT NULL,
    CONSTRAINT PK_Sales_Fact PRIMARY KEY (Sale_ID),
    CONSTRAINT FK_Sales_Date FOREIGN KEY (Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Sales_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Sales_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Sales_Customer FOREIGN KEY (Customer_Key) REFERENCES Customer_Dim(Customer_Key),
    CONSTRAINT FK_Sales_Voucher FOREIGN KEY (Voucher_Key) REFERENCES Voucher_Dim(Voucher_Key),
    CONSTRAINT FK_Delivery_Cmompany FOREIGN KEY (Delivery_Company_Key) REFERENCES Delivery_Company_Dim(Delivery_Company_Key),
    CONSTRAINT FK_Delivery_Date FOREIGN KEY (Delivery_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Sales_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key)
);

-- 11. Returns Fact
CREATE TABLE Returns_Fact (
    Return_ID           NUMBER NOT NULL,
    Order_ID            VARCHAR2(50) NOT NULL,
    Date_Key            NUMBER NOT NULL,
    Branch_Key          NUMBER NOT NULL,
    Product_Key         NUMBER NOT NULL,
    Customer_Key        NUMBER NOT NULL,
    Staff_Key           NUMBER NOT NULL,
    Quantity_Returned   NUMBER(10) NOT NULL,
    Refund_Amount       NUMBER(15,2) NOT NULL,
    Return_Reason       VARCHAR2(255),
    CONSTRAINT PK_Returns_Fact PRIMARY KEY (Return_ID),
    CONSTRAINT FK_Return_Date FOREIGN KEY (Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Return_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key),
    CONSTRAINT FK_Return_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Return_Customer FOREIGN KEY (Customer_Key) REFERENCES Customer_Dim(Customer_Key),
    CONSTRAINT FK_Return_Staff FOREIGN KEY (Staff_Key) REFERENCES Staff_Dim(Staff_Key)
);

-- 12. Inventory Fact (Snapshot Fact)
-- Note: Inventory facts typically use a composite primary key based on the snapshot date, product, and branch.
CREATE TABLE Inventory_Fact (
    Snapshot_Date_Key   NUMBER NOT NULL,
    Product_Key         NUMBER NOT NULL,
    Branch_Key          NUMBER NOT NULL,
    Quantity_On_Hand    NUMBER(10) NOT NULL,
    Reorder_Level       NUMBER(10) NOT NULL,
    Reorder_Quantity    NUMBER(10) NOT NULL,
    CONSTRAINT PK_Inventory_Fact PRIMARY KEY (Snapshot_Date_Key, Product_Key, Branch_Key),
    CONSTRAINT FK_Inv_Date FOREIGN KEY (Snapshot_Date_Key) REFERENCES Date_Dim(Date_Key),
    CONSTRAINT FK_Inv_Product FOREIGN KEY (Product_Key) REFERENCES Product_Dim(Product_Key),
    CONSTRAINT FK_Inv_Branch FOREIGN KEY (Branch_Key) REFERENCES Branch_Dim(Branch_Key)
);
