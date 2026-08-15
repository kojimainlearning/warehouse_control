SET DEFINE OFF;
SET SQLBLANKLINES ON;
SET ECHO OFF;
SET SERVEROUTPUT ON;
WHENEVER SQLERROR CONTINUE;

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC001', 'Rice and Grains', 'Various types of rice, flour, and grains');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC002', 'Cooking Essentials', 'Oils, sauces, seasonings, and condiments');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC003', 'Canned and Packaged Food', 'Canned vegetables, meats, and ready-to-eat meals');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC004', 'Beverages', 'Soft drinks, juices, water, and energy drinks');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC005', 'Snacks and Confectionery', 'Chips, chocolates, candies, and biscuits');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC006', 'Dairy Products', 'Milk, cheese, butter, and yoghurt');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC007', 'Frozen Food', 'Frozen vegetables, meats, and ready meals');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC008', 'Instant Food', 'Instant noodles, cereals, and quick meals');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC009', 'Personal Care', 'Shampoo, soap, toothpaste, and skincare');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC010', 'Household Cleaning', 'Detergents, disinfectants, and cleaning tools');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC011', 'Baby Products', 'Baby milk, diapers, and baby food');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC012', 'Stationery and Daily Needs', 'Paper, pens, batteries, and household items');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC013', 'Alcoholic Beverages', 'Beers, wines, spirits, and other alcoholic drinks');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC014', 'Premium Items', 'Luxury and gourmet products');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC015', 'Organic Foods', 'Certified organic produce and packaged goods');

INSERT INTO Product_Categories (CategoryID, CategoryName, Description) VALUES ('PC016', 'Imported Goods', 'Specialty imported items');

COMMIT;
