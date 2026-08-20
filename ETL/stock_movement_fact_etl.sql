TRUNCATE TABLE Stock_Movement_Fact;

CREATE OR REPLACE VIEW VW_ETL_STOCK_MOVEMENT_FACT AS
/* Purchase received: stock in */
SELECT
    D.Date_Key                    AS Movement_Date_Key,
    PD.Product_Key,
    BD.Branch_Key,
    SD.Staff_Key,
    PO.PurchaseOrderID            AS Reference_ID,
    'PURCHASE'                    AS Movement_Type,
    POI.QuantityReceived          AS Quantity_In,
    0                             AS Quantity_Out
FROM Purchase_Orders PO
JOIN Purchase_Order_Items POI
    ON POI.PurchaseOrderID = PO.PurchaseOrderID
JOIN Staffs S
    ON S.StaffID = PO.StaffID
JOIN Date_Dim D
    ON D.Cal_Date = TRUNC(PO.ReceivedDate)
JOIN Branch_Dim BD
    ON BD.Branch_ID = S.BranchID
JOIN Staff_Dim SD
    ON SD.Staff_ID = PO.StaffID
JOIN Product_Dim PD
    ON PD.Item_ID = POI.ItemID
   AND TRUNC(PO.ReceivedDate)
       BETWEEN TRUNC(PD.Effective_Start_Date)
           AND TRUNC(PD.Effective_End_Date)
WHERE PO.Status = 'RECEIVED'
  AND PO.ReceivedDate IS NOT NULL
  AND POI.QuantityReceived > 0
UNION ALL
/* Completed sale: stock out */
SELECT
    D.Date_Key                    AS Movement_Date_Key,
    PD.Product_Key,
    BD.Branch_Key,
    SD.Staff_Key,
    O.OrderID                     AS Reference_ID,
    'SALE'                        AS Movement_Type,
    0                             AS Quantity_In,
    OI.Quantity                   AS Quantity_Out
FROM Orders O
JOIN Ordered_Items OI
    ON OI.OrderID = O.OrderID
JOIN Date_Dim D
    ON D.Cal_Date = TRUNC(CAST(O.OrderDateTime AS DATE))
JOIN Branch_Dim BD
    ON BD.Branch_ID = O.BranchID
JOIN Staff_Dim SD
    ON SD.Staff_ID = O.StaffID
JOIN Product_Dim PD
    ON PD.Item_ID = OI.ItemID
   AND TRUNC(CAST(O.OrderDateTime AS DATE))
       BETWEEN TRUNC(PD.Effective_Start_Date)
           AND TRUNC(PD.Effective_End_Date)
WHERE O.OrderStatus = 'COMPLETED'
  AND O.StaffID IS NOT NULL
UNION ALL
/* Completed wrong-item return: stock in */
SELECT
    D.Date_Key                    AS Movement_Date_Key,
    PD.Product_Key,
    BD.Branch_Key,
    SD.Staff_Key,
    R.ReturnID                    AS Reference_ID,
    'RETURN'                      AS Movement_Type,
    R.QuantityReturned            AS Quantity_In,
    0                             AS Quantity_Out
FROM Return_Requests R
JOIN Orders O
    ON O.OrderID = R.OrderID
JOIN Date_Dim D
    ON D.Cal_Date = TRUNC(R.ProcessedDate)
JOIN Branch_Dim BD
    ON BD.Branch_ID = O.BranchID
JOIN Staff_Dim SD
    ON SD.Staff_ID = R.StaffID
JOIN Product_Dim PD
    ON PD.Item_ID = R.ItemID
   AND TRUNC(R.ProcessedDate)
       BETWEEN TRUNC(PD.Effective_Start_Date)
           AND TRUNC(PD.Effective_End_Date)
WHERE R.Status IN ('COMPLETED', 'APPROVED')
	AND R.ReturnReason IN ('WRONG_ITEM', 'MISSING')
	AND R.ResolutionType = 'REPLACE'
	AND R.ProcessedDate IS NOT NULL
	AND R.QuantityReturned > 0;
  
INSERT INTO Stock_Movement_Fact
(
    Movement_Date_Key,
    Product_Key,
    Branch_Key,
    Staff_Key,
    Reference_ID,
    Movement_Type,
    Quantity_In,
    Quantity_Out
)
SELECT
    Movement_Date_Key,
    Product_Key,
    Branch_Key,
    Staff_Key,
    Reference_ID,
    Movement_Type,
    Quantity_In,
    Quantity_Out
FROM VW_ETL_STOCK_MOVEMENT_FACT;