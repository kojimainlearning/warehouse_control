
-- VALIDATION CHECKS FOR MEMBER 2 DATA

-- 1. Exactly 12 branches
SELECT COUNT(*) AS BRANCH_COUNT FROM Branches;
-- Expected: 12

-- 2. Exactly 120 staff
SELECT COUNT(*) AS STAFF_COUNT FROM Staffs;
-- Expected: 120

-- 3. Exactly 12 categories
SELECT COUNT(*) AS CATEGORY_COUNT FROM Product_Categories;
-- Expected: 12

-- 4. Exactly 120 items
SELECT COUNT(*) AS ITEM_COUNT FROM Items;
-- Expected: 120

-- 5. Exactly 1,440 stock records (12 branches x 120 items)
SELECT COUNT(*) AS STOCK_COUNT FROM Stocks;
-- Expected: 1440

-- 6. Every postcode has 5 digits (check length)
SELECT BranchID, PostCode
FROM Branches
WHERE LENGTH(PostCode) != 5 OR NOT REGEXP_LIKE(PostCode, '^[0-9]{5}$');

-- 7. Staff hire date >= branch opening date
SELECT s.StaffID, s.HireDate, b.OpeningDate
FROM Staffs s
JOIN Branches b ON s.BranchID = b.BranchID
WHERE s.HireDate < b.OpeningDate;

-- 8. Staff status consistency: active/inactive
-- (No direct validation, but we can check count of active/inactive)
SELECT Status, COUNT(*) FROM Staffs GROUP BY Status;

-- 9. Staff roles assigned correctly (not required but check)
SELECT Role, COUNT(*) FROM Staffs GROUP BY Role;

-- 10. Items reference valid categories
SELECT i.ItemID, i.CategoryID
FROM Items i
LEFT JOIN Product_Categories c ON i.CategoryID = c.CategoryID
WHERE c.CategoryID IS NULL;

-- 11. UnitMeasure in allowed list
SELECT ItemID, UnitMeasure
FROM Items
WHERE UnitMeasure NOT IN ('BAG','BOTTLE','BOX','CAN','TIN','PACK','PCS');

-- 12. MyKasih eligibility only Y or N
SELECT ItemID, IsMyKasihEligible
FROM Items
WHERE IsMyKasihEligible NOT IN ('Y','N');

-- 13. Halal only Y or N
SELECT ItemID, IsHalal
FROM Items
WHERE IsHalal NOT IN ('Y','N');

-- 14. Stock quantities non-negative
SELECT BranchID, ItemID, QuantityOnHand
FROM Stocks
WHERE QuantityOnHand < 0;

-- 15. Unique stock combinations (should be unique)
SELECT BranchID, ItemID, COUNT(*) AS dup
FROM Stocks
GROUP BY BranchID, ItemID
HAVING COUNT(*) > 1;

-- 16. No stock for inactive branches? (We have only one inactive, B012; we might still have stock if opening stock had it)
-- Optional: Check if stock exists for inactive branch (B012) - if opening stock includes it, it's okay but later transactions might stop.
-- We can just list.

-- 17. Stock LastUpdated >= branch opening date?
SELECT s.BranchID, s.ItemID, s.LastUpdated, b.OpeningDate
FROM Stocks s
JOIN Branches b ON s.BranchID = b.BranchID
WHERE s.LastUpdated < b.OpeningDate;

-- 18. Check if any item sold before introduction (requires order data, not available yet)
-- This will be validated later with transaction data.

-- End of validation
