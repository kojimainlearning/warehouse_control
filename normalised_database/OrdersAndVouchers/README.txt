1. Run vouchers first followed by orders then ordered_items

2. Afterwards run this into SQL to update the mykasih amount used reflected by the changes made by the insert orders statement

UPDATE Mykasih_Beneficiaries mb
SET mb.AmountUsed = LEAST(
    mb.MonthlyLimitAmount,
    NVL((
        SELECT SUM(oi.MyKasihSubsidyAmount)
        FROM Orders o
        JOIN Ordered_Items oi ON o.OrderID = oi.OrderID
        WHERE o.CustomerID = mb.CustomerID
          -- Only sum orders from the current active month (e.g., June 2026)
          AND EXTRACT(YEAR FROM o.OrderDateTime) = 2026
          AND EXTRACT(MONTH FROM o.OrderDateTime) = 6
    ), 0)
);

CSV Files details
delivery_plan.csv - Can be used by ShengJie, it is a mock data of the deliveries made, the current version is only in one location but with different pricing due to the variety of KMs according to metadata/delivery_company_profile.csv's DistanceFeeRule. If addition are to be done then orders also will require overhaul.
