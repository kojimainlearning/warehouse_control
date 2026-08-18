-- ==========================================================
-- Synthetic Purchase_Orders (All Branches B001-B012)
-- Period: 2020-01-01 to 2026-06-30 | Seed: 3183
-- Pricing: Half-yearly stepped | Bundling: 2-6 items per PO
-- ==========================================================

INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0001', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-06', 'YYYY-MM-DD'), TO_DATE('2020-01-08', 'YYYY-MM-DD'), 7506.43, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0002', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-09', 'YYYY-MM-DD'), TO_DATE('2020-01-14', 'YYYY-MM-DD'), 2335.9, 'RECEIVED', 'SUP009', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0003', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-04', 'YYYY-MM-DD'), TO_DATE('2020-01-04', 'YYYY-MM-DD'), 4023.31, 'RECEIVED', 'SUP002', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0004', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-06', 'YYYY-MM-DD'), TO_DATE('2020-01-09', 'YYYY-MM-DD'), 1691.8, 'RECEIVED', 'SUP006', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0005', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-04', 'YYYY-MM-DD'), TO_DATE('2020-01-03', 'YYYY-MM-DD'), 2159.53, 'RECEIVED', 'SUP003', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0006', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-09', 'YYYY-MM-DD'), TO_DATE('2020-01-11', 'YYYY-MM-DD'), 3641.43, 'RECEIVED', 'SUP010', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0007', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-09', 'YYYY-MM-DD'), TO_DATE('2020-01-11', 'YYYY-MM-DD'), 3699.32, 'RECEIVED', 'SUP011', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0008', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-06', 'YYYY-MM-DD'), TO_DATE('2020-01-06', 'YYYY-MM-DD'), 5684.2, 'RECEIVED', 'SUP005', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0009', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2020-01-04', 'YYYY-MM-DD'), TO_DATE('2020-01-03', 'YYYY-MM-DD'), 4913.7, 'RECEIVED', 'SUP001', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0010', TO_DATE('2020-01-02', 'YYYY-MM-DD'), TO_DATE('2020-01-10', 'YYYY-MM-DD'), TO_DATE('2020-01-15', 'YYYY-MM-DD'), 9445.63, 'RECEIVED', 'SUP008', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0011', TO_DATE('2020-01-02', 'YYYY-MM-DD'), TO_DATE('2020-01-05', 'YYYY-MM-DD'), TO_DATE('2020-01-04', 'YYYY-MM-DD'), 1227.56, 'RECEIVED', 'SUP003', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0012', TO_DATE('2020-01-02', 'YYYY-MM-DD'), TO_DATE('2020-01-05', 'YYYY-MM-DD'), TO_DATE('2020-01-05', 'YYYY-MM-DD'), 534.35, 'RECEIVED', 'SUP001', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0013', TO_DATE('2020-01-02', 'YYYY-MM-DD'), TO_DATE('2020-01-10', 'YYYY-MM-DD'), TO_DATE('2020-01-12', 'YYYY-MM-DD'), 534.84, 'RECEIVED', 'SUP009', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0014', TO_DATE('2020-01-03', 'YYYY-MM-DD'), TO_DATE('2020-01-11', 'YYYY-MM-DD'), TO_DATE('2020-01-16', 'YYYY-MM-DD'), 496.11, 'RECEIVED', 'SUP010', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0015', TO_DATE('2020-01-03', 'YYYY-MM-DD'), TO_DATE('2020-01-08', 'YYYY-MM-DD'), TO_DATE('2020-01-09', 'YYYY-MM-DD'), 1445.09, 'RECEIVED', 'SUP007', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0016', TO_DATE('2020-01-04', 'YYYY-MM-DD'), TO_DATE('2020-01-09', 'YYYY-MM-DD'), TO_DATE('2020-01-08', 'YYYY-MM-DD'), 3279.68, 'RECEIVED', 'SUP005', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0017', TO_DATE('2020-01-05', 'YYYY-MM-DD'), TO_DATE('2020-01-10', 'YYYY-MM-DD'), TO_DATE('2020-01-11', 'YYYY-MM-DD'), 410.07, 'RECEIVED', 'SUP007', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0018', TO_DATE('2020-01-08', 'YYYY-MM-DD'), TO_DATE('2020-01-11', 'YYYY-MM-DD'), TO_DATE('2020-01-09', 'YYYY-MM-DD'), 683.68, 'RECEIVED', 'SUP001', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0019', TO_DATE('2020-01-09', 'YYYY-MM-DD'), TO_DATE('2020-01-12', 'YYYY-MM-DD'), TO_DATE('2020-01-13', 'YYYY-MM-DD'), 1281.23, 'RECEIVED', 'SUP002', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0020', TO_DATE('2020-01-12', 'YYYY-MM-DD'), TO_DATE('2020-01-17', 'YYYY-MM-DD'), TO_DATE('2020-01-19', 'YYYY-MM-DD'), 2021.69, 'RECEIVED', 'SUP007', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0021', TO_DATE('2020-01-16', 'YYYY-MM-DD'), TO_DATE('2020-01-19', 'YYYY-MM-DD'), TO_DATE('2020-01-17', 'YYYY-MM-DD'), 1077.97, 'RECEIVED', 'SUP002', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0022', TO_DATE('2020-01-19', 'YYYY-MM-DD'), TO_DATE('2020-01-27', 'YYYY-MM-DD'), TO_DATE('2020-01-28', 'YYYY-MM-DD'), 1962.65, 'RECEIVED', 'SUP009', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0023', TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2020-01-23', 'YYYY-MM-DD'), TO_DATE('2020-01-22', 'YYYY-MM-DD'), 225.97, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0024', TO_DATE('2020-01-26', 'YYYY-MM-DD'), TO_DATE('2020-01-29', 'YYYY-MM-DD'), TO_DATE('2020-01-28', 'YYYY-MM-DD'), 251.45, 'RECEIVED', 'SUP003', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0025', TO_DATE('2020-02-02', 'YYYY-MM-DD'), TO_DATE('2020-02-05', 'YYYY-MM-DD'), TO_DATE('2020-02-04', 'YYYY-MM-DD'), 475.12, 'RECEIVED', 'SUP001', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0026', TO_DATE('2020-02-06', 'YYYY-MM-DD'), TO_DATE('2020-02-14', 'YYYY-MM-DD'), NULL, 390.27, 'CANCELLED', 'SUP009', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0027', TO_DATE('2020-02-07', 'YYYY-MM-DD'), TO_DATE('2020-02-10', 'YYYY-MM-DD'), TO_DATE('2020-02-08', 'YYYY-MM-DD'), 390.27, 'RECEIVED', 'SUP002', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0028', TO_DATE('2020-02-08', 'YYYY-MM-DD'), TO_DATE('2020-02-13', 'YYYY-MM-DD'), TO_DATE('2020-02-13', 'YYYY-MM-DD'), 2270.05, 'RECEIVED', 'SUP004', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0029', TO_DATE('2020-02-11', 'YYYY-MM-DD'), TO_DATE('2020-02-19', 'YYYY-MM-DD'), TO_DATE('2020-02-20', 'YYYY-MM-DD'), 1528.05, 'RECEIVED', 'SUP010', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0030', TO_DATE('2020-02-17', 'YYYY-MM-DD'), TO_DATE('2020-02-25', 'YYYY-MM-DD'), TO_DATE('2020-02-28', 'YYYY-MM-DD'), 86.16, 'RECEIVED', 'SUP008', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0031', TO_DATE('2020-02-20', 'YYYY-MM-DD'), TO_DATE('2020-02-28', 'YYYY-MM-DD'), TO_DATE('2020-02-29', 'YYYY-MM-DD'), 35.04, 'RECEIVED', 'SUP011', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0032', TO_DATE('2020-02-25', 'YYYY-MM-DD'), TO_DATE('2020-02-28', 'YYYY-MM-DD'), TO_DATE('2020-02-29', 'YYYY-MM-DD'), 46.72, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0033', TO_DATE('2020-02-26', 'YYYY-MM-DD'), TO_DATE('2020-03-02', 'YYYY-MM-DD'), TO_DATE('2020-03-02', 'YYYY-MM-DD'), 846.99, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0034', TO_DATE('2020-02-29', 'YYYY-MM-DD'), TO_DATE('2020-03-08', 'YYYY-MM-DD'), TO_DATE('2020-03-14', 'YYYY-MM-DD'), 1030.91, 'RECEIVED', 'SUP009', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0035', TO_DATE('2020-02-29', 'YYYY-MM-DD'), TO_DATE('2020-03-03', 'YYYY-MM-DD'), TO_DATE('2020-03-03', 'YYYY-MM-DD'), 828.39, 'RECEIVED', 'SUP002', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0036', TO_DATE('2020-02-29', 'YYYY-MM-DD'), TO_DATE('2020-03-05', 'YYYY-MM-DD'), TO_DATE('2020-03-04', 'YYYY-MM-DD'), 773.09, 'RECEIVED', 'SUP006', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0037', TO_DATE('2020-03-11', 'YYYY-MM-DD'), TO_DATE('2020-03-14', 'YYYY-MM-DD'), TO_DATE('2020-03-12', 'YYYY-MM-DD'), 311.76, 'RECEIVED', 'SUP002', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0038', TO_DATE('2020-03-11', 'YYYY-MM-DD'), TO_DATE('2020-03-16', 'YYYY-MM-DD'), TO_DATE('2020-03-19', 'YYYY-MM-DD'), 1570.75, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0039', TO_DATE('2020-03-13', 'YYYY-MM-DD'), TO_DATE('2020-03-16', 'YYYY-MM-DD'), TO_DATE('2020-03-15', 'YYYY-MM-DD'), 585.5, 'RECEIVED', 'SUP003', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0040', TO_DATE('2020-03-16', 'YYYY-MM-DD'), TO_DATE('2020-03-19', 'YYYY-MM-DD'), TO_DATE('2020-03-17', 'YYYY-MM-DD'), 449.82, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0041', TO_DATE('2020-03-19', 'YYYY-MM-DD'), TO_DATE('2020-03-24', 'YYYY-MM-DD'), TO_DATE('2020-03-23', 'YYYY-MM-DD'), 49.5, 'RECEIVED', 'SUP005', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0042', TO_DATE('2020-03-20', 'YYYY-MM-DD'), TO_DATE('2020-03-28', 'YYYY-MM-DD'), TO_DATE('2020-04-01', 'YYYY-MM-DD'), 356.12, 'RECEIVED', 'SUP010', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0043', TO_DATE('2020-03-29', 'YYYY-MM-DD'), TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-02', 'YYYY-MM-DD'), 1441.66, 'RECEIVED', 'SUP003', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0044', TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-06', 'YYYY-MM-DD'), TO_DATE('2020-04-07', 'YYYY-MM-DD'), 1864.59, 'RECEIVED', 'SUP004', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0045', TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-04', 'YYYY-MM-DD'), TO_DATE('2020-04-05', 'YYYY-MM-DD'), 3833.65, 'RECEIVED', 'SUP001', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0046', TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-09', 'YYYY-MM-DD'), TO_DATE('2020-04-13', 'YYYY-MM-DD'), 3603.68, 'RECEIVED', 'SUP009', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0047', TO_DATE('2020-04-02', 'YYYY-MM-DD'), TO_DATE('2020-04-05', 'YYYY-MM-DD'), TO_DATE('2020-04-06', 'YYYY-MM-DD'), 688.16, 'RECEIVED', 'SUP001', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0048', TO_DATE('2020-04-02', 'YYYY-MM-DD'), TO_DATE('2020-04-07', 'YYYY-MM-DD'), TO_DATE('2020-04-09', 'YYYY-MM-DD'), 5396.82, 'RECEIVED', 'SUP007', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0049', TO_DATE('2020-04-02', 'YYYY-MM-DD'), TO_DATE('2020-04-05', 'YYYY-MM-DD'), TO_DATE('2020-04-03', 'YYYY-MM-DD'), 2091.6, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0050', TO_DATE('2020-04-02', 'YYYY-MM-DD'), TO_DATE('2020-04-10', 'YYYY-MM-DD'), TO_DATE('2020-04-15', 'YYYY-MM-DD'), 2584.2, 'RECEIVED', 'SUP009', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0051', TO_DATE('2020-04-02', 'YYYY-MM-DD'), TO_DATE('2020-04-07', 'YYYY-MM-DD'), TO_DATE('2020-04-07', 'YYYY-MM-DD'), 4716.23, 'RECEIVED', 'SUP005', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0052', TO_DATE('2020-04-02', 'YYYY-MM-DD'), TO_DATE('2020-04-05', 'YYYY-MM-DD'), TO_DATE('2020-04-04', 'YYYY-MM-DD'), 2149.43, 'RECEIVED', 'SUP003', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0053', TO_DATE('2020-04-02', 'YYYY-MM-DD'), TO_DATE('2020-04-10', 'YYYY-MM-DD'), TO_DATE('2020-04-11', 'YYYY-MM-DD'), 2408.77, 'RECEIVED', 'SUP011', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0054', TO_DATE('2020-04-03', 'YYYY-MM-DD'), TO_DATE('2020-04-11', 'YYYY-MM-DD'), TO_DATE('2020-04-12', 'YYYY-MM-DD'), 617.74, 'RECEIVED', 'SUP011', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0055', TO_DATE('2020-04-03', 'YYYY-MM-DD'), TO_DATE('2020-04-06', 'YYYY-MM-DD'), TO_DATE('2020-04-07', 'YYYY-MM-DD'), 1102.14, 'RECEIVED', 'SUP001', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0056', TO_DATE('2020-04-03', 'YYYY-MM-DD'), TO_DATE('2020-04-08', 'YYYY-MM-DD'), TO_DATE('2020-04-07', 'YYYY-MM-DD'), 1870.58, 'RECEIVED', 'SUP006', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0057', TO_DATE('2020-04-03', 'YYYY-MM-DD'), TO_DATE('2020-04-08', 'YYYY-MM-DD'), TO_DATE('2020-04-08', 'YYYY-MM-DD'), 3358.25, 'RECEIVED', 'SUP007', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0058', TO_DATE('2020-04-03', 'YYYY-MM-DD'), TO_DATE('2020-04-11', 'YYYY-MM-DD'), TO_DATE('2020-04-15', 'YYYY-MM-DD'), 5866.42, 'RECEIVED', 'SUP008', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0059', TO_DATE('2020-04-05', 'YYYY-MM-DD'), TO_DATE('2020-04-10', 'YYYY-MM-DD'), TO_DATE('2020-04-12', 'YYYY-MM-DD'), 1377.04, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0060', TO_DATE('2020-04-06', 'YYYY-MM-DD'), TO_DATE('2020-04-11', 'YYYY-MM-DD'), TO_DATE('2020-04-11', 'YYYY-MM-DD'), 3123.3, 'RECEIVED', 'SUP004', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0061', TO_DATE('2020-04-11', 'YYYY-MM-DD'), TO_DATE('2020-04-16', 'YYYY-MM-DD'), TO_DATE('2020-04-16', 'YYYY-MM-DD'), 748.02, 'RECEIVED', 'SUP006', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0062', TO_DATE('2020-04-24', 'YYYY-MM-DD'), TO_DATE('2020-04-29', 'YYYY-MM-DD'), TO_DATE('2020-04-29', 'YYYY-MM-DD'), 1162.7, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0063', TO_DATE('2020-05-05', 'YYYY-MM-DD'), TO_DATE('2020-05-08', 'YYYY-MM-DD'), TO_DATE('2020-05-08', 'YYYY-MM-DD'), 413.17, 'RECEIVED', 'SUP003', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0064', TO_DATE('2020-05-06', 'YYYY-MM-DD'), TO_DATE('2020-05-09', 'YYYY-MM-DD'), TO_DATE('2020-05-08', 'YYYY-MM-DD'), 984.67, 'RECEIVED', 'SUP001', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0065', TO_DATE('2020-05-07', 'YYYY-MM-DD'), TO_DATE('2020-05-15', 'YYYY-MM-DD'), TO_DATE('2020-05-16', 'YYYY-MM-DD'), 272.84, 'RECEIVED', 'SUP011', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0066', TO_DATE('2020-05-07', 'YYYY-MM-DD'), TO_DATE('2020-05-12', 'YYYY-MM-DD'), TO_DATE('2020-05-11', 'YYYY-MM-DD'), 1801.03, 'RECEIVED', 'SUP004', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0067', TO_DATE('2020-05-10', 'YYYY-MM-DD'), TO_DATE('2020-05-13', 'YYYY-MM-DD'), TO_DATE('2020-05-12', 'YYYY-MM-DD'), 1760.56, 'RECEIVED', 'SUP002', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0068', TO_DATE('2020-05-10', 'YYYY-MM-DD'), TO_DATE('2020-05-15', 'YYYY-MM-DD'), TO_DATE('2020-05-18', 'YYYY-MM-DD'), 522.57, 'RECEIVED', 'SUP007', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0069', TO_DATE('2020-05-12', 'YYYY-MM-DD'), TO_DATE('2020-05-17', 'YYYY-MM-DD'), TO_DATE('2020-05-16', 'YYYY-MM-DD'), 330.88, 'RECEIVED', 'SUP006', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0070', TO_DATE('2020-05-14', 'YYYY-MM-DD'), TO_DATE('2020-05-19', 'YYYY-MM-DD'), TO_DATE('2020-05-21', 'YYYY-MM-DD'), 533.05, 'RECEIVED', 'SUP007', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0071', TO_DATE('2020-05-15', 'YYYY-MM-DD'), TO_DATE('2020-05-23', 'YYYY-MM-DD'), TO_DATE('2020-05-26', 'YYYY-MM-DD'), 1099.83, 'RECEIVED', 'SUP009', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0072', TO_DATE('2020-05-21', 'YYYY-MM-DD'), TO_DATE('2020-05-24', 'YYYY-MM-DD'), TO_DATE('2020-05-23', 'YYYY-MM-DD'), 320.62, 'RECEIVED', 'SUP001', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0073', TO_DATE('2020-05-22', 'YYYY-MM-DD'), TO_DATE('2020-05-27', 'YYYY-MM-DD'), TO_DATE('2020-05-29', 'YYYY-MM-DD'), 282.93, 'RECEIVED', 'SUP007', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0074', TO_DATE('2020-05-23', 'YYYY-MM-DD'), TO_DATE('2020-05-26', 'YYYY-MM-DD'), TO_DATE('2020-05-26', 'YYYY-MM-DD'), 383.78, 'RECEIVED', 'SUP001', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0075', TO_DATE('2020-05-23', 'YYYY-MM-DD'), TO_DATE('2020-05-31', 'YYYY-MM-DD'), TO_DATE('2020-06-02', 'YYYY-MM-DD'), 811.0, 'RECEIVED', 'SUP010', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0076', TO_DATE('2020-05-28', 'YYYY-MM-DD'), TO_DATE('2020-05-31', 'YYYY-MM-DD'), TO_DATE('2020-05-30', 'YYYY-MM-DD'), 741.15, 'RECEIVED', 'SUP002', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0077', TO_DATE('2020-06-01', 'YYYY-MM-DD'), TO_DATE('2020-06-06', 'YYYY-MM-DD'), TO_DATE('2020-06-09', 'YYYY-MM-DD'), 449.15, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0078', TO_DATE('2020-06-02', 'YYYY-MM-DD'), TO_DATE('2020-06-05', 'YYYY-MM-DD'), TO_DATE('2020-06-04', 'YYYY-MM-DD'), 621.52, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0079', TO_DATE('2020-06-03', 'YYYY-MM-DD'), TO_DATE('2020-06-08', 'YYYY-MM-DD'), TO_DATE('2020-06-07', 'YYYY-MM-DD'), 68.78, 'RECEIVED', 'SUP007', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0080', TO_DATE('2020-06-04', 'YYYY-MM-DD'), TO_DATE('2020-06-09', 'YYYY-MM-DD'), TO_DATE('2020-06-09', 'YYYY-MM-DD'), 211.76, 'RECEIVED', 'SUP005', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0081', TO_DATE('2020-06-04', 'YYYY-MM-DD'), TO_DATE('2020-06-09', 'YYYY-MM-DD'), TO_DATE('2020-06-12', 'YYYY-MM-DD'), 452.24, 'RECEIVED', 'SUP005', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0082', TO_DATE('2020-06-05', 'YYYY-MM-DD'), TO_DATE('2020-06-13', 'YYYY-MM-DD'), TO_DATE('2020-06-19', 'YYYY-MM-DD'), 1615.57, 'RECEIVED', 'SUP010', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0083', TO_DATE('2020-06-05', 'YYYY-MM-DD'), TO_DATE('2020-06-08', 'YYYY-MM-DD'), TO_DATE('2020-06-06', 'YYYY-MM-DD'), 781.12, 'RECEIVED', 'SUP001', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0084', TO_DATE('2020-06-15', 'YYYY-MM-DD'), TO_DATE('2020-06-23', 'YYYY-MM-DD'), TO_DATE('2020-06-24', 'YYYY-MM-DD'), 911.46, 'RECEIVED', 'SUP009', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0085', TO_DATE('2020-06-16', 'YYYY-MM-DD'), TO_DATE('2020-06-21', 'YYYY-MM-DD'), TO_DATE('2020-06-23', 'YYYY-MM-DD'), 1360.52, 'RECEIVED', 'SUP007', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0086', TO_DATE('2020-06-17', 'YYYY-MM-DD'), TO_DATE('2020-06-20', 'YYYY-MM-DD'), TO_DATE('2020-06-19', 'YYYY-MM-DD'), 228.64, 'RECEIVED', 'SUP001', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0087', TO_DATE('2020-06-17', 'YYYY-MM-DD'), TO_DATE('2020-06-20', 'YYYY-MM-DD'), TO_DATE('2020-06-20', 'YYYY-MM-DD'), 559.82, 'RECEIVED', 'SUP003', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0088', TO_DATE('2020-06-21', 'YYYY-MM-DD'), TO_DATE('2020-06-24', 'YYYY-MM-DD'), TO_DATE('2020-06-22', 'YYYY-MM-DD'), 1163.63, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0089', TO_DATE('2020-07-01', 'YYYY-MM-DD'), TO_DATE('2020-07-04', 'YYYY-MM-DD'), TO_DATE('2020-07-02', 'YYYY-MM-DD'), 5172.32, 'RECEIVED', 'SUP002', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0090', TO_DATE('2020-07-01', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), 8428.91, 'RECEIVED', 'SUP007', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0091', TO_DATE('2020-07-01', 'YYYY-MM-DD'), TO_DATE('2020-07-04', 'YYYY-MM-DD'), TO_DATE('2020-07-03', 'YYYY-MM-DD'), 6514.82, 'RECEIVED', 'SUP001', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0092', TO_DATE('2020-07-01', 'YYYY-MM-DD'), TO_DATE('2020-07-04', 'YYYY-MM-DD'), TO_DATE('2020-07-04', 'YYYY-MM-DD'), 4218.64, 'RECEIVED', 'SUP003', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0093', TO_DATE('2020-07-01', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), TO_DATE('2020-07-09', 'YYYY-MM-DD'), 1702.4, 'RECEIVED', 'SUP004', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0094', TO_DATE('2020-07-02', 'YYYY-MM-DD'), TO_DATE('2020-07-05', 'YYYY-MM-DD'), TO_DATE('2020-07-05', 'YYYY-MM-DD'), 2661.82, 'RECEIVED', 'SUP003', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0095', TO_DATE('2020-07-02', 'YYYY-MM-DD'), TO_DATE('2020-07-05', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), 731.51, 'RECEIVED', 'SUP001', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0096', TO_DATE('2020-07-02', 'YYYY-MM-DD'), TO_DATE('2020-07-05', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), 4031.13, 'RECEIVED', 'SUP002', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0097', TO_DATE('2020-07-03', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), 152.11, 'RECEIVED', 'SUP001', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0098', TO_DATE('2020-07-03', 'YYYY-MM-DD'), TO_DATE('2020-07-11', 'YYYY-MM-DD'), TO_DATE('2020-07-17', 'YYYY-MM-DD'), 5301.63, 'RECEIVED', 'SUP010', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0099', TO_DATE('2020-07-04', 'YYYY-MM-DD'), TO_DATE('2020-07-07', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), 825.11, 'RECEIVED', 'SUP003', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0100', TO_DATE('2020-07-05', 'YYYY-MM-DD'), TO_DATE('2020-07-10', 'YYYY-MM-DD'), TO_DATE('2020-07-13', 'YYYY-MM-DD'), 479.84, 'RECEIVED', 'SUP006', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0101', TO_DATE('2020-07-05', 'YYYY-MM-DD'), TO_DATE('2020-07-08', 'YYYY-MM-DD'), TO_DATE('2020-07-06', 'YYYY-MM-DD'), 2811.3, 'RECEIVED', 'SUP001', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0102', TO_DATE('2020-07-05', 'YYYY-MM-DD'), TO_DATE('2020-07-08', 'YYYY-MM-DD'), TO_DATE('2020-07-07', 'YYYY-MM-DD'), 1377.32, 'RECEIVED', 'SUP002', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0103', TO_DATE('2020-07-06', 'YYYY-MM-DD'), TO_DATE('2020-07-14', 'YYYY-MM-DD'), TO_DATE('2020-07-16', 'YYYY-MM-DD'), 862.98, 'RECEIVED', 'SUP010', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0104', TO_DATE('2020-07-11', 'YYYY-MM-DD'), TO_DATE('2020-07-14', 'YYYY-MM-DD'), TO_DATE('2020-07-13', 'YYYY-MM-DD'), 1222.29, 'RECEIVED', 'SUP002', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0105', TO_DATE('2020-07-17', 'YYYY-MM-DD'), TO_DATE('2020-07-22', 'YYYY-MM-DD'), TO_DATE('2020-07-24', 'YYYY-MM-DD'), 3006.06, 'RECEIVED', 'SUP005', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0106', TO_DATE('2020-07-20', 'YYYY-MM-DD'), TO_DATE('2020-07-25', 'YYYY-MM-DD'), TO_DATE('2020-07-25', 'YYYY-MM-DD'), 1741.09, 'RECEIVED', 'SUP006', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0107', TO_DATE('2020-07-20', 'YYYY-MM-DD'), TO_DATE('2020-07-25', 'YYYY-MM-DD'), TO_DATE('2020-07-27', 'YYYY-MM-DD'), 2514.93, 'RECEIVED', 'SUP004', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0108', TO_DATE('2020-07-21', 'YYYY-MM-DD'), TO_DATE('2020-07-26', 'YYYY-MM-DD'), TO_DATE('2020-07-25', 'YYYY-MM-DD'), 255.56, 'RECEIVED', 'SUP005', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0109', TO_DATE('2020-07-29', 'YYYY-MM-DD'), TO_DATE('2020-08-03', 'YYYY-MM-DD'), TO_DATE('2020-08-03', 'YYYY-MM-DD'), 363.63, 'RECEIVED', 'SUP007', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0110', TO_DATE('2020-08-08', 'YYYY-MM-DD'), TO_DATE('2020-08-16', 'YYYY-MM-DD'), TO_DATE('2020-08-18', 'YYYY-MM-DD'), 1105.58, 'RECEIVED', 'SUP009', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0111', TO_DATE('2020-08-10', 'YYYY-MM-DD'), TO_DATE('2020-08-13', 'YYYY-MM-DD'), TO_DATE('2020-08-11', 'YYYY-MM-DD'), 1345.59, 'RECEIVED', 'SUP003', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0112', TO_DATE('2020-08-11', 'YYYY-MM-DD'), TO_DATE('2020-08-14', 'YYYY-MM-DD'), TO_DATE('2020-08-13', 'YYYY-MM-DD'), 1681.37, 'RECEIVED', 'SUP002', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0113', TO_DATE('2020-08-11', 'YYYY-MM-DD'), TO_DATE('2020-08-19', 'YYYY-MM-DD'), TO_DATE('2020-08-25', 'YYYY-MM-DD'), 2076.67, 'RECEIVED', 'SUP010', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0114', TO_DATE('2020-08-13', 'YYYY-MM-DD'), TO_DATE('2020-08-16', 'YYYY-MM-DD'), TO_DATE('2020-08-15', 'YYYY-MM-DD'), 262.08, 'RECEIVED', 'SUP001', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0115', TO_DATE('2020-08-16', 'YYYY-MM-DD'), TO_DATE('2020-08-19', 'YYYY-MM-DD'), TO_DATE('2020-08-17', 'YYYY-MM-DD'), 287.27, 'RECEIVED', 'SUP001', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0116', TO_DATE('2020-08-21', 'YYYY-MM-DD'), TO_DATE('2020-08-24', 'YYYY-MM-DD'), TO_DATE('2020-08-23', 'YYYY-MM-DD'), 437.0, 'RECEIVED', 'SUP002', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0117', TO_DATE('2020-08-25', 'YYYY-MM-DD'), TO_DATE('2020-08-28', 'YYYY-MM-DD'), TO_DATE('2020-08-26', 'YYYY-MM-DD'), 1114.2, 'RECEIVED', 'SUP003', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0118', TO_DATE('2020-08-27', 'YYYY-MM-DD'), TO_DATE('2020-08-30', 'YYYY-MM-DD'), TO_DATE('2020-08-28', 'YYYY-MM-DD'), 499.18, 'RECEIVED', 'SUP003', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0119', TO_DATE('2020-08-29', 'YYYY-MM-DD'), TO_DATE('2020-09-06', 'YYYY-MM-DD'), TO_DATE('2020-09-10', 'YYYY-MM-DD'), 409.62, 'RECEIVED', 'SUP009', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0120', TO_DATE('2020-08-30', 'YYYY-MM-DD'), TO_DATE('2020-09-02', 'YYYY-MM-DD'), TO_DATE('2020-09-01', 'YYYY-MM-DD'), 628.91, 'RECEIVED', 'SUP002', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0121', TO_DATE('2020-09-06', 'YYYY-MM-DD'), TO_DATE('2020-09-09', 'YYYY-MM-DD'), TO_DATE('2020-09-08', 'YYYY-MM-DD'), 108.36, 'RECEIVED', 'SUP001', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0122', TO_DATE('2020-09-09', 'YYYY-MM-DD'), TO_DATE('2020-09-12', 'YYYY-MM-DD'), TO_DATE('2020-09-10', 'YYYY-MM-DD'), 232.81, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0123', TO_DATE('2020-09-13', 'YYYY-MM-DD'), TO_DATE('2020-09-16', 'YYYY-MM-DD'), TO_DATE('2020-09-14', 'YYYY-MM-DD'), 695.38, 'RECEIVED', 'SUP003', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0124', TO_DATE('2020-09-14', 'YYYY-MM-DD'), TO_DATE('2020-09-22', 'YYYY-MM-DD'), TO_DATE('2020-09-23', 'YYYY-MM-DD'), 851.1, 'RECEIVED', 'SUP009', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0125', TO_DATE('2020-09-16', 'YYYY-MM-DD'), TO_DATE('2020-09-21', 'YYYY-MM-DD'), TO_DATE('2020-09-24', 'YYYY-MM-DD'), 492.14, 'RECEIVED', 'SUP004', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0126', TO_DATE('2020-09-20', 'YYYY-MM-DD'), TO_DATE('2020-09-25', 'YYYY-MM-DD'), TO_DATE('2020-09-27', 'YYYY-MM-DD'), 1671.2, 'RECEIVED', 'SUP005', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0127', TO_DATE('2020-09-27', 'YYYY-MM-DD'), TO_DATE('2020-10-02', 'YYYY-MM-DD'), TO_DATE('2020-10-05', 'YYYY-MM-DD'), 1128.14, 'RECEIVED', 'SUP004', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0128', TO_DATE('2020-09-27', 'YYYY-MM-DD'), TO_DATE('2020-09-30', 'YYYY-MM-DD'), TO_DATE('2020-09-28', 'YYYY-MM-DD'), 72.2, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0129', TO_DATE('2020-10-02', 'YYYY-MM-DD'), TO_DATE('2020-10-07', 'YYYY-MM-DD'), TO_DATE('2020-10-08', 'YYYY-MM-DD'), 1307.15, 'RECEIVED', 'SUP006', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0130', TO_DATE('2020-10-02', 'YYYY-MM-DD'), TO_DATE('2020-10-10', 'YYYY-MM-DD'), TO_DATE('2020-10-13', 'YYYY-MM-DD'), 3514.17, 'RECEIVED', 'SUP010', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0131', TO_DATE('2020-10-02', 'YYYY-MM-DD'), TO_DATE('2020-10-05', 'YYYY-MM-DD'), TO_DATE('2020-10-06', 'YYYY-MM-DD'), 849.03, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0132', TO_DATE('2020-10-03', 'YYYY-MM-DD'), TO_DATE('2020-10-08', 'YYYY-MM-DD'), TO_DATE('2020-10-11', 'YYYY-MM-DD'), 1063.53, 'RECEIVED', 'SUP004', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0133', TO_DATE('2020-10-05', 'YYYY-MM-DD'), TO_DATE('2020-10-10', 'YYYY-MM-DD'), TO_DATE('2020-10-11', 'YYYY-MM-DD'), 894.04, 'RECEIVED', 'SUP005', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0134', TO_DATE('2020-10-05', 'YYYY-MM-DD'), TO_DATE('2020-10-10', 'YYYY-MM-DD'), TO_DATE('2020-10-09', 'YYYY-MM-DD'), 3152.32, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0135', TO_DATE('2020-10-08', 'YYYY-MM-DD'), TO_DATE('2020-10-11', 'YYYY-MM-DD'), TO_DATE('2020-10-12', 'YYYY-MM-DD'), 6518.0, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0136', TO_DATE('2020-10-09', 'YYYY-MM-DD'), TO_DATE('2020-10-17', 'YYYY-MM-DD'), TO_DATE('2020-10-21', 'YYYY-MM-DD'), 685.88, 'RECEIVED', 'SUP008', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0137', TO_DATE('2020-10-14', 'YYYY-MM-DD'), TO_DATE('2020-10-19', 'YYYY-MM-DD'), TO_DATE('2020-10-18', 'YYYY-MM-DD'), 121.91, 'RECEIVED', 'SUP007', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0138', TO_DATE('2020-10-21', 'YYYY-MM-DD'), TO_DATE('2020-10-24', 'YYYY-MM-DD'), TO_DATE('2020-10-22', 'YYYY-MM-DD'), 151.5, 'RECEIVED', 'SUP001', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0139', TO_DATE('2020-10-23', 'YYYY-MM-DD'), TO_DATE('2020-10-31', 'YYYY-MM-DD'), TO_DATE('2020-11-02', 'YYYY-MM-DD'), 2329.7, 'RECEIVED', 'SUP010', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0140', TO_DATE('2020-10-24', 'YYYY-MM-DD'), TO_DATE('2020-10-29', 'YYYY-MM-DD'), TO_DATE('2020-10-31', 'YYYY-MM-DD'), 2472.09, 'RECEIVED', 'SUP005', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0141', TO_DATE('2020-10-24', 'YYYY-MM-DD'), TO_DATE('2020-10-27', 'YYYY-MM-DD'), TO_DATE('2020-10-26', 'YYYY-MM-DD'), 203.72, 'RECEIVED', 'SUP002', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0142', TO_DATE('2020-11-01', 'YYYY-MM-DD'), TO_DATE('2020-11-06', 'YYYY-MM-DD'), TO_DATE('2020-11-06', 'YYYY-MM-DD'), 2018.35, 'RECEIVED', 'SUP007', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0143', TO_DATE('2020-11-02', 'YYYY-MM-DD'), TO_DATE('2020-11-05', 'YYYY-MM-DD'), TO_DATE('2020-11-05', 'YYYY-MM-DD'), 676.92, 'RECEIVED', 'SUP003', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0144', TO_DATE('2020-11-06', 'YYYY-MM-DD'), TO_DATE('2020-11-09', 'YYYY-MM-DD'), TO_DATE('2020-11-09', 'YYYY-MM-DD'), 656.5, 'RECEIVED', 'SUP001', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0145', TO_DATE('2020-11-09', 'YYYY-MM-DD'), TO_DATE('2020-11-14', 'YYYY-MM-DD'), TO_DATE('2020-11-14', 'YYYY-MM-DD'), 1046.2, 'RECEIVED', 'SUP006', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0146', TO_DATE('2020-11-13', 'YYYY-MM-DD'), TO_DATE('2020-11-18', 'YYYY-MM-DD'), TO_DATE('2020-11-19', 'YYYY-MM-DD'), 322.54, 'RECEIVED', 'SUP006', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0147', TO_DATE('2020-11-15', 'YYYY-MM-DD'), TO_DATE('2020-11-23', 'YYYY-MM-DD'), TO_DATE('2020-11-28', 'YYYY-MM-DD'), 695.89, 'RECEIVED', 'SUP008', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0148', TO_DATE('2020-11-15', 'YYYY-MM-DD'), TO_DATE('2020-11-20', 'YYYY-MM-DD'), TO_DATE('2020-11-19', 'YYYY-MM-DD'), 365.41, 'RECEIVED', 'SUP007', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0149', TO_DATE('2020-11-16', 'YYYY-MM-DD'), TO_DATE('2020-11-21', 'YYYY-MM-DD'), TO_DATE('2020-11-23', 'YYYY-MM-DD'), 261.42, 'RECEIVED', 'SUP005', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0150', TO_DATE('2020-11-16', 'YYYY-MM-DD'), TO_DATE('2020-11-19', 'YYYY-MM-DD'), TO_DATE('2020-11-17', 'YYYY-MM-DD'), 2549.34, 'RECEIVED', 'SUP002', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0151', TO_DATE('2020-11-18', 'YYYY-MM-DD'), TO_DATE('2020-11-23', 'YYYY-MM-DD'), TO_DATE('2020-11-26', 'YYYY-MM-DD'), 100.08, 'RECEIVED', 'SUP006', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0152', TO_DATE('2020-11-19', 'YYYY-MM-DD'), TO_DATE('2020-11-22', 'YYYY-MM-DD'), TO_DATE('2020-11-22', 'YYYY-MM-DD'), 155.82, 'RECEIVED', 'SUP002', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0153', TO_DATE('2020-11-27', 'YYYY-MM-DD'), TO_DATE('2020-12-02', 'YYYY-MM-DD'), TO_DATE('2020-12-02', 'YYYY-MM-DD'), 502.82, 'RECEIVED', 'SUP004', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0154', TO_DATE('2020-11-30', 'YYYY-MM-DD'), TO_DATE('2020-12-03', 'YYYY-MM-DD'), TO_DATE('2020-12-04', 'YYYY-MM-DD'), 1771.38, 'RECEIVED', 'SUP001', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0155', TO_DATE('2020-12-01', 'YYYY-MM-DD'), TO_DATE('2020-12-09', 'YYYY-MM-DD'), TO_DATE('2020-12-10', 'YYYY-MM-DD'), 134.2, 'RECEIVED', 'SUP008', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0156', TO_DATE('2020-12-02', 'YYYY-MM-DD'), TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-06', 'YYYY-MM-DD'), 710.9, 'RECEIVED', 'SUP007', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0157', TO_DATE('2020-12-06', 'YYYY-MM-DD'), TO_DATE('2020-12-11', 'YYYY-MM-DD'), TO_DATE('2020-12-11', 'YYYY-MM-DD'), 1367.75, 'RECEIVED', 'SUP007', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0158', TO_DATE('2020-12-07', 'YYYY-MM-DD'), TO_DATE('2020-12-10', 'YYYY-MM-DD'), TO_DATE('2020-12-09', 'YYYY-MM-DD'), 1337.21, 'RECEIVED', 'SUP002', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0159', TO_DATE('2020-12-09', 'YYYY-MM-DD'), TO_DATE('2020-12-14', 'YYYY-MM-DD'), TO_DATE('2020-12-14', 'YYYY-MM-DD'), 619.92, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0160', TO_DATE('2020-12-11', 'YYYY-MM-DD'), TO_DATE('2020-12-19', 'YYYY-MM-DD'), TO_DATE('2020-12-21', 'YYYY-MM-DD'), 84.4, 'RECEIVED', 'SUP008', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0161', TO_DATE('2020-12-12', 'YYYY-MM-DD'), TO_DATE('2020-12-20', 'YYYY-MM-DD'), TO_DATE('2020-12-24', 'YYYY-MM-DD'), 1554.48, 'RECEIVED', 'SUP008', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0162', TO_DATE('2020-12-12', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), 191.75, 'RECEIVED', 'SUP004', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0163', TO_DATE('2020-12-13', 'YYYY-MM-DD'), TO_DATE('2020-12-18', 'YYYY-MM-DD'), TO_DATE('2020-12-20', 'YYYY-MM-DD'), 899.47, 'RECEIVED', 'SUP004', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0164', TO_DATE('2020-12-13', 'YYYY-MM-DD'), TO_DATE('2020-12-18', 'YYYY-MM-DD'), TO_DATE('2020-12-17', 'YYYY-MM-DD'), 563.02, 'RECEIVED', 'SUP007', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0165', TO_DATE('2020-12-17', 'YYYY-MM-DD'), TO_DATE('2020-12-22', 'YYYY-MM-DD'), TO_DATE('2020-12-25', 'YYYY-MM-DD'), 343.03, 'RECEIVED', 'SUP004', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0166', TO_DATE('2020-12-20', 'YYYY-MM-DD'), TO_DATE('2020-12-23', 'YYYY-MM-DD'), TO_DATE('2020-12-24', 'YYYY-MM-DD'), 1540.89, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0167', TO_DATE('2020-12-22', 'YYYY-MM-DD'), TO_DATE('2020-12-25', 'YYYY-MM-DD'), TO_DATE('2020-12-23', 'YYYY-MM-DD'), 1339.77, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0168', TO_DATE('2020-12-23', 'YYYY-MM-DD'), TO_DATE('2020-12-31', 'YYYY-MM-DD'), TO_DATE('2021-01-03', 'YYYY-MM-DD'), 691.86, 'RECEIVED', 'SUP010', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0169', TO_DATE('2020-12-25', 'YYYY-MM-DD'), TO_DATE('2021-01-02', 'YYYY-MM-DD'), TO_DATE('2021-01-06', 'YYYY-MM-DD'), 487.3, 'RECEIVED', 'SUP009', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0170', TO_DATE('2020-12-26', 'YYYY-MM-DD'), TO_DATE('2020-12-29', 'YYYY-MM-DD'), TO_DATE('2020-12-30', 'YYYY-MM-DD'), 151.55, 'RECEIVED', 'SUP001', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0171', TO_DATE('2020-12-28', 'YYYY-MM-DD'), TO_DATE('2021-01-02', 'YYYY-MM-DD'), TO_DATE('2021-01-02', 'YYYY-MM-DD'), 711.91, 'RECEIVED', 'SUP006', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0172', TO_DATE('2020-12-28', 'YYYY-MM-DD'), TO_DATE('2020-12-31', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'), 91.98, 'RECEIVED', 'SUP001', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0173', TO_DATE('2020-12-30', 'YYYY-MM-DD'), TO_DATE('2021-01-07', 'YYYY-MM-DD'), TO_DATE('2021-01-10', 'YYYY-MM-DD'), 2294.21, 'RECEIVED', 'SUP009', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0174', TO_DATE('2020-12-30', 'YYYY-MM-DD'), TO_DATE('2021-01-04', 'YYYY-MM-DD'), TO_DATE('2021-01-04', 'YYYY-MM-DD'), 1062.85, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0175', TO_DATE('2020-12-30', 'YYYY-MM-DD'), TO_DATE('2021-01-02', 'YYYY-MM-DD'), TO_DATE('2021-01-01', 'YYYY-MM-DD'), 240.12, 'RECEIVED', 'SUP003', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0176', TO_DATE('2021-01-02', 'YYYY-MM-DD'), TO_DATE('2021-01-05', 'YYYY-MM-DD'), TO_DATE('2021-01-04', 'YYYY-MM-DD'), 747.84, 'RECEIVED', 'SUP001', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0177', TO_DATE('2021-01-02', 'YYYY-MM-DD'), TO_DATE('2021-01-10', 'YYYY-MM-DD'), TO_DATE('2021-01-16', 'YYYY-MM-DD'), 4773.42, 'RECEIVED', 'SUP009', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0178', TO_DATE('2021-01-02', 'YYYY-MM-DD'), TO_DATE('2021-01-05', 'YYYY-MM-DD'), TO_DATE('2021-01-06', 'YYYY-MM-DD'), 454.4, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0179', TO_DATE('2021-01-03', 'YYYY-MM-DD'), TO_DATE('2021-01-06', 'YYYY-MM-DD'), TO_DATE('2021-01-05', 'YYYY-MM-DD'), 1317.78, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0180', TO_DATE('2021-01-03', 'YYYY-MM-DD'), TO_DATE('2021-01-11', 'YYYY-MM-DD'), TO_DATE('2021-01-16', 'YYYY-MM-DD'), 381.29, 'RECEIVED', 'SUP009', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0181', TO_DATE('2021-01-05', 'YYYY-MM-DD'), TO_DATE('2021-01-13', 'YYYY-MM-DD'), TO_DATE('2021-01-16', 'YYYY-MM-DD'), 2021.61, 'RECEIVED', 'SUP010', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0182', TO_DATE('2021-01-05', 'YYYY-MM-DD'), TO_DATE('2021-01-08', 'YYYY-MM-DD'), TO_DATE('2021-01-07', 'YYYY-MM-DD'), 1092.19, 'RECEIVED', 'SUP003', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0183', TO_DATE('2021-01-08', 'YYYY-MM-DD'), TO_DATE('2021-01-13', 'YYYY-MM-DD'), TO_DATE('2021-01-16', 'YYYY-MM-DD'), 741.12, 'RECEIVED', 'SUP005', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0184', TO_DATE('2021-01-11', 'YYYY-MM-DD'), TO_DATE('2021-01-16', 'YYYY-MM-DD'), TO_DATE('2021-01-17', 'YYYY-MM-DD'), 989.84, 'RECEIVED', 'SUP007', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0185', TO_DATE('2021-01-11', 'YYYY-MM-DD'), TO_DATE('2021-01-19', 'YYYY-MM-DD'), TO_DATE('2021-01-23', 'YYYY-MM-DD'), 571.4, 'RECEIVED', 'SUP009', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0186', TO_DATE('2021-01-12', 'YYYY-MM-DD'), TO_DATE('2021-01-17', 'YYYY-MM-DD'), TO_DATE('2021-01-20', 'YYYY-MM-DD'), 129.96, 'RECEIVED', 'SUP004', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0187', TO_DATE('2021-01-20', 'YYYY-MM-DD'), TO_DATE('2021-01-23', 'YYYY-MM-DD'), TO_DATE('2021-01-23', 'YYYY-MM-DD'), 364.68, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0188', TO_DATE('2021-01-20', 'YYYY-MM-DD'), TO_DATE('2021-01-28', 'YYYY-MM-DD'), TO_DATE('2021-02-01', 'YYYY-MM-DD'), 328.25, 'RECEIVED', 'SUP010', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0189', TO_DATE('2021-01-21', 'YYYY-MM-DD'), TO_DATE('2021-01-24', 'YYYY-MM-DD'), TO_DATE('2021-01-22', 'YYYY-MM-DD'), 234.4, 'RECEIVED', 'SUP001', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0190', TO_DATE('2021-01-22', 'YYYY-MM-DD'), TO_DATE('2021-01-27', 'YYYY-MM-DD'), TO_DATE('2021-01-28', 'YYYY-MM-DD'), 618.88, 'RECEIVED', 'SUP004', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0191', TO_DATE('2021-01-25', 'YYYY-MM-DD'), TO_DATE('2021-01-30', 'YYYY-MM-DD'), TO_DATE('2021-02-01', 'YYYY-MM-DD'), 207.04, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0192', TO_DATE('2021-01-26', 'YYYY-MM-DD'), TO_DATE('2021-02-03', 'YYYY-MM-DD'), NULL, 684.0, 'CANCELLED', 'SUP008', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0193', TO_DATE('2021-01-27', 'YYYY-MM-DD'), TO_DATE('2021-02-01', 'YYYY-MM-DD'), TO_DATE('2021-02-03', 'YYYY-MM-DD'), 498.57, 'RECEIVED', 'SUP006', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0194', TO_DATE('2021-01-27', 'YYYY-MM-DD'), TO_DATE('2021-01-30', 'YYYY-MM-DD'), TO_DATE('2021-01-31', 'YYYY-MM-DD'), 87.36, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0195', TO_DATE('2021-01-28', 'YYYY-MM-DD'), TO_DATE('2021-02-02', 'YYYY-MM-DD'), TO_DATE('2021-02-01', 'YYYY-MM-DD'), 29.1, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0196', TO_DATE('2021-01-30', 'YYYY-MM-DD'), TO_DATE('2021-02-04', 'YYYY-MM-DD'), TO_DATE('2021-02-07', 'YYYY-MM-DD'), 964.22, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0197', TO_DATE('2021-02-03', 'YYYY-MM-DD'), TO_DATE('2021-02-06', 'YYYY-MM-DD'), TO_DATE('2021-02-04', 'YYYY-MM-DD'), 265.02, 'RECEIVED', 'SUP003', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0198', TO_DATE('2021-02-03', 'YYYY-MM-DD'), TO_DATE('2021-02-11', 'YYYY-MM-DD'), TO_DATE('2021-02-14', 'YYYY-MM-DD'), 213.28, 'RECEIVED', 'SUP009', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0199', TO_DATE('2021-02-04', 'YYYY-MM-DD'), TO_DATE('2021-02-09', 'YYYY-MM-DD'), TO_DATE('2021-02-08', 'YYYY-MM-DD'), 254.43, 'RECEIVED', 'SUP006', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0200', TO_DATE('2021-02-07', 'YYYY-MM-DD'), TO_DATE('2021-02-12', 'YYYY-MM-DD'), NULL, 811.85, 'CANCELLED', 'SUP007', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0201', TO_DATE('2021-02-07', 'YYYY-MM-DD'), TO_DATE('2021-02-12', 'YYYY-MM-DD'), TO_DATE('2021-02-11', 'YYYY-MM-DD'), 623.6, 'RECEIVED', 'SUP005', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0202', TO_DATE('2021-02-08', 'YYYY-MM-DD'), TO_DATE('2021-02-16', 'YYYY-MM-DD'), TO_DATE('2021-02-17', 'YYYY-MM-DD'), 767.46, 'RECEIVED', 'SUP011', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0203', TO_DATE('2021-02-09', 'YYYY-MM-DD'), TO_DATE('2021-02-12', 'YYYY-MM-DD'), TO_DATE('2021-02-13', 'YYYY-MM-DD'), 187.77, 'RECEIVED', 'SUP001', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0204', TO_DATE('2021-02-09', 'YYYY-MM-DD'), TO_DATE('2021-02-17', 'YYYY-MM-DD'), TO_DATE('2021-02-22', 'YYYY-MM-DD'), 236.79, 'RECEIVED', 'SUP008', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0205', TO_DATE('2021-02-09', 'YYYY-MM-DD'), TO_DATE('2021-02-14', 'YYYY-MM-DD'), TO_DATE('2021-02-13', 'YYYY-MM-DD'), 811.85, 'RECEIVED', 'SUP007', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0206', TO_DATE('2021-02-11', 'YYYY-MM-DD'), TO_DATE('2021-02-14', 'YYYY-MM-DD'), TO_DATE('2021-02-14', 'YYYY-MM-DD'), 638.4, 'RECEIVED', 'SUP001', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0207', TO_DATE('2021-02-13', 'YYYY-MM-DD'), TO_DATE('2021-02-21', 'YYYY-MM-DD'), TO_DATE('2021-02-25', 'YYYY-MM-DD'), 203.46, 'RECEIVED', 'SUP010', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0208', TO_DATE('2021-02-15', 'YYYY-MM-DD'), TO_DATE('2021-02-20', 'YYYY-MM-DD'), TO_DATE('2021-02-23', 'YYYY-MM-DD'), 578.67, 'RECEIVED', 'SUP006', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0209', TO_DATE('2021-02-17', 'YYYY-MM-DD'), TO_DATE('2021-02-22', 'YYYY-MM-DD'), TO_DATE('2021-02-22', 'YYYY-MM-DD'), 957.47, 'RECEIVED', 'SUP006', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0210', TO_DATE('2021-02-21', 'YYYY-MM-DD'), TO_DATE('2021-02-26', 'YYYY-MM-DD'), TO_DATE('2021-02-28', 'YYYY-MM-DD'), 222.42, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0211', TO_DATE('2021-02-26', 'YYYY-MM-DD'), TO_DATE('2021-03-06', 'YYYY-MM-DD'), TO_DATE('2021-03-09', 'YYYY-MM-DD'), 1184.45, 'RECEIVED', 'SUP010', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0212', TO_DATE('2021-02-26', 'YYYY-MM-DD'), TO_DATE('2021-03-06', 'YYYY-MM-DD'), TO_DATE('2021-03-12', 'YYYY-MM-DD'), 1548.41, 'RECEIVED', 'SUP008', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0213', TO_DATE('2021-03-02', 'YYYY-MM-DD'), TO_DATE('2021-03-07', 'YYYY-MM-DD'), TO_DATE('2021-03-07', 'YYYY-MM-DD'), 49.6, 'RECEIVED', 'SUP007', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0214', TO_DATE('2021-03-09', 'YYYY-MM-DD'), TO_DATE('2021-03-14', 'YYYY-MM-DD'), TO_DATE('2021-03-16', 'YYYY-MM-DD'), 730.7, 'RECEIVED', 'SUP007', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0215', TO_DATE('2021-03-12', 'YYYY-MM-DD'), TO_DATE('2021-03-17', 'YYYY-MM-DD'), TO_DATE('2021-03-20', 'YYYY-MM-DD'), 1302.35, 'RECEIVED', 'SUP005', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0216', TO_DATE('2021-03-21', 'YYYY-MM-DD'), TO_DATE('2021-03-26', 'YYYY-MM-DD'), TO_DATE('2021-03-25', 'YYYY-MM-DD'), 2444.58, 'RECEIVED', 'SUP004', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0217', TO_DATE('2021-03-22', 'YYYY-MM-DD'), TO_DATE('2021-03-25', 'YYYY-MM-DD'), TO_DATE('2021-03-26', 'YYYY-MM-DD'), 739.38, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0218', TO_DATE('2021-03-23', 'YYYY-MM-DD'), TO_DATE('2021-03-28', 'YYYY-MM-DD'), TO_DATE('2021-03-27', 'YYYY-MM-DD'), 211.06, 'RECEIVED', 'SUP006', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0219', TO_DATE('2021-03-24', 'YYYY-MM-DD'), TO_DATE('2021-04-01', 'YYYY-MM-DD'), TO_DATE('2021-04-02', 'YYYY-MM-DD'), 443.3, 'RECEIVED', 'SUP010', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0220', TO_DATE('2021-04-03', 'YYYY-MM-DD'), TO_DATE('2021-04-06', 'YYYY-MM-DD'), TO_DATE('2021-04-05', 'YYYY-MM-DD'), 2638.9, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0221', TO_DATE('2021-04-04', 'YYYY-MM-DD'), TO_DATE('2021-04-07', 'YYYY-MM-DD'), TO_DATE('2021-04-06', 'YYYY-MM-DD'), 915.27, 'RECEIVED', 'SUP002', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0222', TO_DATE('2021-04-04', 'YYYY-MM-DD'), TO_DATE('2021-04-09', 'YYYY-MM-DD'), TO_DATE('2021-04-12', 'YYYY-MM-DD'), 845.86, 'RECEIVED', 'SUP007', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0223', TO_DATE('2021-04-05', 'YYYY-MM-DD'), TO_DATE('2021-04-10', 'YYYY-MM-DD'), TO_DATE('2021-04-13', 'YYYY-MM-DD'), 1753.97, 'RECEIVED', 'SUP005', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0224', TO_DATE('2021-04-07', 'YYYY-MM-DD'), TO_DATE('2021-04-10', 'YYYY-MM-DD'), TO_DATE('2021-04-11', 'YYYY-MM-DD'), 587.19, 'RECEIVED', 'SUP003', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0225', TO_DATE('2021-04-07', 'YYYY-MM-DD'), TO_DATE('2021-04-12', 'YYYY-MM-DD'), TO_DATE('2021-04-13', 'YYYY-MM-DD'), 522.84, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0226', TO_DATE('2021-04-10', 'YYYY-MM-DD'), TO_DATE('2021-04-15', 'YYYY-MM-DD'), TO_DATE('2021-04-18', 'YYYY-MM-DD'), 443.19, 'RECEIVED', 'SUP006', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0227', TO_DATE('2021-04-12', 'YYYY-MM-DD'), TO_DATE('2021-04-15', 'YYYY-MM-DD'), TO_DATE('2021-04-13', 'YYYY-MM-DD'), 643.58, 'RECEIVED', 'SUP003', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0228', TO_DATE('2021-04-13', 'YYYY-MM-DD'), TO_DATE('2021-04-16', 'YYYY-MM-DD'), TO_DATE('2021-04-16', 'YYYY-MM-DD'), 275.98, 'RECEIVED', 'SUP001', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0229', TO_DATE('2021-04-20', 'YYYY-MM-DD'), TO_DATE('2021-04-25', 'YYYY-MM-DD'), TO_DATE('2021-04-27', 'YYYY-MM-DD'), 320.32, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0230', TO_DATE('2021-04-23', 'YYYY-MM-DD'), TO_DATE('2021-05-01', 'YYYY-MM-DD'), TO_DATE('2021-05-06', 'YYYY-MM-DD'), 105.2, 'RECEIVED', 'SUP009', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0231', TO_DATE('2021-04-24', 'YYYY-MM-DD'), TO_DATE('2021-04-27', 'YYYY-MM-DD'), TO_DATE('2021-04-27', 'YYYY-MM-DD'), 231.74, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0232', TO_DATE('2021-04-25', 'YYYY-MM-DD'), TO_DATE('2021-04-28', 'YYYY-MM-DD'), TO_DATE('2021-04-26', 'YYYY-MM-DD'), 882.04, 'RECEIVED', 'SUP003', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0233', TO_DATE('2021-04-27', 'YYYY-MM-DD'), TO_DATE('2021-04-30', 'YYYY-MM-DD'), TO_DATE('2021-04-29', 'YYYY-MM-DD'), 1066.62, 'RECEIVED', 'SUP002', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0234', TO_DATE('2021-05-02', 'YYYY-MM-DD'), TO_DATE('2021-05-10', 'YYYY-MM-DD'), TO_DATE('2021-05-11', 'YYYY-MM-DD'), 1572.61, 'RECEIVED', 'SUP010', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0235', TO_DATE('2021-05-02', 'YYYY-MM-DD'), TO_DATE('2021-05-07', 'YYYY-MM-DD'), NULL, 165.9, 'CANCELLED', 'SUP004', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0236', TO_DATE('2021-05-05', 'YYYY-MM-DD'), TO_DATE('2021-05-10', 'YYYY-MM-DD'), TO_DATE('2021-05-09', 'YYYY-MM-DD'), 165.9, 'RECEIVED', 'SUP004', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0237', TO_DATE('2021-05-06', 'YYYY-MM-DD'), TO_DATE('2021-05-09', 'YYYY-MM-DD'), TO_DATE('2021-05-09', 'YYYY-MM-DD'), 1200.19, 'RECEIVED', 'SUP002', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0238', TO_DATE('2021-05-09', 'YYYY-MM-DD'), TO_DATE('2021-05-14', 'YYYY-MM-DD'), TO_DATE('2021-05-13', 'YYYY-MM-DD'), 63.8, 'RECEIVED', 'SUP005', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0239', TO_DATE('2021-05-10', 'YYYY-MM-DD'), TO_DATE('2021-05-13', 'YYYY-MM-DD'), TO_DATE('2021-05-11', 'YYYY-MM-DD'), 869.28, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0240', TO_DATE('2021-05-10', 'YYYY-MM-DD'), TO_DATE('2021-05-13', 'YYYY-MM-DD'), TO_DATE('2021-05-12', 'YYYY-MM-DD'), 33.54, 'RECEIVED', 'SUP003', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0241', TO_DATE('2021-05-11', 'YYYY-MM-DD'), TO_DATE('2021-05-16', 'YYYY-MM-DD'), TO_DATE('2021-05-16', 'YYYY-MM-DD'), 1288.49, 'RECEIVED', 'SUP004', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0242', TO_DATE('2021-05-20', 'YYYY-MM-DD'), TO_DATE('2021-05-23', 'YYYY-MM-DD'), TO_DATE('2021-05-21', 'YYYY-MM-DD'), 72.89, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0243', TO_DATE('2021-05-22', 'YYYY-MM-DD'), TO_DATE('2021-05-27', 'YYYY-MM-DD'), TO_DATE('2021-05-26', 'YYYY-MM-DD'), 209.04, 'RECEIVED', 'SUP007', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0244', TO_DATE('2021-05-23', 'YYYY-MM-DD'), TO_DATE('2021-05-28', 'YYYY-MM-DD'), TO_DATE('2021-05-28', 'YYYY-MM-DD'), 1895.78, 'RECEIVED', 'SUP006', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0245', TO_DATE('2021-05-25', 'YYYY-MM-DD'), TO_DATE('2021-05-28', 'YYYY-MM-DD'), TO_DATE('2021-05-28', 'YYYY-MM-DD'), 874.47, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0246', TO_DATE('2021-05-25', 'YYYY-MM-DD'), TO_DATE('2021-05-28', 'YYYY-MM-DD'), TO_DATE('2021-05-26', 'YYYY-MM-DD'), 467.43, 'RECEIVED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0247', TO_DATE('2021-05-26', 'YYYY-MM-DD'), TO_DATE('2021-05-29', 'YYYY-MM-DD'), TO_DATE('2021-05-30', 'YYYY-MM-DD'), 1313.04, 'RECEIVED', 'SUP002', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0248', TO_DATE('2021-05-27', 'YYYY-MM-DD'), TO_DATE('2021-06-01', 'YYYY-MM-DD'), TO_DATE('2021-05-31', 'YYYY-MM-DD'), 121.4, 'RECEIVED', 'SUP006', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0249', TO_DATE('2021-05-29', 'YYYY-MM-DD'), TO_DATE('2021-06-06', 'YYYY-MM-DD'), TO_DATE('2021-06-07', 'YYYY-MM-DD'), 343.52, 'RECEIVED', 'SUP011', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0250', TO_DATE('2021-05-30', 'YYYY-MM-DD'), TO_DATE('2021-06-02', 'YYYY-MM-DD'), TO_DATE('2021-06-01', 'YYYY-MM-DD'), 401.74, 'RECEIVED', 'SUP002', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0251', TO_DATE('2021-05-30', 'YYYY-MM-DD'), TO_DATE('2021-06-04', 'YYYY-MM-DD'), TO_DATE('2021-06-07', 'YYYY-MM-DD'), 182.61, 'RECEIVED', 'SUP005', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0252', TO_DATE('2021-06-01', 'YYYY-MM-DD'), TO_DATE('2021-06-06', 'YYYY-MM-DD'), TO_DATE('2021-06-07', 'YYYY-MM-DD'), 785.0, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0253', TO_DATE('2021-06-03', 'YYYY-MM-DD'), TO_DATE('2021-06-08', 'YYYY-MM-DD'), TO_DATE('2021-06-08', 'YYYY-MM-DD'), 5044.18, 'RECEIVED', 'SUP005', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0254', TO_DATE('2021-06-05', 'YYYY-MM-DD'), TO_DATE('2021-06-10', 'YYYY-MM-DD'), TO_DATE('2021-06-10', 'YYYY-MM-DD'), 911.59, 'RECEIVED', 'SUP004', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0255', TO_DATE('2021-06-06', 'YYYY-MM-DD'), TO_DATE('2021-06-11', 'YYYY-MM-DD'), TO_DATE('2021-06-14', 'YYYY-MM-DD'), 479.92, 'RECEIVED', 'SUP006', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0256', TO_DATE('2021-06-08', 'YYYY-MM-DD'), TO_DATE('2021-06-11', 'YYYY-MM-DD'), TO_DATE('2021-06-12', 'YYYY-MM-DD'), 249.59, 'RECEIVED', 'SUP001', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0257', TO_DATE('2021-06-08', 'YYYY-MM-DD'), TO_DATE('2021-06-11', 'YYYY-MM-DD'), TO_DATE('2021-06-12', 'YYYY-MM-DD'), 55.04, 'RECEIVED', 'SUP002', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0258', TO_DATE('2021-06-09', 'YYYY-MM-DD'), TO_DATE('2021-06-14', 'YYYY-MM-DD'), TO_DATE('2021-06-14', 'YYYY-MM-DD'), 5199.38, 'RECEIVED', 'SUP004', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0259', TO_DATE('2021-06-10', 'YYYY-MM-DD'), TO_DATE('2021-06-15', 'YYYY-MM-DD'), TO_DATE('2021-06-14', 'YYYY-MM-DD'), 1288.08, 'RECEIVED', 'SUP006', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0260', TO_DATE('2021-06-11', 'YYYY-MM-DD'), TO_DATE('2021-06-14', 'YYYY-MM-DD'), TO_DATE('2021-06-15', 'YYYY-MM-DD'), 581.49, 'RECEIVED', 'SUP003', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0261', TO_DATE('2021-06-13', 'YYYY-MM-DD'), TO_DATE('2021-06-18', 'YYYY-MM-DD'), TO_DATE('2021-06-17', 'YYYY-MM-DD'), 3135.3, 'RECEIVED', 'SUP007', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0262', TO_DATE('2021-06-20', 'YYYY-MM-DD'), TO_DATE('2021-06-23', 'YYYY-MM-DD'), TO_DATE('2021-06-23', 'YYYY-MM-DD'), 992.71, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0263', TO_DATE('2021-06-22', 'YYYY-MM-DD'), TO_DATE('2021-06-30', 'YYYY-MM-DD'), TO_DATE('2021-07-04', 'YYYY-MM-DD'), 5919.21, 'RECEIVED', 'SUP009', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0264', TO_DATE('2021-06-25', 'YYYY-MM-DD'), TO_DATE('2021-06-28', 'YYYY-MM-DD'), TO_DATE('2021-06-27', 'YYYY-MM-DD'), 340.68, 'RECEIVED', 'SUP003', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0265', TO_DATE('2021-06-26', 'YYYY-MM-DD'), TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_DATE('2021-07-02', 'YYYY-MM-DD'), 950.47, 'RECEIVED', 'SUP005', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0266', TO_DATE('2021-06-28', 'YYYY-MM-DD'), TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_DATE('2021-06-29', 'YYYY-MM-DD'), 440.27, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0267', TO_DATE('2021-06-30', 'YYYY-MM-DD'), TO_DATE('2021-07-03', 'YYYY-MM-DD'), TO_DATE('2021-07-04', 'YYYY-MM-DD'), 1207.18, 'RECEIVED', 'SUP001', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0268', TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_DATE('2021-07-06', 'YYYY-MM-DD'), TO_DATE('2021-07-08', 'YYYY-MM-DD'), 273.33, 'RECEIVED', 'SUP007', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0269', TO_DATE('2021-07-03', 'YYYY-MM-DD'), TO_DATE('2021-07-06', 'YYYY-MM-DD'), TO_DATE('2021-07-06', 'YYYY-MM-DD'), 5305.21, 'RECEIVED', 'SUP003', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0270', TO_DATE('2021-07-05', 'YYYY-MM-DD'), TO_DATE('2021-07-08', 'YYYY-MM-DD'), TO_DATE('2021-07-09', 'YYYY-MM-DD'), 576.35, 'RECEIVED', 'SUP003', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0271', TO_DATE('2021-07-05', 'YYYY-MM-DD'), TO_DATE('2021-07-10', 'YYYY-MM-DD'), TO_DATE('2021-07-09', 'YYYY-MM-DD'), 893.54, 'RECEIVED', 'SUP007', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0272', TO_DATE('2021-07-06', 'YYYY-MM-DD'), TO_DATE('2021-07-14', 'YYYY-MM-DD'), TO_DATE('2021-07-16', 'YYYY-MM-DD'), 299.63, 'RECEIVED', 'SUP009', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0273', TO_DATE('2021-07-08', 'YYYY-MM-DD'), TO_DATE('2021-07-13', 'YYYY-MM-DD'), TO_DATE('2021-07-12', 'YYYY-MM-DD'), 1987.4, 'RECEIVED', 'SUP005', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0274', TO_DATE('2021-07-08', 'YYYY-MM-DD'), TO_DATE('2021-07-16', 'YYYY-MM-DD'), TO_DATE('2021-07-22', 'YYYY-MM-DD'), 3055.39, 'RECEIVED', 'SUP011', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0275', TO_DATE('2021-07-08', 'YYYY-MM-DD'), TO_DATE('2021-07-16', 'YYYY-MM-DD'), TO_DATE('2021-07-17', 'YYYY-MM-DD'), 321.97, 'RECEIVED', 'SUP009', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0276', TO_DATE('2021-07-11', 'YYYY-MM-DD'), TO_DATE('2021-07-14', 'YYYY-MM-DD'), TO_DATE('2021-07-12', 'YYYY-MM-DD'), 796.38, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0277', TO_DATE('2021-07-11', 'YYYY-MM-DD'), TO_DATE('2021-07-16', 'YYYY-MM-DD'), TO_DATE('2021-07-17', 'YYYY-MM-DD'), 105.52, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0278', TO_DATE('2021-07-14', 'YYYY-MM-DD'), TO_DATE('2021-07-19', 'YYYY-MM-DD'), TO_DATE('2021-07-19', 'YYYY-MM-DD'), 270.2, 'RECEIVED', 'SUP006', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0279', TO_DATE('2021-07-14', 'YYYY-MM-DD'), TO_DATE('2021-07-17', 'YYYY-MM-DD'), TO_DATE('2021-07-18', 'YYYY-MM-DD'), 857.5, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0280', TO_DATE('2021-07-17', 'YYYY-MM-DD'), TO_DATE('2021-07-22', 'YYYY-MM-DD'), TO_DATE('2021-07-24', 'YYYY-MM-DD'), 2004.06, 'RECEIVED', 'SUP004', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0281', TO_DATE('2021-07-18', 'YYYY-MM-DD'), TO_DATE('2021-07-21', 'YYYY-MM-DD'), TO_DATE('2021-07-21', 'YYYY-MM-DD'), 4424.84, 'RECEIVED', 'SUP001', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0282', TO_DATE('2021-07-24', 'YYYY-MM-DD'), TO_DATE('2021-07-29', 'YYYY-MM-DD'), TO_DATE('2021-08-01', 'YYYY-MM-DD'), 441.66, 'RECEIVED', 'SUP004', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0283', TO_DATE('2021-08-04', 'YYYY-MM-DD'), TO_DATE('2021-08-07', 'YYYY-MM-DD'), TO_DATE('2021-08-05', 'YYYY-MM-DD'), 601.44, 'RECEIVED', 'SUP003', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0284', TO_DATE('2021-08-06', 'YYYY-MM-DD'), TO_DATE('2021-08-09', 'YYYY-MM-DD'), TO_DATE('2021-08-10', 'YYYY-MM-DD'), 467.32, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0285', TO_DATE('2021-08-07', 'YYYY-MM-DD'), TO_DATE('2021-08-12', 'YYYY-MM-DD'), TO_DATE('2021-08-12', 'YYYY-MM-DD'), 731.48, 'RECEIVED', 'SUP007', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0286', TO_DATE('2021-08-07', 'YYYY-MM-DD'), TO_DATE('2021-08-12', 'YYYY-MM-DD'), TO_DATE('2021-08-11', 'YYYY-MM-DD'), 2777.18, 'RECEIVED', 'SUP007', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0287', TO_DATE('2021-08-07', 'YYYY-MM-DD'), TO_DATE('2021-08-12', 'YYYY-MM-DD'), TO_DATE('2021-08-14', 'YYYY-MM-DD'), 300.54, 'RECEIVED', 'SUP005', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0288', TO_DATE('2021-08-08', 'YYYY-MM-DD'), TO_DATE('2021-08-13', 'YYYY-MM-DD'), TO_DATE('2021-08-14', 'YYYY-MM-DD'), 755.13, 'RECEIVED', 'SUP004', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0289', TO_DATE('2021-08-15', 'YYYY-MM-DD'), TO_DATE('2021-08-20', 'YYYY-MM-DD'), TO_DATE('2021-08-23', 'YYYY-MM-DD'), 1746.14, 'RECEIVED', 'SUP006', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0290', TO_DATE('2021-08-23', 'YYYY-MM-DD'), TO_DATE('2021-08-28', 'YYYY-MM-DD'), TO_DATE('2021-08-30', 'YYYY-MM-DD'), 333.3, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0291', TO_DATE('2021-08-25', 'YYYY-MM-DD'), TO_DATE('2021-08-30', 'YYYY-MM-DD'), TO_DATE('2021-08-29', 'YYYY-MM-DD'), 529.56, 'RECEIVED', 'SUP006', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0292', TO_DATE('2021-08-28', 'YYYY-MM-DD'), TO_DATE('2021-08-31', 'YYYY-MM-DD'), TO_DATE('2021-08-31', 'YYYY-MM-DD'), 5794.85, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0293', TO_DATE('2021-08-30', 'YYYY-MM-DD'), TO_DATE('2021-09-04', 'YYYY-MM-DD'), TO_DATE('2021-09-04', 'YYYY-MM-DD'), 1755.06, 'RECEIVED', 'SUP004', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0294', TO_DATE('2021-08-30', 'YYYY-MM-DD'), TO_DATE('2021-09-02', 'YYYY-MM-DD'), TO_DATE('2021-09-03', 'YYYY-MM-DD'), 223.36, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0295', TO_DATE('2021-08-30', 'YYYY-MM-DD'), TO_DATE('2021-09-02', 'YYYY-MM-DD'), NULL, 307.99, 'CANCELLED', 'SUP003', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0296', TO_DATE('2021-08-31', 'YYYY-MM-DD'), TO_DATE('2021-09-08', 'YYYY-MM-DD'), TO_DATE('2021-09-09', 'YYYY-MM-DD'), 185.12, 'RECEIVED', 'SUP010', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0297', TO_DATE('2021-08-31', 'YYYY-MM-DD'), TO_DATE('2021-09-03', 'YYYY-MM-DD'), TO_DATE('2021-09-03', 'YYYY-MM-DD'), 2107.17, 'RECEIVED', 'SUP002', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0298', TO_DATE('2021-08-31', 'YYYY-MM-DD'), TO_DATE('2021-09-03', 'YYYY-MM-DD'), TO_DATE('2021-09-04', 'YYYY-MM-DD'), 64.75, 'RECEIVED', 'SUP002', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0299', TO_DATE('2021-09-01', 'YYYY-MM-DD'), TO_DATE('2021-09-04', 'YYYY-MM-DD'), TO_DATE('2021-09-02', 'YYYY-MM-DD'), 117.0, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0300', TO_DATE('2021-09-04', 'YYYY-MM-DD'), TO_DATE('2021-09-07', 'YYYY-MM-DD'), TO_DATE('2021-09-08', 'YYYY-MM-DD'), 63.78, 'RECEIVED', 'SUP001', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0301', TO_DATE('2021-09-08', 'YYYY-MM-DD'), TO_DATE('2021-09-11', 'YYYY-MM-DD'), TO_DATE('2021-09-10', 'YYYY-MM-DD'), 559.09, 'RECEIVED', 'SUP003', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0302', TO_DATE('2021-09-12', 'YYYY-MM-DD'), TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2021-09-22', 'YYYY-MM-DD'), 849.7, 'RECEIVED', 'SUP010', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0303', TO_DATE('2021-09-12', 'YYYY-MM-DD'), TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2021-09-23', 'YYYY-MM-DD'), 669.14, 'RECEIVED', 'SUP010', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0304', TO_DATE('2021-09-15', 'YYYY-MM-DD'), TO_DATE('2021-09-18', 'YYYY-MM-DD'), TO_DATE('2021-09-18', 'YYYY-MM-DD'), 226.04, 'RECEIVED', 'SUP001', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0305', TO_DATE('2021-09-16', 'YYYY-MM-DD'), TO_DATE('2021-09-19', 'YYYY-MM-DD'), TO_DATE('2021-09-18', 'YYYY-MM-DD'), 1286.49, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0306', TO_DATE('2021-09-16', 'YYYY-MM-DD'), TO_DATE('2021-09-19', 'YYYY-MM-DD'), TO_DATE('2021-09-20', 'YYYY-MM-DD'), 626.32, 'RECEIVED', 'SUP003', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0307', TO_DATE('2021-09-17', 'YYYY-MM-DD'), TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2021-09-20', 'YYYY-MM-DD'), 234.0, 'RECEIVED', 'SUP003', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0308', TO_DATE('2021-09-18', 'YYYY-MM-DD'), TO_DATE('2021-09-21', 'YYYY-MM-DD'), TO_DATE('2021-09-21', 'YYYY-MM-DD'), 1203.36, 'RECEIVED', 'SUP002', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0309', TO_DATE('2021-09-18', 'YYYY-MM-DD'), TO_DATE('2021-09-23', 'YYYY-MM-DD'), TO_DATE('2021-09-26', 'YYYY-MM-DD'), 310.69, 'RECEIVED', 'SUP004', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0310', TO_DATE('2021-09-22', 'YYYY-MM-DD'), TO_DATE('2021-09-25', 'YYYY-MM-DD'), TO_DATE('2021-09-26', 'YYYY-MM-DD'), 411.24, 'RECEIVED', 'SUP002', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0311', TO_DATE('2021-09-25', 'YYYY-MM-DD'), TO_DATE('2021-09-28', 'YYYY-MM-DD'), TO_DATE('2021-09-28', 'YYYY-MM-DD'), 276.18, 'RECEIVED', 'SUP002', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0312', TO_DATE('2021-10-01', 'YYYY-MM-DD'), TO_DATE('2021-10-06', 'YYYY-MM-DD'), TO_DATE('2021-10-06', 'YYYY-MM-DD'), 5690.25, 'RECEIVED', 'SUP007', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0313', TO_DATE('2021-10-01', 'YYYY-MM-DD'), TO_DATE('2021-10-04', 'YYYY-MM-DD'), TO_DATE('2021-10-02', 'YYYY-MM-DD'), 4581.81, 'RECEIVED', 'SUP003', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0314', TO_DATE('2021-10-01', 'YYYY-MM-DD'), TO_DATE('2021-10-09', 'YYYY-MM-DD'), TO_DATE('2021-10-15', 'YYYY-MM-DD'), 901.98, 'RECEIVED', 'SUP010', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0315', TO_DATE('2021-10-01', 'YYYY-MM-DD'), TO_DATE('2021-10-09', 'YYYY-MM-DD'), TO_DATE('2021-10-14', 'YYYY-MM-DD'), 729.55, 'RECEIVED', 'SUP008', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0316', TO_DATE('2021-10-02', 'YYYY-MM-DD'), TO_DATE('2021-10-05', 'YYYY-MM-DD'), TO_DATE('2021-10-06', 'YYYY-MM-DD'), 1287.98, 'RECEIVED', 'SUP001', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0317', TO_DATE('2021-10-02', 'YYYY-MM-DD'), TO_DATE('2021-10-10', 'YYYY-MM-DD'), TO_DATE('2021-10-12', 'YYYY-MM-DD'), 1415.94, 'RECEIVED', 'SUP009', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0318', TO_DATE('2021-10-02', 'YYYY-MM-DD'), TO_DATE('2021-10-05', 'YYYY-MM-DD'), TO_DATE('2021-10-05', 'YYYY-MM-DD'), 2367.98, 'RECEIVED', 'SUP003', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0319', TO_DATE('2021-10-04', 'YYYY-MM-DD'), TO_DATE('2021-10-09', 'YYYY-MM-DD'), TO_DATE('2021-10-09', 'YYYY-MM-DD'), 1379.66, 'RECEIVED', 'SUP004', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0320', TO_DATE('2021-10-04', 'YYYY-MM-DD'), TO_DATE('2021-10-09', 'YYYY-MM-DD'), TO_DATE('2021-10-08', 'YYYY-MM-DD'), 910.81, 'RECEIVED', 'SUP005', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0321', TO_DATE('2021-10-05', 'YYYY-MM-DD'), TO_DATE('2021-10-10', 'YYYY-MM-DD'), TO_DATE('2021-10-12', 'YYYY-MM-DD'), 157.2, 'RECEIVED', 'SUP005', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0322', TO_DATE('2021-10-06', 'YYYY-MM-DD'), TO_DATE('2021-10-11', 'YYYY-MM-DD'), TO_DATE('2021-10-13', 'YYYY-MM-DD'), 2236.73, 'RECEIVED', 'SUP004', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0323', TO_DATE('2021-10-09', 'YYYY-MM-DD'), TO_DATE('2021-10-17', 'YYYY-MM-DD'), TO_DATE('2021-10-21', 'YYYY-MM-DD'), 252.58, 'RECEIVED', 'SUP009', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0324', TO_DATE('2021-10-12', 'YYYY-MM-DD'), TO_DATE('2021-10-17', 'YYYY-MM-DD'), TO_DATE('2021-10-16', 'YYYY-MM-DD'), 403.78, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0325', TO_DATE('2021-10-16', 'YYYY-MM-DD'), TO_DATE('2021-10-19', 'YYYY-MM-DD'), TO_DATE('2021-10-20', 'YYYY-MM-DD'), 434.32, 'RECEIVED', 'SUP001', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0326', TO_DATE('2021-10-17', 'YYYY-MM-DD'), TO_DATE('2021-10-25', 'YYYY-MM-DD'), TO_DATE('2021-10-27', 'YYYY-MM-DD'), 828.84, 'RECEIVED', 'SUP011', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0327', TO_DATE('2021-10-17', 'YYYY-MM-DD'), TO_DATE('2021-10-20', 'YYYY-MM-DD'), TO_DATE('2021-10-20', 'YYYY-MM-DD'), 265.16, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0328', TO_DATE('2021-10-23', 'YYYY-MM-DD'), TO_DATE('2021-10-31', 'YYYY-MM-DD'), TO_DATE('2021-11-01', 'YYYY-MM-DD'), 47.31, 'RECEIVED', 'SUP009', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0329', TO_DATE('2021-10-23', 'YYYY-MM-DD'), TO_DATE('2021-10-28', 'YYYY-MM-DD'), TO_DATE('2021-10-27', 'YYYY-MM-DD'), 633.24, 'RECEIVED', 'SUP006', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0330', TO_DATE('2021-10-26', 'YYYY-MM-DD'), TO_DATE('2021-10-29', 'YYYY-MM-DD'), TO_DATE('2021-10-27', 'YYYY-MM-DD'), 82.68, 'RECEIVED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0331', TO_DATE('2021-10-26', 'YYYY-MM-DD'), TO_DATE('2021-11-03', 'YYYY-MM-DD'), TO_DATE('2021-11-08', 'YYYY-MM-DD'), 98.04, 'RECEIVED', 'SUP010', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0332', TO_DATE('2021-10-28', 'YYYY-MM-DD'), TO_DATE('2021-11-02', 'YYYY-MM-DD'), TO_DATE('2021-11-04', 'YYYY-MM-DD'), 1406.09, 'RECEIVED', 'SUP004', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0333', TO_DATE('2021-10-30', 'YYYY-MM-DD'), TO_DATE('2021-11-04', 'YYYY-MM-DD'), TO_DATE('2021-11-03', 'YYYY-MM-DD'), 783.68, 'RECEIVED', 'SUP006', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0334', TO_DATE('2021-10-30', 'YYYY-MM-DD'), TO_DATE('2021-11-02', 'YYYY-MM-DD'), TO_DATE('2021-11-02', 'YYYY-MM-DD'), 872.98, 'RECEIVED', 'SUP003', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0335', TO_DATE('2021-11-01', 'YYYY-MM-DD'), TO_DATE('2021-11-04', 'YYYY-MM-DD'), TO_DATE('2021-11-02', 'YYYY-MM-DD'), 560.87, 'RECEIVED', 'SUP002', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0336', TO_DATE('2021-11-03', 'YYYY-MM-DD'), TO_DATE('2021-11-06', 'YYYY-MM-DD'), TO_DATE('2021-11-06', 'YYYY-MM-DD'), 1225.55, 'RECEIVED', 'SUP002', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0337', TO_DATE('2021-11-04', 'YYYY-MM-DD'), TO_DATE('2021-11-09', 'YYYY-MM-DD'), TO_DATE('2021-11-12', 'YYYY-MM-DD'), 670.32, 'RECEIVED', 'SUP006', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0338', TO_DATE('2021-11-04', 'YYYY-MM-DD'), TO_DATE('2021-11-07', 'YYYY-MM-DD'), TO_DATE('2021-11-05', 'YYYY-MM-DD'), 493.93, 'RECEIVED', 'SUP003', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0339', TO_DATE('2021-11-05', 'YYYY-MM-DD'), TO_DATE('2021-11-10', 'YYYY-MM-DD'), TO_DATE('2021-11-12', 'YYYY-MM-DD'), 882.66, 'RECEIVED', 'SUP007', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0340', TO_DATE('2021-11-06', 'YYYY-MM-DD'), TO_DATE('2021-11-11', 'YYYY-MM-DD'), TO_DATE('2021-11-12', 'YYYY-MM-DD'), 753.62, 'RECEIVED', 'SUP006', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0341', TO_DATE('2021-11-06', 'YYYY-MM-DD'), TO_DATE('2021-11-11', 'YYYY-MM-DD'), TO_DATE('2021-11-11', 'YYYY-MM-DD'), 515.49, 'RECEIVED', 'SUP005', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0342', TO_DATE('2021-11-11', 'YYYY-MM-DD'), TO_DATE('2021-11-14', 'YYYY-MM-DD'), TO_DATE('2021-11-12', 'YYYY-MM-DD'), 75.24, 'RECEIVED', 'SUP002', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0343', TO_DATE('2021-11-12', 'YYYY-MM-DD'), TO_DATE('2021-11-15', 'YYYY-MM-DD'), TO_DATE('2021-11-15', 'YYYY-MM-DD'), 89.2, 'RECEIVED', 'SUP001', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0344', TO_DATE('2021-11-14', 'YYYY-MM-DD'), TO_DATE('2021-11-17', 'YYYY-MM-DD'), TO_DATE('2021-11-17', 'YYYY-MM-DD'), 78.0, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0345', TO_DATE('2021-11-20', 'YYYY-MM-DD'), TO_DATE('2021-11-23', 'YYYY-MM-DD'), TO_DATE('2021-11-22', 'YYYY-MM-DD'), 402.88, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0346', TO_DATE('2021-11-20', 'YYYY-MM-DD'), TO_DATE('2021-11-25', 'YYYY-MM-DD'), TO_DATE('2021-11-24', 'YYYY-MM-DD'), 824.33, 'RECEIVED', 'SUP006', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0347', TO_DATE('2021-11-24', 'YYYY-MM-DD'), TO_DATE('2021-11-27', 'YYYY-MM-DD'), TO_DATE('2021-11-26', 'YYYY-MM-DD'), 523.15, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0348', TO_DATE('2021-11-25', 'YYYY-MM-DD'), TO_DATE('2021-11-28', 'YYYY-MM-DD'), TO_DATE('2021-11-29', 'YYYY-MM-DD'), 819.04, 'RECEIVED', 'SUP002', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0349', TO_DATE('2021-11-26', 'YYYY-MM-DD'), TO_DATE('2021-12-04', 'YYYY-MM-DD'), TO_DATE('2021-12-05', 'YYYY-MM-DD'), 598.08, 'RECEIVED', 'SUP009', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0350', TO_DATE('2021-11-27', 'YYYY-MM-DD'), TO_DATE('2021-12-02', 'YYYY-MM-DD'), TO_DATE('2021-12-02', 'YYYY-MM-DD'), 1125.03, 'RECEIVED', 'SUP004', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0351', TO_DATE('2021-11-27', 'YYYY-MM-DD'), TO_DATE('2021-11-30', 'YYYY-MM-DD'), TO_DATE('2021-12-01', 'YYYY-MM-DD'), 898.09, 'RECEIVED', 'SUP002', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0352', TO_DATE('2021-11-28', 'YYYY-MM-DD'), TO_DATE('2021-12-01', 'YYYY-MM-DD'), TO_DATE('2021-12-02', 'YYYY-MM-DD'), 306.12, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0353', TO_DATE('2021-11-28', 'YYYY-MM-DD'), TO_DATE('2021-12-03', 'YYYY-MM-DD'), TO_DATE('2021-12-03', 'YYYY-MM-DD'), 806.5, 'RECEIVED', 'SUP004', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0354', TO_DATE('2021-11-30', 'YYYY-MM-DD'), TO_DATE('2021-12-03', 'YYYY-MM-DD'), TO_DATE('2021-12-03', 'YYYY-MM-DD'), 941.86, 'RECEIVED', 'SUP003', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0355', TO_DATE('2021-12-03', 'YYYY-MM-DD'), TO_DATE('2021-12-08', 'YYYY-MM-DD'), TO_DATE('2021-12-08', 'YYYY-MM-DD'), 570.93, 'RECEIVED', 'SUP004', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0356', TO_DATE('2021-12-05', 'YYYY-MM-DD'), TO_DATE('2021-12-10', 'YYYY-MM-DD'), TO_DATE('2021-12-11', 'YYYY-MM-DD'), 147.36, 'RECEIVED', 'SUP004', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0357', TO_DATE('2021-12-07', 'YYYY-MM-DD'), TO_DATE('2021-12-12', 'YYYY-MM-DD'), TO_DATE('2021-12-12', 'YYYY-MM-DD'), 363.17, 'RECEIVED', 'SUP007', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0358', TO_DATE('2021-12-09', 'YYYY-MM-DD'), TO_DATE('2021-12-17', 'YYYY-MM-DD'), TO_DATE('2021-12-18', 'YYYY-MM-DD'), 152.01, 'RECEIVED', 'SUP011', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0359', TO_DATE('2021-12-10', 'YYYY-MM-DD'), TO_DATE('2021-12-15', 'YYYY-MM-DD'), TO_DATE('2021-12-16', 'YYYY-MM-DD'), 831.36, 'RECEIVED', 'SUP004', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0360', TO_DATE('2021-12-12', 'YYYY-MM-DD'), TO_DATE('2021-12-15', 'YYYY-MM-DD'), TO_DATE('2021-12-16', 'YYYY-MM-DD'), 1406.58, 'RECEIVED', 'SUP003', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0361', TO_DATE('2021-12-13', 'YYYY-MM-DD'), TO_DATE('2021-12-16', 'YYYY-MM-DD'), TO_DATE('2021-12-14', 'YYYY-MM-DD'), 216.58, 'RECEIVED', 'SUP001', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0362', TO_DATE('2021-12-14', 'YYYY-MM-DD'), TO_DATE('2021-12-19', 'YYYY-MM-DD'), TO_DATE('2021-12-22', 'YYYY-MM-DD'), 205.1, 'RECEIVED', 'SUP004', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0363', TO_DATE('2021-12-15', 'YYYY-MM-DD'), TO_DATE('2021-12-18', 'YYYY-MM-DD'), TO_DATE('2021-12-17', 'YYYY-MM-DD'), 1615.93, 'RECEIVED', 'SUP003', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0364', TO_DATE('2021-12-15', 'YYYY-MM-DD'), TO_DATE('2021-12-20', 'YYYY-MM-DD'), TO_DATE('2021-12-22', 'YYYY-MM-DD'), 1298.92, 'RECEIVED', 'SUP004', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0365', TO_DATE('2021-12-16', 'YYYY-MM-DD'), TO_DATE('2021-12-24', 'YYYY-MM-DD'), TO_DATE('2021-12-30', 'YYYY-MM-DD'), 497.14, 'RECEIVED', 'SUP009', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0366', TO_DATE('2021-12-16', 'YYYY-MM-DD'), TO_DATE('2021-12-24', 'YYYY-MM-DD'), TO_DATE('2021-12-25', 'YYYY-MM-DD'), 474.5, 'RECEIVED', 'SUP009', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0367', TO_DATE('2021-12-20', 'YYYY-MM-DD'), TO_DATE('2021-12-28', 'YYYY-MM-DD'), TO_DATE('2021-12-31', 'YYYY-MM-DD'), 1362.49, 'RECEIVED', 'SUP009', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0368', TO_DATE('2021-12-20', 'YYYY-MM-DD'), TO_DATE('2021-12-23', 'YYYY-MM-DD'), TO_DATE('2021-12-21', 'YYYY-MM-DD'), 313.46, 'RECEIVED', 'SUP001', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0369', TO_DATE('2021-12-20', 'YYYY-MM-DD'), TO_DATE('2021-12-28', 'YYYY-MM-DD'), TO_DATE('2022-01-02', 'YYYY-MM-DD'), 907.7, 'RECEIVED', 'SUP008', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0370', TO_DATE('2021-12-22', 'YYYY-MM-DD'), TO_DATE('2021-12-27', 'YYYY-MM-DD'), TO_DATE('2021-12-29', 'YYYY-MM-DD'), 17.16, 'RECEIVED', 'SUP005', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0371', TO_DATE('2021-12-23', 'YYYY-MM-DD'), TO_DATE('2021-12-28', 'YYYY-MM-DD'), TO_DATE('2021-12-30', 'YYYY-MM-DD'), 448.68, 'RECEIVED', 'SUP007', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0372', TO_DATE('2021-12-23', 'YYYY-MM-DD'), TO_DATE('2021-12-26', 'YYYY-MM-DD'), TO_DATE('2021-12-25', 'YYYY-MM-DD'), 314.38, 'RECEIVED', 'SUP001', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0373', TO_DATE('2021-12-23', 'YYYY-MM-DD'), TO_DATE('2021-12-28', 'YYYY-MM-DD'), TO_DATE('2021-12-31', 'YYYY-MM-DD'), 531.36, 'RECEIVED', 'SUP006', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0374', TO_DATE('2021-12-25', 'YYYY-MM-DD'), TO_DATE('2021-12-28', 'YYYY-MM-DD'), TO_DATE('2021-12-26', 'YYYY-MM-DD'), 136.18, 'RECEIVED', 'SUP003', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0375', TO_DATE('2021-12-25', 'YYYY-MM-DD'), TO_DATE('2022-01-02', 'YYYY-MM-DD'), TO_DATE('2022-01-06', 'YYYY-MM-DD'), 50.83, 'RECEIVED', 'SUP011', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0376', TO_DATE('2021-12-26', 'YYYY-MM-DD'), TO_DATE('2021-12-29', 'YYYY-MM-DD'), TO_DATE('2021-12-28', 'YYYY-MM-DD'), 317.78, 'RECEIVED', 'SUP002', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0377', TO_DATE('2021-12-26', 'YYYY-MM-DD'), TO_DATE('2021-12-29', 'YYYY-MM-DD'), TO_DATE('2021-12-28', 'YYYY-MM-DD'), 920.25, 'RECEIVED', 'SUP002', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0378', TO_DATE('2021-12-28', 'YYYY-MM-DD'), TO_DATE('2022-01-02', 'YYYY-MM-DD'), TO_DATE('2022-01-05', 'YYYY-MM-DD'), 493.36, 'RECEIVED', 'SUP007', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0379', TO_DATE('2021-12-28', 'YYYY-MM-DD'), TO_DATE('2021-12-31', 'YYYY-MM-DD'), TO_DATE('2021-12-30', 'YYYY-MM-DD'), 135.99, 'RECEIVED', 'SUP001', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0380', TO_DATE('2021-12-28', 'YYYY-MM-DD'), TO_DATE('2022-01-02', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'), 582.36, 'RECEIVED', 'SUP004', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0381', TO_DATE('2021-12-29', 'YYYY-MM-DD'), TO_DATE('2022-01-06', 'YYYY-MM-DD'), TO_DATE('2022-01-07', 'YYYY-MM-DD'), 11595.47, 'RECEIVED', 'SUP008', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0382', TO_DATE('2021-12-30', 'YYYY-MM-DD'), TO_DATE('2022-01-04', 'YYYY-MM-DD'), TO_DATE('2022-01-04', 'YYYY-MM-DD'), 1017.57, 'RECEIVED', 'SUP007', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0383', TO_DATE('2021-12-31', 'YYYY-MM-DD'), TO_DATE('2022-01-05', 'YYYY-MM-DD'), TO_DATE('2022-01-05', 'YYYY-MM-DD'), 358.52, 'RECEIVED', 'SUP007', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0384', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-06', 'YYYY-MM-DD'), TO_DATE('2022-01-05', 'YYYY-MM-DD'), 776.23, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0385', TO_DATE('2022-01-02', 'YYYY-MM-DD'), TO_DATE('2022-01-07', 'YYYY-MM-DD'), TO_DATE('2022-01-07', 'YYYY-MM-DD'), 398.92, 'RECEIVED', 'SUP004', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0386', TO_DATE('2022-01-02', 'YYYY-MM-DD'), TO_DATE('2022-01-05', 'YYYY-MM-DD'), TO_DATE('2022-01-06', 'YYYY-MM-DD'), 183.15, 'RECEIVED', 'SUP002', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0387', TO_DATE('2022-01-04', 'YYYY-MM-DD'), TO_DATE('2022-01-12', 'YYYY-MM-DD'), TO_DATE('2022-01-14', 'YYYY-MM-DD'), 2788.37, 'RECEIVED', 'SUP008', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0388', TO_DATE('2022-01-05', 'YYYY-MM-DD'), TO_DATE('2022-01-08', 'YYYY-MM-DD'), TO_DATE('2022-01-07', 'YYYY-MM-DD'), 1647.41, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0389', TO_DATE('2022-01-07', 'YYYY-MM-DD'), TO_DATE('2022-01-12', 'YYYY-MM-DD'), TO_DATE('2022-01-12', 'YYYY-MM-DD'), 1016.44, 'RECEIVED', 'SUP006', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0390', TO_DATE('2022-01-08', 'YYYY-MM-DD'), TO_DATE('2022-01-13', 'YYYY-MM-DD'), TO_DATE('2022-01-15', 'YYYY-MM-DD'), 618.29, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0391', TO_DATE('2022-01-14', 'YYYY-MM-DD'), TO_DATE('2022-01-22', 'YYYY-MM-DD'), TO_DATE('2022-01-25', 'YYYY-MM-DD'), 233.81, 'RECEIVED', 'SUP009', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0392', TO_DATE('2022-01-16', 'YYYY-MM-DD'), TO_DATE('2022-01-21', 'YYYY-MM-DD'), TO_DATE('2022-01-23', 'YYYY-MM-DD'), 347.1, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0393', TO_DATE('2022-01-20', 'YYYY-MM-DD'), TO_DATE('2022-01-28', 'YYYY-MM-DD'), TO_DATE('2022-01-31', 'YYYY-MM-DD'), 189.68, 'RECEIVED', 'SUP011', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0394', TO_DATE('2022-01-24', 'YYYY-MM-DD'), TO_DATE('2022-01-29', 'YYYY-MM-DD'), TO_DATE('2022-01-29', 'YYYY-MM-DD'), 357.45, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0395', TO_DATE('2022-01-24', 'YYYY-MM-DD'), TO_DATE('2022-01-29', 'YYYY-MM-DD'), TO_DATE('2022-01-28', 'YYYY-MM-DD'), 760.28, 'RECEIVED', 'SUP005', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0396', TO_DATE('2022-01-25', 'YYYY-MM-DD'), TO_DATE('2022-02-02', 'YYYY-MM-DD'), TO_DATE('2022-02-07', 'YYYY-MM-DD'), 30.75, 'RECEIVED', 'SUP010', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0397', TO_DATE('2022-01-26', 'YYYY-MM-DD'), TO_DATE('2022-01-31', 'YYYY-MM-DD'), TO_DATE('2022-01-31', 'YYYY-MM-DD'), 520.78, 'RECEIVED', 'SUP006', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0398', TO_DATE('2022-01-26', 'YYYY-MM-DD'), TO_DATE('2022-01-31', 'YYYY-MM-DD'), TO_DATE('2022-01-31', 'YYYY-MM-DD'), 379.78, 'RECEIVED', 'SUP007', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0399', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2022-02-04', 'YYYY-MM-DD'), TO_DATE('2022-02-03', 'YYYY-MM-DD'), 501.2, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0400', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2022-02-06', 'YYYY-MM-DD'), TO_DATE('2022-02-07', 'YYYY-MM-DD'), 1056.89, 'RECEIVED', 'SUP007', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0401', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2022-02-06', 'YYYY-MM-DD'), TO_DATE('2022-02-08', 'YYYY-MM-DD'), 68.06, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0402', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2022-02-06', 'YYYY-MM-DD'), TO_DATE('2022-02-08', 'YYYY-MM-DD'), 79.86, 'RECEIVED', 'SUP004', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0403', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2022-02-09', 'YYYY-MM-DD'), TO_DATE('2022-02-12', 'YYYY-MM-DD'), 58.8, 'RECEIVED', 'SUP008', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0404', TO_DATE('2022-02-02', 'YYYY-MM-DD'), TO_DATE('2022-02-07', 'YYYY-MM-DD'), TO_DATE('2022-02-10', 'YYYY-MM-DD'), 177.28, 'RECEIVED', 'SUP005', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0405', TO_DATE('2022-02-05', 'YYYY-MM-DD'), TO_DATE('2022-02-13', 'YYYY-MM-DD'), TO_DATE('2022-02-18', 'YYYY-MM-DD'), 289.83, 'RECEIVED', 'SUP011', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0406', TO_DATE('2022-02-06', 'YYYY-MM-DD'), TO_DATE('2022-02-11', 'YYYY-MM-DD'), TO_DATE('2022-02-13', 'YYYY-MM-DD'), 2211.66, 'RECEIVED', 'SUP005', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0407', TO_DATE('2022-02-10', 'YYYY-MM-DD'), TO_DATE('2022-02-18', 'YYYY-MM-DD'), TO_DATE('2022-02-20', 'YYYY-MM-DD'), 1101.57, 'RECEIVED', 'SUP009', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0408', TO_DATE('2022-02-10', 'YYYY-MM-DD'), TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-02-15', 'YYYY-MM-DD'), 39.36, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0409', TO_DATE('2022-02-13', 'YYYY-MM-DD'), TO_DATE('2022-02-21', 'YYYY-MM-DD'), TO_DATE('2022-02-22', 'YYYY-MM-DD'), 202.69, 'RECEIVED', 'SUP008', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0410', TO_DATE('2022-02-13', 'YYYY-MM-DD'), TO_DATE('2022-02-18', 'YYYY-MM-DD'), NULL, 273.24, 'CANCELLED', 'SUP004', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0411', TO_DATE('2022-02-14', 'YYYY-MM-DD'), TO_DATE('2022-02-17', 'YYYY-MM-DD'), TO_DATE('2022-02-16', 'YYYY-MM-DD'), 415.2, 'RECEIVED', 'SUP001', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0412', TO_DATE('2022-02-21', 'YYYY-MM-DD'), TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-03-02', 'YYYY-MM-DD'), 422.31, 'RECEIVED', 'SUP011', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0413', TO_DATE('2022-02-22', 'YYYY-MM-DD'), TO_DATE('2022-02-25', 'YYYY-MM-DD'), TO_DATE('2022-02-25', 'YYYY-MM-DD'), 79.13, 'RECEIVED', 'SUP001', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0414', TO_DATE('2022-02-22', 'YYYY-MM-DD'), TO_DATE('2022-03-02', 'YYYY-MM-DD'), TO_DATE('2022-03-08', 'YYYY-MM-DD'), 772.62, 'RECEIVED', 'SUP008', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0415', TO_DATE('2022-02-24', 'YYYY-MM-DD'), TO_DATE('2022-02-27', 'YYYY-MM-DD'), TO_DATE('2022-02-28', 'YYYY-MM-DD'), 460.89, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0416', TO_DATE('2022-02-28', 'YYYY-MM-DD'), TO_DATE('2022-03-08', 'YYYY-MM-DD'), TO_DATE('2022-03-12', 'YYYY-MM-DD'), 273.24, 'RECEIVED', 'SUP010', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0417', TO_DATE('2022-03-03', 'YYYY-MM-DD'), TO_DATE('2022-03-08', 'YYYY-MM-DD'), TO_DATE('2022-03-11', 'YYYY-MM-DD'), 1198.47, 'RECEIVED', 'SUP005', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0418', TO_DATE('2022-03-04', 'YYYY-MM-DD'), TO_DATE('2022-03-12', 'YYYY-MM-DD'), TO_DATE('2022-03-14', 'YYYY-MM-DD'), 457.66, 'RECEIVED', 'SUP009', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0419', TO_DATE('2022-03-04', 'YYYY-MM-DD'), TO_DATE('2022-03-07', 'YYYY-MM-DD'), TO_DATE('2022-03-05', 'YYYY-MM-DD'), 603.86, 'RECEIVED', 'SUP002', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0420', TO_DATE('2022-03-05', 'YYYY-MM-DD'), TO_DATE('2022-03-13', 'YYYY-MM-DD'), TO_DATE('2022-03-16', 'YYYY-MM-DD'), 101.92, 'RECEIVED', 'SUP010', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0421', TO_DATE('2022-03-05', 'YYYY-MM-DD'), TO_DATE('2022-03-08', 'YYYY-MM-DD'), TO_DATE('2022-03-07', 'YYYY-MM-DD'), 1005.22, 'RECEIVED', 'SUP001', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0422', TO_DATE('2022-03-06', 'YYYY-MM-DD'), TO_DATE('2022-03-11', 'YYYY-MM-DD'), TO_DATE('2022-03-14', 'YYYY-MM-DD'), 34.54, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0423', TO_DATE('2022-03-07', 'YYYY-MM-DD'), TO_DATE('2022-03-12', 'YYYY-MM-DD'), TO_DATE('2022-03-13', 'YYYY-MM-DD'), 744.3, 'RECEIVED', 'SUP004', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0424', TO_DATE('2022-03-13', 'YYYY-MM-DD'), TO_DATE('2022-03-18', 'YYYY-MM-DD'), TO_DATE('2022-03-19', 'YYYY-MM-DD'), 447.98, 'RECEIVED', 'SUP005', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0425', TO_DATE('2022-03-13', 'YYYY-MM-DD'), TO_DATE('2022-03-16', 'YYYY-MM-DD'), TO_DATE('2022-03-17', 'YYYY-MM-DD'), 1289.38, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0426', TO_DATE('2022-03-14', 'YYYY-MM-DD'), TO_DATE('2022-03-17', 'YYYY-MM-DD'), TO_DATE('2022-03-15', 'YYYY-MM-DD'), 22.88, 'RECEIVED', 'SUP003', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0427', TO_DATE('2022-03-18', 'YYYY-MM-DD'), TO_DATE('2022-03-23', 'YYYY-MM-DD'), TO_DATE('2022-03-23', 'YYYY-MM-DD'), 195.37, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0428', TO_DATE('2022-03-19', 'YYYY-MM-DD'), TO_DATE('2022-03-22', 'YYYY-MM-DD'), TO_DATE('2022-03-22', 'YYYY-MM-DD'), 411.6, 'RECEIVED', 'SUP001', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0429', TO_DATE('2022-03-22', 'YYYY-MM-DD'), TO_DATE('2022-03-25', 'YYYY-MM-DD'), TO_DATE('2022-03-23', 'YYYY-MM-DD'), 258.22, 'RECEIVED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0430', TO_DATE('2022-03-24', 'YYYY-MM-DD'), TO_DATE('2022-03-29', 'YYYY-MM-DD'), TO_DATE('2022-03-28', 'YYYY-MM-DD'), 497.23, 'RECEIVED', 'SUP007', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0431', TO_DATE('2022-03-25', 'YYYY-MM-DD'), TO_DATE('2022-03-28', 'YYYY-MM-DD'), TO_DATE('2022-03-26', 'YYYY-MM-DD'), 34.58, 'RECEIVED', 'SUP003', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0432', TO_DATE('2022-03-31', 'YYYY-MM-DD'), TO_DATE('2022-04-03', 'YYYY-MM-DD'), TO_DATE('2022-04-03', 'YYYY-MM-DD'), 28.56, 'RECEIVED', 'SUP003', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0433', TO_DATE('2022-04-03', 'YYYY-MM-DD'), TO_DATE('2022-04-08', 'YYYY-MM-DD'), TO_DATE('2022-04-08', 'YYYY-MM-DD'), 288.8, 'RECEIVED', 'SUP006', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0434', TO_DATE('2022-04-05', 'YYYY-MM-DD'), TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2022-04-10', 'YYYY-MM-DD'), 175.51, 'RECEIVED', 'SUP004', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0435', TO_DATE('2022-04-09', 'YYYY-MM-DD'), TO_DATE('2022-04-14', 'YYYY-MM-DD'), TO_DATE('2022-04-14', 'YYYY-MM-DD'), 1719.47, 'RECEIVED', 'SUP007', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0436', TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2022-04-18', 'YYYY-MM-DD'), TO_DATE('2022-04-24', 'YYYY-MM-DD'), 158.45, 'RECEIVED', 'SUP010', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0437', TO_DATE('2022-04-13', 'YYYY-MM-DD'), TO_DATE('2022-04-18', 'YYYY-MM-DD'), TO_DATE('2022-04-21', 'YYYY-MM-DD'), 66.4, 'RECEIVED', 'SUP007', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0438', TO_DATE('2022-04-14', 'YYYY-MM-DD'), TO_DATE('2022-04-19', 'YYYY-MM-DD'), TO_DATE('2022-04-21', 'YYYY-MM-DD'), 975.87, 'RECEIVED', 'SUP006', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0439', TO_DATE('2022-04-15', 'YYYY-MM-DD'), TO_DATE('2022-04-20', 'YYYY-MM-DD'), TO_DATE('2022-04-21', 'YYYY-MM-DD'), 513.96, 'RECEIVED', 'SUP006', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0440', TO_DATE('2022-04-22', 'YYYY-MM-DD'), TO_DATE('2022-04-25', 'YYYY-MM-DD'), TO_DATE('2022-04-23', 'YYYY-MM-DD'), 608.88, 'RECEIVED', 'SUP001', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0441', TO_DATE('2022-04-22', 'YYYY-MM-DD'), TO_DATE('2022-04-27', 'YYYY-MM-DD'), TO_DATE('2022-04-27', 'YYYY-MM-DD'), 117.2, 'RECEIVED', 'SUP004', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0442', TO_DATE('2022-04-28', 'YYYY-MM-DD'), TO_DATE('2022-05-06', 'YYYY-MM-DD'), TO_DATE('2022-05-11', 'YYYY-MM-DD'), 867.98, 'RECEIVED', 'SUP009', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0443', TO_DATE('2022-04-30', 'YYYY-MM-DD'), TO_DATE('2022-05-05', 'YYYY-MM-DD'), TO_DATE('2022-05-06', 'YYYY-MM-DD'), 714.08, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0444', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('2022-05-07', 'YYYY-MM-DD'), TO_DATE('2022-05-10', 'YYYY-MM-DD'), 203.85, 'RECEIVED', 'SUP004', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0445', TO_DATE('2022-05-02', 'YYYY-MM-DD'), TO_DATE('2022-05-05', 'YYYY-MM-DD'), TO_DATE('2022-05-06', 'YYYY-MM-DD'), 1036.03, 'RECEIVED', 'SUP002', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0446', TO_DATE('2022-05-03', 'YYYY-MM-DD'), TO_DATE('2022-05-11', 'YYYY-MM-DD'), TO_DATE('2022-05-16', 'YYYY-MM-DD'), 172.85, 'RECEIVED', 'SUP008', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0447', TO_DATE('2022-05-04', 'YYYY-MM-DD'), TO_DATE('2022-05-09', 'YYYY-MM-DD'), TO_DATE('2022-05-10', 'YYYY-MM-DD'), 1269.13, 'RECEIVED', 'SUP005', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0448', TO_DATE('2022-05-05', 'YYYY-MM-DD'), TO_DATE('2022-05-10', 'YYYY-MM-DD'), TO_DATE('2022-05-11', 'YYYY-MM-DD'), 873.51, 'RECEIVED', 'SUP007', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0449', TO_DATE('2022-05-08', 'YYYY-MM-DD'), TO_DATE('2022-05-16', 'YYYY-MM-DD'), TO_DATE('2022-05-18', 'YYYY-MM-DD'), 814.61, 'RECEIVED', 'SUP008', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0450', TO_DATE('2022-05-10', 'YYYY-MM-DD'), TO_DATE('2022-05-13', 'YYYY-MM-DD'), TO_DATE('2022-05-11', 'YYYY-MM-DD'), 206.34, 'RECEIVED', 'SUP002', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0451', TO_DATE('2022-05-11', 'YYYY-MM-DD'), TO_DATE('2022-05-19', 'YYYY-MM-DD'), TO_DATE('2022-05-24', 'YYYY-MM-DD'), 552.4, 'RECEIVED', 'SUP009', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0452', TO_DATE('2022-05-13', 'YYYY-MM-DD'), TO_DATE('2022-05-16', 'YYYY-MM-DD'), TO_DATE('2022-05-15', 'YYYY-MM-DD'), 384.66, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0453', TO_DATE('2022-05-15', 'YYYY-MM-DD'), TO_DATE('2022-05-23', 'YYYY-MM-DD'), TO_DATE('2022-05-26', 'YYYY-MM-DD'), 363.66, 'RECEIVED', 'SUP009', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0454', TO_DATE('2022-05-16', 'YYYY-MM-DD'), TO_DATE('2022-05-19', 'YYYY-MM-DD'), TO_DATE('2022-05-19', 'YYYY-MM-DD'), 281.04, 'RECEIVED', 'SUP003', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0455', TO_DATE('2022-05-17', 'YYYY-MM-DD'), TO_DATE('2022-05-20', 'YYYY-MM-DD'), TO_DATE('2022-05-18', 'YYYY-MM-DD'), 823.83, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0456', TO_DATE('2022-05-20', 'YYYY-MM-DD'), TO_DATE('2022-05-25', 'YYYY-MM-DD'), TO_DATE('2022-05-25', 'YYYY-MM-DD'), 370.11, 'RECEIVED', 'SUP006', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0457', TO_DATE('2022-05-21', 'YYYY-MM-DD'), TO_DATE('2022-05-26', 'YYYY-MM-DD'), TO_DATE('2022-05-28', 'YYYY-MM-DD'), 152.11, 'RECEIVED', 'SUP007', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0458', TO_DATE('2022-05-21', 'YYYY-MM-DD'), TO_DATE('2022-05-26', 'YYYY-MM-DD'), TO_DATE('2022-05-29', 'YYYY-MM-DD'), 971.88, 'RECEIVED', 'SUP004', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0459', TO_DATE('2022-05-24', 'YYYY-MM-DD'), TO_DATE('2022-05-29', 'YYYY-MM-DD'), TO_DATE('2022-05-29', 'YYYY-MM-DD'), 360.28, 'RECEIVED', 'SUP006', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0460', TO_DATE('2022-05-26', 'YYYY-MM-DD'), TO_DATE('2022-05-31', 'YYYY-MM-DD'), TO_DATE('2022-06-02', 'YYYY-MM-DD'), 547.18, 'RECEIVED', 'SUP004', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0461', TO_DATE('2022-05-26', 'YYYY-MM-DD'), TO_DATE('2022-05-29', 'YYYY-MM-DD'), TO_DATE('2022-05-30', 'YYYY-MM-DD'), 487.09, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0462', TO_DATE('2022-05-28', 'YYYY-MM-DD'), TO_DATE('2022-05-31', 'YYYY-MM-DD'), TO_DATE('2022-05-31', 'YYYY-MM-DD'), 164.1, 'RECEIVED', 'SUP002', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0463', TO_DATE('2022-05-30', 'YYYY-MM-DD'), TO_DATE('2022-06-02', 'YYYY-MM-DD'), TO_DATE('2022-06-02', 'YYYY-MM-DD'), 280.06, 'RECEIVED', 'SUP003', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0464', TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2022-06-04', 'YYYY-MM-DD'), TO_DATE('2022-06-04', 'YYYY-MM-DD'), 1759.29, 'RECEIVED', 'SUP003', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0465', TO_DATE('2022-06-02', 'YYYY-MM-DD'), TO_DATE('2022-06-07', 'YYYY-MM-DD'), TO_DATE('2022-06-06', 'YYYY-MM-DD'), 149.16, 'RECEIVED', 'SUP007', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0466', TO_DATE('2022-06-02', 'YYYY-MM-DD'), TO_DATE('2022-06-05', 'YYYY-MM-DD'), TO_DATE('2022-06-05', 'YYYY-MM-DD'), 1004.2, 'RECEIVED', 'SUP002', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0467', TO_DATE('2022-06-03', 'YYYY-MM-DD'), TO_DATE('2022-06-11', 'YYYY-MM-DD'), TO_DATE('2022-06-15', 'YYYY-MM-DD'), 1164.38, 'RECEIVED', 'SUP010', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0468', TO_DATE('2022-06-06', 'YYYY-MM-DD'), TO_DATE('2022-06-11', 'YYYY-MM-DD'), TO_DATE('2022-06-14', 'YYYY-MM-DD'), 566.18, 'RECEIVED', 'SUP007', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0469', TO_DATE('2022-06-06', 'YYYY-MM-DD'), TO_DATE('2022-06-09', 'YYYY-MM-DD'), TO_DATE('2022-06-07', 'YYYY-MM-DD'), 1950.44, 'RECEIVED', 'SUP001', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0470', TO_DATE('2022-06-08', 'YYYY-MM-DD'), TO_DATE('2022-06-11', 'YYYY-MM-DD'), TO_DATE('2022-06-10', 'YYYY-MM-DD'), 280.39, 'RECEIVED', 'SUP002', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0471', TO_DATE('2022-06-08', 'YYYY-MM-DD'), TO_DATE('2022-06-13', 'YYYY-MM-DD'), TO_DATE('2022-06-15', 'YYYY-MM-DD'), 222.96, 'RECEIVED', 'SUP007', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0472', TO_DATE('2022-06-09', 'YYYY-MM-DD'), TO_DATE('2022-06-12', 'YYYY-MM-DD'), TO_DATE('2022-06-11', 'YYYY-MM-DD'), 4259.42, 'RECEIVED', 'SUP003', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0473', TO_DATE('2022-06-09', 'YYYY-MM-DD'), TO_DATE('2022-06-14', 'YYYY-MM-DD'), TO_DATE('2022-06-13', 'YYYY-MM-DD'), 1131.86, 'RECEIVED', 'SUP004', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0474', TO_DATE('2022-06-10', 'YYYY-MM-DD'), TO_DATE('2022-06-13', 'YYYY-MM-DD'), TO_DATE('2022-06-14', 'YYYY-MM-DD'), 3441.17, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0475', TO_DATE('2022-06-11', 'YYYY-MM-DD'), TO_DATE('2022-06-14', 'YYYY-MM-DD'), TO_DATE('2022-06-15', 'YYYY-MM-DD'), 3809.21, 'RECEIVED', 'SUP003', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0476', TO_DATE('2022-06-11', 'YYYY-MM-DD'), TO_DATE('2022-06-14', 'YYYY-MM-DD'), TO_DATE('2022-06-13', 'YYYY-MM-DD'), 797.49, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0477', TO_DATE('2022-06-11', 'YYYY-MM-DD'), TO_DATE('2022-06-14', 'YYYY-MM-DD'), TO_DATE('2022-06-14', 'YYYY-MM-DD'), 365.34, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0478', TO_DATE('2022-06-13', 'YYYY-MM-DD'), TO_DATE('2022-06-21', 'YYYY-MM-DD'), TO_DATE('2022-06-22', 'YYYY-MM-DD'), 816.58, 'RECEIVED', 'SUP009', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0479', TO_DATE('2022-06-13', 'YYYY-MM-DD'), TO_DATE('2022-06-18', 'YYYY-MM-DD'), TO_DATE('2022-06-21', 'YYYY-MM-DD'), 361.95, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0480', TO_DATE('2022-06-14', 'YYYY-MM-DD'), TO_DATE('2022-06-19', 'YYYY-MM-DD'), TO_DATE('2022-06-19', 'YYYY-MM-DD'), 627.11, 'RECEIVED', 'SUP006', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0481', TO_DATE('2022-06-14', 'YYYY-MM-DD'), TO_DATE('2022-06-19', 'YYYY-MM-DD'), TO_DATE('2022-06-22', 'YYYY-MM-DD'), 524.51, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0482', TO_DATE('2022-06-15', 'YYYY-MM-DD'), TO_DATE('2022-06-23', 'YYYY-MM-DD'), TO_DATE('2022-06-27', 'YYYY-MM-DD'), 1369.84, 'RECEIVED', 'SUP009', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0483', TO_DATE('2022-06-16', 'YYYY-MM-DD'), TO_DATE('2022-06-19', 'YYYY-MM-DD'), TO_DATE('2022-06-18', 'YYYY-MM-DD'), 48.3, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0484', TO_DATE('2022-06-20', 'YYYY-MM-DD'), TO_DATE('2022-06-28', 'YYYY-MM-DD'), TO_DATE('2022-07-03', 'YYYY-MM-DD'), 828.99, 'RECEIVED', 'SUP010', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0485', TO_DATE('2022-06-22', 'YYYY-MM-DD'), TO_DATE('2022-06-25', 'YYYY-MM-DD'), TO_DATE('2022-06-24', 'YYYY-MM-DD'), 102.36, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0486', TO_DATE('2022-06-22', 'YYYY-MM-DD'), TO_DATE('2022-06-30', 'YYYY-MM-DD'), TO_DATE('2022-07-01', 'YYYY-MM-DD'), 349.62, 'RECEIVED', 'SUP010', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0487', TO_DATE('2022-06-23', 'YYYY-MM-DD'), TO_DATE('2022-07-01', 'YYYY-MM-DD'), TO_DATE('2022-07-07', 'YYYY-MM-DD'), 674.38, 'RECEIVED', 'SUP010', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0488', TO_DATE('2022-06-25', 'YYYY-MM-DD'), TO_DATE('2022-06-30', 'YYYY-MM-DD'), TO_DATE('2022-07-01', 'YYYY-MM-DD'), 242.68, 'RECEIVED', 'SUP007', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0489', TO_DATE('2022-06-28', 'YYYY-MM-DD'), TO_DATE('2022-07-01', 'YYYY-MM-DD'), TO_DATE('2022-07-01', 'YYYY-MM-DD'), 299.56, 'RECEIVED', 'SUP002', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0490', TO_DATE('2022-07-05', 'YYYY-MM-DD'), TO_DATE('2022-07-08', 'YYYY-MM-DD'), TO_DATE('2022-07-06', 'YYYY-MM-DD'), 151.56, 'RECEIVED', 'SUP001', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0491', TO_DATE('2022-07-07', 'YYYY-MM-DD'), TO_DATE('2022-07-10', 'YYYY-MM-DD'), TO_DATE('2022-07-08', 'YYYY-MM-DD'), 10181.02, 'RECEIVED', 'SUP002', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0492', TO_DATE('2022-07-10', 'YYYY-MM-DD'), TO_DATE('2022-07-15', 'YYYY-MM-DD'), TO_DATE('2022-07-18', 'YYYY-MM-DD'), 317.62, 'RECEIVED', 'SUP006', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0493', TO_DATE('2022-07-10', 'YYYY-MM-DD'), TO_DATE('2022-07-13', 'YYYY-MM-DD'), TO_DATE('2022-07-14', 'YYYY-MM-DD'), 634.02, 'RECEIVED', 'SUP002', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0494', TO_DATE('2022-07-10', 'YYYY-MM-DD'), TO_DATE('2022-07-13', 'YYYY-MM-DD'), TO_DATE('2022-07-13', 'YYYY-MM-DD'), 215.68, 'RECEIVED', 'SUP002', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0495', TO_DATE('2022-07-16', 'YYYY-MM-DD'), TO_DATE('2022-07-21', 'YYYY-MM-DD'), TO_DATE('2022-07-22', 'YYYY-MM-DD'), 354.01, 'RECEIVED', 'SUP007', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0496', TO_DATE('2022-07-17', 'YYYY-MM-DD'), TO_DATE('2022-07-20', 'YYYY-MM-DD'), TO_DATE('2022-07-18', 'YYYY-MM-DD'), 175.46, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0497', TO_DATE('2022-07-17', 'YYYY-MM-DD'), TO_DATE('2022-07-22', 'YYYY-MM-DD'), TO_DATE('2022-07-24', 'YYYY-MM-DD'), 1971.59, 'RECEIVED', 'SUP005', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0498', TO_DATE('2022-07-17', 'YYYY-MM-DD'), TO_DATE('2022-07-20', 'YYYY-MM-DD'), TO_DATE('2022-07-20', 'YYYY-MM-DD'), 334.43, 'RECEIVED', 'SUP001', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0499', TO_DATE('2022-07-21', 'YYYY-MM-DD'), TO_DATE('2022-07-29', 'YYYY-MM-DD'), TO_DATE('2022-08-04', 'YYYY-MM-DD'), 209.32, 'RECEIVED', 'SUP009', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0500', TO_DATE('2022-07-22', 'YYYY-MM-DD'), TO_DATE('2022-07-25', 'YYYY-MM-DD'), TO_DATE('2022-07-24', 'YYYY-MM-DD'), 254.81, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0501', TO_DATE('2022-07-22', 'YYYY-MM-DD'), TO_DATE('2022-07-27', 'YYYY-MM-DD'), TO_DATE('2022-07-30', 'YYYY-MM-DD'), 1206.09, 'RECEIVED', 'SUP007', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0502', TO_DATE('2022-07-26', 'YYYY-MM-DD'), TO_DATE('2022-07-31', 'YYYY-MM-DD'), TO_DATE('2022-07-31', 'YYYY-MM-DD'), 897.68, 'RECEIVED', 'SUP004', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0503', TO_DATE('2022-07-27', 'YYYY-MM-DD'), TO_DATE('2022-07-30', 'YYYY-MM-DD'), TO_DATE('2022-07-28', 'YYYY-MM-DD'), 140.7, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0504', TO_DATE('2022-07-28', 'YYYY-MM-DD'), TO_DATE('2022-08-02', 'YYYY-MM-DD'), TO_DATE('2022-08-03', 'YYYY-MM-DD'), 123.76, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0505', TO_DATE('2022-08-04', 'YYYY-MM-DD'), TO_DATE('2022-08-12', 'YYYY-MM-DD'), TO_DATE('2022-08-14', 'YYYY-MM-DD'), 498.82, 'RECEIVED', 'SUP011', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0506', TO_DATE('2022-08-04', 'YYYY-MM-DD'), TO_DATE('2022-08-07', 'YYYY-MM-DD'), TO_DATE('2022-08-05', 'YYYY-MM-DD'), 337.92, 'RECEIVED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0507', TO_DATE('2022-08-04', 'YYYY-MM-DD'), TO_DATE('2022-08-09', 'YYYY-MM-DD'), TO_DATE('2022-08-08', 'YYYY-MM-DD'), 60.9, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0508', TO_DATE('2022-08-05', 'YYYY-MM-DD'), TO_DATE('2022-08-10', 'YYYY-MM-DD'), TO_DATE('2022-08-10', 'YYYY-MM-DD'), 71.4, 'RECEIVED', 'SUP006', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0509', TO_DATE('2022-08-08', 'YYYY-MM-DD'), TO_DATE('2022-08-13', 'YYYY-MM-DD'), TO_DATE('2022-08-16', 'YYYY-MM-DD'), 1283.88, 'RECEIVED', 'SUP007', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0510', TO_DATE('2022-08-08', 'YYYY-MM-DD'), TO_DATE('2022-08-11', 'YYYY-MM-DD'), TO_DATE('2022-08-10', 'YYYY-MM-DD'), 298.36, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0511', TO_DATE('2022-08-10', 'YYYY-MM-DD'), TO_DATE('2022-08-13', 'YYYY-MM-DD'), TO_DATE('2022-08-11', 'YYYY-MM-DD'), 29.3, 'RECEIVED', 'SUP001', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0512', TO_DATE('2022-08-11', 'YYYY-MM-DD'), TO_DATE('2022-08-16', 'YYYY-MM-DD'), TO_DATE('2022-08-18', 'YYYY-MM-DD'), 368.5, 'RECEIVED', 'SUP006', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0513', TO_DATE('2022-08-13', 'YYYY-MM-DD'), TO_DATE('2022-08-18', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), 394.21, 'RECEIVED', 'SUP007', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0514', TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2022-08-23', 'YYYY-MM-DD'), TO_DATE('2022-08-24', 'YYYY-MM-DD'), 314.78, 'RECEIVED', 'SUP010', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0515', TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2022-08-23', 'YYYY-MM-DD'), TO_DATE('2022-08-26', 'YYYY-MM-DD'), 763.71, 'RECEIVED', 'SUP008', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0516', TO_DATE('2022-08-16', 'YYYY-MM-DD'), TO_DATE('2022-08-19', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), 420.92, 'RECEIVED', 'SUP003', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0517', TO_DATE('2022-08-17', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), 76.9, 'RECEIVED', 'SUP002', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0518', TO_DATE('2022-08-18', 'YYYY-MM-DD'), TO_DATE('2022-08-23', 'YYYY-MM-DD'), TO_DATE('2022-08-22', 'YYYY-MM-DD'), 510.94, 'RECEIVED', 'SUP005', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0519', TO_DATE('2022-08-22', 'YYYY-MM-DD'), TO_DATE('2022-08-27', 'YYYY-MM-DD'), TO_DATE('2022-08-28', 'YYYY-MM-DD'), 364.34, 'RECEIVED', 'SUP004', 'S0003');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0520', TO_DATE('2022-08-25', 'YYYY-MM-DD'), TO_DATE('2022-08-30', 'YYYY-MM-DD'), TO_DATE('2022-08-29', 'YYYY-MM-DD'), 358.53, 'RECEIVED', 'SUP006', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0521', TO_DATE('2022-08-26', 'YYYY-MM-DD'), TO_DATE('2022-08-31', 'YYYY-MM-DD'), TO_DATE('2022-08-30', 'YYYY-MM-DD'), 205.94, 'RECEIVED', 'SUP007', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0522', TO_DATE('2022-08-26', 'YYYY-MM-DD'), TO_DATE('2022-08-29', 'YYYY-MM-DD'), TO_DATE('2022-08-28', 'YYYY-MM-DD'), 475.2, 'RECEIVED', 'SUP003', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0523', TO_DATE('2022-08-28', 'YYYY-MM-DD'), TO_DATE('2022-08-31', 'YYYY-MM-DD'), TO_DATE('2022-08-30', 'YYYY-MM-DD'), 286.23, 'RECEIVED', 'SUP003', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0524', TO_DATE('2022-08-29', 'YYYY-MM-DD'), TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-08-30', 'YYYY-MM-DD'), 316.67, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0525', TO_DATE('2022-08-31', 'YYYY-MM-DD'), TO_DATE('2022-09-05', 'YYYY-MM-DD'), TO_DATE('2022-09-05', 'YYYY-MM-DD'), 481.49, 'RECEIVED', 'SUP005', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0526', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-04', 'YYYY-MM-DD'), TO_DATE('2022-09-03', 'YYYY-MM-DD'), 282.43, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0527', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-06', 'YYYY-MM-DD'), TO_DATE('2022-09-06', 'YYYY-MM-DD'), 473.1, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0528', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-09', 'YYYY-MM-DD'), TO_DATE('2022-09-15', 'YYYY-MM-DD'), 448.14, 'RECEIVED', 'SUP010', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0529', TO_DATE('2022-09-03', 'YYYY-MM-DD'), TO_DATE('2022-09-11', 'YYYY-MM-DD'), TO_DATE('2022-09-14', 'YYYY-MM-DD'), 356.88, 'RECEIVED', 'SUP008', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0530', TO_DATE('2022-09-03', 'YYYY-MM-DD'), TO_DATE('2022-09-06', 'YYYY-MM-DD'), TO_DATE('2022-09-05', 'YYYY-MM-DD'), 1311.86, 'RECEIVED', 'SUP002', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0531', TO_DATE('2022-09-06', 'YYYY-MM-DD'), TO_DATE('2022-09-09', 'YYYY-MM-DD'), TO_DATE('2022-09-10', 'YYYY-MM-DD'), 412.67, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0532', TO_DATE('2022-09-08', 'YYYY-MM-DD'), TO_DATE('2022-09-13', 'YYYY-MM-DD'), TO_DATE('2022-09-13', 'YYYY-MM-DD'), 488.93, 'RECEIVED', 'SUP005', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0533', TO_DATE('2022-09-09', 'YYYY-MM-DD'), TO_DATE('2022-09-12', 'YYYY-MM-DD'), TO_DATE('2022-09-11', 'YYYY-MM-DD'), 3950.13, 'RECEIVED', 'SUP002', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0534', TO_DATE('2022-09-12', 'YYYY-MM-DD'), TO_DATE('2022-09-15', 'YYYY-MM-DD'), TO_DATE('2022-09-14', 'YYYY-MM-DD'), 292.22, 'RECEIVED', 'SUP002', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0535', TO_DATE('2022-09-13', 'YYYY-MM-DD'), TO_DATE('2022-09-16', 'YYYY-MM-DD'), TO_DATE('2022-09-14', 'YYYY-MM-DD'), 30.09, 'RECEIVED', 'SUP002', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0536', TO_DATE('2022-09-15', 'YYYY-MM-DD'), TO_DATE('2022-09-20', 'YYYY-MM-DD'), TO_DATE('2022-09-22', 'YYYY-MM-DD'), 761.17, 'RECEIVED', 'SUP004', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0537', TO_DATE('2022-09-19', 'YYYY-MM-DD'), TO_DATE('2022-09-24', 'YYYY-MM-DD'), TO_DATE('2022-09-27', 'YYYY-MM-DD'), 889.62, 'RECEIVED', 'SUP004', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0538', TO_DATE('2022-09-19', 'YYYY-MM-DD'), TO_DATE('2022-09-27', 'YYYY-MM-DD'), TO_DATE('2022-10-01', 'YYYY-MM-DD'), 649.6, 'RECEIVED', 'SUP010', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0539', TO_DATE('2022-09-20', 'YYYY-MM-DD'), TO_DATE('2022-09-28', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'), 1159.61, 'RECEIVED', 'SUP009', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0540', TO_DATE('2022-09-23', 'YYYY-MM-DD'), TO_DATE('2022-09-28', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'), 1097.2, 'RECEIVED', 'SUP007', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0541', TO_DATE('2022-09-26', 'YYYY-MM-DD'), TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2022-10-03', 'YYYY-MM-DD'), 1301.28, 'RECEIVED', 'SUP005', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0542', TO_DATE('2022-09-26', 'YYYY-MM-DD'), TO_DATE('2022-09-29', 'YYYY-MM-DD'), TO_DATE('2022-09-28', 'YYYY-MM-DD'), 168.77, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0543', TO_DATE('2022-09-29', 'YYYY-MM-DD'), TO_DATE('2022-10-04', 'YYYY-MM-DD'), TO_DATE('2022-10-07', 'YYYY-MM-DD'), 140.7, 'RECEIVED', 'SUP007', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0544', TO_DATE('2022-09-30', 'YYYY-MM-DD'), TO_DATE('2022-10-03', 'YYYY-MM-DD'), TO_DATE('2022-10-01', 'YYYY-MM-DD'), 251.98, 'RECEIVED', 'SUP003', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0545', TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2022-10-04', 'YYYY-MM-DD'), TO_DATE('2022-10-05', 'YYYY-MM-DD'), 407.03, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0546', TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2022-10-09', 'YYYY-MM-DD'), TO_DATE('2022-10-15', 'YYYY-MM-DD'), 366.52, 'RECEIVED', 'SUP010', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0547', TO_DATE('2022-10-06', 'YYYY-MM-DD'), TO_DATE('2022-10-09', 'YYYY-MM-DD'), TO_DATE('2022-10-09', 'YYYY-MM-DD'), 377.22, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0548', TO_DATE('2022-10-06', 'YYYY-MM-DD'), TO_DATE('2022-10-11', 'YYYY-MM-DD'), TO_DATE('2022-10-11', 'YYYY-MM-DD'), 47.06, 'RECEIVED', 'SUP006', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0549', TO_DATE('2022-10-08', 'YYYY-MM-DD'), TO_DATE('2022-10-11', 'YYYY-MM-DD'), TO_DATE('2022-10-12', 'YYYY-MM-DD'), 522.36, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0550', TO_DATE('2022-10-11', 'YYYY-MM-DD'), TO_DATE('2022-10-19', 'YYYY-MM-DD'), TO_DATE('2022-10-20', 'YYYY-MM-DD'), 322.28, 'RECEIVED', 'SUP011', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0551', TO_DATE('2022-10-13', 'YYYY-MM-DD'), TO_DATE('2022-10-21', 'YYYY-MM-DD'), TO_DATE('2022-10-25', 'YYYY-MM-DD'), 67.45, 'RECEIVED', 'SUP011', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0552', TO_DATE('2022-10-18', 'YYYY-MM-DD'), TO_DATE('2022-10-21', 'YYYY-MM-DD'), TO_DATE('2022-10-21', 'YYYY-MM-DD'), 511.31, 'RECEIVED', 'SUP002', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0553', TO_DATE('2022-10-18', 'YYYY-MM-DD'), TO_DATE('2022-10-21', 'YYYY-MM-DD'), TO_DATE('2022-10-20', 'YYYY-MM-DD'), 7107.66, 'RECEIVED', 'SUP001', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0554', TO_DATE('2022-10-18', 'YYYY-MM-DD'), TO_DATE('2022-10-23', 'YYYY-MM-DD'), TO_DATE('2022-10-22', 'YYYY-MM-DD'), 354.3, 'RECEIVED', 'SUP004', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0555', TO_DATE('2022-10-21', 'YYYY-MM-DD'), TO_DATE('2022-10-26', 'YYYY-MM-DD'), TO_DATE('2022-10-29', 'YYYY-MM-DD'), 280.79, 'RECEIVED', 'SUP007', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0556', TO_DATE('2022-10-22', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY-MM-DD'), TO_DATE('2022-11-04', 'YYYY-MM-DD'), 305.9, 'RECEIVED', 'SUP009', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0557', TO_DATE('2022-10-25', 'YYYY-MM-DD'), TO_DATE('2022-11-02', 'YYYY-MM-DD'), TO_DATE('2022-11-05', 'YYYY-MM-DD'), 416.22, 'RECEIVED', 'SUP010', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0558', TO_DATE('2022-10-25', 'YYYY-MM-DD'), TO_DATE('2022-11-02', 'YYYY-MM-DD'), TO_DATE('2022-11-03', 'YYYY-MM-DD'), 120.03, 'RECEIVED', 'SUP010', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0559', TO_DATE('2022-10-25', 'YYYY-MM-DD'), TO_DATE('2022-11-02', 'YYYY-MM-DD'), TO_DATE('2022-11-05', 'YYYY-MM-DD'), 612.18, 'RECEIVED', 'SUP011', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0560', TO_DATE('2022-10-25', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY-MM-DD'), TO_DATE('2022-10-29', 'YYYY-MM-DD'), 364.28, 'RECEIVED', 'SUP006', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0561', TO_DATE('2022-10-26', 'YYYY-MM-DD'), TO_DATE('2022-10-29', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY-MM-DD'), 232.97, 'RECEIVED', 'SUP002', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0562', TO_DATE('2022-10-27', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY-MM-DD'), TO_DATE('2022-10-30', 'YYYY-MM-DD'), 516.0, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0563', TO_DATE('2022-10-30', 'YYYY-MM-DD'), TO_DATE('2022-11-04', 'YYYY-MM-DD'), TO_DATE('2022-11-06', 'YYYY-MM-DD'), 596.23, 'RECEIVED', 'SUP007', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0564', TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-11-09', 'YYYY-MM-DD'), TO_DATE('2022-11-15', 'YYYY-MM-DD'), 272.3, 'RECEIVED', 'SUP009', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0565', TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-11-04', 'YYYY-MM-DD'), TO_DATE('2022-11-03', 'YYYY-MM-DD'), 21.0, 'RECEIVED', 'SUP003', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0566', TO_DATE('2022-11-02', 'YYYY-MM-DD'), TO_DATE('2022-11-10', 'YYYY-MM-DD'), TO_DATE('2022-11-11', 'YYYY-MM-DD'), 585.66, 'RECEIVED', 'SUP008', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0567', TO_DATE('2022-11-04', 'YYYY-MM-DD'), TO_DATE('2022-11-09', 'YYYY-MM-DD'), TO_DATE('2022-11-12', 'YYYY-MM-DD'), 513.37, 'RECEIVED', 'SUP007', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0568', TO_DATE('2022-11-04', 'YYYY-MM-DD'), TO_DATE('2022-11-09', 'YYYY-MM-DD'), TO_DATE('2022-11-12', 'YYYY-MM-DD'), 1025.76, 'RECEIVED', 'SUP006', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0569', TO_DATE('2022-11-04', 'YYYY-MM-DD'), TO_DATE('2022-11-09', 'YYYY-MM-DD'), TO_DATE('2022-11-09', 'YYYY-MM-DD'), 29.4, 'RECEIVED', 'SUP007', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0570', TO_DATE('2022-11-05', 'YYYY-MM-DD'), TO_DATE('2022-11-08', 'YYYY-MM-DD'), TO_DATE('2022-11-07', 'YYYY-MM-DD'), 433.36, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0571', TO_DATE('2022-11-07', 'YYYY-MM-DD'), TO_DATE('2022-11-12', 'YYYY-MM-DD'), TO_DATE('2022-11-12', 'YYYY-MM-DD'), 60.9, 'RECEIVED', 'SUP004', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0572', TO_DATE('2022-11-07', 'YYYY-MM-DD'), TO_DATE('2022-11-10', 'YYYY-MM-DD'), TO_DATE('2022-11-09', 'YYYY-MM-DD'), 638.4, 'RECEIVED', 'SUP003', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0573', TO_DATE('2022-11-10', 'YYYY-MM-DD'), TO_DATE('2022-11-15', 'YYYY-MM-DD'), TO_DATE('2022-11-15', 'YYYY-MM-DD'), 1247.41, 'RECEIVED', 'SUP004', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0574', TO_DATE('2022-11-14', 'YYYY-MM-DD'), TO_DATE('2022-11-17', 'YYYY-MM-DD'), TO_DATE('2022-11-15', 'YYYY-MM-DD'), 2363.7, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0575', TO_DATE('2022-11-14', 'YYYY-MM-DD'), TO_DATE('2022-11-22', 'YYYY-MM-DD'), TO_DATE('2022-11-25', 'YYYY-MM-DD'), 517.88, 'RECEIVED', 'SUP010', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0576', TO_DATE('2022-11-15', 'YYYY-MM-DD'), TO_DATE('2022-11-20', 'YYYY-MM-DD'), TO_DATE('2022-11-21', 'YYYY-MM-DD'), 798.94, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0577', TO_DATE('2022-11-15', 'YYYY-MM-DD'), TO_DATE('2022-11-18', 'YYYY-MM-DD'), TO_DATE('2022-11-19', 'YYYY-MM-DD'), 248.68, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0578', TO_DATE('2022-11-15', 'YYYY-MM-DD'), TO_DATE('2022-11-20', 'YYYY-MM-DD'), TO_DATE('2022-11-22', 'YYYY-MM-DD'), 317.02, 'RECEIVED', 'SUP007', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0579', TO_DATE('2022-11-16', 'YYYY-MM-DD'), TO_DATE('2022-11-21', 'YYYY-MM-DD'), TO_DATE('2022-11-21', 'YYYY-MM-DD'), 572.77, 'RECEIVED', 'SUP005', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0580', TO_DATE('2022-11-18', 'YYYY-MM-DD'), TO_DATE('2022-11-23', 'YYYY-MM-DD'), TO_DATE('2022-11-22', 'YYYY-MM-DD'), 2007.54, 'RECEIVED', 'SUP005', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0581', TO_DATE('2022-11-19', 'YYYY-MM-DD'), TO_DATE('2022-11-22', 'YYYY-MM-DD'), TO_DATE('2022-11-23', 'YYYY-MM-DD'), 211.53, 'RECEIVED', 'SUP003', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0582', TO_DATE('2022-11-20', 'YYYY-MM-DD'), TO_DATE('2022-11-23', 'YYYY-MM-DD'), TO_DATE('2022-11-22', 'YYYY-MM-DD'), 135.52, 'RECEIVED', 'SUP001', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0583', TO_DATE('2022-11-20', 'YYYY-MM-DD'), TO_DATE('2022-11-25', 'YYYY-MM-DD'), TO_DATE('2022-11-27', 'YYYY-MM-DD'), 28.35, 'RECEIVED', 'SUP006', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0584', TO_DATE('2022-11-22', 'YYYY-MM-DD'), TO_DATE('2022-11-30', 'YYYY-MM-DD'), TO_DATE('2022-12-04', 'YYYY-MM-DD'), 147.08, 'RECEIVED', 'SUP009', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0585', TO_DATE('2022-11-23', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2022-12-05', 'YYYY-MM-DD'), 2773.59, 'RECEIVED', 'SUP010', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0586', TO_DATE('2022-11-24', 'YYYY-MM-DD'), TO_DATE('2022-12-02', 'YYYY-MM-DD'), TO_DATE('2022-12-06', 'YYYY-MM-DD'), 1854.71, 'RECEIVED', 'SUP009', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0587', TO_DATE('2022-11-24', 'YYYY-MM-DD'), TO_DATE('2022-12-02', 'YYYY-MM-DD'), TO_DATE('2022-12-07', 'YYYY-MM-DD'), 290.99, 'RECEIVED', 'SUP009', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0588', TO_DATE('2022-11-25', 'YYYY-MM-DD'), TO_DATE('2022-11-30', 'YYYY-MM-DD'), TO_DATE('2022-12-03', 'YYYY-MM-DD'), 2436.15, 'RECEIVED', 'SUP007', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0589', TO_DATE('2022-11-26', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), 57.0, 'RECEIVED', 'SUP005', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0590', TO_DATE('2022-11-28', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2022-11-30', 'YYYY-MM-DD'), 67.0, 'RECEIVED', 'SUP002', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0591', TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2022-12-04', 'YYYY-MM-DD'), TO_DATE('2022-12-03', 'YYYY-MM-DD'), 214.96, 'RECEIVED', 'SUP002', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0592', TO_DATE('2022-12-03', 'YYYY-MM-DD'), TO_DATE('2022-12-06', 'YYYY-MM-DD'), TO_DATE('2022-12-04', 'YYYY-MM-DD'), 112.04, 'RECEIVED', 'SUP001', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0593', TO_DATE('2022-12-03', 'YYYY-MM-DD'), TO_DATE('2022-12-06', 'YYYY-MM-DD'), TO_DATE('2022-12-06', 'YYYY-MM-DD'), 1881.42, 'RECEIVED', 'SUP001', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0594', TO_DATE('2022-12-04', 'YYYY-MM-DD'), TO_DATE('2022-12-09', 'YYYY-MM-DD'), TO_DATE('2022-12-10', 'YYYY-MM-DD'), 356.72, 'RECEIVED', 'SUP004', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0595', TO_DATE('2022-12-04', 'YYYY-MM-DD'), TO_DATE('2022-12-09', 'YYYY-MM-DD'), TO_DATE('2022-12-09', 'YYYY-MM-DD'), 30.09, 'RECEIVED', 'SUP006', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0596', TO_DATE('2022-12-05', 'YYYY-MM-DD'), TO_DATE('2022-12-13', 'YYYY-MM-DD'), TO_DATE('2022-12-18', 'YYYY-MM-DD'), 598.18, 'RECEIVED', 'SUP009', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0597', TO_DATE('2022-12-05', 'YYYY-MM-DD'), TO_DATE('2022-12-13', 'YYYY-MM-DD'), TO_DATE('2022-12-17', 'YYYY-MM-DD'), 727.88, 'RECEIVED', 'SUP009', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0598', TO_DATE('2022-12-06', 'YYYY-MM-DD'), TO_DATE('2022-12-09', 'YYYY-MM-DD'), TO_DATE('2022-12-09', 'YYYY-MM-DD'), 185.47, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0599', TO_DATE('2022-12-06', 'YYYY-MM-DD'), TO_DATE('2022-12-14', 'YYYY-MM-DD'), TO_DATE('2022-12-15', 'YYYY-MM-DD'), 597.6, 'RECEIVED', 'SUP010', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0600', TO_DATE('2022-12-06', 'YYYY-MM-DD'), TO_DATE('2022-12-11', 'YYYY-MM-DD'), TO_DATE('2022-12-12', 'YYYY-MM-DD'), 3423.36, 'RECEIVED', 'SUP005', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0601', TO_DATE('2022-12-07', 'YYYY-MM-DD'), TO_DATE('2022-12-12', 'YYYY-MM-DD'), TO_DATE('2022-12-13', 'YYYY-MM-DD'), 429.72, 'RECEIVED', 'SUP007', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0602', TO_DATE('2022-12-08', 'YYYY-MM-DD'), TO_DATE('2022-12-13', 'YYYY-MM-DD'), TO_DATE('2022-12-14', 'YYYY-MM-DD'), 397.88, 'RECEIVED', 'SUP006', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0603', TO_DATE('2022-12-09', 'YYYY-MM-DD'), TO_DATE('2022-12-14', 'YYYY-MM-DD'), TO_DATE('2022-12-17', 'YYYY-MM-DD'), 655.36, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0604', TO_DATE('2022-12-09', 'YYYY-MM-DD'), TO_DATE('2022-12-14', 'YYYY-MM-DD'), TO_DATE('2022-12-15', 'YYYY-MM-DD'), 2193.5, 'RECEIVED', 'SUP005', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0605', TO_DATE('2022-12-09', 'YYYY-MM-DD'), TO_DATE('2022-12-17', 'YYYY-MM-DD'), TO_DATE('2022-12-20', 'YYYY-MM-DD'), 679.75, 'RECEIVED', 'SUP009', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0606', TO_DATE('2022-12-13', 'YYYY-MM-DD'), TO_DATE('2022-12-21', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'), 457.04, 'RECEIVED', 'SUP010', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0607', TO_DATE('2022-12-13', 'YYYY-MM-DD'), TO_DATE('2022-12-16', 'YYYY-MM-DD'), TO_DATE('2022-12-15', 'YYYY-MM-DD'), 248.79, 'RECEIVED', 'SUP001', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0608', TO_DATE('2022-12-13', 'YYYY-MM-DD'), TO_DATE('2022-12-18', 'YYYY-MM-DD'), TO_DATE('2022-12-18', 'YYYY-MM-DD'), 3096.51, 'RECEIVED', 'SUP007', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0609', TO_DATE('2022-12-14', 'YYYY-MM-DD'), TO_DATE('2022-12-19', 'YYYY-MM-DD'), NULL, 827.05, 'CANCELLED', 'SUP005', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0610', TO_DATE('2022-12-14', 'YYYY-MM-DD'), TO_DATE('2022-12-19', 'YYYY-MM-DD'), TO_DATE('2022-12-19', 'YYYY-MM-DD'), 446.74, 'RECEIVED', 'SUP006', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0611', TO_DATE('2022-12-15', 'YYYY-MM-DD'), TO_DATE('2022-12-18', 'YYYY-MM-DD'), TO_DATE('2022-12-17', 'YYYY-MM-DD'), 337.73, 'RECEIVED', 'SUP002', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0612', TO_DATE('2022-12-16', 'YYYY-MM-DD'), TO_DATE('2022-12-21', 'YYYY-MM-DD'), TO_DATE('2022-12-23', 'YYYY-MM-DD'), 1191.02, 'RECEIVED', 'SUP004', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0613', TO_DATE('2022-12-16', 'YYYY-MM-DD'), TO_DATE('2022-12-19', 'YYYY-MM-DD'), TO_DATE('2022-12-17', 'YYYY-MM-DD'), 94.24, 'RECEIVED', 'SUP001', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0614', TO_DATE('2022-12-16', 'YYYY-MM-DD'), TO_DATE('2022-12-21', 'YYYY-MM-DD'), TO_DATE('2022-12-24', 'YYYY-MM-DD'), 447.59, 'RECEIVED', 'SUP007', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0615', TO_DATE('2022-12-16', 'YYYY-MM-DD'), TO_DATE('2022-12-24', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'), 72.38, 'RECEIVED', 'SUP010', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0616', TO_DATE('2022-12-17', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'), TO_DATE('2022-12-30', 'YYYY-MM-DD'), 6403.49, 'RECEIVED', 'SUP009', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0617', TO_DATE('2022-12-19', 'YYYY-MM-DD'), TO_DATE('2022-12-22', 'YYYY-MM-DD'), TO_DATE('2022-12-21', 'YYYY-MM-DD'), 671.34, 'RECEIVED', 'SUP002', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0618', TO_DATE('2022-12-19', 'YYYY-MM-DD'), TO_DATE('2022-12-27', 'YYYY-MM-DD'), TO_DATE('2022-12-29', 'YYYY-MM-DD'), 17.64, 'RECEIVED', 'SUP011', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0619', TO_DATE('2022-12-20', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'), TO_DATE('2022-12-24', 'YYYY-MM-DD'), 85.55, 'RECEIVED', 'SUP007', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0620', TO_DATE('2022-12-20', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'), TO_DATE('2022-12-24', 'YYYY-MM-DD'), 646.66, 'RECEIVED', 'SUP006', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0621', TO_DATE('2022-12-20', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'), TO_DATE('2022-12-26', 'YYYY-MM-DD'), 198.8, 'RECEIVED', 'SUP006', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0622', TO_DATE('2022-12-20', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'), TO_DATE('2022-12-27', 'YYYY-MM-DD'), 76.9, 'RECEIVED', 'SUP006', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0623', TO_DATE('2022-12-21', 'YYYY-MM-DD'), TO_DATE('2022-12-26', 'YYYY-MM-DD'), TO_DATE('2022-12-29', 'YYYY-MM-DD'), 129.34, 'RECEIVED', 'SUP007', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0624', TO_DATE('2022-12-21', 'YYYY-MM-DD'), TO_DATE('2022-12-24', 'YYYY-MM-DD'), TO_DATE('2022-12-24', 'YYYY-MM-DD'), 362.9, 'RECEIVED', 'SUP002', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0625', TO_DATE('2022-12-22', 'YYYY-MM-DD'), TO_DATE('2022-12-27', 'YYYY-MM-DD'), TO_DATE('2022-12-26', 'YYYY-MM-DD'), 559.77, 'RECEIVED', 'SUP005', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0626', TO_DATE('2022-12-23', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1796.06, 'RECEIVED', 'SUP008', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0627', TO_DATE('2022-12-23', 'YYYY-MM-DD'), TO_DATE('2022-12-28', 'YYYY-MM-DD'), TO_DATE('2022-12-30', 'YYYY-MM-DD'), 53.9, 'RECEIVED', 'SUP004', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0628', TO_DATE('2022-12-25', 'YYYY-MM-DD'), TO_DATE('2022-12-30', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), 241.82, 'RECEIVED', 'SUP006', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0629', TO_DATE('2022-12-26', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), NULL, 200.3, 'CANCELLED', 'SUP005', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0630', TO_DATE('2022-12-26', 'YYYY-MM-DD'), TO_DATE('2022-12-29', 'YYYY-MM-DD'), TO_DATE('2022-12-28', 'YYYY-MM-DD'), 736.54, 'RECEIVED', 'SUP001', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0631', TO_DATE('2022-12-27', 'YYYY-MM-DD'), TO_DATE('2022-12-30', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), 3596.57, 'RECEIVED', 'SUP002', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0632', TO_DATE('2022-12-27', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-04', 'YYYY-MM-DD'), 385.95, 'RECEIVED', 'SUP006', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0633', TO_DATE('2022-12-28', 'YYYY-MM-DD'), TO_DATE('2023-01-05', 'YYYY-MM-DD'), TO_DATE('2023-01-11', 'YYYY-MM-DD'), 332.71, 'RECEIVED', 'SUP008', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0634', TO_DATE('2022-12-28', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), 220.43, 'RECEIVED', 'SUP003', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0635', TO_DATE('2022-12-28', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), TO_DATE('2022-12-30', 'YYYY-MM-DD'), 135.66, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0636', TO_DATE('2022-12-29', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2022-12-30', 'YYYY-MM-DD'), 189.11, 'RECEIVED', 'SUP003', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0637', TO_DATE('2022-12-29', 'YYYY-MM-DD'), TO_DATE('2023-01-03', 'YYYY-MM-DD'), TO_DATE('2023-01-06', 'YYYY-MM-DD'), 331.03, 'RECEIVED', 'SUP004', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0638', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-09', 'YYYY-MM-DD'), TO_DATE('2023-01-12', 'YYYY-MM-DD'), 133.63, 'RECEIVED', 'SUP009', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0639', TO_DATE('2023-01-02', 'YYYY-MM-DD'), TO_DATE('2023-01-05', 'YYYY-MM-DD'), TO_DATE('2023-01-03', 'YYYY-MM-DD'), 388.76, 'RECEIVED', 'SUP002', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0640', TO_DATE('2023-01-03', 'YYYY-MM-DD'), TO_DATE('2023-01-08', 'YYYY-MM-DD'), TO_DATE('2023-01-08', 'YYYY-MM-DD'), 277.07, 'RECEIVED', 'SUP006', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0641', TO_DATE('2023-01-03', 'YYYY-MM-DD'), TO_DATE('2023-01-08', 'YYYY-MM-DD'), TO_DATE('2023-01-08', 'YYYY-MM-DD'), 661.2, 'RECEIVED', 'SUP007', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0642', TO_DATE('2023-01-04', 'YYYY-MM-DD'), TO_DATE('2023-01-09', 'YYYY-MM-DD'), TO_DATE('2023-01-11', 'YYYY-MM-DD'), 6862.59, 'RECEIVED', 'SUP005', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0643', TO_DATE('2023-01-04', 'YYYY-MM-DD'), TO_DATE('2023-01-07', 'YYYY-MM-DD'), TO_DATE('2023-01-05', 'YYYY-MM-DD'), 135.74, 'RECEIVED', 'SUP001', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0644', TO_DATE('2023-01-04', 'YYYY-MM-DD'), TO_DATE('2023-01-07', 'YYYY-MM-DD'), TO_DATE('2023-01-07', 'YYYY-MM-DD'), 251.25, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0645', TO_DATE('2023-01-05', 'YYYY-MM-DD'), TO_DATE('2023-01-13', 'YYYY-MM-DD'), TO_DATE('2023-01-19', 'YYYY-MM-DD'), 204.1, 'RECEIVED', 'SUP008', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0646', TO_DATE('2023-01-06', 'YYYY-MM-DD'), TO_DATE('2023-01-09', 'YYYY-MM-DD'), TO_DATE('2023-01-09', 'YYYY-MM-DD'), 695.6, 'RECEIVED', 'SUP003', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0647', TO_DATE('2023-01-06', 'YYYY-MM-DD'), TO_DATE('2023-01-11', 'YYYY-MM-DD'), TO_DATE('2023-01-12', 'YYYY-MM-DD'), 765.48, 'RECEIVED', 'SUP006', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0648', TO_DATE('2023-01-07', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-19', 'YYYY-MM-DD'), 1265.55, 'RECEIVED', 'SUP009', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0649', TO_DATE('2023-01-07', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-20', 'YYYY-MM-DD'), 365.95, 'RECEIVED', 'SUP010', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0650', TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-14', 'YYYY-MM-DD'), 144.64, 'RECEIVED', 'SUP005', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0651', TO_DATE('2023-01-12', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'), 100.4, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0652', TO_DATE('2023-01-12', 'YYYY-MM-DD'), TO_DATE('2023-01-17', 'YYYY-MM-DD'), TO_DATE('2023-01-20', 'YYYY-MM-DD'), 11.05, 'RECEIVED', 'SUP005', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0653', TO_DATE('2023-01-13', 'YYYY-MM-DD'), TO_DATE('2023-01-21', 'YYYY-MM-DD'), TO_DATE('2023-01-23', 'YYYY-MM-DD'), 396.45, 'RECEIVED', 'SUP011', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0654', TO_DATE('2023-01-14', 'YYYY-MM-DD'), TO_DATE('2023-01-19', 'YYYY-MM-DD'), TO_DATE('2023-01-22', 'YYYY-MM-DD'), 589.48, 'RECEIVED', 'SUP007', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0655', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-18', 'YYYY-MM-DD'), TO_DATE('2023-01-17', 'YYYY-MM-DD'), 105.63, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0656', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-20', 'YYYY-MM-DD'), TO_DATE('2023-01-22', 'YYYY-MM-DD'), 1644.52, 'RECEIVED', 'SUP004', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0657', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-20', 'YYYY-MM-DD'), TO_DATE('2023-01-21', 'YYYY-MM-DD'), 2552.54, 'RECEIVED', 'SUP005', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0658', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-01-18', 'YYYY-MM-DD'), TO_DATE('2023-01-17', 'YYYY-MM-DD'), 484.52, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0659', TO_DATE('2023-01-16', 'YYYY-MM-DD'), TO_DATE('2023-01-19', 'YYYY-MM-DD'), TO_DATE('2023-01-18', 'YYYY-MM-DD'), 561.09, 'RECEIVED', 'SUP002', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0660', TO_DATE('2023-01-16', 'YYYY-MM-DD'), TO_DATE('2023-01-21', 'YYYY-MM-DD'), TO_DATE('2023-01-24', 'YYYY-MM-DD'), 1156.38, 'RECEIVED', 'SUP004', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0661', TO_DATE('2023-01-16', 'YYYY-MM-DD'), TO_DATE('2023-01-24', 'YYYY-MM-DD'), TO_DATE('2023-01-25', 'YYYY-MM-DD'), 348.4, 'RECEIVED', 'SUP010', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0662', TO_DATE('2023-01-18', 'YYYY-MM-DD'), TO_DATE('2023-01-23', 'YYYY-MM-DD'), TO_DATE('2023-01-26', 'YYYY-MM-DD'), 220.54, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0663', TO_DATE('2023-01-18', 'YYYY-MM-DD'), TO_DATE('2023-01-21', 'YYYY-MM-DD'), TO_DATE('2023-01-22', 'YYYY-MM-DD'), 298.62, 'RECEIVED', 'SUP003', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0664', TO_DATE('2023-01-18', 'YYYY-MM-DD'), TO_DATE('2023-01-21', 'YYYY-MM-DD'), TO_DATE('2023-01-22', 'YYYY-MM-DD'), 121.77, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0665', TO_DATE('2023-01-19', 'YYYY-MM-DD'), TO_DATE('2023-01-22', 'YYYY-MM-DD'), TO_DATE('2023-01-21', 'YYYY-MM-DD'), 1051.94, 'RECEIVED', 'SUP003', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0666', TO_DATE('2023-01-19', 'YYYY-MM-DD'), TO_DATE('2023-01-27', 'YYYY-MM-DD'), TO_DATE('2023-02-02', 'YYYY-MM-DD'), 20.01, 'RECEIVED', 'SUP011', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0667', TO_DATE('2023-01-20', 'YYYY-MM-DD'), TO_DATE('2023-01-23', 'YYYY-MM-DD'), TO_DATE('2023-01-21', 'YYYY-MM-DD'), 115.92, 'RECEIVED', 'SUP002', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0668', TO_DATE('2023-01-20', 'YYYY-MM-DD'), TO_DATE('2023-01-25', 'YYYY-MM-DD'), TO_DATE('2023-01-26', 'YYYY-MM-DD'), 182.58, 'RECEIVED', 'SUP006', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0669', TO_DATE('2023-01-22', 'YYYY-MM-DD'), TO_DATE('2023-01-27', 'YYYY-MM-DD'), TO_DATE('2023-01-29', 'YYYY-MM-DD'), 326.34, 'RECEIVED', 'SUP005', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0670', TO_DATE('2023-01-23', 'YYYY-MM-DD'), TO_DATE('2023-01-26', 'YYYY-MM-DD'), TO_DATE('2023-01-27', 'YYYY-MM-DD'), 1493.68, 'RECEIVED', 'SUP002', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0671', TO_DATE('2023-01-24', 'YYYY-MM-DD'), TO_DATE('2023-01-29', 'YYYY-MM-DD'), TO_DATE('2023-01-31', 'YYYY-MM-DD'), 245.22, 'RECEIVED', 'SUP006', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0672', TO_DATE('2023-01-24', 'YYYY-MM-DD'), TO_DATE('2023-01-27', 'YYYY-MM-DD'), TO_DATE('2023-01-25', 'YYYY-MM-DD'), 215.6, 'RECEIVED', 'SUP001', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0673', TO_DATE('2023-01-29', 'YYYY-MM-DD'), TO_DATE('2023-02-03', 'YYYY-MM-DD'), TO_DATE('2023-02-03', 'YYYY-MM-DD'), 208.65, 'RECEIVED', 'SUP006', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0674', TO_DATE('2023-01-29', 'YYYY-MM-DD'), TO_DATE('2023-02-03', 'YYYY-MM-DD'), TO_DATE('2023-02-05', 'YYYY-MM-DD'), 170.81, 'RECEIVED', 'SUP007', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0675', TO_DATE('2023-01-30', 'YYYY-MM-DD'), TO_DATE('2023-02-07', 'YYYY-MM-DD'), TO_DATE('2023-02-11', 'YYYY-MM-DD'), 236.55, 'RECEIVED', 'SUP010', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0676', TO_DATE('2023-02-04', 'YYYY-MM-DD'), TO_DATE('2023-02-07', 'YYYY-MM-DD'), TO_DATE('2023-02-06', 'YYYY-MM-DD'), 226.32, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0677', TO_DATE('2023-02-05', 'YYYY-MM-DD'), TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2023-02-13', 'YYYY-MM-DD'), 1395.6, 'RECEIVED', 'SUP004', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0678', TO_DATE('2023-02-07', 'YYYY-MM-DD'), TO_DATE('2023-02-12', 'YYYY-MM-DD'), TO_DATE('2023-02-11', 'YYYY-MM-DD'), 149.7, 'RECEIVED', 'SUP007', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0679', TO_DATE('2023-02-08', 'YYYY-MM-DD'), TO_DATE('2023-02-11', 'YYYY-MM-DD'), TO_DATE('2023-02-11', 'YYYY-MM-DD'), 23.98, 'RECEIVED', 'SUP003', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0680', TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-14', 'YYYY-MM-DD'), 1056.85, 'RECEIVED', 'SUP004', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0681', TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-18', 'YYYY-MM-DD'), 171.41, 'RECEIVED', 'SUP007', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0682', TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-18', 'YYYY-MM-DD'), 77.18, 'RECEIVED', 'SUP005', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0683', TO_DATE('2023-02-12', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD'), 611.25, 'RECEIVED', 'SUP002', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0684', TO_DATE('2023-02-16', 'YYYY-MM-DD'), TO_DATE('2023-02-21', 'YYYY-MM-DD'), TO_DATE('2023-02-23', 'YYYY-MM-DD'), 164.76, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0685', TO_DATE('2023-02-16', 'YYYY-MM-DD'), TO_DATE('2023-02-21', 'YYYY-MM-DD'), TO_DATE('2023-02-24', 'YYYY-MM-DD'), 487.76, 'RECEIVED', 'SUP007', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0686', TO_DATE('2023-02-21', 'YYYY-MM-DD'), TO_DATE('2023-02-26', 'YYYY-MM-DD'), TO_DATE('2023-02-26', 'YYYY-MM-DD'), 363.82, 'RECEIVED', 'SUP004', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0687', TO_DATE('2023-02-22', 'YYYY-MM-DD'), TO_DATE('2023-02-27', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), 259.04, 'RECEIVED', 'SUP007', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0688', TO_DATE('2023-02-23', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), TO_DATE('2023-03-01', 'YYYY-MM-DD'), 481.23, 'RECEIVED', 'SUP007', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0689', TO_DATE('2023-02-27', 'YYYY-MM-DD'), TO_DATE('2023-03-02', 'YYYY-MM-DD'), TO_DATE('2023-03-02', 'YYYY-MM-DD'), 184.46, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0690', TO_DATE('2023-02-27', 'YYYY-MM-DD'), TO_DATE('2023-03-04', 'YYYY-MM-DD'), TO_DATE('2023-03-05', 'YYYY-MM-DD'), 916.24, 'RECEIVED', 'SUP006', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0691', TO_DATE('2023-03-02', 'YYYY-MM-DD'), TO_DATE('2023-03-07', 'YYYY-MM-DD'), TO_DATE('2023-03-08', 'YYYY-MM-DD'), 544.86, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0692', TO_DATE('2023-03-02', 'YYYY-MM-DD'), TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2023-03-03', 'YYYY-MM-DD'), 207.77, 'RECEIVED', 'SUP001', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0693', TO_DATE('2023-03-03', 'YYYY-MM-DD'), TO_DATE('2023-03-06', 'YYYY-MM-DD'), TO_DATE('2023-03-04', 'YYYY-MM-DD'), 440.94, 'RECEIVED', 'SUP002', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0694', TO_DATE('2023-03-03', 'YYYY-MM-DD'), TO_DATE('2023-03-06', 'YYYY-MM-DD'), TO_DATE('2023-03-06', 'YYYY-MM-DD'), 307.62, 'RECEIVED', 'SUP003', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0695', TO_DATE('2023-03-03', 'YYYY-MM-DD'), TO_DATE('2023-03-06', 'YYYY-MM-DD'), TO_DATE('2023-03-05', 'YYYY-MM-DD'), 78.0, 'RECEIVED', 'SUP002', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0696', TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2023-03-13', 'YYYY-MM-DD'), TO_DATE('2023-03-14', 'YYYY-MM-DD'), 586.84, 'RECEIVED', 'SUP011', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0697', TO_DATE('2023-03-06', 'YYYY-MM-DD'), TO_DATE('2023-03-11', 'YYYY-MM-DD'), TO_DATE('2023-03-14', 'YYYY-MM-DD'), 904.02, 'RECEIVED', 'SUP007', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0698', TO_DATE('2023-03-08', 'YYYY-MM-DD'), TO_DATE('2023-03-13', 'YYYY-MM-DD'), TO_DATE('2023-03-13', 'YYYY-MM-DD'), 1626.3, 'RECEIVED', 'SUP004', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0699', TO_DATE('2023-03-12', 'YYYY-MM-DD'), TO_DATE('2023-03-15', 'YYYY-MM-DD'), TO_DATE('2023-03-15', 'YYYY-MM-DD'), 137.16, 'RECEIVED', 'SUP001', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0700', TO_DATE('2023-03-13', 'YYYY-MM-DD'), TO_DATE('2023-03-18', 'YYYY-MM-DD'), TO_DATE('2023-03-19', 'YYYY-MM-DD'), 326.34, 'RECEIVED', 'SUP006', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0701', TO_DATE('2023-03-15', 'YYYY-MM-DD'), TO_DATE('2023-03-18', 'YYYY-MM-DD'), TO_DATE('2023-03-17', 'YYYY-MM-DD'), 28.34, 'RECEIVED', 'SUP003', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0702', TO_DATE('2023-03-17', 'YYYY-MM-DD'), TO_DATE('2023-03-22', 'YYYY-MM-DD'), TO_DATE('2023-03-21', 'YYYY-MM-DD'), 24.84, 'RECEIVED', 'SUP006', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0703', TO_DATE('2023-03-18', 'YYYY-MM-DD'), TO_DATE('2023-03-26', 'YYYY-MM-DD'), TO_DATE('2023-03-28', 'YYYY-MM-DD'), 390.2, 'RECEIVED', 'SUP009', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0704', TO_DATE('2023-03-20', 'YYYY-MM-DD'), TO_DATE('2023-03-23', 'YYYY-MM-DD'), TO_DATE('2023-03-23', 'YYYY-MM-DD'), 255.3, 'RECEIVED', 'SUP002', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0705', TO_DATE('2023-03-21', 'YYYY-MM-DD'), TO_DATE('2023-03-29', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'), 137.43, 'RECEIVED', 'SUP008', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0706', TO_DATE('2023-03-22', 'YYYY-MM-DD'), TO_DATE('2023-03-27', 'YYYY-MM-DD'), TO_DATE('2023-03-27', 'YYYY-MM-DD'), 147.96, 'RECEIVED', 'SUP006', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0707', TO_DATE('2023-03-25', 'YYYY-MM-DD'), TO_DATE('2023-03-30', 'YYYY-MM-DD'), TO_DATE('2023-03-30', 'YYYY-MM-DD'), 673.97, 'RECEIVED', 'SUP006', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0708', TO_DATE('2023-03-25', 'YYYY-MM-DD'), TO_DATE('2023-03-30', 'YYYY-MM-DD'), TO_DATE('2023-03-29', 'YYYY-MM-DD'), 511.39, 'RECEIVED', 'SUP004', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0709', TO_DATE('2023-03-29', 'YYYY-MM-DD'), TO_DATE('2023-04-06', 'YYYY-MM-DD'), TO_DATE('2023-04-12', 'YYYY-MM-DD'), 158.15, 'RECEIVED', 'SUP008', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0710', TO_DATE('2023-03-29', 'YYYY-MM-DD'), TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-03-31', 'YYYY-MM-DD'), 38.5, 'RECEIVED', 'SUP001', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0711', TO_DATE('2023-03-31', 'YYYY-MM-DD'), TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2023-04-07', 'YYYY-MM-DD'), 695.22, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0712', TO_DATE('2023-04-04', 'YYYY-MM-DD'), TO_DATE('2023-04-07', 'YYYY-MM-DD'), TO_DATE('2023-04-05', 'YYYY-MM-DD'), 484.5, 'RECEIVED', 'SUP003', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0713', TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2023-04-10', 'YYYY-MM-DD'), TO_DATE('2023-04-13', 'YYYY-MM-DD'), 415.28, 'RECEIVED', 'SUP005', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0714', TO_DATE('2023-04-07', 'YYYY-MM-DD'), TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-21', 'YYYY-MM-DD'), 149.46, 'RECEIVED', 'SUP009', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0715', TO_DATE('2023-04-08', 'YYYY-MM-DD'), TO_DATE('2023-04-13', 'YYYY-MM-DD'), TO_DATE('2023-04-13', 'YYYY-MM-DD'), 151.97, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0716', TO_DATE('2023-04-09', 'YYYY-MM-DD'), TO_DATE('2023-04-17', 'YYYY-MM-DD'), TO_DATE('2023-04-21', 'YYYY-MM-DD'), 1093.54, 'RECEIVED', 'SUP009', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0717', TO_DATE('2023-04-11', 'YYYY-MM-DD'), TO_DATE('2023-04-14', 'YYYY-MM-DD'), TO_DATE('2023-04-14', 'YYYY-MM-DD'), 265.32, 'RECEIVED', 'SUP001', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0718', TO_DATE('2023-04-11', 'YYYY-MM-DD'), TO_DATE('2023-04-16', 'YYYY-MM-DD'), TO_DATE('2023-04-19', 'YYYY-MM-DD'), 514.61, 'RECEIVED', 'SUP005', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0719', TO_DATE('2023-04-12', 'YYYY-MM-DD'), TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-15', 'YYYY-MM-DD'), 230.73, 'RECEIVED', 'SUP003', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0720', TO_DATE('2023-04-12', 'YYYY-MM-DD'), TO_DATE('2023-04-17', 'YYYY-MM-DD'), TO_DATE('2023-04-16', 'YYYY-MM-DD'), 252.51, 'RECEIVED', 'SUP004', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0721', TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-18', 'YYYY-MM-DD'), TO_DATE('2023-04-17', 'YYYY-MM-DD'), 670.2, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0722', TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-18', 'YYYY-MM-DD'), TO_DATE('2023-04-18', 'YYYY-MM-DD'), 257.04, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0723', TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_DATE('2023-04-20', 'YYYY-MM-DD'), TO_DATE('2023-04-19', 'YYYY-MM-DD'), 104.34, 'RECEIVED', 'SUP005', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0724', TO_DATE('2023-04-16', 'YYYY-MM-DD'), TO_DATE('2023-04-21', 'YYYY-MM-DD'), NULL, 155.84, 'CANCELLED', 'SUP007', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0725', TO_DATE('2023-04-17', 'YYYY-MM-DD'), TO_DATE('2023-04-20', 'YYYY-MM-DD'), TO_DATE('2023-04-18', 'YYYY-MM-DD'), 1168.64, 'RECEIVED', 'SUP001', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0726', TO_DATE('2023-04-17', 'YYYY-MM-DD'), TO_DATE('2023-04-25', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), 228.28, 'RECEIVED', 'SUP009', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0727', TO_DATE('2023-04-18', 'YYYY-MM-DD'), TO_DATE('2023-04-23', 'YYYY-MM-DD'), TO_DATE('2023-04-24', 'YYYY-MM-DD'), 279.54, 'RECEIVED', 'SUP005', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0728', TO_DATE('2023-04-19', 'YYYY-MM-DD'), TO_DATE('2023-04-22', 'YYYY-MM-DD'), TO_DATE('2023-04-20', 'YYYY-MM-DD'), 450.42, 'RECEIVED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0729', TO_DATE('2023-04-19', 'YYYY-MM-DD'), TO_DATE('2023-04-22', 'YYYY-MM-DD'), TO_DATE('2023-04-20', 'YYYY-MM-DD'), 832.53, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0730', TO_DATE('2023-04-22', 'YYYY-MM-DD'), TO_DATE('2023-04-27', 'YYYY-MM-DD'), TO_DATE('2023-04-26', 'YYYY-MM-DD'), 121.38, 'RECEIVED', 'SUP007', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0731', TO_DATE('2023-04-22', 'YYYY-MM-DD'), TO_DATE('2023-04-25', 'YYYY-MM-DD'), TO_DATE('2023-04-23', 'YYYY-MM-DD'), 176.96, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0732', TO_DATE('2023-04-22', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), TO_DATE('2023-05-03', 'YYYY-MM-DD'), 872.65, 'RECEIVED', 'SUP010', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0733', TO_DATE('2023-04-23', 'YYYY-MM-DD'), TO_DATE('2023-04-26', 'YYYY-MM-DD'), TO_DATE('2023-04-27', 'YYYY-MM-DD'), 287.54, 'RECEIVED', 'SUP003', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0734', TO_DATE('2023-04-23', 'YYYY-MM-DD'), TO_DATE('2023-04-26', 'YYYY-MM-DD'), TO_DATE('2023-04-26', 'YYYY-MM-DD'), 575.04, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0735', TO_DATE('2023-04-23', 'YYYY-MM-DD'), TO_DATE('2023-04-28', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), 576.81, 'RECEIVED', 'SUP007', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0736', TO_DATE('2023-04-24', 'YYYY-MM-DD'), TO_DATE('2023-04-27', 'YYYY-MM-DD'), TO_DATE('2023-04-28', 'YYYY-MM-DD'), 32.5, 'RECEIVED', 'SUP001', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0737', TO_DATE('2023-04-25', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), TO_DATE('2023-05-02', 'YYYY-MM-DD'), 1136.7, 'RECEIVED', 'SUP007', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0738', TO_DATE('2023-04-26', 'YYYY-MM-DD'), TO_DATE('2023-04-29', 'YYYY-MM-DD'), TO_DATE('2023-04-27', 'YYYY-MM-DD'), 120.27, 'RECEIVED', 'SUP001', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0739', TO_DATE('2023-04-26', 'YYYY-MM-DD'), TO_DATE('2023-05-04', 'YYYY-MM-DD'), TO_DATE('2023-05-10', 'YYYY-MM-DD'), 2931.79, 'RECEIVED', 'SUP010', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0740', TO_DATE('2023-04-27', 'YYYY-MM-DD'), TO_DATE('2023-05-05', 'YYYY-MM-DD'), TO_DATE('2023-05-11', 'YYYY-MM-DD'), 278.76, 'RECEIVED', 'SUP008', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0741', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-09', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 561.08, 'RECEIVED', 'SUP008', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0742', TO_DATE('2023-05-02', 'YYYY-MM-DD'), TO_DATE('2023-05-07', 'YYYY-MM-DD'), TO_DATE('2023-05-06', 'YYYY-MM-DD'), 195.13, 'RECEIVED', 'SUP005', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0743', TO_DATE('2023-05-04', 'YYYY-MM-DD'), TO_DATE('2023-05-09', 'YYYY-MM-DD'), TO_DATE('2023-05-12', 'YYYY-MM-DD'), 18.1, 'RECEIVED', 'SUP006', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0744', TO_DATE('2023-05-05', 'YYYY-MM-DD'), TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-05-12', 'YYYY-MM-DD'), 65.0, 'RECEIVED', 'SUP005', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0745', TO_DATE('2023-05-06', 'YYYY-MM-DD'), TO_DATE('2023-05-09', 'YYYY-MM-DD'), TO_DATE('2023-05-08', 'YYYY-MM-DD'), 23.98, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0746', TO_DATE('2023-05-09', 'YYYY-MM-DD'), TO_DATE('2023-05-12', 'YYYY-MM-DD'), TO_DATE('2023-05-10', 'YYYY-MM-DD'), 120.94, 'RECEIVED', 'SUP001', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0747', TO_DATE('2023-05-09', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-13', 'YYYY-MM-DD'), 216.67, 'RECEIVED', 'SUP007', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0748', TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'), 1118.37, 'RECEIVED', 'SUP006', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0749', TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 60.2, 'RECEIVED', 'SUP007', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0750', TO_DATE('2023-05-11', 'YYYY-MM-DD'), TO_DATE('2023-05-16', 'YYYY-MM-DD'), TO_DATE('2023-05-18', 'YYYY-MM-DD'), 232.46, 'RECEIVED', 'SUP006', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0751', TO_DATE('2023-05-12', 'YYYY-MM-DD'), TO_DATE('2023-05-17', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'), 97.44, 'RECEIVED', 'SUP006', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0752', TO_DATE('2023-05-12', 'YYYY-MM-DD'), TO_DATE('2023-05-17', 'YYYY-MM-DD'), TO_DATE('2023-05-16', 'YYYY-MM-DD'), 465.19, 'RECEIVED', 'SUP004', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0753', TO_DATE('2023-05-14', 'YYYY-MM-DD'), TO_DATE('2023-05-22', 'YYYY-MM-DD'), TO_DATE('2023-05-24', 'YYYY-MM-DD'), 127.25, 'RECEIVED', 'SUP010', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0754', TO_DATE('2023-05-17', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'), TO_DATE('2023-05-18', 'YYYY-MM-DD'), 72.24, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0755', TO_DATE('2023-05-19', 'YYYY-MM-DD'), TO_DATE('2023-05-24', 'YYYY-MM-DD'), TO_DATE('2023-05-23', 'YYYY-MM-DD'), 85.07, 'RECEIVED', 'SUP004', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0756', TO_DATE('2023-05-20', 'YYYY-MM-DD'), TO_DATE('2023-05-25', 'YYYY-MM-DD'), TO_DATE('2023-05-27', 'YYYY-MM-DD'), 964.66, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0757', TO_DATE('2023-05-21', 'YYYY-MM-DD'), TO_DATE('2023-05-24', 'YYYY-MM-DD'), TO_DATE('2023-05-24', 'YYYY-MM-DD'), 2543.84, 'RECEIVED', 'SUP003', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0758', TO_DATE('2023-05-22', 'YYYY-MM-DD'), TO_DATE('2023-05-27', 'YYYY-MM-DD'), TO_DATE('2023-05-26', 'YYYY-MM-DD'), 1102.3, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0759', TO_DATE('2023-05-23', 'YYYY-MM-DD'), TO_DATE('2023-05-28', 'YYYY-MM-DD'), TO_DATE('2023-05-27', 'YYYY-MM-DD'), 21.6, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0760', TO_DATE('2023-05-25', 'YYYY-MM-DD'), TO_DATE('2023-05-30', 'YYYY-MM-DD'), TO_DATE('2023-06-02', 'YYYY-MM-DD'), 158.0, 'RECEIVED', 'SUP007', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0761', TO_DATE('2023-05-26', 'YYYY-MM-DD'), TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2023-06-05', 'YYYY-MM-DD'), 652.2, 'RECEIVED', 'SUP010', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0762', TO_DATE('2023-05-26', 'YYYY-MM-DD'), TO_DATE('2023-05-29', 'YYYY-MM-DD'), TO_DATE('2023-05-27', 'YYYY-MM-DD'), 54.0, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0763', TO_DATE('2023-05-29', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-05-31', 'YYYY-MM-DD'), 2233.54, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0764', TO_DATE('2023-05-31', 'YYYY-MM-DD'), TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-06-06', 'YYYY-MM-DD'), 253.0, 'RECEIVED', 'SUP005', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0765', TO_DATE('2023-05-31', 'YYYY-MM-DD'), TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-06-08', 'YYYY-MM-DD'), 34.6, 'RECEIVED', 'SUP004', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0766', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2023-06-06', 'YYYY-MM-DD'), 142.71, 'RECEIVED', 'SUP005', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0767', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2023-06-06', 'YYYY-MM-DD'), 261.07, 'RECEIVED', 'SUP005', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0768', TO_DATE('2023-06-03', 'YYYY-MM-DD'), TO_DATE('2023-06-11', 'YYYY-MM-DD'), TO_DATE('2023-06-15', 'YYYY-MM-DD'), 777.47, 'RECEIVED', 'SUP010', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0769', TO_DATE('2023-06-04', 'YYYY-MM-DD'), TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2023-06-07', 'YYYY-MM-DD'), 124.1, 'RECEIVED', 'SUP002', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0770', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-09', 'YYYY-MM-DD'), 501.19, 'RECEIVED', 'SUP006', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0771', TO_DATE('2023-06-06', 'YYYY-MM-DD'), TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_DATE('2023-06-10', 'YYYY-MM-DD'), 794.8, 'RECEIVED', 'SUP002', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0772', TO_DATE('2023-06-07', 'YYYY-MM-DD'), TO_DATE('2023-06-12', 'YYYY-MM-DD'), TO_DATE('2023-06-14', 'YYYY-MM-DD'), 68.1, 'RECEIVED', 'SUP006', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0773', TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_DATE('2023-06-11', 'YYYY-MM-DD'), TO_DATE('2023-06-09', 'YYYY-MM-DD'), 113.86, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0774', TO_DATE('2023-06-11', 'YYYY-MM-DD'), TO_DATE('2023-06-14', 'YYYY-MM-DD'), TO_DATE('2023-06-12', 'YYYY-MM-DD'), 173.74, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0775', TO_DATE('2023-06-12', 'YYYY-MM-DD'), TO_DATE('2023-06-17', 'YYYY-MM-DD'), TO_DATE('2023-06-18', 'YYYY-MM-DD'), 203.0, 'RECEIVED', 'SUP007', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0776', TO_DATE('2023-06-12', 'YYYY-MM-DD'), TO_DATE('2023-06-17', 'YYYY-MM-DD'), TO_DATE('2023-06-16', 'YYYY-MM-DD'), 275.34, 'RECEIVED', 'SUP006', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0777', TO_DATE('2023-06-12', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 1678.44, 'RECEIVED', 'SUP011', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0778', TO_DATE('2023-06-14', 'YYYY-MM-DD'), TO_DATE('2023-06-22', 'YYYY-MM-DD'), TO_DATE('2023-06-24', 'YYYY-MM-DD'), 464.53, 'RECEIVED', 'SUP009', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0779', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-23', 'YYYY-MM-DD'), TO_DATE('2023-06-29', 'YYYY-MM-DD'), 375.07, 'RECEIVED', 'SUP009', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0780', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-18', 'YYYY-MM-DD'), TO_DATE('2023-06-16', 'YYYY-MM-DD'), 104.24, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0781', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-23', 'YYYY-MM-DD'), TO_DATE('2023-06-27', 'YYYY-MM-DD'), 623.46, 'RECEIVED', 'SUP008', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0782', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-18', 'YYYY-MM-DD'), NULL, 130.43, 'CANCELLED', 'SUP001', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0783', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2023-06-23', 'YYYY-MM-DD'), TO_DATE('2023-06-29', 'YYYY-MM-DD'), 23.98, 'RECEIVED', 'SUP009', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0784', TO_DATE('2023-06-16', 'YYYY-MM-DD'), TO_DATE('2023-06-21', 'YYYY-MM-DD'), TO_DATE('2023-06-21', 'YYYY-MM-DD'), 826.95, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0785', TO_DATE('2023-06-17', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'), TO_DATE('2023-06-18', 'YYYY-MM-DD'), 181.5, 'RECEIVED', 'SUP003', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0786', TO_DATE('2023-06-18', 'YYYY-MM-DD'), TO_DATE('2023-06-23', 'YYYY-MM-DD'), TO_DATE('2023-06-26', 'YYYY-MM-DD'), 187.8, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0787', TO_DATE('2023-06-20', 'YYYY-MM-DD'), TO_DATE('2023-06-28', 'YYYY-MM-DD'), TO_DATE('2023-07-02', 'YYYY-MM-DD'), 697.83, 'RECEIVED', 'SUP010', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0788', TO_DATE('2023-06-20', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-27', 'YYYY-MM-DD'), 4312.62, 'RECEIVED', 'SUP004', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0789', TO_DATE('2023-06-21', 'YYYY-MM-DD'), TO_DATE('2023-06-26', 'YYYY-MM-DD'), TO_DATE('2023-06-27', 'YYYY-MM-DD'), 269.22, 'RECEIVED', 'SUP006', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0790', TO_DATE('2023-06-21', 'YYYY-MM-DD'), TO_DATE('2023-06-24', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 982.56, 'RECEIVED', 'SUP003', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0791', TO_DATE('2023-06-23', 'YYYY-MM-DD'), TO_DATE('2023-06-28', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 506.4, 'RECEIVED', 'SUP004', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0792', TO_DATE('2023-06-23', 'YYYY-MM-DD'), TO_DATE('2023-06-26', 'YYYY-MM-DD'), TO_DATE('2023-06-24', 'YYYY-MM-DD'), 152.38, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0793', TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 188.11, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0794', TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-28', 'YYYY-MM-DD'), TO_DATE('2023-06-29', 'YYYY-MM-DD'), 309.28, 'RECEIVED', 'SUP002', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0795', TO_DATE('2023-06-28', 'YYYY-MM-DD'), TO_DATE('2023-07-03', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), 226.37, 'RECEIVED', 'SUP005', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0796', TO_DATE('2023-06-28', 'YYYY-MM-DD'), TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-02', 'YYYY-MM-DD'), 270.6, 'RECEIVED', 'SUP003', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0797', TO_DATE('2023-06-29', 'YYYY-MM-DD'), TO_DATE('2023-07-04', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), 383.0, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0798', TO_DATE('2023-07-02', 'YYYY-MM-DD'), TO_DATE('2023-07-07', 'YYYY-MM-DD'), TO_DATE('2023-07-09', 'YYYY-MM-DD'), 135.0, 'RECEIVED', 'SUP006', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0799', TO_DATE('2023-07-03', 'YYYY-MM-DD'), TO_DATE('2023-07-08', 'YYYY-MM-DD'), TO_DATE('2023-07-07', 'YYYY-MM-DD'), 1002.57, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0800', TO_DATE('2023-07-04', 'YYYY-MM-DD'), TO_DATE('2023-07-07', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), 79.2, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0801', TO_DATE('2023-07-05', 'YYYY-MM-DD'), TO_DATE('2023-07-08', 'YYYY-MM-DD'), TO_DATE('2023-07-08', 'YYYY-MM-DD'), 666.29, 'RECEIVED', 'SUP001', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0802', TO_DATE('2023-07-07', 'YYYY-MM-DD'), TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-07-11', 'YYYY-MM-DD'), 528.45, 'RECEIVED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0803', TO_DATE('2023-07-08', 'YYYY-MM-DD'), TO_DATE('2023-07-13', 'YYYY-MM-DD'), TO_DATE('2023-07-15', 'YYYY-MM-DD'), 1029.77, 'RECEIVED', 'SUP004', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0804', TO_DATE('2023-07-08', 'YYYY-MM-DD'), TO_DATE('2023-07-13', 'YYYY-MM-DD'), TO_DATE('2023-07-14', 'YYYY-MM-DD'), 25.2, 'RECEIVED', 'SUP006', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0805', TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-07-13', 'YYYY-MM-DD'), TO_DATE('2023-07-14', 'YYYY-MM-DD'), 756.11, 'RECEIVED', 'SUP002', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0806', TO_DATE('2023-07-12', 'YYYY-MM-DD'), TO_DATE('2023-07-17', 'YYYY-MM-DD'), TO_DATE('2023-07-19', 'YYYY-MM-DD'), 1701.59, 'RECEIVED', 'SUP006', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0807', TO_DATE('2023-07-14', 'YYYY-MM-DD'), TO_DATE('2023-07-19', 'YYYY-MM-DD'), TO_DATE('2023-07-21', 'YYYY-MM-DD'), 3556.12, 'RECEIVED', 'SUP005', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0808', TO_DATE('2023-07-14', 'YYYY-MM-DD'), TO_DATE('2023-07-17', 'YYYY-MM-DD'), TO_DATE('2023-07-15', 'YYYY-MM-DD'), 263.84, 'RECEIVED', 'SUP001', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0809', TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2023-07-20', 'YYYY-MM-DD'), TO_DATE('2023-07-23', 'YYYY-MM-DD'), 544.95, 'RECEIVED', 'SUP006', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0810', TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2023-07-23', 'YYYY-MM-DD'), TO_DATE('2023-07-27', 'YYYY-MM-DD'), 441.51, 'RECEIVED', 'SUP010', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0811', TO_DATE('2023-07-16', 'YYYY-MM-DD'), TO_DATE('2023-07-21', 'YYYY-MM-DD'), TO_DATE('2023-07-22', 'YYYY-MM-DD'), 1093.8, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0812', TO_DATE('2023-07-19', 'YYYY-MM-DD'), TO_DATE('2023-07-27', 'YYYY-MM-DD'), TO_DATE('2023-08-02', 'YYYY-MM-DD'), 1222.8, 'RECEIVED', 'SUP011', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0813', TO_DATE('2023-07-20', 'YYYY-MM-DD'), TO_DATE('2023-07-23', 'YYYY-MM-DD'), TO_DATE('2023-07-21', 'YYYY-MM-DD'), 177.0, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0814', TO_DATE('2023-07-21', 'YYYY-MM-DD'), TO_DATE('2023-07-26', 'YYYY-MM-DD'), TO_DATE('2023-07-26', 'YYYY-MM-DD'), 672.57, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0815', TO_DATE('2023-07-21', 'YYYY-MM-DD'), TO_DATE('2023-07-29', 'YYYY-MM-DD'), TO_DATE('2023-08-03', 'YYYY-MM-DD'), 279.76, 'RECEIVED', 'SUP011', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0816', TO_DATE('2023-07-24', 'YYYY-MM-DD'), TO_DATE('2023-07-29', 'YYYY-MM-DD'), TO_DATE('2023-07-31', 'YYYY-MM-DD'), 597.81, 'RECEIVED', 'SUP006', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0817', TO_DATE('2023-07-24', 'YYYY-MM-DD'), TO_DATE('2023-07-29', 'YYYY-MM-DD'), TO_DATE('2023-07-29', 'YYYY-MM-DD'), 1142.8, 'RECEIVED', 'SUP007', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0818', TO_DATE('2023-07-25', 'YYYY-MM-DD'), TO_DATE('2023-08-02', 'YYYY-MM-DD'), TO_DATE('2023-08-05', 'YYYY-MM-DD'), 173.76, 'RECEIVED', 'SUP011', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0819', TO_DATE('2023-07-25', 'YYYY-MM-DD'), TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_DATE('2023-07-26', 'YYYY-MM-DD'), 2011.14, 'RECEIVED', 'SUP002', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0820', TO_DATE('2023-07-25', 'YYYY-MM-DD'), TO_DATE('2023-07-30', 'YYYY-MM-DD'), TO_DATE('2023-08-02', 'YYYY-MM-DD'), 1648.13, 'RECEIVED', 'SUP006', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0821', TO_DATE('2023-07-29', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), 321.62, 'RECEIVED', 'SUP002', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0822', TO_DATE('2023-07-30', 'YYYY-MM-DD'), TO_DATE('2023-08-04', 'YYYY-MM-DD'), TO_DATE('2023-08-03', 'YYYY-MM-DD'), 284.22, 'RECEIVED', 'SUP006', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0823', TO_DATE('2023-08-02', 'YYYY-MM-DD'), TO_DATE('2023-08-05', 'YYYY-MM-DD'), TO_DATE('2023-08-05', 'YYYY-MM-DD'), 496.63, 'RECEIVED', 'SUP001', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0824', TO_DATE('2023-08-04', 'YYYY-MM-DD'), TO_DATE('2023-08-07', 'YYYY-MM-DD'), TO_DATE('2023-08-07', 'YYYY-MM-DD'), 407.82, 'RECEIVED', 'SUP003', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0825', TO_DATE('2023-08-04', 'YYYY-MM-DD'), TO_DATE('2023-08-07', 'YYYY-MM-DD'), TO_DATE('2023-08-07', 'YYYY-MM-DD'), 641.92, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0826', TO_DATE('2023-08-06', 'YYYY-MM-DD'), TO_DATE('2023-08-09', 'YYYY-MM-DD'), TO_DATE('2023-08-08', 'YYYY-MM-DD'), 144.23, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0827', TO_DATE('2023-08-07', 'YYYY-MM-DD'), TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-08-10', 'YYYY-MM-DD'), 2820.9, 'RECEIVED', 'SUP002', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0828', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-08-13', 'YYYY-MM-DD'), TO_DATE('2023-08-13', 'YYYY-MM-DD'), 94.54, 'RECEIVED', 'SUP003', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0829', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-08-18', 'YYYY-MM-DD'), 233.72, 'RECEIVED', 'SUP007', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0830', TO_DATE('2023-08-13', 'YYYY-MM-DD'), TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_DATE('2023-08-18', 'YYYY-MM-DD'), 507.36, 'RECEIVED', 'SUP006', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0831', TO_DATE('2023-08-14', 'YYYY-MM-DD'), TO_DATE('2023-08-17', 'YYYY-MM-DD'), TO_DATE('2023-08-17', 'YYYY-MM-DD'), 456.11, 'RECEIVED', 'SUP002', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0832', TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-08-20', 'YYYY-MM-DD'), TO_DATE('2023-08-19', 'YYYY-MM-DD'), 953.92, 'RECEIVED', 'SUP006', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0833', TO_DATE('2023-08-17', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD'), TO_DATE('2023-08-23', 'YYYY-MM-DD'), 1798.51, 'RECEIVED', 'SUP004', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0834', TO_DATE('2023-08-18', 'YYYY-MM-DD'), TO_DATE('2023-08-23', 'YYYY-MM-DD'), TO_DATE('2023-08-26', 'YYYY-MM-DD'), 79.2, 'RECEIVED', 'SUP004', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0835', TO_DATE('2023-08-23', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 663.52, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0836', TO_DATE('2023-08-23', 'YYYY-MM-DD'), TO_DATE('2023-08-26', 'YYYY-MM-DD'), TO_DATE('2023-08-26', 'YYYY-MM-DD'), 123.51, 'RECEIVED', 'SUP002', 'S0034');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0837', TO_DATE('2023-08-23', 'YYYY-MM-DD'), TO_DATE('2023-08-28', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 57.78, 'RECEIVED', 'SUP004', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0838', TO_DATE('2023-08-24', 'YYYY-MM-DD'), TO_DATE('2023-08-29', 'YYYY-MM-DD'), TO_DATE('2023-08-29', 'YYYY-MM-DD'), 468.53, 'RECEIVED', 'SUP007', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0839', TO_DATE('2023-08-24', 'YYYY-MM-DD'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), TO_DATE('2023-08-27', 'YYYY-MM-DD'), 1275.96, 'RECEIVED', 'SUP001', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0840', TO_DATE('2023-08-25', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 5874.25, 'RECEIVED', 'SUP005', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0841', TO_DATE('2023-08-25', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-06', 'YYYY-MM-DD'), 257.91, 'RECEIVED', 'SUP009', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0842', TO_DATE('2023-08-26', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), 452.58, 'RECEIVED', 'SUP006', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0843', TO_DATE('2023-08-27', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-04', 'YYYY-MM-DD'), 403.76, 'RECEIVED', 'SUP006', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0844', TO_DATE('2023-08-27', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 1477.45, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0845', TO_DATE('2023-08-28', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'), 283.13, 'RECEIVED', 'SUP001', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0846', TO_DATE('2023-08-30', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 161.56, 'RECEIVED', 'SUP001', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0847', TO_DATE('2023-08-30', 'YYYY-MM-DD'), TO_DATE('2023-09-04', 'YYYY-MM-DD'), NULL, 636.9, 'CANCELLED', 'SUP006', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0848', TO_DATE('2023-08-31', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), TO_DATE('2023-09-03', 'YYYY-MM-DD'), 306.61, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0849', TO_DATE('2023-09-03', 'YYYY-MM-DD'), TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), 375.62, 'RECEIVED', 'SUP008', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0850', TO_DATE('2023-09-07', 'YYYY-MM-DD'), TO_DATE('2023-09-12', 'YYYY-MM-DD'), TO_DATE('2023-09-12', 'YYYY-MM-DD'), 346.69, 'RECEIVED', 'SUP004', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0851', TO_DATE('2023-09-08', 'YYYY-MM-DD'), TO_DATE('2023-09-13', 'YYYY-MM-DD'), TO_DATE('2023-09-13', 'YYYY-MM-DD'), 1792.88, 'RECEIVED', 'SUP006', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0852', TO_DATE('2023-09-08', 'YYYY-MM-DD'), TO_DATE('2023-09-13', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), 259.4, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0853', TO_DATE('2023-09-09', 'YYYY-MM-DD'), TO_DATE('2023-09-12', 'YYYY-MM-DD'), TO_DATE('2023-09-12', 'YYYY-MM-DD'), 293.58, 'RECEIVED', 'SUP002', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0854', TO_DATE('2023-09-11', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), 435.06, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0855', TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-22', 'YYYY-MM-DD'), 222.3, 'RECEIVED', 'SUP006', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0856', TO_DATE('2023-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-28', 'YYYY-MM-DD'), TO_DATE('2023-10-04', 'YYYY-MM-DD'), 267.33, 'RECEIVED', 'SUP009', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0857', TO_DATE('2023-09-21', 'YYYY-MM-DD'), TO_DATE('2023-09-26', 'YYYY-MM-DD'), TO_DATE('2023-09-28', 'YYYY-MM-DD'), 757.08, 'RECEIVED', 'SUP004', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0858', TO_DATE('2023-09-24', 'YYYY-MM-DD'), TO_DATE('2023-09-29', 'YYYY-MM-DD'), TO_DATE('2023-09-28', 'YYYY-MM-DD'), 507.12, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0859', TO_DATE('2023-09-25', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 759.5, 'RECEIVED', 'SUP007', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0860', TO_DATE('2023-09-26', 'YYYY-MM-DD'), TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-03', 'YYYY-MM-DD'), 1416.38, 'RECEIVED', 'SUP007', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0861', TO_DATE('2023-09-26', 'YYYY-MM-DD'), TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'), 253.12, 'RECEIVED', 'SUP005', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0862', TO_DATE('2023-09-26', 'YYYY-MM-DD'), TO_DATE('2023-09-29', 'YYYY-MM-DD'), TO_DATE('2023-09-29', 'YYYY-MM-DD'), 73.7, 'RECEIVED', 'SUP002', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0863', TO_DATE('2023-09-29', 'YYYY-MM-DD'), TO_DATE('2023-10-04', 'YYYY-MM-DD'), TO_DATE('2023-10-06', 'YYYY-MM-DD'), 1283.9, 'RECEIVED', 'SUP006', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0864', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-06', 'YYYY-MM-DD'), TO_DATE('2023-10-08', 'YYYY-MM-DD'), 101.2, 'RECEIVED', 'SUP007', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0865', TO_DATE('2023-10-03', 'YYYY-MM-DD'), TO_DATE('2023-10-11', 'YYYY-MM-DD'), TO_DATE('2023-10-13', 'YYYY-MM-DD'), 179.2, 'RECEIVED', 'SUP009', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0866', TO_DATE('2023-10-04', 'YYYY-MM-DD'), TO_DATE('2023-10-09', 'YYYY-MM-DD'), TO_DATE('2023-10-11', 'YYYY-MM-DD'), 581.06, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0867', TO_DATE('2023-10-04', 'YYYY-MM-DD'), TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_DATE('2023-10-08', 'YYYY-MM-DD'), 74.34, 'RECEIVED', 'SUP001', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0868', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-08', 'YYYY-MM-DD'), TO_DATE('2023-10-07', 'YYYY-MM-DD'), 296.18, 'RECEIVED', 'SUP002', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0869', TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-16', 'YYYY-MM-DD'), 193.53, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0870', TO_DATE('2023-10-10', 'YYYY-MM-DD'), TO_DATE('2023-10-13', 'YYYY-MM-DD'), TO_DATE('2023-10-13', 'YYYY-MM-DD'), 803.8, 'RECEIVED', 'SUP001', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0871', TO_DATE('2023-10-11', 'YYYY-MM-DD'), TO_DATE('2023-10-14', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 387.1, 'RECEIVED', 'SUP003', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0872', TO_DATE('2023-10-11', 'YYYY-MM-DD'), TO_DATE('2023-10-14', 'YYYY-MM-DD'), TO_DATE('2023-10-12', 'YYYY-MM-DD'), 628.51, 'RECEIVED', 'SUP003', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0873', TO_DATE('2023-10-12', 'YYYY-MM-DD'), TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_DATE('2023-10-21', 'YYYY-MM-DD'), 1785.11, 'RECEIVED', 'SUP010', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0874', TO_DATE('2023-10-12', 'YYYY-MM-DD'), TO_DATE('2023-10-17', 'YYYY-MM-DD'), TO_DATE('2023-10-17', 'YYYY-MM-DD'), 542.13, 'RECEIVED', 'SUP004', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0875', TO_DATE('2023-10-14', 'YYYY-MM-DD'), TO_DATE('2023-10-17', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 174.92, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0876', TO_DATE('2023-10-14', 'YYYY-MM-DD'), TO_DATE('2023-10-19', 'YYYY-MM-DD'), TO_DATE('2023-10-19', 'YYYY-MM-DD'), 35.97, 'RECEIVED', 'SUP004', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0877', TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-10-18', 'YYYY-MM-DD'), TO_DATE('2023-10-19', 'YYYY-MM-DD'), 1375.9, 'RECEIVED', 'SUP003', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0878', TO_DATE('2023-10-16', 'YYYY-MM-DD'), TO_DATE('2023-10-24', 'YYYY-MM-DD'), TO_DATE('2023-10-25', 'YYYY-MM-DD'), 26.8, 'RECEIVED', 'SUP008', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0879', TO_DATE('2023-10-17', 'YYYY-MM-DD'), TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_DATE('2023-10-19', 'YYYY-MM-DD'), 566.61, 'RECEIVED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0880', TO_DATE('2023-10-19', 'YYYY-MM-DD'), TO_DATE('2023-10-22', 'YYYY-MM-DD'), TO_DATE('2023-10-22', 'YYYY-MM-DD'), 50.58, 'RECEIVED', 'SUP003', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0881', TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_DATE('2023-10-23', 'YYYY-MM-DD'), TO_DATE('2023-10-23', 'YYYY-MM-DD'), 26.04, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0882', TO_DATE('2023-10-21', 'YYYY-MM-DD'), TO_DATE('2023-10-26', 'YYYY-MM-DD'), TO_DATE('2023-10-28', 'YYYY-MM-DD'), 883.56, 'RECEIVED', 'SUP006', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0883', TO_DATE('2023-10-21', 'YYYY-MM-DD'), TO_DATE('2023-10-24', 'YYYY-MM-DD'), TO_DATE('2023-10-22', 'YYYY-MM-DD'), 39.6, 'RECEIVED', 'SUP001', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0884', TO_DATE('2023-10-22', 'YYYY-MM-DD'), TO_DATE('2023-10-25', 'YYYY-MM-DD'), TO_DATE('2023-10-24', 'YYYY-MM-DD'), 524.21, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0885', TO_DATE('2023-10-23', 'YYYY-MM-DD'), TO_DATE('2023-10-26', 'YYYY-MM-DD'), TO_DATE('2023-10-26', 'YYYY-MM-DD'), 1895.84, 'RECEIVED', 'SUP003', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0886', TO_DATE('2023-10-24', 'YYYY-MM-DD'), TO_DATE('2023-10-29', 'YYYY-MM-DD'), TO_DATE('2023-10-30', 'YYYY-MM-DD'), 121.16, 'RECEIVED', 'SUP007', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0887', TO_DATE('2023-10-26', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'), TO_DATE('2023-11-02', 'YYYY-MM-DD'), 535.67, 'RECEIVED', 'SUP004', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0888', TO_DATE('2023-10-27', 'YYYY-MM-DD'), TO_DATE('2023-10-30', 'YYYY-MM-DD'), TO_DATE('2023-10-28', 'YYYY-MM-DD'), 307.46, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0889', TO_DATE('2023-10-29', 'YYYY-MM-DD'), TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-02', 'YYYY-MM-DD'), 306.43, 'RECEIVED', 'SUP001', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0890', TO_DATE('2023-10-31', 'YYYY-MM-DD'), TO_DATE('2023-11-03', 'YYYY-MM-DD'), TO_DATE('2023-11-02', 'YYYY-MM-DD'), 534.6, 'RECEIVED', 'SUP002', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0891', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-04', 'YYYY-MM-DD'), TO_DATE('2023-11-02', 'YYYY-MM-DD'), 1611.1, 'RECEIVED', 'SUP002', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0892', TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-11-16', 'YYYY-MM-DD'), 354.6, 'RECEIVED', 'SUP010', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0893', TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-07', 'YYYY-MM-DD'), TO_DATE('2023-11-08', 'YYYY-MM-DD'), 2049.97, 'RECEIVED', 'SUP007', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0894', TO_DATE('2023-11-03', 'YYYY-MM-DD'), TO_DATE('2023-11-08', 'YYYY-MM-DD'), TO_DATE('2023-11-07', 'YYYY-MM-DD'), 79.2, 'RECEIVED', 'SUP006', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0895', TO_DATE('2023-11-04', 'YYYY-MM-DD'), TO_DATE('2023-11-09', 'YYYY-MM-DD'), TO_DATE('2023-11-09', 'YYYY-MM-DD'), 168.84, 'RECEIVED', 'SUP004', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0896', TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2023-11-08', 'YYYY-MM-DD'), TO_DATE('2023-11-06', 'YYYY-MM-DD'), 499.5, 'RECEIVED', 'SUP003', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0897', TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2023-11-13', 'YYYY-MM-DD'), TO_DATE('2023-11-14', 'YYYY-MM-DD'), 286.65, 'RECEIVED', 'SUP010', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0898', TO_DATE('2023-11-06', 'YYYY-MM-DD'), TO_DATE('2023-11-09', 'YYYY-MM-DD'), TO_DATE('2023-11-09', 'YYYY-MM-DD'), 548.02, 'RECEIVED', 'SUP001', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0899', TO_DATE('2023-11-06', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'), 177.1, 'RECEIVED', 'SUP006', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0900', TO_DATE('2023-11-07', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), 2432.57, 'RECEIVED', 'SUP005', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0901', TO_DATE('2023-11-08', 'YYYY-MM-DD'), TO_DATE('2023-11-13', 'YYYY-MM-DD'), TO_DATE('2023-11-14', 'YYYY-MM-DD'), 352.82, 'RECEIVED', 'SUP004', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0902', TO_DATE('2023-11-08', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_DATE('2023-11-10', 'YYYY-MM-DD'), 746.61, 'RECEIVED', 'SUP003', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0903', TO_DATE('2023-11-08', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'), 255.83, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0904', TO_DATE('2023-11-09', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'), 44.71, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0905', TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-11-17', 'YYYY-MM-DD'), 363.93, 'RECEIVED', 'SUP006', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0906', TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-11-18', 'YYYY-MM-DD'), TO_DATE('2023-11-21', 'YYYY-MM-DD'), 309.18, 'RECEIVED', 'SUP009', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0907', TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-11-13', 'YYYY-MM-DD'), TO_DATE('2023-11-13', 'YYYY-MM-DD'), 306.53, 'RECEIVED', 'SUP003', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0908', TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-11-17', 'YYYY-MM-DD'), 397.32, 'RECEIVED', 'SUP006', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0909', TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-11-13', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), 208.56, 'RECEIVED', 'SUP003', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0910', TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_DATE('2023-11-19', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), 887.27, 'RECEIVED', 'SUP009', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0911', TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), 483.18, 'RECEIVED', 'SUP009', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0912', TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-17', 'YYYY-MM-DD'), TO_DATE('2023-11-19', 'YYYY-MM-DD'), 80.77, 'RECEIVED', 'SUP004', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0913', TO_DATE('2023-11-13', 'YYYY-MM-DD'), TO_DATE('2023-11-16', 'YYYY-MM-DD'), TO_DATE('2023-11-16', 'YYYY-MM-DD'), 108.67, 'RECEIVED', 'SUP001', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0914', TO_DATE('2023-11-13', 'YYYY-MM-DD'), TO_DATE('2023-11-16', 'YYYY-MM-DD'), TO_DATE('2023-11-14', 'YYYY-MM-DD'), 437.12, 'RECEIVED', 'SUP002', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0915', TO_DATE('2023-11-14', 'YYYY-MM-DD'), TO_DATE('2023-11-22', 'YYYY-MM-DD'), TO_DATE('2023-11-26', 'YYYY-MM-DD'), 2885.45, 'RECEIVED', 'SUP010', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0916', TO_DATE('2023-11-14', 'YYYY-MM-DD'), TO_DATE('2023-11-17', 'YYYY-MM-DD'), TO_DATE('2023-11-17', 'YYYY-MM-DD'), 136.34, 'RECEIVED', 'SUP001', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0917', TO_DATE('2023-11-14', 'YYYY-MM-DD'), TO_DATE('2023-11-19', 'YYYY-MM-DD'), TO_DATE('2023-11-18', 'YYYY-MM-DD'), 2556.58, 'RECEIVED', 'SUP007', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0918', TO_DATE('2023-11-14', 'YYYY-MM-DD'), TO_DATE('2023-11-17', 'YYYY-MM-DD'), TO_DATE('2023-11-17', 'YYYY-MM-DD'), 590.94, 'RECEIVED', 'SUP003', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0919', TO_DATE('2023-11-16', 'YYYY-MM-DD'), TO_DATE('2023-11-19', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), 489.41, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0920', TO_DATE('2023-11-16', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), TO_DATE('2023-11-29', 'YYYY-MM-DD'), 776.64, 'RECEIVED', 'SUP009', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0921', TO_DATE('2023-11-16', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), TO_DATE('2023-11-28', 'YYYY-MM-DD'), 108.23, 'RECEIVED', 'SUP010', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0922', TO_DATE('2023-11-16', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'), 344.37, 'RECEIVED', 'SUP008', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0923', TO_DATE('2023-11-17', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-19', 'YYYY-MM-DD'), 809.84, 'RECEIVED', 'SUP002', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0924', TO_DATE('2023-11-17', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-18', 'YYYY-MM-DD'), 80.64, 'RECEIVED', 'SUP001', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0925', TO_DATE('2023-11-18', 'YYYY-MM-DD'), TO_DATE('2023-11-26', 'YYYY-MM-DD'), TO_DATE('2023-12-01', 'YYYY-MM-DD'), 560.43, 'RECEIVED', 'SUP010', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0926', TO_DATE('2023-11-18', 'YYYY-MM-DD'), TO_DATE('2023-11-21', 'YYYY-MM-DD'), TO_DATE('2023-11-19', 'YYYY-MM-DD'), 651.1, 'RECEIVED', 'SUP001', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0927', TO_DATE('2023-11-19', 'YYYY-MM-DD'), TO_DATE('2023-11-27', 'YYYY-MM-DD'), TO_DATE('2023-12-01', 'YYYY-MM-DD'), 236.9, 'RECEIVED', 'SUP009', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0928', TO_DATE('2023-11-19', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), TO_DATE('2023-11-24', 'YYYY-MM-DD'), 59.84, 'RECEIVED', 'SUP007', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0929', TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-23', 'YYYY-MM-DD'), TO_DATE('2023-11-21', 'YYYY-MM-DD'), 975.41, 'RECEIVED', 'SUP003', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0930', TO_DATE('2023-11-21', 'YYYY-MM-DD'), TO_DATE('2023-11-26', 'YYYY-MM-DD'), TO_DATE('2023-11-28', 'YYYY-MM-DD'), 395.85, 'RECEIVED', 'SUP006', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0931', TO_DATE('2023-11-22', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'), TO_DATE('2023-11-25', 'YYYY-MM-DD'), 1699.83, 'RECEIVED', 'SUP002', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0932', TO_DATE('2023-11-23', 'YYYY-MM-DD'), TO_DATE('2023-11-28', 'YYYY-MM-DD'), TO_DATE('2023-11-27', 'YYYY-MM-DD'), 386.92, 'RECEIVED', 'SUP004', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0933', TO_DATE('2023-11-24', 'YYYY-MM-DD'), TO_DATE('2023-11-29', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), 80.74, 'RECEIVED', 'SUP007', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0934', TO_DATE('2023-11-24', 'YYYY-MM-DD'), TO_DATE('2023-11-29', 'YYYY-MM-DD'), TO_DATE('2023-11-28', 'YYYY-MM-DD'), 471.22, 'RECEIVED', 'SUP004', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0935', TO_DATE('2023-11-25', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'), TO_DATE('2023-12-03', 'YYYY-MM-DD'), 95.06, 'RECEIVED', 'SUP006', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0936', TO_DATE('2023-11-25', 'YYYY-MM-DD'), TO_DATE('2023-12-03', 'YYYY-MM-DD'), TO_DATE('2023-12-08', 'YYYY-MM-DD'), 312.01, 'RECEIVED', 'SUP009', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0937', TO_DATE('2023-11-25', 'YYYY-MM-DD'), TO_DATE('2023-11-28', 'YYYY-MM-DD'), TO_DATE('2023-11-29', 'YYYY-MM-DD'), 25.81, 'RECEIVED', 'SUP001', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0938', TO_DATE('2023-11-25', 'YYYY-MM-DD'), TO_DATE('2023-12-03', 'YYYY-MM-DD'), TO_DATE('2023-12-05', 'YYYY-MM-DD'), 25.2, 'RECEIVED', 'SUP009', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0939', TO_DATE('2023-11-26', 'YYYY-MM-DD'), TO_DATE('2023-12-04', 'YYYY-MM-DD'), TO_DATE('2023-12-05', 'YYYY-MM-DD'), 119.54, 'RECEIVED', 'SUP009', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0940', TO_DATE('2023-11-28', 'YYYY-MM-DD'), TO_DATE('2023-12-03', 'YYYY-MM-DD'), TO_DATE('2023-12-04', 'YYYY-MM-DD'), 92.92, 'RECEIVED', 'SUP007', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0941', TO_DATE('2023-11-28', 'YYYY-MM-DD'), TO_DATE('2023-12-03', 'YYYY-MM-DD'), TO_DATE('2023-12-02', 'YYYY-MM-DD'), 2012.68, 'RECEIVED', 'SUP005', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0942', TO_DATE('2023-12-03', 'YYYY-MM-DD'), TO_DATE('2023-12-08', 'YYYY-MM-DD'), TO_DATE('2023-12-10', 'YYYY-MM-DD'), 459.76, 'RECEIVED', 'SUP005', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0943', TO_DATE('2023-12-05', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 293.32, 'RECEIVED', 'SUP011', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0944', TO_DATE('2023-12-05', 'YYYY-MM-DD'), TO_DATE('2023-12-08', 'YYYY-MM-DD'), TO_DATE('2023-12-07', 'YYYY-MM-DD'), 337.68, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0945', TO_DATE('2023-12-06', 'YYYY-MM-DD'), TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-12', 'YYYY-MM-DD'), 134.04, 'RECEIVED', 'SUP005', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0946', TO_DATE('2023-12-06', 'YYYY-MM-DD'), TO_DATE('2023-12-09', 'YYYY-MM-DD'), TO_DATE('2023-12-07', 'YYYY-MM-DD'), 77.28, 'RECEIVED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0947', TO_DATE('2023-12-07', 'YYYY-MM-DD'), TO_DATE('2023-12-12', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), 1453.44, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0948', TO_DATE('2023-12-07', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), TO_DATE('2023-12-18', 'YYYY-MM-DD'), 691.82, 'RECEIVED', 'SUP008', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0949', TO_DATE('2023-12-08', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), TO_DATE('2023-12-12', 'YYYY-MM-DD'), 437.25, 'RECEIVED', 'SUP007', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0950', TO_DATE('2023-12-08', 'YYYY-MM-DD'), TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-11', 'YYYY-MM-DD'), 1247.44, 'RECEIVED', 'SUP001', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0951', TO_DATE('2023-12-08', 'YYYY-MM-DD'), TO_DATE('2023-12-16', 'YYYY-MM-DD'), TO_DATE('2023-12-22', 'YYYY-MM-DD'), 1290.79, 'RECEIVED', 'SUP009', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0952', TO_DATE('2023-12-08', 'YYYY-MM-DD'), TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-09', 'YYYY-MM-DD'), 506.99, 'RECEIVED', 'SUP002', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0953', TO_DATE('2023-12-08', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), 79.2, 'RECEIVED', 'SUP006', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0954', TO_DATE('2023-12-09', 'YYYY-MM-DD'), TO_DATE('2023-12-17', 'YYYY-MM-DD'), TO_DATE('2023-12-20', 'YYYY-MM-DD'), 583.2, 'RECEIVED', 'SUP008', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0955', TO_DATE('2023-12-10', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), TO_DATE('2023-12-16', 'YYYY-MM-DD'), 263.6, 'RECEIVED', 'SUP007', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0956', TO_DATE('2023-12-10', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), TO_DATE('2023-12-14', 'YYYY-MM-DD'), 1362.68, 'RECEIVED', 'SUP005', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0957', TO_DATE('2023-12-10', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'), 35.5, 'RECEIVED', 'SUP001', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0958', TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-14', 'YYYY-MM-DD'), TO_DATE('2023-12-14', 'YYYY-MM-DD'), 339.31, 'RECEIVED', 'SUP002', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0959', TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-14', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 1775.34, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0960', TO_DATE('2023-12-12', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 120.2, 'RECEIVED', 'SUP001', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0961', TO_DATE('2023-12-14', 'YYYY-MM-DD'), TO_DATE('2023-12-22', 'YYYY-MM-DD'), TO_DATE('2023-12-26', 'YYYY-MM-DD'), 488.79, 'RECEIVED', 'SUP011', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0962', TO_DATE('2023-12-16', 'YYYY-MM-DD'), TO_DATE('2023-12-19', 'YYYY-MM-DD'), TO_DATE('2023-12-20', 'YYYY-MM-DD'), 1664.07, 'RECEIVED', 'SUP002', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0963', TO_DATE('2023-12-16', 'YYYY-MM-DD'), TO_DATE('2023-12-19', 'YYYY-MM-DD'), TO_DATE('2023-12-20', 'YYYY-MM-DD'), 993.67, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0964', TO_DATE('2023-12-18', 'YYYY-MM-DD'), TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2023-12-29', 'YYYY-MM-DD'), 280.37, 'RECEIVED', 'SUP010', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0965', TO_DATE('2023-12-18', 'YYYY-MM-DD'), TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2023-12-29', 'YYYY-MM-DD'), 1939.01, 'RECEIVED', 'SUP010', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0966', TO_DATE('2023-12-19', 'YYYY-MM-DD'), TO_DATE('2023-12-24', 'YYYY-MM-DD'), TO_DATE('2023-12-24', 'YYYY-MM-DD'), 1227.82, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0967', TO_DATE('2023-12-19', 'YYYY-MM-DD'), TO_DATE('2023-12-22', 'YYYY-MM-DD'), TO_DATE('2023-12-23', 'YYYY-MM-DD'), 1149.36, 'RECEIVED', 'SUP003', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0968', TO_DATE('2023-12-19', 'YYYY-MM-DD'), TO_DATE('2023-12-24', 'YYYY-MM-DD'), TO_DATE('2023-12-24', 'YYYY-MM-DD'), 188.55, 'RECEIVED', 'SUP004', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0969', TO_DATE('2023-12-20', 'YYYY-MM-DD'), TO_DATE('2023-12-25', 'YYYY-MM-DD'), TO_DATE('2023-12-28', 'YYYY-MM-DD'), 300.77, 'RECEIVED', 'SUP006', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0970', TO_DATE('2023-12-20', 'YYYY-MM-DD'), TO_DATE('2023-12-23', 'YYYY-MM-DD'), NULL, 634.32, 'CANCELLED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0971', TO_DATE('2023-12-20', 'YYYY-MM-DD'), TO_DATE('2023-12-28', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), 436.8, 'RECEIVED', 'SUP009', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0972', TO_DATE('2023-12-22', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'), TO_DATE('2023-12-30', 'YYYY-MM-DD'), 404.8, 'RECEIVED', 'SUP006', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0973', TO_DATE('2023-12-23', 'YYYY-MM-DD'), TO_DATE('2023-12-28', 'YYYY-MM-DD'), TO_DATE('2023-12-29', 'YYYY-MM-DD'), 419.82, 'RECEIVED', 'SUP005', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0974', TO_DATE('2023-12-23', 'YYYY-MM-DD'), TO_DATE('2023-12-28', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'), 1023.16, 'RECEIVED', 'SUP006', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0975', TO_DATE('2023-12-23', 'YYYY-MM-DD'), TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2023-12-24', 'YYYY-MM-DD'), 579.31, 'RECEIVED', 'SUP002', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0976', TO_DATE('2023-12-24', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'), TO_DATE('2023-12-25', 'YYYY-MM-DD'), 191.68, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0977', TO_DATE('2023-12-24', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'), TO_DATE('2023-12-26', 'YYYY-MM-DD'), 215.93, 'RECEIVED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0978', TO_DATE('2023-12-24', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-07', 'YYYY-MM-DD'), 591.92, 'RECEIVED', 'SUP010', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0979', TO_DATE('2023-12-24', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'), 1531.79, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0980', TO_DATE('2023-12-25', 'YYYY-MM-DD'), TO_DATE('2023-12-28', 'YYYY-MM-DD'), TO_DATE('2023-12-29', 'YYYY-MM-DD'), 276.64, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0981', TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2023-12-29', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'), 365.06, 'RECEIVED', 'SUP001', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0982', TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), TO_DATE('2024-01-05', 'YYYY-MM-DD'), 719.04, 'RECEIVED', 'SUP010', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0983', TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2023-12-29', 'YYYY-MM-DD'), TO_DATE('2023-12-30', 'YYYY-MM-DD'), 199.1, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0984', TO_DATE('2023-12-26', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), TO_DATE('2024-01-04', 'YYYY-MM-DD'), 55.7, 'RECEIVED', 'SUP010', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0985', TO_DATE('2023-12-27', 'YYYY-MM-DD'), TO_DATE('2023-12-30', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 189.96, 'RECEIVED', 'SUP001', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0986', TO_DATE('2023-12-27', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-04', 'YYYY-MM-DD'), 150.98, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0987', TO_DATE('2023-12-28', 'YYYY-MM-DD'), TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), 121.63, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0988', TO_DATE('2023-12-28', 'YYYY-MM-DD'), TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-07', 'YYYY-MM-DD'), 466.12, 'RECEIVED', 'SUP008', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0989', TO_DATE('2023-12-30', 'YYYY-MM-DD'), TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_DATE('2024-01-06', 'YYYY-MM-DD'), 75.8, 'RECEIVED', 'SUP006', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0990', TO_DATE('2023-12-30', 'YYYY-MM-DD'), TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_DATE('2024-01-02', 'YYYY-MM-DD'), 2363.52, 'RECEIVED', 'SUP003', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0991', TO_DATE('2023-12-30', 'YYYY-MM-DD'), TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), 1325.7, 'RECEIVED', 'SUP002', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0992', TO_DATE('2023-12-31', 'YYYY-MM-DD'), TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-07', 'YYYY-MM-DD'), 154.56, 'RECEIVED', 'SUP005', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0993', TO_DATE('2023-12-31', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), TO_DATE('2024-01-03', 'YYYY-MM-DD'), 329.07, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0994', TO_DATE('2023-12-31', 'YYYY-MM-DD'), TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-09', 'YYYY-MM-DD'), 386.7, 'RECEIVED', 'SUP009', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0995', TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), 80.4, 'RECEIVED', 'SUP009', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0996', TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_DATE('2024-01-06', 'YYYY-MM-DD'), 206.24, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0997', TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), 550.42, 'RECEIVED', 'SUP010', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0998', TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_DATE('2024-01-08', 'YYYY-MM-DD'), 276.8, 'RECEIVED', 'SUP001', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO0999', TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), 221.04, 'RECEIVED', 'SUP011', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1000', TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-09', 'YYYY-MM-DD'), 641.51, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1001', TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-06', 'YYYY-MM-DD'), 462.98, 'RECEIVED', 'SUP001', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1002', TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-09', 'YYYY-MM-DD'), 688.72, 'RECEIVED', 'SUP001', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1003', TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-11', 'YYYY-MM-DD'), 321.48, 'RECEIVED', 'SUP003', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1004', TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-08', 'YYYY-MM-DD'), 300.94, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1005', TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-11', 'YYYY-MM-DD'), TO_DATE('2024-01-09', 'YYYY-MM-DD'), 912.69, 'RECEIVED', 'SUP003', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1006', TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-11', 'YYYY-MM-DD'), TO_DATE('2024-01-11', 'YYYY-MM-DD'), 490.67, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1007', TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_DATE('2024-01-12', 'YYYY-MM-DD'), 90.19, 'RECEIVED', 'SUP007', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1008', TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-17', 'YYYY-MM-DD'), 492.5, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1009', TO_DATE('2024-01-11', 'YYYY-MM-DD'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), NULL, 180.89, 'CANCELLED', 'SUP005', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1010', TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), 345.21, 'RECEIVED', 'SUP002', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1011', TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-01-17', 'YYYY-MM-DD'), 776.4, 'RECEIVED', 'SUP003', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1012', TO_DATE('2024-01-14', 'YYYY-MM-DD'), TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_DATE('2024-01-21', 'YYYY-MM-DD'), 189.85, 'RECEIVED', 'SUP005', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1013', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-23', 'YYYY-MM-DD'), NULL, 638.67, 'CANCELLED', 'SUP010', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1014', TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_DATE('2024-01-21', 'YYYY-MM-DD'), TO_DATE('2024-01-24', 'YYYY-MM-DD'), 319.02, 'RECEIVED', 'SUP004', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1015', TO_DATE('2024-01-17', 'YYYY-MM-DD'), TO_DATE('2024-01-22', 'YYYY-MM-DD'), TO_DATE('2024-01-24', 'YYYY-MM-DD'), 397.92, 'RECEIVED', 'SUP006', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1016', TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_DATE('2024-01-27', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), 365.6, 'RECEIVED', 'SUP010', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1017', TO_DATE('2024-01-20', 'YYYY-MM-DD'), TO_DATE('2024-01-25', 'YYYY-MM-DD'), TO_DATE('2024-01-25', 'YYYY-MM-DD'), 470.1, 'RECEIVED', 'SUP006', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1018', TO_DATE('2024-01-20', 'YYYY-MM-DD'), TO_DATE('2024-01-23', 'YYYY-MM-DD'), TO_DATE('2024-01-22', 'YYYY-MM-DD'), 423.72, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1019', TO_DATE('2024-01-21', 'YYYY-MM-DD'), TO_DATE('2024-01-29', 'YYYY-MM-DD'), TO_DATE('2024-02-02', 'YYYY-MM-DD'), 252.65, 'RECEIVED', 'SUP011', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1020', TO_DATE('2024-01-23', 'YYYY-MM-DD'), TO_DATE('2024-01-28', 'YYYY-MM-DD'), TO_DATE('2024-01-27', 'YYYY-MM-DD'), 286.08, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1021', TO_DATE('2024-01-24', 'YYYY-MM-DD'), TO_DATE('2024-01-29', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), 1019.49, 'RECEIVED', 'SUP007', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1022', TO_DATE('2024-01-27', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'), 409.37, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1023', TO_DATE('2024-01-27', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-03', 'YYYY-MM-DD'), 155.92, 'RECEIVED', 'SUP005', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1024', TO_DATE('2024-01-27', 'YYYY-MM-DD'), TO_DATE('2024-02-04', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), 51.05, 'RECEIVED', 'SUP009', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1025', TO_DATE('2024-01-27', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), TO_DATE('2024-01-28', 'YYYY-MM-DD'), 259.44, 'RECEIVED', 'SUP002', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1026', TO_DATE('2024-01-29', 'YYYY-MM-DD'), TO_DATE('2024-02-03', 'YYYY-MM-DD'), TO_DATE('2024-02-05', 'YYYY-MM-DD'), 172.96, 'RECEIVED', 'SUP006', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1027', TO_DATE('2024-01-31', 'YYYY-MM-DD'), TO_DATE('2024-02-03', 'YYYY-MM-DD'), TO_DATE('2024-02-04', 'YYYY-MM-DD'), 705.07, 'RECEIVED', 'SUP001', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1028', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-04', 'YYYY-MM-DD'), TO_DATE('2024-02-02', 'YYYY-MM-DD'), 3062.63, 'RECEIVED', 'SUP002', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1029', TO_DATE('2024-02-02', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), 163.63, 'RECEIVED', 'SUP008', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1030', TO_DATE('2024-02-03', 'YYYY-MM-DD'), TO_DATE('2024-02-11', 'YYYY-MM-DD'), TO_DATE('2024-02-17', 'YYYY-MM-DD'), 795.56, 'RECEIVED', 'SUP010', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1031', TO_DATE('2024-02-03', 'YYYY-MM-DD'), TO_DATE('2024-02-08', 'YYYY-MM-DD'), TO_DATE('2024-02-07', 'YYYY-MM-DD'), 365.6, 'RECEIVED', 'SUP004', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1032', TO_DATE('2024-02-05', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), 580.14, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1033', TO_DATE('2024-02-06', 'YYYY-MM-DD'), TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-02-17', 'YYYY-MM-DD'), 1126.69, 'RECEIVED', 'SUP009', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1034', TO_DATE('2024-02-06', 'YYYY-MM-DD'), TO_DATE('2024-02-11', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), 671.24, 'RECEIVED', 'SUP007', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1035', TO_DATE('2024-02-07', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-09', 'YYYY-MM-DD'), 52.21, 'RECEIVED', 'SUP003', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1036', TO_DATE('2024-02-08', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), TO_DATE('2024-02-14', 'YYYY-MM-DD'), 245.11, 'RECEIVED', 'SUP006', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1037', TO_DATE('2024-02-08', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'), 82.28, 'RECEIVED', 'SUP005', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1038', TO_DATE('2024-02-08', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'), 84.84, 'RECEIVED', 'SUP006', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1039', TO_DATE('2024-02-08', 'YYYY-MM-DD'), TO_DATE('2024-02-11', 'YYYY-MM-DD'), TO_DATE('2024-02-11', 'YYYY-MM-DD'), 150.41, 'RECEIVED', 'SUP001', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1040', TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-18', 'YYYY-MM-DD'), TO_DATE('2024-02-22', 'YYYY-MM-DD'), 370.24, 'RECEIVED', 'SUP009', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1041', TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), TO_DATE('2024-02-12', 'YYYY-MM-DD'), 478.65, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1042', TO_DATE('2024-02-11', 'YYYY-MM-DD'), TO_DATE('2024-02-19', 'YYYY-MM-DD'), TO_DATE('2024-02-24', 'YYYY-MM-DD'), 466.84, 'RECEIVED', 'SUP009', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1043', TO_DATE('2024-02-11', 'YYYY-MM-DD'), TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-02-13', 'YYYY-MM-DD'), 208.72, 'RECEIVED', 'SUP003', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1044', TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-02-22', 'YYYY-MM-DD'), TO_DATE('2024-02-26', 'YYYY-MM-DD'), 1567.8, 'RECEIVED', 'SUP010', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1045', TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-02-20', 'YYYY-MM-DD'), TO_DATE('2024-02-21', 'YYYY-MM-DD'), 545.3, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1046', TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-02-18', 'YYYY-MM-DD'), TO_DATE('2024-02-16', 'YYYY-MM-DD'), 11.7, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1047', TO_DATE('2024-02-16', 'YYYY-MM-DD'), TO_DATE('2024-02-24', 'YYYY-MM-DD'), TO_DATE('2024-02-25', 'YYYY-MM-DD'), 503.2, 'RECEIVED', 'SUP010', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1048', TO_DATE('2024-02-17', 'YYYY-MM-DD'), TO_DATE('2024-02-25', 'YYYY-MM-DD'), TO_DATE('2024-02-27', 'YYYY-MM-DD'), 751.88, 'RECEIVED', 'SUP009', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1049', TO_DATE('2024-02-17', 'YYYY-MM-DD'), TO_DATE('2024-02-20', 'YYYY-MM-DD'), TO_DATE('2024-02-20', 'YYYY-MM-DD'), 895.43, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1050', TO_DATE('2024-02-19', 'YYYY-MM-DD'), TO_DATE('2024-02-24', 'YYYY-MM-DD'), TO_DATE('2024-02-23', 'YYYY-MM-DD'), 2335.1, 'RECEIVED', 'SUP006', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1051', TO_DATE('2024-02-24', 'YYYY-MM-DD'), TO_DATE('2024-03-03', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), 418.56, 'RECEIVED', 'SUP010', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1052', TO_DATE('2024-02-24', 'YYYY-MM-DD'), TO_DATE('2024-02-27', 'YYYY-MM-DD'), TO_DATE('2024-02-27', 'YYYY-MM-DD'), 443.2, 'RECEIVED', 'SUP003', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1053', TO_DATE('2024-02-25', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-02', 'YYYY-MM-DD'), 495.14, 'RECEIVED', 'SUP006', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1054', TO_DATE('2024-02-26', 'YYYY-MM-DD'), TO_DATE('2024-03-02', 'YYYY-MM-DD'), TO_DATE('2024-03-04', 'YYYY-MM-DD'), 1517.57, 'RECEIVED', 'SUP007', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1055', TO_DATE('2024-02-26', 'YYYY-MM-DD'), TO_DATE('2024-03-02', 'YYYY-MM-DD'), TO_DATE('2024-03-03', 'YYYY-MM-DD'), 599.24, 'RECEIVED', 'SUP005', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1056', TO_DATE('2024-02-28', 'YYYY-MM-DD'), TO_DATE('2024-03-07', 'YYYY-MM-DD'), TO_DATE('2024-03-12', 'YYYY-MM-DD'), 446.37, 'RECEIVED', 'SUP010', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1057', TO_DATE('2024-02-29', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-06', 'YYYY-MM-DD'), 63.72, 'RECEIVED', 'SUP007', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1058', TO_DATE('2024-03-02', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-06', 'YYYY-MM-DD'), 303.77, 'RECEIVED', 'SUP001', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1059', TO_DATE('2024-03-02', 'YYYY-MM-DD'), TO_DATE('2024-03-07', 'YYYY-MM-DD'), TO_DATE('2024-03-07', 'YYYY-MM-DD'), 493.93, 'RECEIVED', 'SUP007', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1060', TO_DATE('2024-03-03', 'YYYY-MM-DD'), TO_DATE('2024-03-08', 'YYYY-MM-DD'), TO_DATE('2024-03-11', 'YYYY-MM-DD'), 60.09, 'RECEIVED', 'SUP005', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1061', TO_DATE('2024-03-03', 'YYYY-MM-DD'), TO_DATE('2024-03-08', 'YYYY-MM-DD'), TO_DATE('2024-03-07', 'YYYY-MM-DD'), 799.44, 'RECEIVED', 'SUP004', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1062', TO_DATE('2024-03-03', 'YYYY-MM-DD'), TO_DATE('2024-03-11', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), 36.66, 'RECEIVED', 'SUP009', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1063', TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), 1132.36, 'RECEIVED', 'SUP010', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1064', TO_DATE('2024-03-07', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-08', 'YYYY-MM-DD'), 70.85, 'RECEIVED', 'SUP002', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1065', TO_DATE('2024-03-08', 'YYYY-MM-DD'), TO_DATE('2024-03-11', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 814.93, 'RECEIVED', 'SUP003', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1066', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 364.24, 'RECEIVED', 'SUP008', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1067', TO_DATE('2024-03-13', 'YYYY-MM-DD'), TO_DATE('2024-03-16', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), 122.1, 'RECEIVED', 'SUP003', 'S0067');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1068', TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 135.18, 'RECEIVED', 'SUP009', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1069', TO_DATE('2024-03-17', 'YYYY-MM-DD'), TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 106.54, 'RECEIVED', 'SUP004', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1070', TO_DATE('2024-03-17', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-18', 'YYYY-MM-DD'), 122.35, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1071', TO_DATE('2024-03-17', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), 940.1, 'RECEIVED', 'SUP001', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1072', TO_DATE('2024-03-19', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 238.16, 'RECEIVED', 'SUP004', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1073', TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 3124.78, 'RECEIVED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1074', TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 119.89, 'RECEIVED', 'SUP005', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1075', TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-26', 'YYYY-MM-DD'), 878.0, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1076', TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 424.25, 'RECEIVED', 'SUP002', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1077', TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-03-26', 'YYYY-MM-DD'), TO_DATE('2024-03-28', 'YYYY-MM-DD'), 868.17, 'RECEIVED', 'SUP006', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1078', TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 126.23, 'RECEIVED', 'SUP009', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1079', TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-28', 'YYYY-MM-DD'), TO_DATE('2024-03-28', 'YYYY-MM-DD'), 402.5, 'RECEIVED', 'SUP002', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1080', TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), 43.68, 'RECEIVED', 'SUP007', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1081', TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), 145.88, 'RECEIVED', 'SUP005', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1082', TO_DATE('2024-03-26', 'YYYY-MM-DD'), TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 788.59, 'RECEIVED', 'SUP009', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1083', TO_DATE('2024-03-26', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'), 60.42, 'RECEIVED', 'SUP001', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1084', TO_DATE('2024-03-27', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 285.98, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1085', TO_DATE('2024-03-29', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-03-30', 'YYYY-MM-DD'), 277.16, 'RECEIVED', 'SUP001', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1086', TO_DATE('2024-03-30', 'YYYY-MM-DD'), TO_DATE('2024-04-07', 'YYYY-MM-DD'), TO_DATE('2024-04-13', 'YYYY-MM-DD'), 58.86, 'RECEIVED', 'SUP010', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1087', TO_DATE('2024-03-30', 'YYYY-MM-DD'), TO_DATE('2024-04-02', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), 70.06, 'RECEIVED', 'SUP003', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1088', TO_DATE('2024-03-31', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-06', 'YYYY-MM-DD'), 173.74, 'RECEIVED', 'SUP007', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1089', TO_DATE('2024-03-31', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), NULL, 80.4, 'CANCELLED', 'SUP006', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1090', TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-06', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 247.32, 'RECEIVED', 'SUP006', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1091', TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), TO_DATE('2024-04-13', 'YYYY-MM-DD'), 68.44, 'RECEIVED', 'SUP010', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1092', TO_DATE('2024-04-02', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-06', 'YYYY-MM-DD'), 205.25, 'RECEIVED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1093', TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), 125.72, 'RECEIVED', 'SUP006', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1094', TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-06', 'YYYY-MM-DD'), TO_DATE('2024-04-04', 'YYYY-MM-DD'), 433.79, 'RECEIVED', 'SUP003', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1095', TO_DATE('2024-04-03', 'YYYY-MM-DD'), TO_DATE('2024-04-06', 'YYYY-MM-DD'), TO_DATE('2024-04-06', 'YYYY-MM-DD'), 205.1, 'RECEIVED', 'SUP003', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1096', TO_DATE('2024-04-04', 'YYYY-MM-DD'), TO_DATE('2024-04-09', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'), 937.92, 'RECEIVED', 'SUP005', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1097', TO_DATE('2024-04-07', 'YYYY-MM-DD'), TO_DATE('2024-04-12', 'YYYY-MM-DD'), TO_DATE('2024-04-13', 'YYYY-MM-DD'), 159.84, 'RECEIVED', 'SUP006', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1098', TO_DATE('2024-04-07', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-11', 'YYYY-MM-DD'), 1500.43, 'RECEIVED', 'SUP002', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1099', TO_DATE('2024-04-07', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-08', 'YYYY-MM-DD'), 129.67, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1100', TO_DATE('2024-04-08', 'YYYY-MM-DD'), TO_DATE('2024-04-13', 'YYYY-MM-DD'), TO_DATE('2024-04-16', 'YYYY-MM-DD'), 121.58, 'RECEIVED', 'SUP004', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1101', TO_DATE('2024-04-09', 'YYYY-MM-DD'), TO_DATE('2024-04-14', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 1631.73, 'RECEIVED', 'SUP006', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1102', TO_DATE('2024-04-11', 'YYYY-MM-DD'), TO_DATE('2024-04-19', 'YYYY-MM-DD'), TO_DATE('2024-04-23', 'YYYY-MM-DD'), 413.82, 'RECEIVED', 'SUP009', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1103', TO_DATE('2024-04-13', 'YYYY-MM-DD'), TO_DATE('2024-04-16', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 1232.42, 'RECEIVED', 'SUP001', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1104', TO_DATE('2024-04-13', 'YYYY-MM-DD'), TO_DATE('2024-04-16', 'YYYY-MM-DD'), TO_DATE('2024-04-16', 'YYYY-MM-DD'), 54.72, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1105', TO_DATE('2024-04-16', 'YYYY-MM-DD'), TO_DATE('2024-04-21', 'YYYY-MM-DD'), TO_DATE('2024-04-20', 'YYYY-MM-DD'), 1642.7, 'RECEIVED', 'SUP004', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1106', TO_DATE('2024-04-21', 'YYYY-MM-DD'), TO_DATE('2024-04-29', 'YYYY-MM-DD'), TO_DATE('2024-05-02', 'YYYY-MM-DD'), 307.3, 'RECEIVED', 'SUP011', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1107', TO_DATE('2024-04-21', 'YYYY-MM-DD'), TO_DATE('2024-04-29', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), 331.78, 'RECEIVED', 'SUP009', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1108', TO_DATE('2024-04-21', 'YYYY-MM-DD'), TO_DATE('2024-04-26', 'YYYY-MM-DD'), TO_DATE('2024-04-28', 'YYYY-MM-DD'), 6722.18, 'RECEIVED', 'SUP005', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1109', TO_DATE('2024-04-22', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'), TO_DATE('2024-04-23', 'YYYY-MM-DD'), 253.22, 'RECEIVED', 'SUP003', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1110', TO_DATE('2024-04-23', 'YYYY-MM-DD'), TO_DATE('2024-04-26', 'YYYY-MM-DD'), TO_DATE('2024-04-24', 'YYYY-MM-DD'), 891.19, 'RECEIVED', 'SUP001', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1111', TO_DATE('2024-04-23', 'YYYY-MM-DD'), TO_DATE('2024-04-26', 'YYYY-MM-DD'), TO_DATE('2024-04-27', 'YYYY-MM-DD'), 22.7, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1112', TO_DATE('2024-04-24', 'YYYY-MM-DD'), TO_DATE('2024-04-29', 'YYYY-MM-DD'), TO_DATE('2024-04-28', 'YYYY-MM-DD'), 618.41, 'RECEIVED', 'SUP004', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1113', TO_DATE('2024-04-27', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), 691.92, 'RECEIVED', 'SUP001', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1114', TO_DATE('2024-04-27', 'YYYY-MM-DD'), TO_DATE('2024-05-02', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), 376.51, 'RECEIVED', 'SUP004', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1115', TO_DATE('2024-04-29', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'), TO_DATE('2024-05-12', 'YYYY-MM-DD'), 1765.65, 'RECEIVED', 'SUP010', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1116', TO_DATE('2024-04-30', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), 286.02, 'RECEIVED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1117', TO_DATE('2024-04-30', 'YYYY-MM-DD'), TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-02', 'YYYY-MM-DD'), 371.99, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1118', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-06', 'YYYY-MM-DD'), TO_DATE('2024-05-08', 'YYYY-MM-DD'), 243.57, 'RECEIVED', 'SUP005', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1119', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-04', 'YYYY-MM-DD'), TO_DATE('2024-05-05', 'YYYY-MM-DD'), 684.52, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1120', TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-06', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'), 535.44, 'RECEIVED', 'SUP002', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1121', TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-06', 'YYYY-MM-DD'), TO_DATE('2024-05-04', 'YYYY-MM-DD'), 139.04, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1122', TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-08', 'YYYY-MM-DD'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), 296.98, 'RECEIVED', 'SUP007', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1123', TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-06', 'YYYY-MM-DD'), TO_DATE('2024-05-06', 'YYYY-MM-DD'), 681.55, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1124', TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-11', 'YYYY-MM-DD'), TO_DATE('2024-05-13', 'YYYY-MM-DD'), 215.24, 'RECEIVED', 'SUP008', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1125', TO_DATE('2024-05-05', 'YYYY-MM-DD'), TO_DATE('2024-05-13', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), 434.63, 'RECEIVED', 'SUP011', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1126', TO_DATE('2024-05-06', 'YYYY-MM-DD'), TO_DATE('2024-05-11', 'YYYY-MM-DD'), TO_DATE('2024-05-13', 'YYYY-MM-DD'), 56.5, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1127', TO_DATE('2024-05-07', 'YYYY-MM-DD'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-11', 'YYYY-MM-DD'), 129.24, 'RECEIVED', 'SUP001', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1128', TO_DATE('2024-05-11', 'YYYY-MM-DD'), TO_DATE('2024-05-14', 'YYYY-MM-DD'), TO_DATE('2024-05-14', 'YYYY-MM-DD'), 312.54, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1129', TO_DATE('2024-05-12', 'YYYY-MM-DD'), TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-05-21', 'YYYY-MM-DD'), 526.75, 'RECEIVED', 'SUP009', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1130', TO_DATE('2024-05-14', 'YYYY-MM-DD'), TO_DATE('2024-05-17', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'), 803.69, 'RECEIVED', 'SUP002', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1131', TO_DATE('2024-05-14', 'YYYY-MM-DD'), TO_DATE('2024-05-19', 'YYYY-MM-DD'), TO_DATE('2024-05-21', 'YYYY-MM-DD'), 1864.28, 'RECEIVED', 'SUP004', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1132', TO_DATE('2024-05-16', 'YYYY-MM-DD'), TO_DATE('2024-05-19', 'YYYY-MM-DD'), TO_DATE('2024-05-18', 'YYYY-MM-DD'), 496.71, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1133', TO_DATE('2024-05-17', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 267.28, 'RECEIVED', 'SUP010', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1134', TO_DATE('2024-05-18', 'YYYY-MM-DD'), TO_DATE('2024-05-23', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'), 47.26, 'RECEIVED', 'SUP004', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1135', TO_DATE('2024-05-19', 'YYYY-MM-DD'), TO_DATE('2024-05-24', 'YYYY-MM-DD'), TO_DATE('2024-05-26', 'YYYY-MM-DD'), 25.56, 'RECEIVED', 'SUP006', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1136', TO_DATE('2024-05-22', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'), TO_DATE('2024-05-26', 'YYYY-MM-DD'), 261.2, 'RECEIVED', 'SUP002', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1137', TO_DATE('2024-05-23', 'YYYY-MM-DD'), TO_DATE('2024-05-28', 'YYYY-MM-DD'), TO_DATE('2024-05-31', 'YYYY-MM-DD'), 543.39, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1138', TO_DATE('2024-05-26', 'YYYY-MM-DD'), TO_DATE('2024-05-29', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), 292.74, 'RECEIVED', 'SUP001', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1139', TO_DATE('2024-05-27', 'YYYY-MM-DD'), TO_DATE('2024-06-04', 'YYYY-MM-DD'), TO_DATE('2024-06-08', 'YYYY-MM-DD'), 3313.22, 'RECEIVED', 'SUP010', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1140', TO_DATE('2024-05-30', 'YYYY-MM-DD'), TO_DATE('2024-06-07', 'YYYY-MM-DD'), TO_DATE('2024-06-09', 'YYYY-MM-DD'), 569.56, 'RECEIVED', 'SUP009', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1141', TO_DATE('2024-05-31', 'YYYY-MM-DD'), TO_DATE('2024-06-03', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), 169.48, 'RECEIVED', 'SUP003', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1142', TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-04', 'YYYY-MM-DD'), TO_DATE('2024-06-04', 'YYYY-MM-DD'), 502.17, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1143', TO_DATE('2024-06-03', 'YYYY-MM-DD'), TO_DATE('2024-06-08', 'YYYY-MM-DD'), TO_DATE('2024-06-11', 'YYYY-MM-DD'), 876.75, 'RECEIVED', 'SUP007', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1144', TO_DATE('2024-06-03', 'YYYY-MM-DD'), TO_DATE('2024-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-05', 'YYYY-MM-DD'), 44.98, 'RECEIVED', 'SUP002', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1145', TO_DATE('2024-06-05', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), 790.48, 'RECEIVED', 'SUP007', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1146', TO_DATE('2024-06-05', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'), 521.68, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1147', TO_DATE('2024-06-05', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), 168.12, 'RECEIVED', 'SUP007', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1148', TO_DATE('2024-06-06', 'YYYY-MM-DD'), TO_DATE('2024-06-11', 'YYYY-MM-DD'), NULL, 750.17, 'CANCELLED', 'SUP006', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1149', TO_DATE('2024-06-07', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-11', 'YYYY-MM-DD'), 123.14, 'RECEIVED', 'SUP001', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1150', TO_DATE('2024-06-07', 'YYYY-MM-DD'), TO_DATE('2024-06-12', 'YYYY-MM-DD'), TO_DATE('2024-06-13', 'YYYY-MM-DD'), 39.44, 'RECEIVED', 'SUP005', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1151', TO_DATE('2024-06-09', 'YYYY-MM-DD'), TO_DATE('2024-06-14', 'YYYY-MM-DD'), TO_DATE('2024-06-13', 'YYYY-MM-DD'), 308.26, 'RECEIVED', 'SUP006', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1152', TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-13', 'YYYY-MM-DD'), TO_DATE('2024-06-13', 'YYYY-MM-DD'), 18.7, 'RECEIVED', 'SUP002', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1153', TO_DATE('2024-06-11', 'YYYY-MM-DD'), TO_DATE('2024-06-19', 'YYYY-MM-DD'), TO_DATE('2024-06-23', 'YYYY-MM-DD'), 1371.77, 'RECEIVED', 'SUP009', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1154', TO_DATE('2024-06-11', 'YYYY-MM-DD'), TO_DATE('2024-06-16', 'YYYY-MM-DD'), TO_DATE('2024-06-19', 'YYYY-MM-DD'), 327.83, 'RECEIVED', 'SUP007', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1155', TO_DATE('2024-06-11', 'YYYY-MM-DD'), TO_DATE('2024-06-19', 'YYYY-MM-DD'), TO_DATE('2024-06-23', 'YYYY-MM-DD'), 676.24, 'RECEIVED', 'SUP009', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1156', TO_DATE('2024-06-12', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-16', 'YYYY-MM-DD'), 330.48, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1157', TO_DATE('2024-06-12', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-16', 'YYYY-MM-DD'), 180.41, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1158', TO_DATE('2024-06-12', 'YYYY-MM-DD'), TO_DATE('2024-06-17', 'YYYY-MM-DD'), TO_DATE('2024-06-18', 'YYYY-MM-DD'), 839.64, 'RECEIVED', 'SUP006', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1159', TO_DATE('2024-06-13', 'YYYY-MM-DD'), TO_DATE('2024-06-16', 'YYYY-MM-DD'), TO_DATE('2024-06-14', 'YYYY-MM-DD'), 236.7, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1160', TO_DATE('2024-06-14', 'YYYY-MM-DD'), TO_DATE('2024-06-22', 'YYYY-MM-DD'), TO_DATE('2024-06-27', 'YYYY-MM-DD'), 953.66, 'RECEIVED', 'SUP008', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1161', TO_DATE('2024-06-14', 'YYYY-MM-DD'), TO_DATE('2024-06-22', 'YYYY-MM-DD'), TO_DATE('2024-06-25', 'YYYY-MM-DD'), 530.19, 'RECEIVED', 'SUP008', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1162', TO_DATE('2024-06-14', 'YYYY-MM-DD'), TO_DATE('2024-06-19', 'YYYY-MM-DD'), TO_DATE('2024-06-18', 'YYYY-MM-DD'), 378.1, 'RECEIVED', 'SUP007', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1163', TO_DATE('2024-06-14', 'YYYY-MM-DD'), TO_DATE('2024-06-17', 'YYYY-MM-DD'), TO_DATE('2024-06-17', 'YYYY-MM-DD'), 36.4, 'RECEIVED', 'SUP001', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1164', TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2024-06-21', 'YYYY-MM-DD'), 868.8, 'RECEIVED', 'SUP004', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1165', TO_DATE('2024-06-16', 'YYYY-MM-DD'), TO_DATE('2024-06-19', 'YYYY-MM-DD'), TO_DATE('2024-06-17', 'YYYY-MM-DD'), 859.94, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1166', TO_DATE('2024-06-17', 'YYYY-MM-DD'), TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2024-06-19', 'YYYY-MM-DD'), 66.43, 'RECEIVED', 'SUP001', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1167', TO_DATE('2024-06-17', 'YYYY-MM-DD'), TO_DATE('2024-06-22', 'YYYY-MM-DD'), TO_DATE('2024-06-22', 'YYYY-MM-DD'), 142.05, 'RECEIVED', 'SUP004', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1168', TO_DATE('2024-06-19', 'YYYY-MM-DD'), TO_DATE('2024-06-24', 'YYYY-MM-DD'), TO_DATE('2024-06-25', 'YYYY-MM-DD'), 500.59, 'RECEIVED', 'SUP004', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1169', TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2024-06-23', 'YYYY-MM-DD'), TO_DATE('2024-06-24', 'YYYY-MM-DD'), 89.88, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1170', TO_DATE('2024-06-20', 'YYYY-MM-DD'), TO_DATE('2024-06-28', 'YYYY-MM-DD'), TO_DATE('2024-06-29', 'YYYY-MM-DD'), 30.03, 'RECEIVED', 'SUP011', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1171', TO_DATE('2024-06-22', 'YYYY-MM-DD'), TO_DATE('2024-06-27', 'YYYY-MM-DD'), TO_DATE('2024-06-27', 'YYYY-MM-DD'), 158.36, 'RECEIVED', 'SUP007', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1172', TO_DATE('2024-06-22', 'YYYY-MM-DD'), TO_DATE('2024-06-25', 'YYYY-MM-DD'), TO_DATE('2024-06-23', 'YYYY-MM-DD'), 28.35, 'RECEIVED', 'SUP002', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1173', TO_DATE('2024-06-24', 'YYYY-MM-DD'), TO_DATE('2024-06-27', 'YYYY-MM-DD'), TO_DATE('2024-06-28', 'YYYY-MM-DD'), 479.24, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1174', TO_DATE('2024-06-24', 'YYYY-MM-DD'), TO_DATE('2024-06-29', 'YYYY-MM-DD'), TO_DATE('2024-06-29', 'YYYY-MM-DD'), 154.65, 'RECEIVED', 'SUP007', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1175', TO_DATE('2024-06-25', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), TO_DATE('2024-07-02', 'YYYY-MM-DD'), 742.66, 'RECEIVED', 'SUP004', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1176', TO_DATE('2024-06-25', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), TO_DATE('2024-07-03', 'YYYY-MM-DD'), 55.25, 'RECEIVED', 'SUP007', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1177', TO_DATE('2024-06-27', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), 425.46, 'RECEIVED', 'SUP003', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1178', TO_DATE('2024-06-28', 'YYYY-MM-DD'), TO_DATE('2024-07-03', 'YYYY-MM-DD'), TO_DATE('2024-07-06', 'YYYY-MM-DD'), 263.36, 'RECEIVED', 'SUP006', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1179', TO_DATE('2024-06-28', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-02', 'YYYY-MM-DD'), 385.56, 'RECEIVED', 'SUP002', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1180', TO_DATE('2024-06-28', 'YYYY-MM-DD'), TO_DATE('2024-07-06', 'YYYY-MM-DD'), TO_DATE('2024-07-11', 'YYYY-MM-DD'), 15.47, 'RECEIVED', 'SUP011', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1181', TO_DATE('2024-06-29', 'YYYY-MM-DD'), TO_DATE('2024-07-02', 'YYYY-MM-DD'), TO_DATE('2024-07-03', 'YYYY-MM-DD'), 455.76, 'RECEIVED', 'SUP003', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1182', TO_DATE('2024-06-29', 'YYYY-MM-DD'), TO_DATE('2024-07-04', 'YYYY-MM-DD'), TO_DATE('2024-07-04', 'YYYY-MM-DD'), 106.22, 'RECEIVED', 'SUP004', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1183', TO_DATE('2024-07-02', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), TO_DATE('2024-07-06', 'YYYY-MM-DD'), 698.2, 'RECEIVED', 'SUP006', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1184', TO_DATE('2024-07-02', 'YYYY-MM-DD'), TO_DATE('2024-07-05', 'YYYY-MM-DD'), TO_DATE('2024-07-06', 'YYYY-MM-DD'), 542.31, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1185', TO_DATE('2024-07-02', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), TO_DATE('2024-07-08', 'YYYY-MM-DD'), 229.25, 'RECEIVED', 'SUP007', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1186', TO_DATE('2024-07-03', 'YYYY-MM-DD'), TO_DATE('2024-07-08', 'YYYY-MM-DD'), TO_DATE('2024-07-08', 'YYYY-MM-DD'), 295.29, 'RECEIVED', 'SUP006', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1187', TO_DATE('2024-07-04', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), TO_DATE('2024-07-08', 'YYYY-MM-DD'), 272.89, 'RECEIVED', 'SUP001', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1188', TO_DATE('2024-07-04', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), TO_DATE('2024-07-08', 'YYYY-MM-DD'), 733.74, 'RECEIVED', 'SUP001', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1189', TO_DATE('2024-07-04', 'YYYY-MM-DD'), TO_DATE('2024-07-12', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 71.6, 'RECEIVED', 'SUP009', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1190', TO_DATE('2024-07-05', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'), TO_DATE('2024-07-13', 'YYYY-MM-DD'), 110.92, 'RECEIVED', 'SUP006', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1191', TO_DATE('2024-07-05', 'YYYY-MM-DD'), TO_DATE('2024-07-08', 'YYYY-MM-DD'), TO_DATE('2024-07-09', 'YYYY-MM-DD'), 76.79, 'RECEIVED', 'SUP003', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1192', TO_DATE('2024-07-06', 'YYYY-MM-DD'), TO_DATE('2024-07-14', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 1191.88, 'RECEIVED', 'SUP010', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1193', TO_DATE('2024-07-06', 'YYYY-MM-DD'), TO_DATE('2024-07-14', 'YYYY-MM-DD'), TO_DATE('2024-07-17', 'YYYY-MM-DD'), 568.13, 'RECEIVED', 'SUP009', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1194', TO_DATE('2024-07-06', 'YYYY-MM-DD'), TO_DATE('2024-07-11', 'YYYY-MM-DD'), TO_DATE('2024-07-13', 'YYYY-MM-DD'), 802.3, 'RECEIVED', 'SUP007', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1195', TO_DATE('2024-07-06', 'YYYY-MM-DD'), TO_DATE('2024-07-09', 'YYYY-MM-DD'), TO_DATE('2024-07-10', 'YYYY-MM-DD'), 497.11, 'RECEIVED', 'SUP001', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1196', TO_DATE('2024-07-06', 'YYYY-MM-DD'), TO_DATE('2024-07-09', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 298.39, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1197', TO_DATE('2024-07-06', 'YYYY-MM-DD'), TO_DATE('2024-07-09', 'YYYY-MM-DD'), TO_DATE('2024-07-08', 'YYYY-MM-DD'), 105.26, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1198', TO_DATE('2024-07-07', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-16', 'YYYY-MM-DD'), 595.54, 'RECEIVED', 'SUP010', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1199', TO_DATE('2024-07-07', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'), 376.86, 'RECEIVED', 'SUP008', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1200', TO_DATE('2024-07-08', 'YYYY-MM-DD'), TO_DATE('2024-07-11', 'YYYY-MM-DD'), TO_DATE('2024-07-12', 'YYYY-MM-DD'), 154.39, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1201', TO_DATE('2024-07-09', 'YYYY-MM-DD'), TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-19', 'YYYY-MM-DD'), 327.79, 'RECEIVED', 'SUP008', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1202', TO_DATE('2024-07-09', 'YYYY-MM-DD'), TO_DATE('2024-07-12', 'YYYY-MM-DD'), TO_DATE('2024-07-11', 'YYYY-MM-DD'), 506.1, 'RECEIVED', 'SUP003', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1203', TO_DATE('2024-07-11', 'YYYY-MM-DD'), TO_DATE('2024-07-14', 'YYYY-MM-DD'), TO_DATE('2024-07-12', 'YYYY-MM-DD'), 148.4, 'RECEIVED', 'SUP003', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1204', TO_DATE('2024-07-12', 'YYYY-MM-DD'), TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'), 1106.03, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1205', TO_DATE('2024-07-14', 'YYYY-MM-DD'), TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-17', 'YYYY-MM-DD'), 103.61, 'RECEIVED', 'SUP003', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1206', TO_DATE('2024-07-14', 'YYYY-MM-DD'), TO_DATE('2024-07-17', 'YYYY-MM-DD'), NULL, 237.94, 'CANCELLED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1207', TO_DATE('2024-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-18', 'YYYY-MM-DD'), TO_DATE('2024-07-19', 'YYYY-MM-DD'), 91.62, 'RECEIVED', 'SUP003', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1208', TO_DATE('2024-07-16', 'YYYY-MM-DD'), TO_DATE('2024-07-21', 'YYYY-MM-DD'), TO_DATE('2024-07-23', 'YYYY-MM-DD'), 468.01, 'RECEIVED', 'SUP005', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1209', TO_DATE('2024-07-18', 'YYYY-MM-DD'), TO_DATE('2024-07-23', 'YYYY-MM-DD'), TO_DATE('2024-07-22', 'YYYY-MM-DD'), 126.5, 'RECEIVED', 'SUP005', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1210', TO_DATE('2024-07-19', 'YYYY-MM-DD'), TO_DATE('2024-07-22', 'YYYY-MM-DD'), TO_DATE('2024-07-21', 'YYYY-MM-DD'), 678.48, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1211', TO_DATE('2024-07-19', 'YYYY-MM-DD'), TO_DATE('2024-07-22', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'), 76.92, 'RECEIVED', 'SUP003', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1212', TO_DATE('2024-07-20', 'YYYY-MM-DD'), TO_DATE('2024-07-25', 'YYYY-MM-DD'), TO_DATE('2024-07-26', 'YYYY-MM-DD'), 209.46, 'RECEIVED', 'SUP005', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1213', TO_DATE('2024-07-22', 'YYYY-MM-DD'), TO_DATE('2024-07-27', 'YYYY-MM-DD'), TO_DATE('2024-07-30', 'YYYY-MM-DD'), 543.04, 'RECEIVED', 'SUP006', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1214', TO_DATE('2024-07-23', 'YYYY-MM-DD'), TO_DATE('2024-07-26', 'YYYY-MM-DD'), TO_DATE('2024-07-25', 'YYYY-MM-DD'), 157.49, 'RECEIVED', 'SUP001', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1215', TO_DATE('2024-07-23', 'YYYY-MM-DD'), TO_DATE('2024-07-28', 'YYYY-MM-DD'), TO_DATE('2024-07-27', 'YYYY-MM-DD'), 34.56, 'RECEIVED', 'SUP004', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1216', TO_DATE('2024-07-24', 'YYYY-MM-DD'), TO_DATE('2024-07-29', 'YYYY-MM-DD'), TO_DATE('2024-07-28', 'YYYY-MM-DD'), 342.1, 'RECEIVED', 'SUP005', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1217', TO_DATE('2024-07-24', 'YYYY-MM-DD'), TO_DATE('2024-07-27', 'YYYY-MM-DD'), TO_DATE('2024-07-28', 'YYYY-MM-DD'), 372.8, 'RECEIVED', 'SUP002', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1218', TO_DATE('2024-07-25', 'YYYY-MM-DD'), TO_DATE('2024-07-28', 'YYYY-MM-DD'), TO_DATE('2024-07-28', 'YYYY-MM-DD'), 178.77, 'RECEIVED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1219', TO_DATE('2024-07-26', 'YYYY-MM-DD'), TO_DATE('2024-08-03', 'YYYY-MM-DD'), TO_DATE('2024-08-05', 'YYYY-MM-DD'), 179.94, 'RECEIVED', 'SUP010', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1220', TO_DATE('2024-07-27', 'YYYY-MM-DD'), TO_DATE('2024-07-30', 'YYYY-MM-DD'), TO_DATE('2024-07-30', 'YYYY-MM-DD'), 615.22, 'RECEIVED', 'SUP002', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1221', TO_DATE('2024-07-28', 'YYYY-MM-DD'), TO_DATE('2024-08-02', 'YYYY-MM-DD'), TO_DATE('2024-08-04', 'YYYY-MM-DD'), 294.92, 'RECEIVED', 'SUP007', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1222', TO_DATE('2024-07-29', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-02', 'YYYY-MM-DD'), 1359.7, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1223', TO_DATE('2024-07-30', 'YYYY-MM-DD'), TO_DATE('2024-08-04', 'YYYY-MM-DD'), TO_DATE('2024-08-06', 'YYYY-MM-DD'), 1006.28, 'RECEIVED', 'SUP006', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1224', TO_DATE('2024-07-30', 'YYYY-MM-DD'), TO_DATE('2024-08-02', 'YYYY-MM-DD'), TO_DATE('2024-08-02', 'YYYY-MM-DD'), 258.54, 'RECEIVED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1225', TO_DATE('2024-07-31', 'YYYY-MM-DD'), TO_DATE('2024-08-03', 'YYYY-MM-DD'), TO_DATE('2024-08-04', 'YYYY-MM-DD'), 266.04, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1226', TO_DATE('2024-08-02', 'YYYY-MM-DD'), TO_DATE('2024-08-05', 'YYYY-MM-DD'), TO_DATE('2024-08-04', 'YYYY-MM-DD'), 1312.68, 'RECEIVED', 'SUP001', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1227', TO_DATE('2024-08-05', 'YYYY-MM-DD'), TO_DATE('2024-08-08', 'YYYY-MM-DD'), TO_DATE('2024-08-06', 'YYYY-MM-DD'), 3429.93, 'RECEIVED', 'SUP003', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1228', TO_DATE('2024-08-06', 'YYYY-MM-DD'), TO_DATE('2024-08-11', 'YYYY-MM-DD'), TO_DATE('2024-08-11', 'YYYY-MM-DD'), 349.4, 'RECEIVED', 'SUP007', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1229', TO_DATE('2024-08-08', 'YYYY-MM-DD'), TO_DATE('2024-08-16', 'YYYY-MM-DD'), TO_DATE('2024-08-21', 'YYYY-MM-DD'), 1567.19, 'RECEIVED', 'SUP010', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1230', TO_DATE('2024-08-09', 'YYYY-MM-DD'), TO_DATE('2024-08-14', 'YYYY-MM-DD'), TO_DATE('2024-08-14', 'YYYY-MM-DD'), 2524.63, 'RECEIVED', 'SUP004', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1231', TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2024-08-18', 'YYYY-MM-DD'), TO_DATE('2024-08-19', 'YYYY-MM-DD'), 535.14, 'RECEIVED', 'SUP008', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1232', TO_DATE('2024-08-12', 'YYYY-MM-DD'), TO_DATE('2024-08-17', 'YYYY-MM-DD'), TO_DATE('2024-08-16', 'YYYY-MM-DD'), 586.21, 'RECEIVED', 'SUP005', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1233', TO_DATE('2024-08-13', 'YYYY-MM-DD'), TO_DATE('2024-08-16', 'YYYY-MM-DD'), TO_DATE('2024-08-14', 'YYYY-MM-DD'), 103.44, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1234', TO_DATE('2024-08-14', 'YYYY-MM-DD'), TO_DATE('2024-08-22', 'YYYY-MM-DD'), TO_DATE('2024-08-26', 'YYYY-MM-DD'), 859.63, 'RECEIVED', 'SUP009', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1235', TO_DATE('2024-08-15', 'YYYY-MM-DD'), TO_DATE('2024-08-18', 'YYYY-MM-DD'), TO_DATE('2024-08-16', 'YYYY-MM-DD'), 950.88, 'RECEIVED', 'SUP001', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1236', TO_DATE('2024-08-17', 'YYYY-MM-DD'), TO_DATE('2024-08-22', 'YYYY-MM-DD'), TO_DATE('2024-08-23', 'YYYY-MM-DD'), 1731.54, 'RECEIVED', 'SUP005', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1237', TO_DATE('2024-08-20', 'YYYY-MM-DD'), TO_DATE('2024-08-23', 'YYYY-MM-DD'), TO_DATE('2024-08-21', 'YYYY-MM-DD'), 123.0, 'RECEIVED', 'SUP002', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1238', TO_DATE('2024-08-22', 'YYYY-MM-DD'), TO_DATE('2024-08-25', 'YYYY-MM-DD'), TO_DATE('2024-08-25', 'YYYY-MM-DD'), 138.72, 'RECEIVED', 'SUP001', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1239', TO_DATE('2024-08-25', 'YYYY-MM-DD'), TO_DATE('2024-08-30', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), 87.71, 'RECEIVED', 'SUP005', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1240', TO_DATE('2024-08-25', 'YYYY-MM-DD'), TO_DATE('2024-08-30', 'YYYY-MM-DD'), TO_DATE('2024-09-02', 'YYYY-MM-DD'), 520.66, 'RECEIVED', 'SUP006', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1241', TO_DATE('2024-08-25', 'YYYY-MM-DD'), TO_DATE('2024-08-30', 'YYYY-MM-DD'), TO_DATE('2024-08-31', 'YYYY-MM-DD'), 242.9, 'RECEIVED', 'SUP005', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1242', TO_DATE('2024-08-26', 'YYYY-MM-DD'), TO_DATE('2024-08-31', 'YYYY-MM-DD'), TO_DATE('2024-09-02', 'YYYY-MM-DD'), 928.14, 'RECEIVED', 'SUP005', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1243', TO_DATE('2024-08-26', 'YYYY-MM-DD'), TO_DATE('2024-09-03', 'YYYY-MM-DD'), TO_DATE('2024-09-06', 'YYYY-MM-DD'), 269.29, 'RECEIVED', 'SUP009', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1244', TO_DATE('2024-08-27', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-04', 'YYYY-MM-DD'), 158.76, 'RECEIVED', 'SUP007', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1245', TO_DATE('2024-08-28', 'YYYY-MM-DD'), TO_DATE('2024-08-31', 'YYYY-MM-DD'), TO_DATE('2024-08-31', 'YYYY-MM-DD'), 158.02, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1246', TO_DATE('2024-08-30', 'YYYY-MM-DD'), TO_DATE('2024-09-04', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'), 475.74, 'RECEIVED', 'SUP007', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1247', TO_DATE('2024-08-31', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('2024-09-07', 'YYYY-MM-DD'), 682.41, 'RECEIVED', 'SUP007', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1248', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-04', 'YYYY-MM-DD'), TO_DATE('2024-09-02', 'YYYY-MM-DD'), 1103.82, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1249', TO_DATE('2024-09-02', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('2024-09-06', 'YYYY-MM-DD'), 1392.93, 'RECEIVED', 'SUP002', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1250', TO_DATE('2024-09-02', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('2024-09-04', 'YYYY-MM-DD'), 631.39, 'RECEIVED', 'SUP002', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1251', TO_DATE('2024-09-04', 'YYYY-MM-DD'), TO_DATE('2024-09-09', 'YYYY-MM-DD'), TO_DATE('2024-09-08', 'YYYY-MM-DD'), 653.07, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1252', TO_DATE('2024-09-04', 'YYYY-MM-DD'), TO_DATE('2024-09-09', 'YYYY-MM-DD'), TO_DATE('2024-09-09', 'YYYY-MM-DD'), 592.22, 'RECEIVED', 'SUP007', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1253', TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_DATE('2024-09-13', 'YYYY-MM-DD'), 849.98, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1254', TO_DATE('2024-09-06', 'YYYY-MM-DD'), TO_DATE('2024-09-14', 'YYYY-MM-DD'), TO_DATE('2024-09-19', 'YYYY-MM-DD'), 793.84, 'RECEIVED', 'SUP010', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1255', TO_DATE('2024-09-07', 'YYYY-MM-DD'), TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_DATE('2024-09-08', 'YYYY-MM-DD'), 469.8, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1256', TO_DATE('2024-09-07', 'YYYY-MM-DD'), TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_DATE('2024-09-09', 'YYYY-MM-DD'), 250.83, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1257', TO_DATE('2024-09-08', 'YYYY-MM-DD'), TO_DATE('2024-09-11', 'YYYY-MM-DD'), NULL, 416.51, 'CANCELLED', 'SUP001', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1258', TO_DATE('2024-09-08', 'YYYY-MM-DD'), TO_DATE('2024-09-13', 'YYYY-MM-DD'), TO_DATE('2024-09-16', 'YYYY-MM-DD'), 209.86, 'RECEIVED', 'SUP006', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1259', TO_DATE('2024-09-09', 'YYYY-MM-DD'), TO_DATE('2024-09-17', 'YYYY-MM-DD'), TO_DATE('2024-09-18', 'YYYY-MM-DD'), 366.23, 'RECEIVED', 'SUP010', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1260', TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_DATE('2024-09-16', 'YYYY-MM-DD'), 562.29, 'RECEIVED', 'SUP007', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1261', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-09-14', 'YYYY-MM-DD'), TO_DATE('2024-09-14', 'YYYY-MM-DD'), 2093.33, 'RECEIVED', 'SUP002', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1262', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-09-14', 'YYYY-MM-DD'), TO_DATE('2024-09-13', 'YYYY-MM-DD'), 486.68, 'RECEIVED', 'SUP003', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1263', TO_DATE('2024-09-13', 'YYYY-MM-DD'), TO_DATE('2024-09-21', 'YYYY-MM-DD'), TO_DATE('2024-09-22', 'YYYY-MM-DD'), 61.75, 'RECEIVED', 'SUP011', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1264', TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_DATE('2024-09-23', 'YYYY-MM-DD'), TO_DATE('2024-09-24', 'YYYY-MM-DD'), 3799.89, 'RECEIVED', 'SUP008', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1265', TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_DATE('2024-09-18', 'YYYY-MM-DD'), TO_DATE('2024-09-16', 'YYYY-MM-DD'), 158.17, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1266', TO_DATE('2024-09-16', 'YYYY-MM-DD'), TO_DATE('2024-09-21', 'YYYY-MM-DD'), TO_DATE('2024-09-20', 'YYYY-MM-DD'), 41.7, 'RECEIVED', 'SUP004', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1267', TO_DATE('2024-09-17', 'YYYY-MM-DD'), TO_DATE('2024-09-20', 'YYYY-MM-DD'), TO_DATE('2024-09-19', 'YYYY-MM-DD'), 393.05, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1268', TO_DATE('2024-09-17', 'YYYY-MM-DD'), TO_DATE('2024-09-22', 'YYYY-MM-DD'), TO_DATE('2024-09-24', 'YYYY-MM-DD'), 78.72, 'RECEIVED', 'SUP006', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1269', TO_DATE('2024-09-19', 'YYYY-MM-DD'), TO_DATE('2024-09-22', 'YYYY-MM-DD'), TO_DATE('2024-09-23', 'YYYY-MM-DD'), 629.26, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1270', TO_DATE('2024-09-21', 'YYYY-MM-DD'), TO_DATE('2024-09-24', 'YYYY-MM-DD'), TO_DATE('2024-09-25', 'YYYY-MM-DD'), 127.97, 'RECEIVED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1271', TO_DATE('2024-09-21', 'YYYY-MM-DD'), TO_DATE('2024-09-24', 'YYYY-MM-DD'), TO_DATE('2024-09-25', 'YYYY-MM-DD'), 416.51, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1272', TO_DATE('2024-09-23', 'YYYY-MM-DD'), TO_DATE('2024-09-28', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), 3010.59, 'RECEIVED', 'SUP007', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1273', TO_DATE('2024-09-24', 'YYYY-MM-DD'), TO_DATE('2024-09-27', 'YYYY-MM-DD'), TO_DATE('2024-09-25', 'YYYY-MM-DD'), 646.46, 'RECEIVED', 'SUP001', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1274', TO_DATE('2024-09-24', 'YYYY-MM-DD'), TO_DATE('2024-10-02', 'YYYY-MM-DD'), TO_DATE('2024-10-06', 'YYYY-MM-DD'), 169.42, 'RECEIVED', 'SUP010', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1275', TO_DATE('2024-09-24', 'YYYY-MM-DD'), TO_DATE('2024-09-27', 'YYYY-MM-DD'), TO_DATE('2024-09-25', 'YYYY-MM-DD'), 148.77, 'RECEIVED', 'SUP003', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1276', TO_DATE('2024-09-25', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), TO_DATE('2024-10-03', 'YYYY-MM-DD'), 1114.15, 'RECEIVED', 'SUP007', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1277', TO_DATE('2024-09-25', 'YYYY-MM-DD'), TO_DATE('2024-09-28', 'YYYY-MM-DD'), TO_DATE('2024-09-27', 'YYYY-MM-DD'), 406.71, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1278', TO_DATE('2024-09-26', 'YYYY-MM-DD'), TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_DATE('2024-10-05', 'YYYY-MM-DD'), 562.6, 'RECEIVED', 'SUP009', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1279', TO_DATE('2024-09-26', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), 303.39, 'RECEIVED', 'SUP006', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1280', TO_DATE('2024-09-29', 'YYYY-MM-DD'), TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_DATE('2024-10-04', 'YYYY-MM-DD'), 115.52, 'RECEIVED', 'SUP004', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1281', TO_DATE('2024-09-30', 'YYYY-MM-DD'), TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'), 324.84, 'RECEIVED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1282', TO_DATE('2024-09-30', 'YYYY-MM-DD'), TO_DATE('2024-10-08', 'YYYY-MM-DD'), TO_DATE('2024-10-11', 'YYYY-MM-DD'), 512.35, 'RECEIVED', 'SUP008', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1283', TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_DATE('2024-10-06', 'YYYY-MM-DD'), TO_DATE('2024-10-05', 'YYYY-MM-DD'), 114.16, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1284', TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_DATE('2024-10-11', 'YYYY-MM-DD'), TO_DATE('2024-10-17', 'YYYY-MM-DD'), 1176.18, 'RECEIVED', 'SUP011', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1285', TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_DATE('2024-10-08', 'YYYY-MM-DD'), TO_DATE('2024-10-11', 'YYYY-MM-DD'), 620.95, 'RECEIVED', 'SUP007', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1286', TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_DATE('2024-10-06', 'YYYY-MM-DD'), TO_DATE('2024-10-07', 'YYYY-MM-DD'), 305.14, 'RECEIVED', 'SUP001', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1287', TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_DATE('2024-10-09', 'YYYY-MM-DD'), TO_DATE('2024-10-09', 'YYYY-MM-DD'), 138.5, 'RECEIVED', 'SUP007', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1288', TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_DATE('2024-10-09', 'YYYY-MM-DD'), TO_DATE('2024-10-12', 'YYYY-MM-DD'), 47.88, 'RECEIVED', 'SUP004', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1289', TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_DATE('2024-10-07', 'YYYY-MM-DD'), TO_DATE('2024-10-06', 'YYYY-MM-DD'), 52.02, 'RECEIVED', 'SUP003', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1290', TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_DATE('2024-10-08', 'YYYY-MM-DD'), TO_DATE('2024-10-07', 'YYYY-MM-DD'), 814.75, 'RECEIVED', 'SUP001', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1291', TO_DATE('2024-10-06', 'YYYY-MM-DD'), TO_DATE('2024-10-11', 'YYYY-MM-DD'), TO_DATE('2024-10-13', 'YYYY-MM-DD'), 366.23, 'RECEIVED', 'SUP004', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1292', TO_DATE('2024-10-11', 'YYYY-MM-DD'), TO_DATE('2024-10-16', 'YYYY-MM-DD'), TO_DATE('2024-10-19', 'YYYY-MM-DD'), 664.89, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1293', TO_DATE('2024-10-12', 'YYYY-MM-DD'), TO_DATE('2024-10-15', 'YYYY-MM-DD'), TO_DATE('2024-10-14', 'YYYY-MM-DD'), 254.67, 'RECEIVED', 'SUP003', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1294', TO_DATE('2024-10-12', 'YYYY-MM-DD'), TO_DATE('2024-10-17', 'YYYY-MM-DD'), TO_DATE('2024-10-17', 'YYYY-MM-DD'), 2247.35, 'RECEIVED', 'SUP005', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1295', TO_DATE('2024-10-13', 'YYYY-MM-DD'), TO_DATE('2024-10-16', 'YYYY-MM-DD'), TO_DATE('2024-10-17', 'YYYY-MM-DD'), 274.51, 'RECEIVED', 'SUP002', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1296', TO_DATE('2024-10-13', 'YYYY-MM-DD'), TO_DATE('2024-10-16', 'YYYY-MM-DD'), TO_DATE('2024-10-14', 'YYYY-MM-DD'), 441.03, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1297', TO_DATE('2024-10-15', 'YYYY-MM-DD'), TO_DATE('2024-10-18', 'YYYY-MM-DD'), TO_DATE('2024-10-16', 'YYYY-MM-DD'), 338.64, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1298', TO_DATE('2024-10-15', 'YYYY-MM-DD'), TO_DATE('2024-10-20', 'YYYY-MM-DD'), TO_DATE('2024-10-20', 'YYYY-MM-DD'), 364.46, 'RECEIVED', 'SUP006', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1299', TO_DATE('2024-10-19', 'YYYY-MM-DD'), TO_DATE('2024-10-22', 'YYYY-MM-DD'), TO_DATE('2024-10-21', 'YYYY-MM-DD'), 327.76, 'RECEIVED', 'SUP002', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1300', TO_DATE('2024-10-19', 'YYYY-MM-DD'), TO_DATE('2024-10-27', 'YYYY-MM-DD'), TO_DATE('2024-10-30', 'YYYY-MM-DD'), 231.08, 'RECEIVED', 'SUP009', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1301', TO_DATE('2024-10-19', 'YYYY-MM-DD'), TO_DATE('2024-10-27', 'YYYY-MM-DD'), TO_DATE('2024-10-31', 'YYYY-MM-DD'), 647.06, 'RECEIVED', 'SUP009', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1302', TO_DATE('2024-10-20', 'YYYY-MM-DD'), TO_DATE('2024-10-25', 'YYYY-MM-DD'), TO_DATE('2024-10-24', 'YYYY-MM-DD'), 464.49, 'RECEIVED', 'SUP004', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1303', TO_DATE('2024-10-24', 'YYYY-MM-DD'), TO_DATE('2024-10-29', 'YYYY-MM-DD'), TO_DATE('2024-10-30', 'YYYY-MM-DD'), 320.35, 'RECEIVED', 'SUP005', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1304', TO_DATE('2024-10-25', 'YYYY-MM-DD'), TO_DATE('2024-10-28', 'YYYY-MM-DD'), TO_DATE('2024-10-29', 'YYYY-MM-DD'), 164.8, 'RECEIVED', 'SUP001', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1305', TO_DATE('2024-10-25', 'YYYY-MM-DD'), TO_DATE('2024-10-30', 'YYYY-MM-DD'), TO_DATE('2024-10-29', 'YYYY-MM-DD'), 612.79, 'RECEIVED', 'SUP004', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1306', TO_DATE('2024-10-26', 'YYYY-MM-DD'), TO_DATE('2024-10-29', 'YYYY-MM-DD'), TO_DATE('2024-10-27', 'YYYY-MM-DD'), 32.62, 'RECEIVED', 'SUP003', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1307', TO_DATE('2024-10-27', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-10-31', 'YYYY-MM-DD'), 700.42, 'RECEIVED', 'SUP006', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1308', TO_DATE('2024-10-27', 'YYYY-MM-DD'), TO_DATE('2024-11-04', 'YYYY-MM-DD'), TO_DATE('2024-11-07', 'YYYY-MM-DD'), 526.92, 'RECEIVED', 'SUP009', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1309', TO_DATE('2024-10-28', 'YYYY-MM-DD'), TO_DATE('2024-11-05', 'YYYY-MM-DD'), NULL, 217.9, 'CANCELLED', 'SUP009', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1310', TO_DATE('2024-10-29', 'YYYY-MM-DD'), TO_DATE('2024-11-03', 'YYYY-MM-DD'), TO_DATE('2024-11-05', 'YYYY-MM-DD'), 367.64, 'RECEIVED', 'SUP005', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1311', TO_DATE('2024-10-29', 'YYYY-MM-DD'), TO_DATE('2024-11-03', 'YYYY-MM-DD'), TO_DATE('2024-11-03', 'YYYY-MM-DD'), 342.78, 'RECEIVED', 'SUP005', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1312', TO_DATE('2024-10-30', 'YYYY-MM-DD'), TO_DATE('2024-11-04', 'YYYY-MM-DD'), TO_DATE('2024-11-04', 'YYYY-MM-DD'), 171.52, 'RECEIVED', 'SUP007', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1313', TO_DATE('2024-10-30', 'YYYY-MM-DD'), TO_DATE('2024-11-04', 'YYYY-MM-DD'), TO_DATE('2024-11-03', 'YYYY-MM-DD'), 223.96, 'RECEIVED', 'SUP007', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1314', TO_DATE('2024-10-31', 'YYYY-MM-DD'), TO_DATE('2024-11-03', 'YYYY-MM-DD'), TO_DATE('2024-11-01', 'YYYY-MM-DD'), 403.66, 'RECEIVED', 'SUP003', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1315', TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-04', 'YYYY-MM-DD'), TO_DATE('2024-11-04', 'YYYY-MM-DD'), 194.59, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1316', TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-06', 'YYYY-MM-DD'), TO_DATE('2024-11-06', 'YYYY-MM-DD'), 490.16, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1317', TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-06', 'YYYY-MM-DD'), TO_DATE('2024-11-08', 'YYYY-MM-DD'), 19.0, 'RECEIVED', 'SUP006', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1318', TO_DATE('2024-11-03', 'YYYY-MM-DD'), TO_DATE('2024-11-08', 'YYYY-MM-DD'), TO_DATE('2024-11-11', 'YYYY-MM-DD'), 571.14, 'RECEIVED', 'SUP007', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1319', TO_DATE('2024-11-03', 'YYYY-MM-DD'), TO_DATE('2024-11-08', 'YYYY-MM-DD'), TO_DATE('2024-11-09', 'YYYY-MM-DD'), 718.63, 'RECEIVED', 'SUP006', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1320', TO_DATE('2024-11-04', 'YYYY-MM-DD'), TO_DATE('2024-11-09', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), 201.19, 'RECEIVED', 'SUP007', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1321', TO_DATE('2024-11-04', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), TO_DATE('2024-11-13', 'YYYY-MM-DD'), 26.29, 'RECEIVED', 'SUP011', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1322', TO_DATE('2024-11-05', 'YYYY-MM-DD'), TO_DATE('2024-11-08', 'YYYY-MM-DD'), TO_DATE('2024-11-09', 'YYYY-MM-DD'), 275.33, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1323', TO_DATE('2024-11-05', 'YYYY-MM-DD'), TO_DATE('2024-11-10', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), 1673.33, 'RECEIVED', 'SUP004', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1324', TO_DATE('2024-11-06', 'YYYY-MM-DD'), TO_DATE('2024-11-14', 'YYYY-MM-DD'), TO_DATE('2024-11-19', 'YYYY-MM-DD'), 672.78, 'RECEIVED', 'SUP011', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1325', TO_DATE('2024-11-07', 'YYYY-MM-DD'), TO_DATE('2024-11-15', 'YYYY-MM-DD'), TO_DATE('2024-11-20', 'YYYY-MM-DD'), 125.38, 'RECEIVED', 'SUP008', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1326', TO_DATE('2024-11-07', 'YYYY-MM-DD'), TO_DATE('2024-11-10', 'YYYY-MM-DD'), TO_DATE('2024-11-08', 'YYYY-MM-DD'), 503.02, 'RECEIVED', 'SUP002', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1327', TO_DATE('2024-11-08', 'YYYY-MM-DD'), TO_DATE('2024-11-16', 'YYYY-MM-DD'), TO_DATE('2024-11-22', 'YYYY-MM-DD'), 997.24, 'RECEIVED', 'SUP009', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1328', TO_DATE('2024-11-09', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), TO_DATE('2024-11-13', 'YYYY-MM-DD'), 118.32, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1329', TO_DATE('2024-11-09', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), TO_DATE('2024-11-11', 'YYYY-MM-DD'), 106.3, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1330', TO_DATE('2024-11-09', 'YYYY-MM-DD'), TO_DATE('2024-11-14', 'YYYY-MM-DD'), TO_DATE('2024-11-17', 'YYYY-MM-DD'), 81.3, 'RECEIVED', 'SUP006', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1331', TO_DATE('2024-11-09', 'YYYY-MM-DD'), TO_DATE('2024-11-12', 'YYYY-MM-DD'), TO_DATE('2024-11-11', 'YYYY-MM-DD'), 199.84, 'RECEIVED', 'SUP003', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1332', TO_DATE('2024-11-09', 'YYYY-MM-DD'), TO_DATE('2024-11-14', 'YYYY-MM-DD'), TO_DATE('2024-11-17', 'YYYY-MM-DD'), 212.54, 'RECEIVED', 'SUP006', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1333', TO_DATE('2024-11-10', 'YYYY-MM-DD'), TO_DATE('2024-11-13', 'YYYY-MM-DD'), TO_DATE('2024-11-14', 'YYYY-MM-DD'), 1813.7, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1334', TO_DATE('2024-11-11', 'YYYY-MM-DD'), TO_DATE('2024-11-16', 'YYYY-MM-DD'), TO_DATE('2024-11-15', 'YYYY-MM-DD'), 302.02, 'RECEIVED', 'SUP007', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1335', TO_DATE('2024-11-13', 'YYYY-MM-DD'), TO_DATE('2024-11-21', 'YYYY-MM-DD'), TO_DATE('2024-11-22', 'YYYY-MM-DD'), 246.85, 'RECEIVED', 'SUP010', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1336', TO_DATE('2024-11-13', 'YYYY-MM-DD'), TO_DATE('2024-11-16', 'YYYY-MM-DD'), TO_DATE('2024-11-17', 'YYYY-MM-DD'), 3707.25, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1337', TO_DATE('2024-11-13', 'YYYY-MM-DD'), TO_DATE('2024-11-18', 'YYYY-MM-DD'), TO_DATE('2024-11-20', 'YYYY-MM-DD'), 243.46, 'RECEIVED', 'SUP004', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1338', TO_DATE('2024-11-15', 'YYYY-MM-DD'), TO_DATE('2024-11-18', 'YYYY-MM-DD'), TO_DATE('2024-11-17', 'YYYY-MM-DD'), 421.83, 'RECEIVED', 'SUP002', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1339', TO_DATE('2024-11-15', 'YYYY-MM-DD'), TO_DATE('2024-11-20', 'YYYY-MM-DD'), TO_DATE('2024-11-20', 'YYYY-MM-DD'), 1807.49, 'RECEIVED', 'SUP004', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1340', TO_DATE('2024-11-16', 'YYYY-MM-DD'), TO_DATE('2024-11-24', 'YYYY-MM-DD'), TO_DATE('2024-11-29', 'YYYY-MM-DD'), 134.14, 'RECEIVED', 'SUP011', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1341', TO_DATE('2024-11-16', 'YYYY-MM-DD'), TO_DATE('2024-11-21', 'YYYY-MM-DD'), TO_DATE('2024-11-22', 'YYYY-MM-DD'), 1261.45, 'RECEIVED', 'SUP005', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1342', TO_DATE('2024-11-17', 'YYYY-MM-DD'), TO_DATE('2024-11-22', 'YYYY-MM-DD'), TO_DATE('2024-11-21', 'YYYY-MM-DD'), 370.94, 'RECEIVED', 'SUP006', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1343', TO_DATE('2024-11-17', 'YYYY-MM-DD'), TO_DATE('2024-11-20', 'YYYY-MM-DD'), TO_DATE('2024-11-18', 'YYYY-MM-DD'), 740.82, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1344', TO_DATE('2024-11-18', 'YYYY-MM-DD'), TO_DATE('2024-11-23', 'YYYY-MM-DD'), TO_DATE('2024-11-25', 'YYYY-MM-DD'), 318.24, 'RECEIVED', 'SUP006', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1345', TO_DATE('2024-11-18', 'YYYY-MM-DD'), TO_DATE('2024-11-21', 'YYYY-MM-DD'), TO_DATE('2024-11-21', 'YYYY-MM-DD'), 135.4, 'RECEIVED', 'SUP001', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1346', TO_DATE('2024-11-18', 'YYYY-MM-DD'), TO_DATE('2024-11-26', 'YYYY-MM-DD'), TO_DATE('2024-11-27', 'YYYY-MM-DD'), 390.94, 'RECEIVED', 'SUP009', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1347', TO_DATE('2024-11-19', 'YYYY-MM-DD'), TO_DATE('2024-11-27', 'YYYY-MM-DD'), NULL, 345.64, 'CANCELLED', 'SUP008', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1348', TO_DATE('2024-11-19', 'YYYY-MM-DD'), TO_DATE('2024-11-27', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'), 760.84, 'RECEIVED', 'SUP009', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1349', TO_DATE('2024-11-19', 'YYYY-MM-DD'), TO_DATE('2024-11-24', 'YYYY-MM-DD'), NULL, 2544.02, 'CANCELLED', 'SUP007', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1350', TO_DATE('2024-11-22', 'YYYY-MM-DD'), TO_DATE('2024-11-27', 'YYYY-MM-DD'), TO_DATE('2024-11-29', 'YYYY-MM-DD'), 424.69, 'RECEIVED', 'SUP005', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1351', TO_DATE('2024-11-23', 'YYYY-MM-DD'), TO_DATE('2024-11-26', 'YYYY-MM-DD'), TO_DATE('2024-11-26', 'YYYY-MM-DD'), 379.76, 'RECEIVED', 'SUP002', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1352', TO_DATE('2024-11-23', 'YYYY-MM-DD'), TO_DATE('2024-11-26', 'YYYY-MM-DD'), TO_DATE('2024-11-24', 'YYYY-MM-DD'), 103.61, 'RECEIVED', 'SUP003', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1353', TO_DATE('2024-11-24', 'YYYY-MM-DD'), TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_DATE('2024-12-08', 'YYYY-MM-DD'), 255.9, 'RECEIVED', 'SUP008', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1354', TO_DATE('2024-11-24', 'YYYY-MM-DD'), TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_DATE('2024-12-04', 'YYYY-MM-DD'), 483.18, 'RECEIVED', 'SUP011', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1355', TO_DATE('2024-11-25', 'YYYY-MM-DD'), TO_DATE('2024-12-03', 'YYYY-MM-DD'), TO_DATE('2024-12-05', 'YYYY-MM-DD'), 794.25, 'RECEIVED', 'SUP010', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1356', TO_DATE('2024-11-25', 'YYYY-MM-DD'), TO_DATE('2024-11-28', 'YYYY-MM-DD'), TO_DATE('2024-11-28', 'YYYY-MM-DD'), 399.14, 'RECEIVED', 'SUP003', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1357', TO_DATE('2024-11-25', 'YYYY-MM-DD'), TO_DATE('2024-11-28', 'YYYY-MM-DD'), TO_DATE('2024-11-28', 'YYYY-MM-DD'), 234.2, 'RECEIVED', 'SUP002', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1358', TO_DATE('2024-11-26', 'YYYY-MM-DD'), TO_DATE('2024-11-29', 'YYYY-MM-DD'), TO_DATE('2024-11-29', 'YYYY-MM-DD'), 189.76, 'RECEIVED', 'SUP002', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1359', TO_DATE('2024-11-27', 'YYYY-MM-DD'), TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'), 4336.11, 'RECEIVED', 'SUP007', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1360', TO_DATE('2024-11-28', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-02', 'YYYY-MM-DD'), 102.96, 'RECEIVED', 'SUP003', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1361', TO_DATE('2024-11-29', 'YYYY-MM-DD'), TO_DATE('2024-12-07', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'), 2477.06, 'RECEIVED', 'SUP010', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1362', TO_DATE('2024-11-29', 'YYYY-MM-DD'), TO_DATE('2024-12-04', 'YYYY-MM-DD'), TO_DATE('2024-12-05', 'YYYY-MM-DD'), 345.64, 'RECEIVED', 'SUP005', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1363', TO_DATE('2024-11-30', 'YYYY-MM-DD'), TO_DATE('2024-12-05', 'YYYY-MM-DD'), TO_DATE('2024-12-07', 'YYYY-MM-DD'), 382.99, 'RECEIVED', 'SUP005', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1364', TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-06', 'YYYY-MM-DD'), TO_DATE('2024-12-09', 'YYYY-MM-DD'), 867.86, 'RECEIVED', 'SUP007', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1365', TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_DATE('2024-12-05', 'YYYY-MM-DD'), TO_DATE('2024-12-04', 'YYYY-MM-DD'), 315.64, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1366', TO_DATE('2024-12-02', 'YYYY-MM-DD'), TO_DATE('2024-12-07', 'YYYY-MM-DD'), TO_DATE('2024-12-07', 'YYYY-MM-DD'), 120.17, 'RECEIVED', 'SUP004', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1367', TO_DATE('2024-12-03', 'YYYY-MM-DD'), TO_DATE('2024-12-08', 'YYYY-MM-DD'), TO_DATE('2024-12-07', 'YYYY-MM-DD'), 108.54, 'RECEIVED', 'SUP007', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1368', TO_DATE('2024-12-03', 'YYYY-MM-DD'), TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'), 380.55, 'RECEIVED', 'SUP008', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1369', TO_DATE('2024-12-04', 'YYYY-MM-DD'), TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_DATE('2024-12-09', 'YYYY-MM-DD'), 507.16, 'RECEIVED', 'SUP004', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1370', TO_DATE('2024-12-04', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_DATE('2024-12-18', 'YYYY-MM-DD'), 1200.17, 'RECEIVED', 'SUP009', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1371', TO_DATE('2024-12-05', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2024-12-11', 'YYYY-MM-DD'), 600.86, 'RECEIVED', 'SUP004', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1372', TO_DATE('2024-12-05', 'YYYY-MM-DD'), TO_DATE('2024-12-08', 'YYYY-MM-DD'), TO_DATE('2024-12-07', 'YYYY-MM-DD'), 325.7, 'RECEIVED', 'SUP002', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1373', TO_DATE('2024-12-06', 'YYYY-MM-DD'), TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_DATE('2024-12-08', 'YYYY-MM-DD'), 996.99, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1374', TO_DATE('2024-12-06', 'YYYY-MM-DD'), TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_DATE('2024-12-07', 'YYYY-MM-DD'), 654.72, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1375', TO_DATE('2024-12-06', 'YYYY-MM-DD'), TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_DATE('2024-12-14', 'YYYY-MM-DD'), 273.94, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1376', TO_DATE('2024-12-07', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2024-12-09', 'YYYY-MM-DD'), 164.44, 'RECEIVED', 'SUP003', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1377', TO_DATE('2024-12-07', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 525.78, 'RECEIVED', 'SUP004', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1378', TO_DATE('2024-12-07', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2024-12-08', 'YYYY-MM-DD'), 368.14, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1379', TO_DATE('2024-12-08', 'YYYY-MM-DD'), TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'), 152.3, 'RECEIVED', 'SUP001', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1380', TO_DATE('2024-12-08', 'YYYY-MM-DD'), TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_DATE('2024-12-16', 'YYYY-MM-DD'), 348.62, 'RECEIVED', 'SUP005', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1381', TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_DATE('2024-12-14', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 482.07, 'RECEIVED', 'SUP007', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1382', TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'), 1082.2, 'RECEIVED', 'SUP001', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1383', TO_DATE('2024-12-09', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_DATE('2024-12-10', 'YYYY-MM-DD'), 48.0, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1384', TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('2024-12-14', 'YYYY-MM-DD'), 159.53, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1385', TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 339.24, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1386', TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_DATE('2024-12-14', 'YYYY-MM-DD'), 173.96, 'RECEIVED', 'SUP002', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1387', TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_DATE('2024-12-19', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), 1244.67, 'RECEIVED', 'SUP009', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1388', TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_DATE('2024-12-19', 'YYYY-MM-DD'), TO_DATE('2024-12-20', 'YYYY-MM-DD'), 652.38, 'RECEIVED', 'SUP009', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1389', TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_DATE('2024-12-19', 'YYYY-MM-DD'), TO_DATE('2024-12-24', 'YYYY-MM-DD'), 36.29, 'RECEIVED', 'SUP009', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1390', TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-23', 'YYYY-MM-DD'), 888.53, 'RECEIVED', 'SUP009', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1391', TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('2024-12-16', 'YYYY-MM-DD'), 134.36, 'RECEIVED', 'SUP001', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1392', TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-23', 'YYYY-MM-DD'), 376.09, 'RECEIVED', 'SUP010', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1393', TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), 229.14, 'RECEIVED', 'SUP006', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1394', TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_DATE('2024-12-17', 'YYYY-MM-DD'), 459.72, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1395', TO_DATE('2024-12-13', 'YYYY-MM-DD'), TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_DATE('2024-12-16', 'YYYY-MM-DD'), 399.06, 'RECEIVED', 'SUP003', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1396', TO_DATE('2024-12-14', 'YYYY-MM-DD'), TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_DATE('2024-12-16', 'YYYY-MM-DD'), 282.02, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1397', TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_DATE('2024-12-29', 'YYYY-MM-DD'), 2041.05, 'RECEIVED', 'SUP008', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1398', TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_DATE('2024-12-27', 'YYYY-MM-DD'), 115.62, 'RECEIVED', 'SUP009', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1399', TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_DATE('2024-12-19', 'YYYY-MM-DD'), TO_DATE('2024-12-19', 'YYYY-MM-DD'), 76.19, 'RECEIVED', 'SUP003', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1400', TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-23', 'YYYY-MM-DD'), 326.68, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1401', TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_DATE('2024-12-24', 'YYYY-MM-DD'), TO_DATE('2024-12-29', 'YYYY-MM-DD'), 531.61, 'RECEIVED', 'SUP011', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1402', TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), 211.94, 'RECEIVED', 'SUP006', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1403', TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-19', 'YYYY-MM-DD'), 870.06, 'RECEIVED', 'SUP001', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1404', TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_DATE('2024-12-22', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), 2248.83, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1405', TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-20', 'YYYY-MM-DD'), 99.64, 'RECEIVED', 'SUP002', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1406', TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_DATE('2024-12-27', 'YYYY-MM-DD'), 151.0, 'RECEIVED', 'SUP011', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1407', TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-19', 'YYYY-MM-DD'), 162.13, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1408', TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), 142.9, 'RECEIVED', 'SUP001', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1409', TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-19', 'YYYY-MM-DD'), 143.79, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1410', TO_DATE('2024-12-18', 'YYYY-MM-DD'), TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-20', 'YYYY-MM-DD'), 493.08, 'RECEIVED', 'SUP002', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1411', TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_DATE('2024-12-24', 'YYYY-MM-DD'), 321.31, 'RECEIVED', 'SUP007', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1412', TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_DATE('2024-12-22', 'YYYY-MM-DD'), 161.49, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1413', TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_DATE('2024-12-27', 'YYYY-MM-DD'), 130.91, 'RECEIVED', 'SUP007', 'S0045');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1414', TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-28', 'YYYY-MM-DD'), TO_DATE('2025-01-02', 'YYYY-MM-DD'), 204.14, 'RECEIVED', 'SUP009', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1415', TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_DATE('2024-12-22', 'YYYY-MM-DD'), 116.12, 'RECEIVED', 'SUP002', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1416', TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_DATE('2024-12-22', 'YYYY-MM-DD'), 312.05, 'RECEIVED', 'SUP003', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1417', TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_DATE('2024-12-28', 'YYYY-MM-DD'), 300.39, 'RECEIVED', 'SUP007', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1418', TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-24', 'YYYY-MM-DD'), TO_DATE('2024-12-25', 'YYYY-MM-DD'), 358.13, 'RECEIVED', 'SUP002', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1419', TO_DATE('2024-12-21', 'YYYY-MM-DD'), TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_DATE('2024-12-29', 'YYYY-MM-DD'), 113.8, 'RECEIVED', 'SUP006', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1420', TO_DATE('2024-12-23', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2025-01-05', 'YYYY-MM-DD'), 458.8, 'RECEIVED', 'SUP009', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1421', TO_DATE('2024-12-24', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-03', 'YYYY-MM-DD'), 184.7, 'RECEIVED', 'SUP011', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1422', TO_DATE('2024-12-24', 'YYYY-MM-DD'), TO_DATE('2024-12-29', 'YYYY-MM-DD'), TO_DATE('2024-12-30', 'YYYY-MM-DD'), 121.95, 'RECEIVED', 'SUP006', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1423', TO_DATE('2024-12-25', 'YYYY-MM-DD'), TO_DATE('2024-12-28', 'YYYY-MM-DD'), TO_DATE('2024-12-26', 'YYYY-MM-DD'), 339.16, 'RECEIVED', 'SUP001', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1424', TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_DATE('2024-12-29', 'YYYY-MM-DD'), TO_DATE('2024-12-27', 'YYYY-MM-DD'), 166.02, 'RECEIVED', 'SUP001', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1425', TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_DATE('2025-01-03', 'YYYY-MM-DD'), TO_DATE('2025-01-07', 'YYYY-MM-DD'), 359.22, 'RECEIVED', 'SUP009', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1426', TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_DATE('2024-12-29', 'YYYY-MM-DD'), TO_DATE('2024-12-28', 'YYYY-MM-DD'), 334.81, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1427', TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), 1445.22, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1428', TO_DATE('2024-12-26', 'YYYY-MM-DD'), TO_DATE('2025-01-03', 'YYYY-MM-DD'), TO_DATE('2025-01-05', 'YYYY-MM-DD'), 482.9, 'RECEIVED', 'SUP010', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1429', TO_DATE('2024-12-27', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-04', 'YYYY-MM-DD'), 115.23, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1430', TO_DATE('2024-12-27', 'YYYY-MM-DD'), TO_DATE('2024-12-30', 'YYYY-MM-DD'), TO_DATE('2024-12-30', 'YYYY-MM-DD'), 159.72, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1431', TO_DATE('2024-12-28', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 452.81, 'RECEIVED', 'SUP002', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1432', TO_DATE('2024-12-29', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-30', 'YYYY-MM-DD'), 59.68, 'RECEIVED', 'SUP001', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1433', TO_DATE('2024-12-30', 'YYYY-MM-DD'), TO_DATE('2025-01-02', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 163.27, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1434', TO_DATE('2024-12-30', 'YYYY-MM-DD'), TO_DATE('2025-01-07', 'YYYY-MM-DD'), TO_DATE('2025-01-11', 'YYYY-MM-DD'), 940.23, 'RECEIVED', 'SUP010', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1435', TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2025-01-05', 'YYYY-MM-DD'), TO_DATE('2025-01-06', 'YYYY-MM-DD'), 458.69, 'RECEIVED', 'SUP006', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1436', TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2025-01-03', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 72.05, 'RECEIVED', 'SUP003', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1437', TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2025-01-03', 'YYYY-MM-DD'), TO_DATE('2025-01-04', 'YYYY-MM-DD'), 79.8, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1438', TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2025-01-08', 'YYYY-MM-DD'), TO_DATE('2025-01-13', 'YYYY-MM-DD'), 51.9, 'RECEIVED', 'SUP011', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1439', TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2025-01-03', 'YYYY-MM-DD'), TO_DATE('2025-01-03', 'YYYY-MM-DD'), 101.76, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1440', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-04', 'YYYY-MM-DD'), TO_DATE('2025-01-05', 'YYYY-MM-DD'), 135.85, 'RECEIVED', 'SUP001', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1441', TO_DATE('2025-01-04', 'YYYY-MM-DD'), TO_DATE('2025-01-07', 'YYYY-MM-DD'), TO_DATE('2025-01-08', 'YYYY-MM-DD'), 290.09, 'RECEIVED', 'SUP001', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1442', TO_DATE('2025-01-05', 'YYYY-MM-DD'), TO_DATE('2025-01-08', 'YYYY-MM-DD'), TO_DATE('2025-01-08', 'YYYY-MM-DD'), 342.03, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1443', TO_DATE('2025-01-05', 'YYYY-MM-DD'), TO_DATE('2025-01-13', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), 263.05, 'RECEIVED', 'SUP009', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1444', TO_DATE('2025-01-05', 'YYYY-MM-DD'), TO_DATE('2025-01-08', 'YYYY-MM-DD'), TO_DATE('2025-01-09', 'YYYY-MM-DD'), 485.82, 'RECEIVED', 'SUP002', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1445', TO_DATE('2025-01-06', 'YYYY-MM-DD'), TO_DATE('2025-01-09', 'YYYY-MM-DD'), TO_DATE('2025-01-08', 'YYYY-MM-DD'), 284.28, 'RECEIVED', 'SUP003', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1446', TO_DATE('2025-01-07', 'YYYY-MM-DD'), TO_DATE('2025-01-12', 'YYYY-MM-DD'), TO_DATE('2025-01-13', 'YYYY-MM-DD'), 442.52, 'RECEIVED', 'SUP004', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1447', TO_DATE('2025-01-07', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-11', 'YYYY-MM-DD'), 515.11, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1448', TO_DATE('2025-01-07', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-08', 'YYYY-MM-DD'), 361.4, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1449', TO_DATE('2025-01-08', 'YYYY-MM-DD'), TO_DATE('2025-01-13', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), 74.38, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1450', TO_DATE('2025-01-08', 'YYYY-MM-DD'), TO_DATE('2025-01-11', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'), 42.5, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1451', TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-18', 'YYYY-MM-DD'), TO_DATE('2025-01-21', 'YYYY-MM-DD'), 79.6, 'RECEIVED', 'SUP009', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1452', TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-01-18', 'YYYY-MM-DD'), 527.85, 'RECEIVED', 'SUP004', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1453', TO_DATE('2025-01-12', 'YYYY-MM-DD'), TO_DATE('2025-01-17', 'YYYY-MM-DD'), TO_DATE('2025-01-17', 'YYYY-MM-DD'), 428.89, 'RECEIVED', 'SUP007', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1454', TO_DATE('2025-01-13', 'YYYY-MM-DD'), TO_DATE('2025-01-18', 'YYYY-MM-DD'), TO_DATE('2025-01-19', 'YYYY-MM-DD'), 638.02, 'RECEIVED', 'SUP007', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1455', TO_DATE('2025-01-14', 'YYYY-MM-DD'), TO_DATE('2025-01-22', 'YYYY-MM-DD'), TO_DATE('2025-01-27', 'YYYY-MM-DD'), 338.71, 'RECEIVED', 'SUP008', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1456', TO_DATE('2025-01-16', 'YYYY-MM-DD'), TO_DATE('2025-01-21', 'YYYY-MM-DD'), TO_DATE('2025-01-21', 'YYYY-MM-DD'), 4897.49, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1457', TO_DATE('2025-01-16', 'YYYY-MM-DD'), TO_DATE('2025-01-19', 'YYYY-MM-DD'), TO_DATE('2025-01-18', 'YYYY-MM-DD'), 549.75, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1458', TO_DATE('2025-01-16', 'YYYY-MM-DD'), TO_DATE('2025-01-19', 'YYYY-MM-DD'), TO_DATE('2025-01-17', 'YYYY-MM-DD'), 84.95, 'RECEIVED', 'SUP001', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1459', TO_DATE('2025-01-16', 'YYYY-MM-DD'), TO_DATE('2025-01-19', 'YYYY-MM-DD'), TO_DATE('2025-01-18', 'YYYY-MM-DD'), 168.52, 'RECEIVED', 'SUP003', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1460', TO_DATE('2025-01-17', 'YYYY-MM-DD'), TO_DATE('2025-01-25', 'YYYY-MM-DD'), TO_DATE('2025-01-31', 'YYYY-MM-DD'), 563.99, 'RECEIVED', 'SUP010', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1461', TO_DATE('2025-01-17', 'YYYY-MM-DD'), TO_DATE('2025-01-22', 'YYYY-MM-DD'), TO_DATE('2025-01-23', 'YYYY-MM-DD'), 645.73, 'RECEIVED', 'SUP004', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1462', TO_DATE('2025-01-18', 'YYYY-MM-DD'), TO_DATE('2025-01-26', 'YYYY-MM-DD'), TO_DATE('2025-01-30', 'YYYY-MM-DD'), 319.51, 'RECEIVED', 'SUP008', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1463', TO_DATE('2025-01-18', 'YYYY-MM-DD'), TO_DATE('2025-01-26', 'YYYY-MM-DD'), TO_DATE('2025-01-27', 'YYYY-MM-DD'), 639.37, 'RECEIVED', 'SUP009', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1464', TO_DATE('2025-01-18', 'YYYY-MM-DD'), TO_DATE('2025-01-21', 'YYYY-MM-DD'), TO_DATE('2025-01-19', 'YYYY-MM-DD'), 215.93, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1465', TO_DATE('2025-01-18', 'YYYY-MM-DD'), TO_DATE('2025-01-21', 'YYYY-MM-DD'), TO_DATE('2025-01-20', 'YYYY-MM-DD'), 1235.94, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1466', TO_DATE('2025-01-19', 'YYYY-MM-DD'), TO_DATE('2025-01-24', 'YYYY-MM-DD'), TO_DATE('2025-01-26', 'YYYY-MM-DD'), 365.03, 'RECEIVED', 'SUP007', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1467', TO_DATE('2025-01-21', 'YYYY-MM-DD'), TO_DATE('2025-01-24', 'YYYY-MM-DD'), TO_DATE('2025-01-23', 'YYYY-MM-DD'), 481.94, 'RECEIVED', 'SUP001', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1468', TO_DATE('2025-01-22', 'YYYY-MM-DD'), TO_DATE('2025-01-25', 'YYYY-MM-DD'), TO_DATE('2025-01-24', 'YYYY-MM-DD'), 273.12, 'RECEIVED', 'SUP002', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1469', TO_DATE('2025-01-23', 'YYYY-MM-DD'), TO_DATE('2025-01-28', 'YYYY-MM-DD'), TO_DATE('2025-01-28', 'YYYY-MM-DD'), 198.02, 'RECEIVED', 'SUP007', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1470', TO_DATE('2025-01-23', 'YYYY-MM-DD'), TO_DATE('2025-01-26', 'YYYY-MM-DD'), TO_DATE('2025-01-25', 'YYYY-MM-DD'), 68.64, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1471', TO_DATE('2025-01-24', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-07', 'YYYY-MM-DD'), 105.82, 'RECEIVED', 'SUP008', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1472', TO_DATE('2025-01-24', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), 189.63, 'RECEIVED', 'SUP011', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1473', TO_DATE('2025-01-25', 'YYYY-MM-DD'), TO_DATE('2025-01-30', 'YYYY-MM-DD'), TO_DATE('2025-02-02', 'YYYY-MM-DD'), 1029.68, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1474', TO_DATE('2025-01-25', 'YYYY-MM-DD'), TO_DATE('2025-02-02', 'YYYY-MM-DD'), TO_DATE('2025-02-07', 'YYYY-MM-DD'), 217.44, 'RECEIVED', 'SUP010', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1475', TO_DATE('2025-01-26', 'YYYY-MM-DD'), TO_DATE('2025-01-31', 'YYYY-MM-DD'), TO_DATE('2025-01-30', 'YYYY-MM-DD'), 326.67, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1476', TO_DATE('2025-01-27', 'YYYY-MM-DD'), TO_DATE('2025-01-30', 'YYYY-MM-DD'), TO_DATE('2025-01-29', 'YYYY-MM-DD'), 130.39, 'RECEIVED', 'SUP001', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1477', TO_DATE('2025-01-27', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-03', 'YYYY-MM-DD'), 243.49, 'RECEIVED', 'SUP007', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1478', TO_DATE('2025-01-27', 'YYYY-MM-DD'), TO_DATE('2025-02-04', 'YYYY-MM-DD'), TO_DATE('2025-02-05', 'YYYY-MM-DD'), 241.41, 'RECEIVED', 'SUP011', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1479', TO_DATE('2025-01-27', 'YYYY-MM-DD'), TO_DATE('2025-02-04', 'YYYY-MM-DD'), TO_DATE('2025-02-08', 'YYYY-MM-DD'), 615.84, 'RECEIVED', 'SUP009', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1480', TO_DATE('2025-01-28', 'YYYY-MM-DD'), TO_DATE('2025-02-05', 'YYYY-MM-DD'), TO_DATE('2025-02-07', 'YYYY-MM-DD'), 321.06, 'RECEIVED', 'SUP009', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1481', TO_DATE('2025-01-28', 'YYYY-MM-DD'), TO_DATE('2025-01-31', 'YYYY-MM-DD'), TO_DATE('2025-01-31', 'YYYY-MM-DD'), 869.75, 'RECEIVED', 'SUP001', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1482', TO_DATE('2025-01-29', 'YYYY-MM-DD'), TO_DATE('2025-02-03', 'YYYY-MM-DD'), TO_DATE('2025-02-04', 'YYYY-MM-DD'), 576.95, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1483', TO_DATE('2025-01-29', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-01-30', 'YYYY-MM-DD'), 150.67, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1484', TO_DATE('2025-01-30', 'YYYY-MM-DD'), TO_DATE('2025-02-04', 'YYYY-MM-DD'), TO_DATE('2025-02-03', 'YYYY-MM-DD'), 672.33, 'RECEIVED', 'SUP004', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1485', TO_DATE('2025-01-30', 'YYYY-MM-DD'), TO_DATE('2025-02-02', 'YYYY-MM-DD'), TO_DATE('2025-01-31', 'YYYY-MM-DD'), 176.5, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1486', TO_DATE('2025-01-30', 'YYYY-MM-DD'), TO_DATE('2025-02-04', 'YYYY-MM-DD'), TO_DATE('2025-02-03', 'YYYY-MM-DD'), 115.91, 'RECEIVED', 'SUP006', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1487', TO_DATE('2025-01-30', 'YYYY-MM-DD'), TO_DATE('2025-02-04', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), 124.41, 'RECEIVED', 'SUP004', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1488', TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), 837.79, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1489', TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), TO_DATE('2025-02-07', 'YYYY-MM-DD'), 601.98, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1490', TO_DATE('2025-02-02', 'YYYY-MM-DD'), TO_DATE('2025-02-07', 'YYYY-MM-DD'), TO_DATE('2025-02-09', 'YYYY-MM-DD'), 661.18, 'RECEIVED', 'SUP006', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1491', TO_DATE('2025-02-03', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), 795.88, 'RECEIVED', 'SUP003', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1492', TO_DATE('2025-02-03', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), TO_DATE('2025-02-07', 'YYYY-MM-DD'), 71.48, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1493', TO_DATE('2025-02-04', 'YYYY-MM-DD'), TO_DATE('2025-02-09', 'YYYY-MM-DD'), TO_DATE('2025-02-09', 'YYYY-MM-DD'), 57.49, 'RECEIVED', 'SUP007', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1494', TO_DATE('2025-02-05', 'YYYY-MM-DD'), TO_DATE('2025-02-13', 'YYYY-MM-DD'), TO_DATE('2025-02-19', 'YYYY-MM-DD'), 861.27, 'RECEIVED', 'SUP008', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1495', TO_DATE('2025-02-05', 'YYYY-MM-DD'), TO_DATE('2025-02-13', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), 669.38, 'RECEIVED', 'SUP011', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1496', TO_DATE('2025-02-06', 'YYYY-MM-DD'), TO_DATE('2025-02-11', 'YYYY-MM-DD'), TO_DATE('2025-02-13', 'YYYY-MM-DD'), 168.42, 'RECEIVED', 'SUP007', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1497', TO_DATE('2025-02-07', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-16', 'YYYY-MM-DD'), 887.16, 'RECEIVED', 'SUP010', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1498', TO_DATE('2025-02-10', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), 537.95, 'RECEIVED', 'SUP005', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1499', TO_DATE('2025-02-12', 'YYYY-MM-DD'), TO_DATE('2025-02-17', 'YYYY-MM-DD'), TO_DATE('2025-02-18', 'YYYY-MM-DD'), 280.02, 'RECEIVED', 'SUP007', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1500', TO_DATE('2025-02-12', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-14', 'YYYY-MM-DD'), 309.24, 'RECEIVED', 'SUP002', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1501', TO_DATE('2025-02-13', 'YYYY-MM-DD'), TO_DATE('2025-02-16', 'YYYY-MM-DD'), TO_DATE('2025-02-14', 'YYYY-MM-DD'), 190.26, 'RECEIVED', 'SUP003', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1502', TO_DATE('2025-02-14', 'YYYY-MM-DD'), TO_DATE('2025-02-22', 'YYYY-MM-DD'), TO_DATE('2025-02-26', 'YYYY-MM-DD'), 258.43, 'RECEIVED', 'SUP009', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1503', TO_DATE('2025-02-14', 'YYYY-MM-DD'), TO_DATE('2025-02-17', 'YYYY-MM-DD'), TO_DATE('2025-02-16', 'YYYY-MM-DD'), 10.45, 'RECEIVED', 'SUP001', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1504', TO_DATE('2025-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-18', 'YYYY-MM-DD'), TO_DATE('2025-02-18', 'YYYY-MM-DD'), 147.7, 'RECEIVED', 'SUP001', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1505', TO_DATE('2025-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-18', 'YYYY-MM-DD'), TO_DATE('2025-02-18', 'YYYY-MM-DD'), 351.11, 'RECEIVED', 'SUP001', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1506', TO_DATE('2025-02-16', 'YYYY-MM-DD'), TO_DATE('2025-02-19', 'YYYY-MM-DD'), TO_DATE('2025-02-17', 'YYYY-MM-DD'), 5202.36, 'RECEIVED', 'SUP003', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1507', TO_DATE('2025-02-16', 'YYYY-MM-DD'), TO_DATE('2025-02-21', 'YYYY-MM-DD'), TO_DATE('2025-02-20', 'YYYY-MM-DD'), 466.24, 'RECEIVED', 'SUP007', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1508', TO_DATE('2025-02-16', 'YYYY-MM-DD'), TO_DATE('2025-02-19', 'YYYY-MM-DD'), TO_DATE('2025-02-18', 'YYYY-MM-DD'), 519.54, 'RECEIVED', 'SUP002', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1509', TO_DATE('2025-02-19', 'YYYY-MM-DD'), TO_DATE('2025-02-22', 'YYYY-MM-DD'), TO_DATE('2025-02-23', 'YYYY-MM-DD'), 130.43, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1510', TO_DATE('2025-02-20', 'YYYY-MM-DD'), TO_DATE('2025-02-23', 'YYYY-MM-DD'), TO_DATE('2025-02-22', 'YYYY-MM-DD'), 862.57, 'RECEIVED', 'SUP002', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1511', TO_DATE('2025-02-21', 'YYYY-MM-DD'), TO_DATE('2025-02-26', 'YYYY-MM-DD'), TO_DATE('2025-02-27', 'YYYY-MM-DD'), 475.05, 'RECEIVED', 'SUP007', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1512', TO_DATE('2025-02-21', 'YYYY-MM-DD'), TO_DATE('2025-02-24', 'YYYY-MM-DD'), TO_DATE('2025-02-24', 'YYYY-MM-DD'), 119.0, 'RECEIVED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1513', TO_DATE('2025-02-21', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'), 60.06, 'RECEIVED', 'SUP011', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1514', TO_DATE('2025-02-22', 'YYYY-MM-DD'), TO_DATE('2025-02-27', 'YYYY-MM-DD'), TO_DATE('2025-02-27', 'YYYY-MM-DD'), 2354.47, 'RECEIVED', 'SUP007', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1515', TO_DATE('2025-02-23', 'YYYY-MM-DD'), TO_DATE('2025-02-26', 'YYYY-MM-DD'), TO_DATE('2025-02-24', 'YYYY-MM-DD'), 346.57, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1516', TO_DATE('2025-02-23', 'YYYY-MM-DD'), TO_DATE('2025-02-28', 'YYYY-MM-DD'), TO_DATE('2025-03-02', 'YYYY-MM-DD'), 366.87, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1517', TO_DATE('2025-02-23', 'YYYY-MM-DD'), TO_DATE('2025-02-28', 'YYYY-MM-DD'), NULL, 79.44, 'CANCELLED', 'SUP007', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1518', TO_DATE('2025-02-23', 'YYYY-MM-DD'), TO_DATE('2025-02-28', 'YYYY-MM-DD'), TO_DATE('2025-03-03', 'YYYY-MM-DD'), 1574.78, 'RECEIVED', 'SUP005', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1519', TO_DATE('2025-02-24', 'YYYY-MM-DD'), TO_DATE('2025-02-27', 'YYYY-MM-DD'), TO_DATE('2025-02-26', 'YYYY-MM-DD'), 1917.29, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1520', TO_DATE('2025-02-26', 'YYYY-MM-DD'), TO_DATE('2025-03-03', 'YYYY-MM-DD'), TO_DATE('2025-03-04', 'YYYY-MM-DD'), 1292.53, 'RECEIVED', 'SUP004', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1521', TO_DATE('2025-02-26', 'YYYY-MM-DD'), TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-02', 'YYYY-MM-DD'), 103.19, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1522', TO_DATE('2025-02-27', 'YYYY-MM-DD'), TO_DATE('2025-03-02', 'YYYY-MM-DD'), TO_DATE('2025-02-28', 'YYYY-MM-DD'), 23.8, 'RECEIVED', 'SUP003', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1523', TO_DATE('2025-02-28', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'), NULL, 1360.7, 'CANCELLED', 'SUP004', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1524', TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-03-04', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'), 427.6, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1525', TO_DATE('2025-03-02', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-06', 'YYYY-MM-DD'), 1091.35, 'RECEIVED', 'SUP002', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1526', TO_DATE('2025-03-02', 'YYYY-MM-DD'), TO_DATE('2025-03-07', 'YYYY-MM-DD'), TO_DATE('2025-03-07', 'YYYY-MM-DD'), 571.08, 'RECEIVED', 'SUP006', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1527', TO_DATE('2025-03-02', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-05', 'YYYY-MM-DD'), 120.95, 'RECEIVED', 'SUP002', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1528', TO_DATE('2025-03-03', 'YYYY-MM-DD'), TO_DATE('2025-03-06', 'YYYY-MM-DD'), TO_DATE('2025-03-04', 'YYYY-MM-DD'), 79.95, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1529', TO_DATE('2025-03-04', 'YYYY-MM-DD'), TO_DATE('2025-03-09', 'YYYY-MM-DD'), TO_DATE('2025-03-08', 'YYYY-MM-DD'), 1260.11, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1530', TO_DATE('2025-03-04', 'YYYY-MM-DD'), TO_DATE('2025-03-07', 'YYYY-MM-DD'), TO_DATE('2025-03-08', 'YYYY-MM-DD'), 303.2, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1531', TO_DATE('2025-03-07', 'YYYY-MM-DD'), TO_DATE('2025-03-15', 'YYYY-MM-DD'), TO_DATE('2025-03-16', 'YYYY-MM-DD'), 734.73, 'RECEIVED', 'SUP009', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1532', TO_DATE('2025-03-08', 'YYYY-MM-DD'), TO_DATE('2025-03-16', 'YYYY-MM-DD'), NULL, 90.2, 'CANCELLED', 'SUP010', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1533', TO_DATE('2025-03-08', 'YYYY-MM-DD'), TO_DATE('2025-03-16', 'YYYY-MM-DD'), TO_DATE('2025-03-17', 'YYYY-MM-DD'), 1360.7, 'RECEIVED', 'SUP010', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1534', TO_DATE('2025-03-08', 'YYYY-MM-DD'), TO_DATE('2025-03-11', 'YYYY-MM-DD'), TO_DATE('2025-03-09', 'YYYY-MM-DD'), 227.15, 'RECEIVED', 'SUP003', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1535', TO_DATE('2025-03-09', 'YYYY-MM-DD'), TO_DATE('2025-03-12', 'YYYY-MM-DD'), TO_DATE('2025-03-12', 'YYYY-MM-DD'), 134.84, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1536', TO_DATE('2025-03-11', 'YYYY-MM-DD'), TO_DATE('2025-03-14', 'YYYY-MM-DD'), TO_DATE('2025-03-13', 'YYYY-MM-DD'), 96.95, 'RECEIVED', 'SUP001', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1537', TO_DATE('2025-03-12', 'YYYY-MM-DD'), TO_DATE('2025-03-17', 'YYYY-MM-DD'), TO_DATE('2025-03-19', 'YYYY-MM-DD'), 411.68, 'RECEIVED', 'SUP005', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1538', TO_DATE('2025-03-13', 'YYYY-MM-DD'), TO_DATE('2025-03-21', 'YYYY-MM-DD'), TO_DATE('2025-03-26', 'YYYY-MM-DD'), 174.86, 'RECEIVED', 'SUP009', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1539', TO_DATE('2025-03-15', 'YYYY-MM-DD'), TO_DATE('2025-03-18', 'YYYY-MM-DD'), TO_DATE('2025-03-19', 'YYYY-MM-DD'), 138.56, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1540', TO_DATE('2025-03-15', 'YYYY-MM-DD'), TO_DATE('2025-03-20', 'YYYY-MM-DD'), TO_DATE('2025-03-20', 'YYYY-MM-DD'), 328.46, 'RECEIVED', 'SUP005', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1541', TO_DATE('2025-03-16', 'YYYY-MM-DD'), TO_DATE('2025-03-19', 'YYYY-MM-DD'), TO_DATE('2025-03-18', 'YYYY-MM-DD'), 742.49, 'RECEIVED', 'SUP002', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1542', TO_DATE('2025-03-16', 'YYYY-MM-DD'), TO_DATE('2025-03-21', 'YYYY-MM-DD'), TO_DATE('2025-03-24', 'YYYY-MM-DD'), 464.16, 'RECEIVED', 'SUP006', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1543', TO_DATE('2025-03-18', 'YYYY-MM-DD'), TO_DATE('2025-03-26', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'), 185.95, 'RECEIVED', 'SUP008', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1544', TO_DATE('2025-03-20', 'YYYY-MM-DD'), TO_DATE('2025-03-23', 'YYYY-MM-DD'), TO_DATE('2025-03-23', 'YYYY-MM-DD'), 391.26, 'RECEIVED', 'SUP002', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1545', TO_DATE('2025-03-20', 'YYYY-MM-DD'), TO_DATE('2025-03-25', 'YYYY-MM-DD'), TO_DATE('2025-03-27', 'YYYY-MM-DD'), 1242.0, 'RECEIVED', 'SUP004', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1546', TO_DATE('2025-03-21', 'YYYY-MM-DD'), TO_DATE('2025-03-24', 'YYYY-MM-DD'), TO_DATE('2025-03-23', 'YYYY-MM-DD'), 116.04, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1547', TO_DATE('2025-03-23', 'YYYY-MM-DD'), TO_DATE('2025-03-26', 'YYYY-MM-DD'), TO_DATE('2025-03-25', 'YYYY-MM-DD'), 76.4, 'RECEIVED', 'SUP001', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1548', TO_DATE('2025-03-23', 'YYYY-MM-DD'), TO_DATE('2025-03-28', 'YYYY-MM-DD'), TO_DATE('2025-03-28', 'YYYY-MM-DD'), 142.88, 'RECEIVED', 'SUP007', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1549', TO_DATE('2025-03-25', 'YYYY-MM-DD'), TO_DATE('2025-04-02', 'YYYY-MM-DD'), TO_DATE('2025-04-08', 'YYYY-MM-DD'), 207.7, 'RECEIVED', 'SUP011', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1550', TO_DATE('2025-03-25', 'YYYY-MM-DD'), TO_DATE('2025-04-02', 'YYYY-MM-DD'), TO_DATE('2025-04-06', 'YYYY-MM-DD'), 74.44, 'RECEIVED', 'SUP011', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1551', TO_DATE('2025-03-26', 'YYYY-MM-DD'), TO_DATE('2025-03-29', 'YYYY-MM-DD'), TO_DATE('2025-03-30', 'YYYY-MM-DD'), 167.66, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1552', TO_DATE('2025-03-26', 'YYYY-MM-DD'), TO_DATE('2025-03-29', 'YYYY-MM-DD'), TO_DATE('2025-03-30', 'YYYY-MM-DD'), 1500.14, 'RECEIVED', 'SUP003', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1553', TO_DATE('2025-03-27', 'YYYY-MM-DD'), TO_DATE('2025-03-30', 'YYYY-MM-DD'), TO_DATE('2025-03-29', 'YYYY-MM-DD'), 882.03, 'RECEIVED', 'SUP003', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1554', TO_DATE('2025-03-28', 'YYYY-MM-DD'), TO_DATE('2025-03-31', 'YYYY-MM-DD'), TO_DATE('2025-03-29', 'YYYY-MM-DD'), 875.25, 'RECEIVED', 'SUP002', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1555', TO_DATE('2025-03-29', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'), 517.01, 'RECEIVED', 'SUP003', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1556', TO_DATE('2025-03-29', 'YYYY-MM-DD'), TO_DATE('2025-04-03', 'YYYY-MM-DD'), TO_DATE('2025-04-05', 'YYYY-MM-DD'), 358.66, 'RECEIVED', 'SUP007', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1557', TO_DATE('2025-03-30', 'YYYY-MM-DD'), TO_DATE('2025-04-04', 'YYYY-MM-DD'), TO_DATE('2025-04-04', 'YYYY-MM-DD'), 435.64, 'RECEIVED', 'SUP006', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1558', TO_DATE('2025-03-30', 'YYYY-MM-DD'), TO_DATE('2025-04-04', 'YYYY-MM-DD'), TO_DATE('2025-04-06', 'YYYY-MM-DD'), 502.22, 'RECEIVED', 'SUP007', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1559', TO_DATE('2025-03-30', 'YYYY-MM-DD'), TO_DATE('2025-04-02', 'YYYY-MM-DD'), TO_DATE('2025-04-02', 'YYYY-MM-DD'), 956.21, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1560', TO_DATE('2025-03-31', 'YYYY-MM-DD'), TO_DATE('2025-04-03', 'YYYY-MM-DD'), NULL, 1054.13, 'CANCELLED', 'SUP002', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1561', TO_DATE('2025-03-31', 'YYYY-MM-DD'), TO_DATE('2025-04-03', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'), 223.35, 'RECEIVED', 'SUP001', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1562', TO_DATE('2025-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-06', 'YYYY-MM-DD'), TO_DATE('2025-04-08', 'YYYY-MM-DD'), 190.64, 'RECEIVED', 'SUP005', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1563', TO_DATE('2025-04-02', 'YYYY-MM-DD'), TO_DATE('2025-04-10', 'YYYY-MM-DD'), TO_DATE('2025-04-12', 'YYYY-MM-DD'), 885.24, 'RECEIVED', 'SUP010', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1564', TO_DATE('2025-04-03', 'YYYY-MM-DD'), TO_DATE('2025-04-06', 'YYYY-MM-DD'), TO_DATE('2025-04-04', 'YYYY-MM-DD'), 549.89, 'RECEIVED', 'SUP002', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1565', TO_DATE('2025-04-03', 'YYYY-MM-DD'), TO_DATE('2025-04-06', 'YYYY-MM-DD'), TO_DATE('2025-04-07', 'YYYY-MM-DD'), 12.35, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1566', TO_DATE('2025-04-04', 'YYYY-MM-DD'), TO_DATE('2025-04-09', 'YYYY-MM-DD'), TO_DATE('2025-04-09', 'YYYY-MM-DD'), 306.25, 'RECEIVED', 'SUP006', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1567', TO_DATE('2025-04-05', 'YYYY-MM-DD'), TO_DATE('2025-04-08', 'YYYY-MM-DD'), TO_DATE('2025-04-07', 'YYYY-MM-DD'), 499.46, 'RECEIVED', 'SUP001', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1568', TO_DATE('2025-04-05', 'YYYY-MM-DD'), TO_DATE('2025-04-10', 'YYYY-MM-DD'), TO_DATE('2025-04-11', 'YYYY-MM-DD'), 505.04, 'RECEIVED', 'SUP004', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1569', TO_DATE('2025-04-06', 'YYYY-MM-DD'), TO_DATE('2025-04-09', 'YYYY-MM-DD'), TO_DATE('2025-04-09', 'YYYY-MM-DD'), 862.0, 'RECEIVED', 'SUP002', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1570', TO_DATE('2025-04-07', 'YYYY-MM-DD'), TO_DATE('2025-04-12', 'YYYY-MM-DD'), TO_DATE('2025-04-11', 'YYYY-MM-DD'), 298.72, 'RECEIVED', 'SUP006', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1571', TO_DATE('2025-04-09', 'YYYY-MM-DD'), TO_DATE('2025-04-14', 'YYYY-MM-DD'), TO_DATE('2025-04-16', 'YYYY-MM-DD'), 1011.0, 'RECEIVED', 'SUP007', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1572', TO_DATE('2025-04-10', 'YYYY-MM-DD'), TO_DATE('2025-04-13', 'YYYY-MM-DD'), TO_DATE('2025-04-13', 'YYYY-MM-DD'), 462.11, 'RECEIVED', 'SUP003', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1573', TO_DATE('2025-04-10', 'YYYY-MM-DD'), TO_DATE('2025-04-15', 'YYYY-MM-DD'), TO_DATE('2025-04-16', 'YYYY-MM-DD'), 182.69, 'RECEIVED', 'SUP007', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1574', TO_DATE('2025-04-10', 'YYYY-MM-DD'), TO_DATE('2025-04-15', 'YYYY-MM-DD'), TO_DATE('2025-04-15', 'YYYY-MM-DD'), 2679.53, 'RECEIVED', 'SUP006', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1575', TO_DATE('2025-04-14', 'YYYY-MM-DD'), TO_DATE('2025-04-22', 'YYYY-MM-DD'), TO_DATE('2025-04-23', 'YYYY-MM-DD'), 880.68, 'RECEIVED', 'SUP011', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1576', TO_DATE('2025-04-16', 'YYYY-MM-DD'), TO_DATE('2025-04-21', 'YYYY-MM-DD'), NULL, 780.66, 'CANCELLED', 'SUP007', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1577', TO_DATE('2025-04-17', 'YYYY-MM-DD'), TO_DATE('2025-04-22', 'YYYY-MM-DD'), TO_DATE('2025-04-24', 'YYYY-MM-DD'), 250.85, 'RECEIVED', 'SUP004', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1578', TO_DATE('2025-04-18', 'YYYY-MM-DD'), TO_DATE('2025-04-21', 'YYYY-MM-DD'), TO_DATE('2025-04-20', 'YYYY-MM-DD'), 315.93, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1579', TO_DATE('2025-04-19', 'YYYY-MM-DD'), TO_DATE('2025-04-24', 'YYYY-MM-DD'), TO_DATE('2025-04-25', 'YYYY-MM-DD'), 324.18, 'RECEIVED', 'SUP006', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1580', TO_DATE('2025-04-21', 'YYYY-MM-DD'), TO_DATE('2025-04-24', 'YYYY-MM-DD'), TO_DATE('2025-04-25', 'YYYY-MM-DD'), 280.56, 'RECEIVED', 'SUP002', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1581', TO_DATE('2025-04-27', 'YYYY-MM-DD'), TO_DATE('2025-05-02', 'YYYY-MM-DD'), TO_DATE('2025-05-02', 'YYYY-MM-DD'), 466.93, 'RECEIVED', 'SUP006', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1582', TO_DATE('2025-04-28', 'YYYY-MM-DD'), TO_DATE('2025-05-03', 'YYYY-MM-DD'), TO_DATE('2025-05-03', 'YYYY-MM-DD'), 719.91, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1583', TO_DATE('2025-04-29', 'YYYY-MM-DD'), TO_DATE('2025-05-04', 'YYYY-MM-DD'), TO_DATE('2025-05-06', 'YYYY-MM-DD'), 401.97, 'RECEIVED', 'SUP006', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1584', TO_DATE('2025-04-29', 'YYYY-MM-DD'), TO_DATE('2025-05-04', 'YYYY-MM-DD'), TO_DATE('2025-05-05', 'YYYY-MM-DD'), 70.66, 'RECEIVED', 'SUP005', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1585', TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-04', 'YYYY-MM-DD'), NULL, 46.6, 'CANCELLED', 'SUP002', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1586', TO_DATE('2025-05-02', 'YYYY-MM-DD'), TO_DATE('2025-05-05', 'YYYY-MM-DD'), TO_DATE('2025-05-03', 'YYYY-MM-DD'), 245.44, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1587', TO_DATE('2025-05-02', 'YYYY-MM-DD'), TO_DATE('2025-05-05', 'YYYY-MM-DD'), TO_DATE('2025-05-06', 'YYYY-MM-DD'), 1575.68, 'RECEIVED', 'SUP001', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1588', TO_DATE('2025-05-04', 'YYYY-MM-DD'), TO_DATE('2025-05-09', 'YYYY-MM-DD'), TO_DATE('2025-05-10', 'YYYY-MM-DD'), 230.26, 'RECEIVED', 'SUP007', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1589', TO_DATE('2025-05-04', 'YYYY-MM-DD'), TO_DATE('2025-05-09', 'YYYY-MM-DD'), TO_DATE('2025-05-08', 'YYYY-MM-DD'), 678.47, 'RECEIVED', 'SUP007', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1590', TO_DATE('2025-05-05', 'YYYY-MM-DD'), TO_DATE('2025-05-08', 'YYYY-MM-DD'), TO_DATE('2025-05-09', 'YYYY-MM-DD'), 1448.66, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1591', TO_DATE('2025-05-06', 'YYYY-MM-DD'), TO_DATE('2025-05-11', 'YYYY-MM-DD'), TO_DATE('2025-05-14', 'YYYY-MM-DD'), 659.49, 'RECEIVED', 'SUP005', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1592', TO_DATE('2025-05-06', 'YYYY-MM-DD'), TO_DATE('2025-05-11', 'YYYY-MM-DD'), TO_DATE('2025-05-11', 'YYYY-MM-DD'), 374.58, 'RECEIVED', 'SUP006', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1593', TO_DATE('2025-05-07', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-20', 'YYYY-MM-DD'), 165.57, 'RECEIVED', 'SUP010', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1594', TO_DATE('2025-05-07', 'YYYY-MM-DD'), TO_DATE('2025-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-11', 'YYYY-MM-DD'), 234.75, 'RECEIVED', 'SUP002', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1595', TO_DATE('2025-05-07', 'YYYY-MM-DD'), TO_DATE('2025-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-10', 'YYYY-MM-DD'), 508.68, 'RECEIVED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1596', TO_DATE('2025-05-09', 'YYYY-MM-DD'), TO_DATE('2025-05-14', 'YYYY-MM-DD'), TO_DATE('2025-05-17', 'YYYY-MM-DD'), 1209.32, 'RECEIVED', 'SUP004', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1597', TO_DATE('2025-05-09', 'YYYY-MM-DD'), TO_DATE('2025-05-17', 'YYYY-MM-DD'), TO_DATE('2025-05-23', 'YYYY-MM-DD'), 2056.99, 'RECEIVED', 'SUP010', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1598', TO_DATE('2025-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-13', 'YYYY-MM-DD'), TO_DATE('2025-05-12', 'YYYY-MM-DD'), 291.31, 'RECEIVED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1599', TO_DATE('2025-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-13', 'YYYY-MM-DD'), TO_DATE('2025-05-13', 'YYYY-MM-DD'), 445.65, 'RECEIVED', 'SUP003', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1600', TO_DATE('2025-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-16', 'YYYY-MM-DD'), 1068.3, 'RECEIVED', 'SUP007', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1601', TO_DATE('2025-05-11', 'YYYY-MM-DD'), TO_DATE('2025-05-16', 'YYYY-MM-DD'), TO_DATE('2025-05-16', 'YYYY-MM-DD'), 503.26, 'RECEIVED', 'SUP007', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1602', TO_DATE('2025-05-11', 'YYYY-MM-DD'), TO_DATE('2025-05-14', 'YYYY-MM-DD'), TO_DATE('2025-05-12', 'YYYY-MM-DD'), 123.02, 'RECEIVED', 'SUP002', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1603', TO_DATE('2025-05-12', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), 1329.94, 'RECEIVED', 'SUP003', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1604', TO_DATE('2025-05-12', 'YYYY-MM-DD'), TO_DATE('2025-05-20', 'YYYY-MM-DD'), TO_DATE('2025-05-25', 'YYYY-MM-DD'), 310.85, 'RECEIVED', 'SUP009', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1605', TO_DATE('2025-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-18', 'YYYY-MM-DD'), TO_DATE('2025-05-18', 'YYYY-MM-DD'), 674.97, 'RECEIVED', 'SUP002', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1606', TO_DATE('2025-05-16', 'YYYY-MM-DD'), TO_DATE('2025-05-21', 'YYYY-MM-DD'), TO_DATE('2025-05-22', 'YYYY-MM-DD'), 746.68, 'RECEIVED', 'SUP005', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1607', TO_DATE('2025-05-16', 'YYYY-MM-DD'), TO_DATE('2025-05-24', 'YYYY-MM-DD'), TO_DATE('2025-05-27', 'YYYY-MM-DD'), 1365.32, 'RECEIVED', 'SUP009', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1608', TO_DATE('2025-05-16', 'YYYY-MM-DD'), TO_DATE('2025-05-21', 'YYYY-MM-DD'), TO_DATE('2025-05-20', 'YYYY-MM-DD'), 885.3, 'RECEIVED', 'SUP004', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1609', TO_DATE('2025-05-20', 'YYYY-MM-DD'), TO_DATE('2025-05-23', 'YYYY-MM-DD'), TO_DATE('2025-05-24', 'YYYY-MM-DD'), 396.6, 'RECEIVED', 'SUP001', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1610', TO_DATE('2025-05-21', 'YYYY-MM-DD'), TO_DATE('2025-05-26', 'YYYY-MM-DD'), TO_DATE('2025-05-27', 'YYYY-MM-DD'), 745.19, 'RECEIVED', 'SUP004', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1611', TO_DATE('2025-05-23', 'YYYY-MM-DD'), TO_DATE('2025-05-28', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD'), 232.62, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1612', TO_DATE('2025-05-23', 'YYYY-MM-DD'), TO_DATE('2025-05-26', 'YYYY-MM-DD'), TO_DATE('2025-05-24', 'YYYY-MM-DD'), 409.77, 'RECEIVED', 'SUP002', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1613', TO_DATE('2025-05-24', 'YYYY-MM-DD'), TO_DATE('2025-05-27', 'YYYY-MM-DD'), TO_DATE('2025-05-27', 'YYYY-MM-DD'), 277.25, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1614', TO_DATE('2025-05-24', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-06', 'YYYY-MM-DD'), 1833.36, 'RECEIVED', 'SUP010', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1615', TO_DATE('2025-05-27', 'YYYY-MM-DD'), TO_DATE('2025-05-30', 'YYYY-MM-DD'), TO_DATE('2025-05-30', 'YYYY-MM-DD'), 506.1, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1616', TO_DATE('2025-05-27', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 188.01, 'RECEIVED', 'SUP005', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1617', TO_DATE('2025-05-27', 'YYYY-MM-DD'), TO_DATE('2025-06-04', 'YYYY-MM-DD'), TO_DATE('2025-06-10', 'YYYY-MM-DD'), 153.42, 'RECEIVED', 'SUP009', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1618', TO_DATE('2025-05-28', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 78.64, 'RECEIVED', 'SUP003', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1619', TO_DATE('2025-05-28', 'YYYY-MM-DD'), TO_DATE('2025-05-31', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 611.36, 'RECEIVED', 'SUP002', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1620', TO_DATE('2025-05-30', 'YYYY-MM-DD'), TO_DATE('2025-06-04', 'YYYY-MM-DD'), TO_DATE('2025-06-03', 'YYYY-MM-DD'), 145.0, 'RECEIVED', 'SUP006', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1621', TO_DATE('2025-05-31', 'YYYY-MM-DD'), TO_DATE('2025-06-03', 'YYYY-MM-DD'), TO_DATE('2025-06-03', 'YYYY-MM-DD'), 340.74, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1622', TO_DATE('2025-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-06', 'YYYY-MM-DD'), TO_DATE('2025-06-05', 'YYYY-MM-DD'), 195.32, 'RECEIVED', 'SUP004', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1623', TO_DATE('2025-06-03', 'YYYY-MM-DD'), TO_DATE('2025-06-06', 'YYYY-MM-DD'), TO_DATE('2025-06-05', 'YYYY-MM-DD'), 1092.32, 'RECEIVED', 'SUP001', 'S0082');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1624', TO_DATE('2025-06-03', 'YYYY-MM-DD'), TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-11', 'YYYY-MM-DD'), 1557.0, 'RECEIVED', 'SUP005', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1625', TO_DATE('2025-06-03', 'YYYY-MM-DD'), TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-11', 'YYYY-MM-DD'), 1496.48, 'RECEIVED', 'SUP007', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1626', TO_DATE('2025-06-04', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), 145.57, 'RECEIVED', 'SUP001', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1627', TO_DATE('2025-06-04', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), 256.09, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1628', TO_DATE('2025-06-04', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), 304.96, 'RECEIVED', 'SUP003', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1629', TO_DATE('2025-06-04', 'YYYY-MM-DD'), TO_DATE('2025-06-12', 'YYYY-MM-DD'), TO_DATE('2025-06-17', 'YYYY-MM-DD'), 61.1, 'RECEIVED', 'SUP008', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1630', TO_DATE('2025-06-05', 'YYYY-MM-DD'), TO_DATE('2025-06-10', 'YYYY-MM-DD'), TO_DATE('2025-06-12', 'YYYY-MM-DD'), 169.69, 'RECEIVED', 'SUP004', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1631', TO_DATE('2025-06-05', 'YYYY-MM-DD'), TO_DATE('2025-06-10', 'YYYY-MM-DD'), TO_DATE('2025-06-13', 'YYYY-MM-DD'), 504.99, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1632', TO_DATE('2025-06-05', 'YYYY-MM-DD'), TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-06', 'YYYY-MM-DD'), 4722.45, 'RECEIVED', 'SUP002', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1633', TO_DATE('2025-06-05', 'YYYY-MM-DD'), TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-07', 'YYYY-MM-DD'), 219.02, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1634', TO_DATE('2025-06-07', 'YYYY-MM-DD'), TO_DATE('2025-06-10', 'YYYY-MM-DD'), TO_DATE('2025-06-10', 'YYYY-MM-DD'), 81.93, 'RECEIVED', 'SUP001', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1635', TO_DATE('2025-06-07', 'YYYY-MM-DD'), TO_DATE('2025-06-10', 'YYYY-MM-DD'), TO_DATE('2025-06-09', 'YYYY-MM-DD'), 360.91, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1636', TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-16', 'YYYY-MM-DD'), TO_DATE('2025-06-17', 'YYYY-MM-DD'), 980.05, 'RECEIVED', 'SUP009', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1637', TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-11', 'YYYY-MM-DD'), TO_DATE('2025-06-12', 'YYYY-MM-DD'), 754.65, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1638', TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-13', 'YYYY-MM-DD'), TO_DATE('2025-06-14', 'YYYY-MM-DD'), 438.9, 'RECEIVED', 'SUP006', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1639', TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-13', 'YYYY-MM-DD'), TO_DATE('2025-06-15', 'YYYY-MM-DD'), 180.58, 'RECEIVED', 'SUP005', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1640', TO_DATE('2025-06-08', 'YYYY-MM-DD'), TO_DATE('2025-06-11', 'YYYY-MM-DD'), TO_DATE('2025-06-12', 'YYYY-MM-DD'), 256.66, 'RECEIVED', 'SUP002', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1641', TO_DATE('2025-06-09', 'YYYY-MM-DD'), TO_DATE('2025-06-14', 'YYYY-MM-DD'), TO_DATE('2025-06-15', 'YYYY-MM-DD'), 565.24, 'RECEIVED', 'SUP004', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1642', TO_DATE('2025-06-09', 'YYYY-MM-DD'), TO_DATE('2025-06-17', 'YYYY-MM-DD'), TO_DATE('2025-06-21', 'YYYY-MM-DD'), 78.54, 'RECEIVED', 'SUP009', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1643', TO_DATE('2025-06-09', 'YYYY-MM-DD'), TO_DATE('2025-06-14', 'YYYY-MM-DD'), TO_DATE('2025-06-16', 'YYYY-MM-DD'), 372.6, 'RECEIVED', 'SUP004', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1644', TO_DATE('2025-06-10', 'YYYY-MM-DD'), TO_DATE('2025-06-13', 'YYYY-MM-DD'), TO_DATE('2025-06-13', 'YYYY-MM-DD'), 23.8, 'RECEIVED', 'SUP003', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1645', TO_DATE('2025-06-11', 'YYYY-MM-DD'), TO_DATE('2025-06-16', 'YYYY-MM-DD'), TO_DATE('2025-06-16', 'YYYY-MM-DD'), 1260.42, 'RECEIVED', 'SUP007', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1646', TO_DATE('2025-06-11', 'YYYY-MM-DD'), TO_DATE('2025-06-14', 'YYYY-MM-DD'), TO_DATE('2025-06-13', 'YYYY-MM-DD'), 80.0, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1647', TO_DATE('2025-06-13', 'YYYY-MM-DD'), TO_DATE('2025-06-21', 'YYYY-MM-DD'), TO_DATE('2025-06-27', 'YYYY-MM-DD'), 257.02, 'RECEIVED', 'SUP008', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1648', TO_DATE('2025-06-13', 'YYYY-MM-DD'), TO_DATE('2025-06-18', 'YYYY-MM-DD'), TO_DATE('2025-06-18', 'YYYY-MM-DD'), 141.46, 'RECEIVED', 'SUP005', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1649', TO_DATE('2025-06-13', 'YYYY-MM-DD'), TO_DATE('2025-06-21', 'YYYY-MM-DD'), TO_DATE('2025-06-23', 'YYYY-MM-DD'), 23.28, 'RECEIVED', 'SUP010', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1650', TO_DATE('2025-06-14', 'YYYY-MM-DD'), TO_DATE('2025-06-19', 'YYYY-MM-DD'), TO_DATE('2025-06-22', 'YYYY-MM-DD'), 566.33, 'RECEIVED', 'SUP007', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1651', TO_DATE('2025-06-14', 'YYYY-MM-DD'), TO_DATE('2025-06-19', 'YYYY-MM-DD'), TO_DATE('2025-06-21', 'YYYY-MM-DD'), 615.38, 'RECEIVED', 'SUP006', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1652', TO_DATE('2025-06-15', 'YYYY-MM-DD'), TO_DATE('2025-06-18', 'YYYY-MM-DD'), TO_DATE('2025-06-16', 'YYYY-MM-DD'), 100.0, 'RECEIVED', 'SUP001', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1653', TO_DATE('2025-06-15', 'YYYY-MM-DD'), TO_DATE('2025-06-18', 'YYYY-MM-DD'), TO_DATE('2025-06-19', 'YYYY-MM-DD'), 1414.32, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1654', TO_DATE('2025-06-16', 'YYYY-MM-DD'), TO_DATE('2025-06-19', 'YYYY-MM-DD'), TO_DATE('2025-06-17', 'YYYY-MM-DD'), 273.7, 'RECEIVED', 'SUP003', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1655', TO_DATE('2025-06-16', 'YYYY-MM-DD'), TO_DATE('2025-06-19', 'YYYY-MM-DD'), TO_DATE('2025-06-17', 'YYYY-MM-DD'), 251.74, 'RECEIVED', 'SUP003', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1656', TO_DATE('2025-06-16', 'YYYY-MM-DD'), TO_DATE('2025-06-19', 'YYYY-MM-DD'), TO_DATE('2025-06-17', 'YYYY-MM-DD'), 454.65, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1657', TO_DATE('2025-06-17', 'YYYY-MM-DD'), TO_DATE('2025-06-22', 'YYYY-MM-DD'), TO_DATE('2025-06-21', 'YYYY-MM-DD'), 370.58, 'RECEIVED', 'SUP006', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1658', TO_DATE('2025-06-18', 'YYYY-MM-DD'), TO_DATE('2025-06-21', 'YYYY-MM-DD'), TO_DATE('2025-06-20', 'YYYY-MM-DD'), 146.95, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1659', TO_DATE('2025-06-18', 'YYYY-MM-DD'), TO_DATE('2025-06-23', 'YYYY-MM-DD'), TO_DATE('2025-06-26', 'YYYY-MM-DD'), 766.5, 'RECEIVED', 'SUP006', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1660', TO_DATE('2025-06-19', 'YYYY-MM-DD'), TO_DATE('2025-06-24', 'YYYY-MM-DD'), TO_DATE('2025-06-23', 'YYYY-MM-DD'), 360.57, 'RECEIVED', 'SUP007', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1661', TO_DATE('2025-06-20', 'YYYY-MM-DD'), TO_DATE('2025-06-28', 'YYYY-MM-DD'), TO_DATE('2025-07-04', 'YYYY-MM-DD'), 441.1, 'RECEIVED', 'SUP010', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1662', TO_DATE('2025-06-22', 'YYYY-MM-DD'), TO_DATE('2025-06-25', 'YYYY-MM-DD'), TO_DATE('2025-06-26', 'YYYY-MM-DD'), 645.52, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1663', TO_DATE('2025-06-23', 'YYYY-MM-DD'), TO_DATE('2025-06-28', 'YYYY-MM-DD'), TO_DATE('2025-06-30', 'YYYY-MM-DD'), 248.09, 'RECEIVED', 'SUP004', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1664', TO_DATE('2025-06-25', 'YYYY-MM-DD'), TO_DATE('2025-06-28', 'YYYY-MM-DD'), TO_DATE('2025-06-29', 'YYYY-MM-DD'), 107.3, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1665', TO_DATE('2025-06-26', 'YYYY-MM-DD'), TO_DATE('2025-07-04', 'YYYY-MM-DD'), TO_DATE('2025-07-05', 'YYYY-MM-DD'), 277.62, 'RECEIVED', 'SUP010', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1666', TO_DATE('2025-06-26', 'YYYY-MM-DD'), TO_DATE('2025-07-04', 'YYYY-MM-DD'), TO_DATE('2025-07-10', 'YYYY-MM-DD'), 866.66, 'RECEIVED', 'SUP009', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1667', TO_DATE('2025-06-27', 'YYYY-MM-DD'), TO_DATE('2025-06-30', 'YYYY-MM-DD'), TO_DATE('2025-06-28', 'YYYY-MM-DD'), 315.3, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1668', TO_DATE('2025-06-27', 'YYYY-MM-DD'), TO_DATE('2025-06-30', 'YYYY-MM-DD'), TO_DATE('2025-06-30', 'YYYY-MM-DD'), 1787.17, 'RECEIVED', 'SUP002', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1669', TO_DATE('2025-06-29', 'YYYY-MM-DD'), TO_DATE('2025-07-04', 'YYYY-MM-DD'), TO_DATE('2025-07-06', 'YYYY-MM-DD'), 120.53, 'RECEIVED', 'SUP006', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1670', TO_DATE('2025-06-29', 'YYYY-MM-DD'), TO_DATE('2025-07-02', 'YYYY-MM-DD'), TO_DATE('2025-07-03', 'YYYY-MM-DD'), 413.09, 'RECEIVED', 'SUP001', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1671', TO_DATE('2025-06-29', 'YYYY-MM-DD'), TO_DATE('2025-07-02', 'YYYY-MM-DD'), TO_DATE('2025-07-03', 'YYYY-MM-DD'), 8973.49, 'RECEIVED', 'SUP002', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1672', TO_DATE('2025-06-29', 'YYYY-MM-DD'), TO_DATE('2025-07-02', 'YYYY-MM-DD'), TO_DATE('2025-07-03', 'YYYY-MM-DD'), 38.24, 'RECEIVED', 'SUP003', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1673', TO_DATE('2025-06-30', 'YYYY-MM-DD'), TO_DATE('2025-07-08', 'YYYY-MM-DD'), TO_DATE('2025-07-13', 'YYYY-MM-DD'), 334.07, 'RECEIVED', 'SUP009', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1674', TO_DATE('2025-07-01', 'YYYY-MM-DD'), TO_DATE('2025-07-06', 'YYYY-MM-DD'), TO_DATE('2025-07-05', 'YYYY-MM-DD'), 637.8, 'RECEIVED', 'SUP006', 'S0093');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1675', TO_DATE('2025-07-02', 'YYYY-MM-DD'), TO_DATE('2025-07-05', 'YYYY-MM-DD'), TO_DATE('2025-07-04', 'YYYY-MM-DD'), 245.49, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1676', TO_DATE('2025-07-02', 'YYYY-MM-DD'), TO_DATE('2025-07-05', 'YYYY-MM-DD'), TO_DATE('2025-07-05', 'YYYY-MM-DD'), 310.31, 'RECEIVED', 'SUP001', 'S0068');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1677', TO_DATE('2025-07-02', 'YYYY-MM-DD'), TO_DATE('2025-07-10', 'YYYY-MM-DD'), TO_DATE('2025-07-15', 'YYYY-MM-DD'), 461.88, 'RECEIVED', 'SUP009', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1678', TO_DATE('2025-07-02', 'YYYY-MM-DD'), TO_DATE('2025-07-07', 'YYYY-MM-DD'), TO_DATE('2025-07-08', 'YYYY-MM-DD'), 271.29, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1679', TO_DATE('2025-07-02', 'YYYY-MM-DD'), TO_DATE('2025-07-05', 'YYYY-MM-DD'), TO_DATE('2025-07-03', 'YYYY-MM-DD'), 39.1, 'RECEIVED', 'SUP001', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1680', TO_DATE('2025-07-03', 'YYYY-MM-DD'), TO_DATE('2025-07-06', 'YYYY-MM-DD'), NULL, 855.12, 'CANCELLED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1681', TO_DATE('2025-07-03', 'YYYY-MM-DD'), TO_DATE('2025-07-11', 'YYYY-MM-DD'), TO_DATE('2025-07-14', 'YYYY-MM-DD'), 1305.27, 'RECEIVED', 'SUP009', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1682', TO_DATE('2025-07-04', 'YYYY-MM-DD'), TO_DATE('2025-07-09', 'YYYY-MM-DD'), TO_DATE('2025-07-11', 'YYYY-MM-DD'), 973.44, 'RECEIVED', 'SUP005', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1683', TO_DATE('2025-07-05', 'YYYY-MM-DD'), TO_DATE('2025-07-13', 'YYYY-MM-DD'), TO_DATE('2025-07-16', 'YYYY-MM-DD'), 2282.74, 'RECEIVED', 'SUP008', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1684', TO_DATE('2025-07-05', 'YYYY-MM-DD'), TO_DATE('2025-07-10', 'YYYY-MM-DD'), TO_DATE('2025-07-12', 'YYYY-MM-DD'), 2488.23, 'RECEIVED', 'SUP004', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1685', TO_DATE('2025-07-06', 'YYYY-MM-DD'), TO_DATE('2025-07-09', 'YYYY-MM-DD'), TO_DATE('2025-07-07', 'YYYY-MM-DD'), 3197.04, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1686', TO_DATE('2025-07-07', 'YYYY-MM-DD'), TO_DATE('2025-07-10', 'YYYY-MM-DD'), TO_DATE('2025-07-09', 'YYYY-MM-DD'), 29.4, 'RECEIVED', 'SUP001', 'S0092');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1687', TO_DATE('2025-07-12', 'YYYY-MM-DD'), TO_DATE('2025-07-17', 'YYYY-MM-DD'), TO_DATE('2025-07-18', 'YYYY-MM-DD'), 209.33, 'RECEIVED', 'SUP007', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1688', TO_DATE('2025-07-12', 'YYYY-MM-DD'), TO_DATE('2025-07-20', 'YYYY-MM-DD'), TO_DATE('2025-07-25', 'YYYY-MM-DD'), 130.24, 'RECEIVED', 'SUP010', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1689', TO_DATE('2025-07-13', 'YYYY-MM-DD'), TO_DATE('2025-07-18', 'YYYY-MM-DD'), TO_DATE('2025-07-17', 'YYYY-MM-DD'), 56.4, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1690', TO_DATE('2025-07-14', 'YYYY-MM-DD'), TO_DATE('2025-07-17', 'YYYY-MM-DD'), TO_DATE('2025-07-15', 'YYYY-MM-DD'), 1493.62, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1691', TO_DATE('2025-07-16', 'YYYY-MM-DD'), TO_DATE('2025-07-19', 'YYYY-MM-DD'), TO_DATE('2025-07-20', 'YYYY-MM-DD'), 855.12, 'RECEIVED', 'SUP002', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1692', TO_DATE('2025-07-16', 'YYYY-MM-DD'), TO_DATE('2025-07-19', 'YYYY-MM-DD'), TO_DATE('2025-07-17', 'YYYY-MM-DD'), 300.01, 'RECEIVED', 'SUP002', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1693', TO_DATE('2025-07-17', 'YYYY-MM-DD'), TO_DATE('2025-07-22', 'YYYY-MM-DD'), TO_DATE('2025-07-22', 'YYYY-MM-DD'), 96.07, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1694', TO_DATE('2025-07-18', 'YYYY-MM-DD'), TO_DATE('2025-07-26', 'YYYY-MM-DD'), TO_DATE('2025-07-28', 'YYYY-MM-DD'), 621.47, 'RECEIVED', 'SUP009', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1695', TO_DATE('2025-07-19', 'YYYY-MM-DD'), TO_DATE('2025-07-24', 'YYYY-MM-DD'), TO_DATE('2025-07-27', 'YYYY-MM-DD'), 350.44, 'RECEIVED', 'SUP004', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1696', TO_DATE('2025-07-20', 'YYYY-MM-DD'), TO_DATE('2025-07-25', 'YYYY-MM-DD'), TO_DATE('2025-07-24', 'YYYY-MM-DD'), 119.07, 'RECEIVED', 'SUP005', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1697', TO_DATE('2025-07-20', 'YYYY-MM-DD'), TO_DATE('2025-07-23', 'YYYY-MM-DD'), TO_DATE('2025-07-21', 'YYYY-MM-DD'), 29.55, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1698', TO_DATE('2025-07-21', 'YYYY-MM-DD'), TO_DATE('2025-07-26', 'YYYY-MM-DD'), TO_DATE('2025-07-29', 'YYYY-MM-DD'), 477.05, 'RECEIVED', 'SUP007', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1699', TO_DATE('2025-07-23', 'YYYY-MM-DD'), TO_DATE('2025-07-31', 'YYYY-MM-DD'), TO_DATE('2025-08-05', 'YYYY-MM-DD'), 312.6, 'RECEIVED', 'SUP010', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1700', TO_DATE('2025-07-24', 'YYYY-MM-DD'), TO_DATE('2025-07-27', 'YYYY-MM-DD'), TO_DATE('2025-07-28', 'YYYY-MM-DD'), 148.19, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1701', TO_DATE('2025-07-25', 'YYYY-MM-DD'), TO_DATE('2025-08-02', 'YYYY-MM-DD'), TO_DATE('2025-08-05', 'YYYY-MM-DD'), 115.3, 'RECEIVED', 'SUP009', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1702', TO_DATE('2025-07-26', 'YYYY-MM-DD'), TO_DATE('2025-07-31', 'YYYY-MM-DD'), TO_DATE('2025-08-02', 'YYYY-MM-DD'), 2109.98, 'RECEIVED', 'SUP005', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1703', TO_DATE('2025-07-26', 'YYYY-MM-DD'), TO_DATE('2025-07-31', 'YYYY-MM-DD'), TO_DATE('2025-07-31', 'YYYY-MM-DD'), 413.14, 'RECEIVED', 'SUP007', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1704', TO_DATE('2025-07-27', 'YYYY-MM-DD'), TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-02', 'YYYY-MM-DD'), 803.41, 'RECEIVED', 'SUP005', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1705', TO_DATE('2025-07-27', 'YYYY-MM-DD'), TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-03', 'YYYY-MM-DD'), 332.3, 'RECEIVED', 'SUP007', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1706', TO_DATE('2025-07-30', 'YYYY-MM-DD'), TO_DATE('2025-08-02', 'YYYY-MM-DD'), TO_DATE('2025-08-03', 'YYYY-MM-DD'), 205.54, 'RECEIVED', 'SUP002', 'S0090');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1707', TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-06', 'YYYY-MM-DD'), TO_DATE('2025-08-07', 'YYYY-MM-DD'), 457.74, 'RECEIVED', 'SUP004', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1708', TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-04', 'YYYY-MM-DD'), TO_DATE('2025-08-02', 'YYYY-MM-DD'), 174.29, 'RECEIVED', 'SUP002', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1709', TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-06', 'YYYY-MM-DD'), TO_DATE('2025-08-06', 'YYYY-MM-DD'), 508.78, 'RECEIVED', 'SUP004', 'S0091');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1710', TO_DATE('2025-08-03', 'YYYY-MM-DD'), TO_DATE('2025-08-08', 'YYYY-MM-DD'), TO_DATE('2025-08-07', 'YYYY-MM-DD'), 1486.21, 'RECEIVED', 'SUP007', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1711', TO_DATE('2025-08-07', 'YYYY-MM-DD'), TO_DATE('2025-08-10', 'YYYY-MM-DD'), TO_DATE('2025-08-08', 'YYYY-MM-DD'), 102.8, 'RECEIVED', 'SUP001', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1712', TO_DATE('2025-08-07', 'YYYY-MM-DD'), TO_DATE('2025-08-12', 'YYYY-MM-DD'), TO_DATE('2025-08-15', 'YYYY-MM-DD'), 62.56, 'RECEIVED', 'SUP004', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1713', TO_DATE('2025-08-07', 'YYYY-MM-DD'), TO_DATE('2025-08-12', 'YYYY-MM-DD'), TO_DATE('2025-08-14', 'YYYY-MM-DD'), 57.13, 'RECEIVED', 'SUP004', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1714', TO_DATE('2025-08-09', 'YYYY-MM-DD'), TO_DATE('2025-08-14', 'YYYY-MM-DD'), TO_DATE('2025-08-16', 'YYYY-MM-DD'), 300.6, 'RECEIVED', 'SUP005', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1715', TO_DATE('2025-08-10', 'YYYY-MM-DD'), TO_DATE('2025-08-15', 'YYYY-MM-DD'), TO_DATE('2025-08-17', 'YYYY-MM-DD'), 403.25, 'RECEIVED', 'SUP006', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1716', TO_DATE('2025-08-11', 'YYYY-MM-DD'), TO_DATE('2025-08-16', 'YYYY-MM-DD'), TO_DATE('2025-08-19', 'YYYY-MM-DD'), 674.04, 'RECEIVED', 'SUP004', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1717', TO_DATE('2025-08-11', 'YYYY-MM-DD'), TO_DATE('2025-08-19', 'YYYY-MM-DD'), TO_DATE('2025-08-20', 'YYYY-MM-DD'), 252.6, 'RECEIVED', 'SUP009', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1718', TO_DATE('2025-08-11', 'YYYY-MM-DD'), TO_DATE('2025-08-14', 'YYYY-MM-DD'), TO_DATE('2025-08-12', 'YYYY-MM-DD'), 541.34, 'RECEIVED', 'SUP001', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1719', TO_DATE('2025-08-12', 'YYYY-MM-DD'), TO_DATE('2025-08-15', 'YYYY-MM-DD'), TO_DATE('2025-08-15', 'YYYY-MM-DD'), 1313.88, 'RECEIVED', 'SUP001', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1720', TO_DATE('2025-08-14', 'YYYY-MM-DD'), TO_DATE('2025-08-17', 'YYYY-MM-DD'), TO_DATE('2025-08-18', 'YYYY-MM-DD'), 39.1, 'RECEIVED', 'SUP001', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1721', TO_DATE('2025-08-15', 'YYYY-MM-DD'), TO_DATE('2025-08-20', 'YYYY-MM-DD'), TO_DATE('2025-08-21', 'YYYY-MM-DD'), 1013.76, 'RECEIVED', 'SUP004', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1722', TO_DATE('2025-08-19', 'YYYY-MM-DD'), TO_DATE('2025-08-27', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'), 4548.06, 'RECEIVED', 'SUP008', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1723', TO_DATE('2025-08-20', 'YYYY-MM-DD'), TO_DATE('2025-08-23', 'YYYY-MM-DD'), TO_DATE('2025-08-21', 'YYYY-MM-DD'), 601.14, 'RECEIVED', 'SUP003', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1724', TO_DATE('2025-08-20', 'YYYY-MM-DD'), TO_DATE('2025-08-23', 'YYYY-MM-DD'), TO_DATE('2025-08-23', 'YYYY-MM-DD'), 110.35, 'RECEIVED', 'SUP002', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1725', TO_DATE('2025-08-21', 'YYYY-MM-DD'), TO_DATE('2025-08-24', 'YYYY-MM-DD'), TO_DATE('2025-08-23', 'YYYY-MM-DD'), 259.77, 'RECEIVED', 'SUP003', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1726', TO_DATE('2025-08-22', 'YYYY-MM-DD'), TO_DATE('2025-08-27', 'YYYY-MM-DD'), TO_DATE('2025-08-30', 'YYYY-MM-DD'), 526.51, 'RECEIVED', 'SUP007', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1727', TO_DATE('2025-08-22', 'YYYY-MM-DD'), TO_DATE('2025-08-27', 'YYYY-MM-DD'), TO_DATE('2025-08-30', 'YYYY-MM-DD'), 599.84, 'RECEIVED', 'SUP007', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1728', TO_DATE('2025-08-23', 'YYYY-MM-DD'), TO_DATE('2025-08-28', 'YYYY-MM-DD'), TO_DATE('2025-08-30', 'YYYY-MM-DD'), 658.23, 'RECEIVED', 'SUP004', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1729', TO_DATE('2025-08-24', 'YYYY-MM-DD'), TO_DATE('2025-08-29', 'YYYY-MM-DD'), TO_DATE('2025-08-30', 'YYYY-MM-DD'), 650.55, 'RECEIVED', 'SUP005', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1730', TO_DATE('2025-08-25', 'YYYY-MM-DD'), TO_DATE('2025-08-30', 'YYYY-MM-DD'), TO_DATE('2025-08-30', 'YYYY-MM-DD'), 334.84, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1731', TO_DATE('2025-08-25', 'YYYY-MM-DD'), TO_DATE('2025-08-30', 'YYYY-MM-DD'), TO_DATE('2025-08-31', 'YYYY-MM-DD'), 440.55, 'RECEIVED', 'SUP004', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1732', TO_DATE('2025-08-25', 'YYYY-MM-DD'), TO_DATE('2025-08-30', 'YYYY-MM-DD'), TO_DATE('2025-09-02', 'YYYY-MM-DD'), 1093.03, 'RECEIVED', 'SUP004', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1733', TO_DATE('2025-08-26', 'YYYY-MM-DD'), TO_DATE('2025-08-29', 'YYYY-MM-DD'), TO_DATE('2025-08-27', 'YYYY-MM-DD'), 77.8, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1734', TO_DATE('2025-08-26', 'YYYY-MM-DD'), TO_DATE('2025-08-29', 'YYYY-MM-DD'), TO_DATE('2025-08-29', 'YYYY-MM-DD'), 38.48, 'RECEIVED', 'SUP003', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1735', TO_DATE('2025-08-28', 'YYYY-MM-DD'), TO_DATE('2025-09-05', 'YYYY-MM-DD'), TO_DATE('2025-09-11', 'YYYY-MM-DD'), 167.2, 'RECEIVED', 'SUP009', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1736', TO_DATE('2025-08-28', 'YYYY-MM-DD'), TO_DATE('2025-09-02', 'YYYY-MM-DD'), NULL, 104.84, 'CANCELLED', 'SUP006', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1737', TO_DATE('2025-08-28', 'YYYY-MM-DD'), TO_DATE('2025-08-31', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'), 261.68, 'RECEIVED', 'SUP003', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1738', TO_DATE('2025-08-28', 'YYYY-MM-DD'), TO_DATE('2025-09-02', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'), 391.12, 'RECEIVED', 'SUP005', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1739', TO_DATE('2025-08-28', 'YYYY-MM-DD'), TO_DATE('2025-09-05', 'YYYY-MM-DD'), TO_DATE('2025-09-06', 'YYYY-MM-DD'), 2150.8, 'RECEIVED', 'SUP009', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1740', TO_DATE('2025-08-29', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'), 4605.89, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1741', TO_DATE('2025-08-29', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'), 364.22, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1742', TO_DATE('2025-08-30', 'YYYY-MM-DD'), TO_DATE('2025-09-02', 'YYYY-MM-DD'), TO_DATE('2025-08-31', 'YYYY-MM-DD'), 61.0, 'RECEIVED', 'SUP003', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1743', TO_DATE('2025-09-02', 'YYYY-MM-DD'), TO_DATE('2025-09-10', 'YYYY-MM-DD'), TO_DATE('2025-09-16', 'YYYY-MM-DD'), 42.7, 'RECEIVED', 'SUP010', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1744', TO_DATE('2025-09-03', 'YYYY-MM-DD'), TO_DATE('2025-09-11', 'YYYY-MM-DD'), TO_DATE('2025-09-14', 'YYYY-MM-DD'), 98.26, 'RECEIVED', 'SUP008', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1745', TO_DATE('2025-09-03', 'YYYY-MM-DD'), TO_DATE('2025-09-06', 'YYYY-MM-DD'), TO_DATE('2025-09-06', 'YYYY-MM-DD'), 147.46, 'RECEIVED', 'SUP001', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1746', TO_DATE('2025-09-04', 'YYYY-MM-DD'), TO_DATE('2025-09-09', 'YYYY-MM-DD'), TO_DATE('2025-09-09', 'YYYY-MM-DD'), 96.0, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1747', TO_DATE('2025-09-05', 'YYYY-MM-DD'), TO_DATE('2025-09-08', 'YYYY-MM-DD'), TO_DATE('2025-09-09', 'YYYY-MM-DD'), 801.79, 'RECEIVED', 'SUP003', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1748', TO_DATE('2025-09-06', 'YYYY-MM-DD'), TO_DATE('2025-09-09', 'YYYY-MM-DD'), TO_DATE('2025-09-07', 'YYYY-MM-DD'), 622.36, 'RECEIVED', 'SUP002', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1749', TO_DATE('2025-09-06', 'YYYY-MM-DD'), TO_DATE('2025-09-11', 'YYYY-MM-DD'), TO_DATE('2025-09-11', 'YYYY-MM-DD'), 4091.78, 'RECEIVED', 'SUP007', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1750', TO_DATE('2025-09-09', 'YYYY-MM-DD'), TO_DATE('2025-09-17', 'YYYY-MM-DD'), TO_DATE('2025-09-19', 'YYYY-MM-DD'), 715.46, 'RECEIVED', 'SUP008', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1751', TO_DATE('2025-09-09', 'YYYY-MM-DD'), TO_DATE('2025-09-12', 'YYYY-MM-DD'), NULL, 119.21, 'CANCELLED', 'SUP002', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1752', TO_DATE('2025-09-09', 'YYYY-MM-DD'), TO_DATE('2025-09-17', 'YYYY-MM-DD'), TO_DATE('2025-09-19', 'YYYY-MM-DD'), 21.45, 'RECEIVED', 'SUP008', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1753', TO_DATE('2025-09-10', 'YYYY-MM-DD'), TO_DATE('2025-09-15', 'YYYY-MM-DD'), TO_DATE('2025-09-14', 'YYYY-MM-DD'), 2062.38, 'RECEIVED', 'SUP005', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1754', TO_DATE('2025-09-10', 'YYYY-MM-DD'), TO_DATE('2025-09-15', 'YYYY-MM-DD'), TO_DATE('2025-09-14', 'YYYY-MM-DD'), 81.2, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1755', TO_DATE('2025-09-10', 'YYYY-MM-DD'), TO_DATE('2025-09-15', 'YYYY-MM-DD'), TO_DATE('2025-09-14', 'YYYY-MM-DD'), 182.6, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1756', TO_DATE('2025-09-12', 'YYYY-MM-DD'), TO_DATE('2025-09-15', 'YYYY-MM-DD'), TO_DATE('2025-09-13', 'YYYY-MM-DD'), 82.92, 'RECEIVED', 'SUP002', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1757', TO_DATE('2025-09-12', 'YYYY-MM-DD'), TO_DATE('2025-09-17', 'YYYY-MM-DD'), TO_DATE('2025-09-18', 'YYYY-MM-DD'), 328.86, 'RECEIVED', 'SUP006', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1758', TO_DATE('2025-09-13', 'YYYY-MM-DD'), TO_DATE('2025-09-21', 'YYYY-MM-DD'), TO_DATE('2025-09-26', 'YYYY-MM-DD'), 96.84, 'RECEIVED', 'SUP009', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1759', TO_DATE('2025-09-15', 'YYYY-MM-DD'), TO_DATE('2025-09-20', 'YYYY-MM-DD'), TO_DATE('2025-09-19', 'YYYY-MM-DD'), 869.79, 'RECEIVED', 'SUP005', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1760', TO_DATE('2025-09-16', 'YYYY-MM-DD'), TO_DATE('2025-09-21', 'YYYY-MM-DD'), TO_DATE('2025-09-20', 'YYYY-MM-DD'), 55.77, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1761', TO_DATE('2025-09-17', 'YYYY-MM-DD'), TO_DATE('2025-09-25', 'YYYY-MM-DD'), TO_DATE('2025-09-30', 'YYYY-MM-DD'), 742.11, 'RECEIVED', 'SUP009', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1762', TO_DATE('2025-09-17', 'YYYY-MM-DD'), TO_DATE('2025-09-20', 'YYYY-MM-DD'), TO_DATE('2025-09-19', 'YYYY-MM-DD'), 351.55, 'RECEIVED', 'SUP002', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1763', TO_DATE('2025-09-17', 'YYYY-MM-DD'), TO_DATE('2025-09-22', 'YYYY-MM-DD'), TO_DATE('2025-09-21', 'YYYY-MM-DD'), 26.64, 'RECEIVED', 'SUP006', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1764', TO_DATE('2025-09-21', 'YYYY-MM-DD'), TO_DATE('2025-09-29', 'YYYY-MM-DD'), TO_DATE('2025-09-30', 'YYYY-MM-DD'), 201.39, 'RECEIVED', 'SUP008', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1765', TO_DATE('2025-09-22', 'YYYY-MM-DD'), TO_DATE('2025-09-25', 'YYYY-MM-DD'), TO_DATE('2025-09-24', 'YYYY-MM-DD'), 146.84, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1766', TO_DATE('2025-09-26', 'YYYY-MM-DD'), TO_DATE('2025-10-01', 'YYYY-MM-DD'), TO_DATE('2025-10-01', 'YYYY-MM-DD'), 394.34, 'RECEIVED', 'SUP006', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1767', TO_DATE('2025-09-26', 'YYYY-MM-DD'), TO_DATE('2025-10-04', 'YYYY-MM-DD'), TO_DATE('2025-10-08', 'YYYY-MM-DD'), 1215.96, 'RECEIVED', 'SUP009', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1768', TO_DATE('2025-09-27', 'YYYY-MM-DD'), TO_DATE('2025-10-05', 'YYYY-MM-DD'), TO_DATE('2025-10-11', 'YYYY-MM-DD'), 158.46, 'RECEIVED', 'SUP008', 'S0085');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1769', TO_DATE('2025-09-29', 'YYYY-MM-DD'), TO_DATE('2025-10-02', 'YYYY-MM-DD'), TO_DATE('2025-10-01', 'YYYY-MM-DD'), 1933.92, 'RECEIVED', 'SUP001', 'S0021');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1770', TO_DATE('2025-10-01', 'YYYY-MM-DD'), TO_DATE('2025-10-04', 'YYYY-MM-DD'), TO_DATE('2025-10-05', 'YYYY-MM-DD'), 561.79, 'RECEIVED', 'SUP001', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1771', TO_DATE('2025-10-02', 'YYYY-MM-DD'), TO_DATE('2025-10-05', 'YYYY-MM-DD'), TO_DATE('2025-10-06', 'YYYY-MM-DD'), 182.46, 'RECEIVED', 'SUP001', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1772', TO_DATE('2025-10-02', 'YYYY-MM-DD'), TO_DATE('2025-10-07', 'YYYY-MM-DD'), TO_DATE('2025-10-09', 'YYYY-MM-DD'), 477.4, 'RECEIVED', 'SUP004', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1773', TO_DATE('2025-10-02', 'YYYY-MM-DD'), TO_DATE('2025-10-07', 'YYYY-MM-DD'), TO_DATE('2025-10-08', 'YYYY-MM-DD'), 52.03, 'RECEIVED', 'SUP005', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1774', TO_DATE('2025-10-03', 'YYYY-MM-DD'), TO_DATE('2025-10-06', 'YYYY-MM-DD'), TO_DATE('2025-10-07', 'YYYY-MM-DD'), 826.3, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1775', TO_DATE('2025-10-04', 'YYYY-MM-DD'), TO_DATE('2025-10-09', 'YYYY-MM-DD'), TO_DATE('2025-10-09', 'YYYY-MM-DD'), 200.02, 'RECEIVED', 'SUP007', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1776', TO_DATE('2025-10-07', 'YYYY-MM-DD'), TO_DATE('2025-10-12', 'YYYY-MM-DD'), TO_DATE('2025-10-12', 'YYYY-MM-DD'), 1366.31, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1777', TO_DATE('2025-10-08', 'YYYY-MM-DD'), TO_DATE('2025-10-11', 'YYYY-MM-DD'), TO_DATE('2025-10-12', 'YYYY-MM-DD'), 658.88, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1778', TO_DATE('2025-10-09', 'YYYY-MM-DD'), TO_DATE('2025-10-14', 'YYYY-MM-DD'), TO_DATE('2025-10-14', 'YYYY-MM-DD'), 80.77, 'RECEIVED', 'SUP006', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1779', TO_DATE('2025-10-11', 'YYYY-MM-DD'), TO_DATE('2025-10-14', 'YYYY-MM-DD'), TO_DATE('2025-10-13', 'YYYY-MM-DD'), 531.2, 'RECEIVED', 'SUP002', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1780', TO_DATE('2025-10-11', 'YYYY-MM-DD'), TO_DATE('2025-10-14', 'YYYY-MM-DD'), TO_DATE('2025-10-12', 'YYYY-MM-DD'), 273.43, 'RECEIVED', 'SUP002', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1781', TO_DATE('2025-10-12', 'YYYY-MM-DD'), TO_DATE('2025-10-17', 'YYYY-MM-DD'), TO_DATE('2025-10-19', 'YYYY-MM-DD'), 1447.7, 'RECEIVED', 'SUP007', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1782', TO_DATE('2025-10-13', 'YYYY-MM-DD'), TO_DATE('2025-10-21', 'YYYY-MM-DD'), TO_DATE('2025-10-25', 'YYYY-MM-DD'), 715.42, 'RECEIVED', 'SUP008', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1783', TO_DATE('2025-10-14', 'YYYY-MM-DD'), TO_DATE('2025-10-17', 'YYYY-MM-DD'), NULL, 180.7, 'CANCELLED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1784', TO_DATE('2025-10-14', 'YYYY-MM-DD'), TO_DATE('2025-10-19', 'YYYY-MM-DD'), TO_DATE('2025-10-21', 'YYYY-MM-DD'), 552.48, 'RECEIVED', 'SUP006', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1785', TO_DATE('2025-10-15', 'YYYY-MM-DD'), TO_DATE('2025-10-20', 'YYYY-MM-DD'), TO_DATE('2025-10-23', 'YYYY-MM-DD'), 1049.06, 'RECEIVED', 'SUP007', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1786', TO_DATE('2025-10-16', 'YYYY-MM-DD'), TO_DATE('2025-10-19', 'YYYY-MM-DD'), TO_DATE('2025-10-20', 'YYYY-MM-DD'), 242.94, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1787', TO_DATE('2025-10-16', 'YYYY-MM-DD'), TO_DATE('2025-10-19', 'YYYY-MM-DD'), TO_DATE('2025-10-19', 'YYYY-MM-DD'), 154.77, 'RECEIVED', 'SUP002', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1788', TO_DATE('2025-10-17', 'YYYY-MM-DD'), TO_DATE('2025-10-20', 'YYYY-MM-DD'), TO_DATE('2025-10-18', 'YYYY-MM-DD'), 3605.25, 'RECEIVED', 'SUP003', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1789', TO_DATE('2025-10-17', 'YYYY-MM-DD'), TO_DATE('2025-10-20', 'YYYY-MM-DD'), TO_DATE('2025-10-19', 'YYYY-MM-DD'), 106.52, 'RECEIVED', 'SUP003', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1790', TO_DATE('2025-10-18', 'YYYY-MM-DD'), TO_DATE('2025-10-26', 'YYYY-MM-DD'), TO_DATE('2025-10-31', 'YYYY-MM-DD'), 435.0, 'RECEIVED', 'SUP010', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1791', TO_DATE('2025-10-19', 'YYYY-MM-DD'), TO_DATE('2025-10-22', 'YYYY-MM-DD'), TO_DATE('2025-10-20', 'YYYY-MM-DD'), 128.05, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1792', TO_DATE('2025-10-19', 'YYYY-MM-DD'), TO_DATE('2025-10-24', 'YYYY-MM-DD'), TO_DATE('2025-10-25', 'YYYY-MM-DD'), 232.06, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1793', TO_DATE('2025-10-19', 'YYYY-MM-DD'), TO_DATE('2025-10-24', 'YYYY-MM-DD'), TO_DATE('2025-10-23', 'YYYY-MM-DD'), 91.9, 'RECEIVED', 'SUP007', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1794', TO_DATE('2025-10-22', 'YYYY-MM-DD'), TO_DATE('2025-10-27', 'YYYY-MM-DD'), TO_DATE('2025-10-28', 'YYYY-MM-DD'), 873.18, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1795', TO_DATE('2025-10-23', 'YYYY-MM-DD'), TO_DATE('2025-10-26', 'YYYY-MM-DD'), TO_DATE('2025-10-26', 'YYYY-MM-DD'), 183.64, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1796', TO_DATE('2025-10-26', 'YYYY-MM-DD'), TO_DATE('2025-10-29', 'YYYY-MM-DD'), TO_DATE('2025-10-29', 'YYYY-MM-DD'), 194.08, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1797', TO_DATE('2025-10-26', 'YYYY-MM-DD'), TO_DATE('2025-10-29', 'YYYY-MM-DD'), TO_DATE('2025-10-27', 'YYYY-MM-DD'), 504.69, 'RECEIVED', 'SUP001', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1798', TO_DATE('2025-10-28', 'YYYY-MM-DD'), TO_DATE('2025-11-02', 'YYYY-MM-DD'), TO_DATE('2025-11-05', 'YYYY-MM-DD'), 1055.28, 'RECEIVED', 'SUP007', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1799', TO_DATE('2025-10-29', 'YYYY-MM-DD'), TO_DATE('2025-11-03', 'YYYY-MM-DD'), TO_DATE('2025-11-03', 'YYYY-MM-DD'), 480.09, 'RECEIVED', 'SUP007', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1800', TO_DATE('2025-10-30', 'YYYY-MM-DD'), TO_DATE('2025-11-04', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), 431.69, 'RECEIVED', 'SUP007', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1801', TO_DATE('2025-10-30', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), TO_DATE('2025-11-12', 'YYYY-MM-DD'), 694.47, 'RECEIVED', 'SUP011', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1802', TO_DATE('2025-11-01', 'YYYY-MM-DD'), TO_DATE('2025-11-04', 'YYYY-MM-DD'), TO_DATE('2025-11-02', 'YYYY-MM-DD'), 892.96, 'RECEIVED', 'SUP001', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1803', TO_DATE('2025-11-02', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), TO_DATE('2025-11-06', 'YYYY-MM-DD'), 184.76, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1804', TO_DATE('2025-11-02', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), TO_DATE('2025-11-09', 'YYYY-MM-DD'), 179.84, 'RECEIVED', 'SUP006', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1805', TO_DATE('2025-11-02', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), 421.58, 'RECEIVED', 'SUP006', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1806', TO_DATE('2025-11-02', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), 119.81, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1807', TO_DATE('2025-11-03', 'YYYY-MM-DD'), TO_DATE('2025-11-06', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), 720.49, 'RECEIVED', 'SUP002', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1808', TO_DATE('2025-11-03', 'YYYY-MM-DD'), TO_DATE('2025-11-06', 'YYYY-MM-DD'), NULL, 917.1, 'CANCELLED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1809', TO_DATE('2025-11-03', 'YYYY-MM-DD'), TO_DATE('2025-11-06', 'YYYY-MM-DD'), TO_DATE('2025-11-05', 'YYYY-MM-DD'), 1085.08, 'RECEIVED', 'SUP001', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1810', TO_DATE('2025-11-03', 'YYYY-MM-DD'), TO_DATE('2025-11-08', 'YYYY-MM-DD'), TO_DATE('2025-11-10', 'YYYY-MM-DD'), 208.71, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1811', TO_DATE('2025-11-04', 'YYYY-MM-DD'), TO_DATE('2025-11-12', 'YYYY-MM-DD'), TO_DATE('2025-11-15', 'YYYY-MM-DD'), 846.2, 'RECEIVED', 'SUP010', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1812', TO_DATE('2025-11-05', 'YYYY-MM-DD'), TO_DATE('2025-11-08', 'YYYY-MM-DD'), TO_DATE('2025-11-08', 'YYYY-MM-DD'), 73.79, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1813', TO_DATE('2025-11-05', 'YYYY-MM-DD'), TO_DATE('2025-11-08', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), 555.53, 'RECEIVED', 'SUP001', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1814', TO_DATE('2025-11-05', 'YYYY-MM-DD'), TO_DATE('2025-11-10', 'YYYY-MM-DD'), TO_DATE('2025-11-13', 'YYYY-MM-DD'), 870.52, 'RECEIVED', 'SUP005', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1815', TO_DATE('2025-11-05', 'YYYY-MM-DD'), TO_DATE('2025-11-08', 'YYYY-MM-DD'), TO_DATE('2025-11-07', 'YYYY-MM-DD'), 53.68, 'RECEIVED', 'SUP003', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1816', TO_DATE('2025-11-06', 'YYYY-MM-DD'), TO_DATE('2025-11-14', 'YYYY-MM-DD'), TO_DATE('2025-11-20', 'YYYY-MM-DD'), 234.15, 'RECEIVED', 'SUP009', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1817', TO_DATE('2025-11-06', 'YYYY-MM-DD'), TO_DATE('2025-11-09', 'YYYY-MM-DD'), TO_DATE('2025-11-08', 'YYYY-MM-DD'), 785.17, 'RECEIVED', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1818', TO_DATE('2025-11-06', 'YYYY-MM-DD'), TO_DATE('2025-11-14', 'YYYY-MM-DD'), TO_DATE('2025-11-19', 'YYYY-MM-DD'), 1186.74, 'RECEIVED', 'SUP010', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1819', TO_DATE('2025-11-06', 'YYYY-MM-DD'), TO_DATE('2025-11-11', 'YYYY-MM-DD'), TO_DATE('2025-11-13', 'YYYY-MM-DD'), 391.4, 'RECEIVED', 'SUP007', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1820', TO_DATE('2025-11-07', 'YYYY-MM-DD'), TO_DATE('2025-11-12', 'YYYY-MM-DD'), TO_DATE('2025-11-13', 'YYYY-MM-DD'), 373.7, 'RECEIVED', 'SUP005', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1821', TO_DATE('2025-11-08', 'YYYY-MM-DD'), TO_DATE('2025-11-16', 'YYYY-MM-DD'), TO_DATE('2025-11-17', 'YYYY-MM-DD'), 350.74, 'RECEIVED', 'SUP010', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1822', TO_DATE('2025-11-08', 'YYYY-MM-DD'), TO_DATE('2025-11-13', 'YYYY-MM-DD'), NULL, 62.56, 'CANCELLED', 'SUP004', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1823', TO_DATE('2025-11-10', 'YYYY-MM-DD'), TO_DATE('2025-11-18', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), 211.65, 'RECEIVED', 'SUP009', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1824', TO_DATE('2025-11-10', 'YYYY-MM-DD'), TO_DATE('2025-11-18', 'YYYY-MM-DD'), TO_DATE('2025-11-22', 'YYYY-MM-DD'), 1632.44, 'RECEIVED', 'SUP009', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1825', TO_DATE('2025-11-11', 'YYYY-MM-DD'), TO_DATE('2025-11-14', 'YYYY-MM-DD'), TO_DATE('2025-11-13', 'YYYY-MM-DD'), 901.28, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1826', TO_DATE('2025-11-12', 'YYYY-MM-DD'), TO_DATE('2025-11-17', 'YYYY-MM-DD'), TO_DATE('2025-11-17', 'YYYY-MM-DD'), 160.36, 'RECEIVED', 'SUP007', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1827', TO_DATE('2025-11-12', 'YYYY-MM-DD'), TO_DATE('2025-11-15', 'YYYY-MM-DD'), TO_DATE('2025-11-13', 'YYYY-MM-DD'), 299.85, 'RECEIVED', 'SUP002', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1828', TO_DATE('2025-11-12', 'YYYY-MM-DD'), TO_DATE('2025-11-17', 'YYYY-MM-DD'), TO_DATE('2025-11-18', 'YYYY-MM-DD'), 27.58, 'RECEIVED', 'SUP006', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1829', TO_DATE('2025-11-13', 'YYYY-MM-DD'), TO_DATE('2025-11-21', 'YYYY-MM-DD'), TO_DATE('2025-11-26', 'YYYY-MM-DD'), 496.27, 'RECEIVED', 'SUP011', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1830', TO_DATE('2025-11-14', 'YYYY-MM-DD'), TO_DATE('2025-11-19', 'YYYY-MM-DD'), TO_DATE('2025-11-19', 'YYYY-MM-DD'), 208.61, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1831', TO_DATE('2025-11-15', 'YYYY-MM-DD'), TO_DATE('2025-11-18', 'YYYY-MM-DD'), TO_DATE('2025-11-18', 'YYYY-MM-DD'), 948.41, 'RECEIVED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1832', TO_DATE('2025-11-15', 'YYYY-MM-DD'), TO_DATE('2025-11-20', 'YYYY-MM-DD'), TO_DATE('2025-11-22', 'YYYY-MM-DD'), 275.37, 'RECEIVED', 'SUP005', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1833', TO_DATE('2025-11-15', 'YYYY-MM-DD'), TO_DATE('2025-11-18', 'YYYY-MM-DD'), TO_DATE('2025-11-17', 'YYYY-MM-DD'), 893.38, 'RECEIVED', 'SUP003', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1834', TO_DATE('2025-11-15', 'YYYY-MM-DD'), TO_DATE('2025-11-23', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), 382.08, 'RECEIVED', 'SUP008', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1835', TO_DATE('2025-11-16', 'YYYY-MM-DD'), TO_DATE('2025-11-21', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), 162.58, 'RECEIVED', 'SUP006', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1836', TO_DATE('2025-11-16', 'YYYY-MM-DD'), TO_DATE('2025-11-21', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), 458.28, 'RECEIVED', 'SUP007', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1837', TO_DATE('2025-11-17', 'YYYY-MM-DD'), TO_DATE('2025-11-22', 'YYYY-MM-DD'), TO_DATE('2025-11-23', 'YYYY-MM-DD'), 495.26, 'RECEIVED', 'SUP005', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1838', TO_DATE('2025-11-18', 'YYYY-MM-DD'), TO_DATE('2025-11-23', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), 378.45, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1839', TO_DATE('2025-11-19', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), 279.92, 'RECEIVED', 'SUP006', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1840', TO_DATE('2025-11-20', 'YYYY-MM-DD'), TO_DATE('2025-11-23', 'YYYY-MM-DD'), TO_DATE('2025-11-22', 'YYYY-MM-DD'), 449.32, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1841', TO_DATE('2025-11-21', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), TO_DATE('2025-11-23', 'YYYY-MM-DD'), 97.3, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1842', TO_DATE('2025-11-21', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), TO_DATE('2025-11-23', 'YYYY-MM-DD'), 1925.65, 'RECEIVED', 'SUP002', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1843', TO_DATE('2025-11-21', 'YYYY-MM-DD'), TO_DATE('2025-11-26', 'YYYY-MM-DD'), TO_DATE('2025-11-26', 'YYYY-MM-DD'), 55.77, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1844', TO_DATE('2025-11-22', 'YYYY-MM-DD'), TO_DATE('2025-11-27', 'YYYY-MM-DD'), TO_DATE('2025-11-26', 'YYYY-MM-DD'), 4787.59, 'RECEIVED', 'SUP007', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1845', TO_DATE('2025-11-22', 'YYYY-MM-DD'), TO_DATE('2025-11-30', 'YYYY-MM-DD'), TO_DATE('2025-12-05', 'YYYY-MM-DD'), 156.0, 'RECEIVED', 'SUP008', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1846', TO_DATE('2025-11-24', 'YYYY-MM-DD'), TO_DATE('2025-12-02', 'YYYY-MM-DD'), TO_DATE('2025-12-08', 'YYYY-MM-DD'), 153.4, 'RECEIVED', 'SUP009', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1847', TO_DATE('2025-11-24', 'YYYY-MM-DD'), TO_DATE('2025-11-27', 'YYYY-MM-DD'), TO_DATE('2025-11-28', 'YYYY-MM-DD'), 196.98, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1848', TO_DATE('2025-11-24', 'YYYY-MM-DD'), TO_DATE('2025-11-27', 'YYYY-MM-DD'), TO_DATE('2025-11-26', 'YYYY-MM-DD'), 182.7, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1849', TO_DATE('2025-11-26', 'YYYY-MM-DD'), TO_DATE('2025-12-01', 'YYYY-MM-DD'), TO_DATE('2025-12-03', 'YYYY-MM-DD'), 383.74, 'RECEIVED', 'SUP004', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1850', TO_DATE('2025-11-26', 'YYYY-MM-DD'), TO_DATE('2025-12-01', 'YYYY-MM-DD'), TO_DATE('2025-12-04', 'YYYY-MM-DD'), 223.35, 'RECEIVED', 'SUP006', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1851', TO_DATE('2025-11-28', 'YYYY-MM-DD'), TO_DATE('2025-12-03', 'YYYY-MM-DD'), TO_DATE('2025-12-06', 'YYYY-MM-DD'), 239.4, 'RECEIVED', 'SUP006', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1852', TO_DATE('2025-11-28', 'YYYY-MM-DD'), TO_DATE('2025-12-03', 'YYYY-MM-DD'), TO_DATE('2025-12-04', 'YYYY-MM-DD'), 131.26, 'RECEIVED', 'SUP005', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1853', TO_DATE('2025-11-28', 'YYYY-MM-DD'), TO_DATE('2025-12-01', 'YYYY-MM-DD'), TO_DATE('2025-11-30', 'YYYY-MM-DD'), 2378.35, 'RECEIVED', 'SUP002', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1854', TO_DATE('2025-12-01', 'YYYY-MM-DD'), TO_DATE('2025-12-06', 'YYYY-MM-DD'), TO_DATE('2025-12-08', 'YYYY-MM-DD'), 277.82, 'RECEIVED', 'SUP006', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1855', TO_DATE('2025-12-02', 'YYYY-MM-DD'), TO_DATE('2025-12-05', 'YYYY-MM-DD'), TO_DATE('2025-12-04', 'YYYY-MM-DD'), 214.1, 'RECEIVED', 'SUP003', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1856', TO_DATE('2025-12-02', 'YYYY-MM-DD'), TO_DATE('2025-12-05', 'YYYY-MM-DD'), TO_DATE('2025-12-03', 'YYYY-MM-DD'), 429.12, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1857', TO_DATE('2025-12-03', 'YYYY-MM-DD'), TO_DATE('2025-12-08', 'YYYY-MM-DD'), TO_DATE('2025-12-07', 'YYYY-MM-DD'), 308.63, 'RECEIVED', 'SUP005', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1858', TO_DATE('2025-12-03', 'YYYY-MM-DD'), TO_DATE('2025-12-06', 'YYYY-MM-DD'), TO_DATE('2025-12-05', 'YYYY-MM-DD'), 197.44, 'RECEIVED', 'SUP003', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1859', TO_DATE('2025-12-03', 'YYYY-MM-DD'), TO_DATE('2025-12-11', 'YYYY-MM-DD'), TO_DATE('2025-12-12', 'YYYY-MM-DD'), 1041.06, 'RECEIVED', 'SUP010', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1860', TO_DATE('2025-12-04', 'YYYY-MM-DD'), TO_DATE('2025-12-09', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), 133.23, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1861', TO_DATE('2025-12-05', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), 380.42, 'RECEIVED', 'SUP007', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1862', TO_DATE('2025-12-05', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-13', 'YYYY-MM-DD'), 444.98, 'RECEIVED', 'SUP006', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1863', TO_DATE('2025-12-05', 'YYYY-MM-DD'), TO_DATE('2025-12-13', 'YYYY-MM-DD'), TO_DATE('2025-12-15', 'YYYY-MM-DD'), 219.12, 'RECEIVED', 'SUP009', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1864', TO_DATE('2025-12-06', 'YYYY-MM-DD'), TO_DATE('2025-12-11', 'YYYY-MM-DD'), TO_DATE('2025-12-14', 'YYYY-MM-DD'), 471.19, 'RECEIVED', 'SUP005', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1865', TO_DATE('2025-12-06', 'YYYY-MM-DD'), TO_DATE('2025-12-09', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), 1973.75, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1866', TO_DATE('2025-12-07', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-08', 'YYYY-MM-DD'), 1294.03, 'RECEIVED', 'SUP003', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1867', TO_DATE('2025-12-07', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), NULL, 1286.8, 'CANCELLED', 'SUP001', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1868', TO_DATE('2025-12-07', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-11', 'YYYY-MM-DD'), 938.62, 'RECEIVED', 'SUP003', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1869', TO_DATE('2025-12-07', 'YYYY-MM-DD'), TO_DATE('2025-12-15', 'YYYY-MM-DD'), TO_DATE('2025-12-19', 'YYYY-MM-DD'), 2304.32, 'RECEIVED', 'SUP010', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1870', TO_DATE('2025-12-09', 'YYYY-MM-DD'), TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-14', 'YYYY-MM-DD'), 1000.43, 'RECEIVED', 'SUP007', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1871', TO_DATE('2025-12-09', 'YYYY-MM-DD'), TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-15', 'YYYY-MM-DD'), 270.08, 'RECEIVED', 'SUP006', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1872', TO_DATE('2025-12-09', 'YYYY-MM-DD'), TO_DATE('2025-12-12', 'YYYY-MM-DD'), TO_DATE('2025-12-11', 'YYYY-MM-DD'), 2942.67, 'RECEIVED', 'SUP002', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1873', TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-13', 'YYYY-MM-DD'), TO_DATE('2025-12-11', 'YYYY-MM-DD'), 303.05, 'RECEIVED', 'SUP002', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1874', TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-15', 'YYYY-MM-DD'), TO_DATE('2025-12-15', 'YYYY-MM-DD'), 1471.0, 'RECEIVED', 'SUP004', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1875', TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-13', 'YYYY-MM-DD'), TO_DATE('2025-12-13', 'YYYY-MM-DD'), 66.98, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1876', TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-13', 'YYYY-MM-DD'), TO_DATE('2025-12-12', 'YYYY-MM-DD'), 24.4, 'RECEIVED', 'SUP003', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1877', TO_DATE('2025-12-11', 'YYYY-MM-DD'), TO_DATE('2025-12-19', 'YYYY-MM-DD'), TO_DATE('2025-12-22', 'YYYY-MM-DD'), 286.65, 'RECEIVED', 'SUP010', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1878', TO_DATE('2025-12-11', 'YYYY-MM-DD'), TO_DATE('2025-12-16', 'YYYY-MM-DD'), TO_DATE('2025-12-15', 'YYYY-MM-DD'), 2633.4, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1879', TO_DATE('2025-12-11', 'YYYY-MM-DD'), TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-12', 'YYYY-MM-DD'), 1150.33, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1880', TO_DATE('2025-12-11', 'YYYY-MM-DD'), TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-12', 'YYYY-MM-DD'), 75.08, 'RECEIVED', 'SUP003', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1881', TO_DATE('2025-12-11', 'YYYY-MM-DD'), TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-13', 'YYYY-MM-DD'), 262.42, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1882', TO_DATE('2025-12-12', 'YYYY-MM-DD'), TO_DATE('2025-12-15', 'YYYY-MM-DD'), TO_DATE('2025-12-15', 'YYYY-MM-DD'), 1162.95, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1883', TO_DATE('2025-12-12', 'YYYY-MM-DD'), TO_DATE('2025-12-20', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), 231.97, 'RECEIVED', 'SUP008', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1884', TO_DATE('2025-12-13', 'YYYY-MM-DD'), TO_DATE('2025-12-16', 'YYYY-MM-DD'), TO_DATE('2025-12-16', 'YYYY-MM-DD'), 753.8, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1885', TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-19', 'YYYY-MM-DD'), TO_DATE('2025-12-18', 'YYYY-MM-DD'), 492.97, 'RECEIVED', 'SUP006', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1886', TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-19', 'YYYY-MM-DD'), TO_DATE('2025-12-19', 'YYYY-MM-DD'), 141.52, 'RECEIVED', 'SUP007', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1887', TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-22', 'YYYY-MM-DD'), TO_DATE('2025-12-24', 'YYYY-MM-DD'), 123.61, 'RECEIVED', 'SUP009', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1888', TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-19', 'YYYY-MM-DD'), TO_DATE('2025-12-19', 'YYYY-MM-DD'), 117.44, 'RECEIVED', 'SUP004', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1889', TO_DATE('2025-12-14', 'YYYY-MM-DD'), TO_DATE('2025-12-19', 'YYYY-MM-DD'), TO_DATE('2025-12-22', 'YYYY-MM-DD'), 81.2, 'RECEIVED', 'SUP006', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1890', TO_DATE('2025-12-15', 'YYYY-MM-DD'), TO_DATE('2025-12-20', 'YYYY-MM-DD'), TO_DATE('2025-12-22', 'YYYY-MM-DD'), 2482.32, 'RECEIVED', 'SUP004', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1891', TO_DATE('2025-12-16', 'YYYY-MM-DD'), TO_DATE('2025-12-24', 'YYYY-MM-DD'), TO_DATE('2025-12-27', 'YYYY-MM-DD'), 316.25, 'RECEIVED', 'SUP008', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1892', TO_DATE('2025-12-17', 'YYYY-MM-DD'), TO_DATE('2025-12-25', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), 2371.22, 'RECEIVED', 'SUP009', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1893', TO_DATE('2025-12-17', 'YYYY-MM-DD'), TO_DATE('2025-12-22', 'YYYY-MM-DD'), TO_DATE('2025-12-22', 'YYYY-MM-DD'), 553.4, 'RECEIVED', 'SUP007', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1894', TO_DATE('2025-12-17', 'YYYY-MM-DD'), TO_DATE('2025-12-25', 'YYYY-MM-DD'), TO_DATE('2025-12-28', 'YYYY-MM-DD'), 149.65, 'RECEIVED', 'SUP009', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1895', TO_DATE('2025-12-17', 'YYYY-MM-DD'), TO_DATE('2025-12-22', 'YYYY-MM-DD'), TO_DATE('2025-12-23', 'YYYY-MM-DD'), 167.2, 'RECEIVED', 'SUP007', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1896', TO_DATE('2025-12-17', 'YYYY-MM-DD'), TO_DATE('2025-12-22', 'YYYY-MM-DD'), TO_DATE('2025-12-21', 'YYYY-MM-DD'), 152.08, 'RECEIVED', 'SUP005', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1897', TO_DATE('2025-12-17', 'YYYY-MM-DD'), TO_DATE('2025-12-20', 'YYYY-MM-DD'), TO_DATE('2025-12-20', 'YYYY-MM-DD'), 141.72, 'RECEIVED', 'SUP001', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1898', TO_DATE('2025-12-18', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2025-12-27', 'YYYY-MM-DD'), 499.84, 'RECEIVED', 'SUP008', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1899', TO_DATE('2025-12-20', 'YYYY-MM-DD'), TO_DATE('2025-12-28', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), 248.02, 'RECEIVED', 'SUP010', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1900', TO_DATE('2025-12-20', 'YYYY-MM-DD'), TO_DATE('2025-12-23', 'YYYY-MM-DD'), TO_DATE('2025-12-24', 'YYYY-MM-DD'), 105.76, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1901', TO_DATE('2025-12-20', 'YYYY-MM-DD'), TO_DATE('2025-12-25', 'YYYY-MM-DD'), TO_DATE('2025-12-25', 'YYYY-MM-DD'), 1046.96, 'RECEIVED', 'SUP007', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1902', TO_DATE('2025-12-21', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2025-12-29', 'YYYY-MM-DD'), 186.72, 'RECEIVED', 'SUP005', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1903', TO_DATE('2025-12-21', 'YYYY-MM-DD'), TO_DATE('2025-12-29', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), 1051.06, 'RECEIVED', 'SUP009', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1904', TO_DATE('2025-12-21', 'YYYY-MM-DD'), TO_DATE('2025-12-24', 'YYYY-MM-DD'), TO_DATE('2025-12-23', 'YYYY-MM-DD'), 146.82, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1905', TO_DATE('2025-12-21', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), 583.78, 'RECEIVED', 'SUP007', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1906', TO_DATE('2025-12-21', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2025-12-27', 'YYYY-MM-DD'), 70.32, 'RECEIVED', 'SUP007', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1907', TO_DATE('2025-12-21', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), 317.86, 'RECEIVED', 'SUP006', 'S0005');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1908', TO_DATE('2025-12-22', 'YYYY-MM-DD'), TO_DATE('2025-12-30', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'), 1131.47, 'RECEIVED', 'SUP011', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1909', TO_DATE('2025-12-22', 'YYYY-MM-DD'), TO_DATE('2025-12-27', 'YYYY-MM-DD'), TO_DATE('2025-12-27', 'YYYY-MM-DD'), 246.38, 'RECEIVED', 'SUP004', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1910', TO_DATE('2025-12-23', 'YYYY-MM-DD'), TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2025-12-25', 'YYYY-MM-DD'), 633.02, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1911', TO_DATE('2025-12-23', 'YYYY-MM-DD'), TO_DATE('2025-12-28', 'YYYY-MM-DD'), TO_DATE('2025-12-30', 'YYYY-MM-DD'), 1245.04, 'RECEIVED', 'SUP006', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1912', TO_DATE('2025-12-24', 'YYYY-MM-DD'), TO_DATE('2025-12-29', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), 794.96, 'RECEIVED', 'SUP006', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1913', TO_DATE('2025-12-25', 'YYYY-MM-DD'), TO_DATE('2026-01-02', 'YYYY-MM-DD'), TO_DATE('2026-01-04', 'YYYY-MM-DD'), 243.27, 'RECEIVED', 'SUP011', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1914', TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), TO_DATE('2026-01-03', 'YYYY-MM-DD'), 170.88, 'RECEIVED', 'SUP004', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1915', TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2026-01-03', 'YYYY-MM-DD'), TO_DATE('2026-01-07', 'YYYY-MM-DD'), 98.3, 'RECEIVED', 'SUP009', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1916', TO_DATE('2025-12-26', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), 1897.44, 'RECEIVED', 'SUP004', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1917', TO_DATE('2025-12-27', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'), 1052.49, 'RECEIVED', 'SUP006', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1918', TO_DATE('2025-12-27', 'YYYY-MM-DD'), TO_DATE('2025-12-30', 'YYYY-MM-DD'), TO_DATE('2025-12-28', 'YYYY-MM-DD'), 190.0, 'RECEIVED', 'SUP001', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1919', TO_DATE('2025-12-27', 'YYYY-MM-DD'), TO_DATE('2025-12-30', 'YYYY-MM-DD'), TO_DATE('2025-12-29', 'YYYY-MM-DD'), 217.43, 'RECEIVED', 'SUP001', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1920', TO_DATE('2025-12-27', 'YYYY-MM-DD'), TO_DATE('2026-01-04', 'YYYY-MM-DD'), TO_DATE('2026-01-09', 'YYYY-MM-DD'), 57.13, 'RECEIVED', 'SUP009', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1921', TO_DATE('2025-12-28', 'YYYY-MM-DD'), TO_DATE('2026-01-02', 'YYYY-MM-DD'), TO_DATE('2026-01-03', 'YYYY-MM-DD'), 1106.87, 'RECEIVED', 'SUP007', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1922', TO_DATE('2025-12-29', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2026-01-02', 'YYYY-MM-DD'), 344.55, 'RECEIVED', 'SUP003', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1923', TO_DATE('2025-12-29', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2025-12-30', 'YYYY-MM-DD'), 549.17, 'RECEIVED', 'SUP003', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1924', TO_DATE('2025-12-29', 'YYYY-MM-DD'), TO_DATE('2026-01-03', 'YYYY-MM-DD'), TO_DATE('2026-01-06', 'YYYY-MM-DD'), 653.13, 'RECEIVED', 'SUP005', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1925', TO_DATE('2025-12-29', 'YYYY-MM-DD'), TO_DATE('2026-01-03', 'YYYY-MM-DD'), TO_DATE('2026-01-04', 'YYYY-MM-DD'), 715.86, 'RECEIVED', 'SUP004', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1926', TO_DATE('2025-12-29', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2026-01-02', 'YYYY-MM-DD'), 4646.98, 'RECEIVED', 'SUP001', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1927', TO_DATE('2025-12-30', 'YYYY-MM-DD'), TO_DATE('2026-01-04', 'YYYY-MM-DD'), TO_DATE('2026-01-04', 'YYYY-MM-DD'), 290.76, 'RECEIVED', 'SUP005', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1928', TO_DATE('2025-12-31', 'YYYY-MM-DD'), TO_DATE('2026-01-05', 'YYYY-MM-DD'), TO_DATE('2026-01-07', 'YYYY-MM-DD'), 1170.03, 'RECEIVED', 'SUP007', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1929', TO_DATE('2026-01-02', 'YYYY-MM-DD'), TO_DATE('2026-01-07', 'YYYY-MM-DD'), TO_DATE('2026-01-08', 'YYYY-MM-DD'), 66.5, 'RECEIVED', 'SUP007', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1930', TO_DATE('2026-01-03', 'YYYY-MM-DD'), TO_DATE('2026-01-08', 'YYYY-MM-DD'), TO_DATE('2026-01-10', 'YYYY-MM-DD'), 4103.2, 'RECEIVED', 'SUP005', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1931', TO_DATE('2026-01-03', 'YYYY-MM-DD'), TO_DATE('2026-01-08', 'YYYY-MM-DD'), TO_DATE('2026-01-11', 'YYYY-MM-DD'), 616.4, 'RECEIVED', 'SUP007', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1932', TO_DATE('2026-01-03', 'YYYY-MM-DD'), TO_DATE('2026-01-08', 'YYYY-MM-DD'), TO_DATE('2026-01-11', 'YYYY-MM-DD'), 330.7, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1933', TO_DATE('2026-01-03', 'YYYY-MM-DD'), TO_DATE('2026-01-11', 'YYYY-MM-DD'), TO_DATE('2026-01-14', 'YYYY-MM-DD'), 60.0, 'RECEIVED', 'SUP010', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1934', TO_DATE('2026-01-05', 'YYYY-MM-DD'), TO_DATE('2026-01-08', 'YYYY-MM-DD'), TO_DATE('2026-01-09', 'YYYY-MM-DD'), 168.0, 'RECEIVED', 'SUP001', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1935', TO_DATE('2026-01-07', 'YYYY-MM-DD'), TO_DATE('2026-01-10', 'YYYY-MM-DD'), TO_DATE('2026-01-09', 'YYYY-MM-DD'), 407.88, 'RECEIVED', 'SUP002', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1936', TO_DATE('2026-01-07', 'YYYY-MM-DD'), TO_DATE('2026-01-15', 'YYYY-MM-DD'), TO_DATE('2026-01-21', 'YYYY-MM-DD'), 427.88, 'RECEIVED', 'SUP008', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1937', TO_DATE('2026-01-07', 'YYYY-MM-DD'), TO_DATE('2026-01-12', 'YYYY-MM-DD'), TO_DATE('2026-01-13', 'YYYY-MM-DD'), 264.1, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1938', TO_DATE('2026-01-12', 'YYYY-MM-DD'), TO_DATE('2026-01-17', 'YYYY-MM-DD'), TO_DATE('2026-01-17', 'YYYY-MM-DD'), 125.8, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1939', TO_DATE('2026-01-12', 'YYYY-MM-DD'), TO_DATE('2026-01-15', 'YYYY-MM-DD'), TO_DATE('2026-01-14', 'YYYY-MM-DD'), 512.0, 'RECEIVED', 'SUP003', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1940', TO_DATE('2026-01-13', 'YYYY-MM-DD'), TO_DATE('2026-01-18', 'YYYY-MM-DD'), TO_DATE('2026-01-18', 'YYYY-MM-DD'), 124.18, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1941', TO_DATE('2026-01-13', 'YYYY-MM-DD'), TO_DATE('2026-01-16', 'YYYY-MM-DD'), TO_DATE('2026-01-17', 'YYYY-MM-DD'), 178.2, 'RECEIVED', 'SUP002', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1942', TO_DATE('2026-01-13', 'YYYY-MM-DD'), TO_DATE('2026-01-18', 'YYYY-MM-DD'), TO_DATE('2026-01-19', 'YYYY-MM-DD'), 126.5, 'RECEIVED', 'SUP005', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1943', TO_DATE('2026-01-15', 'YYYY-MM-DD'), TO_DATE('2026-01-20', 'YYYY-MM-DD'), TO_DATE('2026-01-22', 'YYYY-MM-DD'), 142.0, 'RECEIVED', 'SUP006', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1944', TO_DATE('2026-01-17', 'YYYY-MM-DD'), TO_DATE('2026-01-22', 'YYYY-MM-DD'), TO_DATE('2026-01-23', 'YYYY-MM-DD'), 172.5, 'RECEIVED', 'SUP007', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1945', TO_DATE('2026-01-17', 'YYYY-MM-DD'), TO_DATE('2026-01-20', 'YYYY-MM-DD'), TO_DATE('2026-01-18', 'YYYY-MM-DD'), 269.5, 'RECEIVED', 'SUP003', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1946', TO_DATE('2026-01-21', 'YYYY-MM-DD'), TO_DATE('2026-01-26', 'YYYY-MM-DD'), TO_DATE('2026-01-25', 'YYYY-MM-DD'), 81.0, 'RECEIVED', 'SUP005', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1947', TO_DATE('2026-01-22', 'YYYY-MM-DD'), TO_DATE('2026-01-25', 'YYYY-MM-DD'), TO_DATE('2026-01-25', 'YYYY-MM-DD'), 345.0, 'RECEIVED', 'SUP003', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1948', TO_DATE('2026-01-25', 'YYYY-MM-DD'), TO_DATE('2026-01-30', 'YYYY-MM-DD'), TO_DATE('2026-02-02', 'YYYY-MM-DD'), 3322.43, 'RECEIVED', 'SUP004', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1949', TO_DATE('2026-01-25', 'YYYY-MM-DD'), TO_DATE('2026-01-30', 'YYYY-MM-DD'), TO_DATE('2026-01-31', 'YYYY-MM-DD'), 1104.13, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1950', TO_DATE('2026-01-26', 'YYYY-MM-DD'), TO_DATE('2026-01-31', 'YYYY-MM-DD'), TO_DATE('2026-01-30', 'YYYY-MM-DD'), 558.08, 'RECEIVED', 'SUP006', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1951', TO_DATE('2026-01-28', 'YYYY-MM-DD'), TO_DATE('2026-01-31', 'YYYY-MM-DD'), TO_DATE('2026-01-30', 'YYYY-MM-DD'), 251.5, 'RECEIVED', 'SUP003', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1952', TO_DATE('2026-01-29', 'YYYY-MM-DD'), TO_DATE('2026-02-03', 'YYYY-MM-DD'), TO_DATE('2026-02-04', 'YYYY-MM-DD'), 929.01, 'RECEIVED', 'SUP007', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1953', TO_DATE('2026-01-30', 'YYYY-MM-DD'), TO_DATE('2026-02-07', 'YYYY-MM-DD'), TO_DATE('2026-02-09', 'YYYY-MM-DD'), 701.14, 'RECEIVED', 'SUP011', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1954', TO_DATE('2026-01-30', 'YYYY-MM-DD'), TO_DATE('2026-02-02', 'YYYY-MM-DD'), TO_DATE('2026-01-31', 'YYYY-MM-DD'), 224.24, 'RECEIVED', 'SUP001', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1955', TO_DATE('2026-01-31', 'YYYY-MM-DD'), TO_DATE('2026-02-05', 'YYYY-MM-DD'), TO_DATE('2026-02-08', 'YYYY-MM-DD'), 240.96, 'RECEIVED', 'SUP005', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1956', TO_DATE('2026-02-01', 'YYYY-MM-DD'), TO_DATE('2026-02-06', 'YYYY-MM-DD'), TO_DATE('2026-02-05', 'YYYY-MM-DD'), 560.0, 'RECEIVED', 'SUP004', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1957', TO_DATE('2026-02-02', 'YYYY-MM-DD'), TO_DATE('2026-02-05', 'YYYY-MM-DD'), TO_DATE('2026-02-05', 'YYYY-MM-DD'), 601.0, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1958', TO_DATE('2026-02-02', 'YYYY-MM-DD'), TO_DATE('2026-02-07', 'YYYY-MM-DD'), TO_DATE('2026-02-07', 'YYYY-MM-DD'), 383.53, 'RECEIVED', 'SUP005', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1959', TO_DATE('2026-02-04', 'YYYY-MM-DD'), TO_DATE('2026-02-07', 'YYYY-MM-DD'), NULL, 278.5, 'CANCELLED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1960', TO_DATE('2026-02-04', 'YYYY-MM-DD'), TO_DATE('2026-02-09', 'YYYY-MM-DD'), TO_DATE('2026-02-10', 'YYYY-MM-DD'), 267.2, 'RECEIVED', 'SUP004', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1961', TO_DATE('2026-02-04', 'YYYY-MM-DD'), TO_DATE('2026-02-07', 'YYYY-MM-DD'), TO_DATE('2026-02-07', 'YYYY-MM-DD'), 228.89, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1962', TO_DATE('2026-02-05', 'YYYY-MM-DD'), TO_DATE('2026-02-13', 'YYYY-MM-DD'), TO_DATE('2026-02-14', 'YYYY-MM-DD'), 130.08, 'RECEIVED', 'SUP009', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1963', TO_DATE('2026-02-05', 'YYYY-MM-DD'), TO_DATE('2026-02-08', 'YYYY-MM-DD'), TO_DATE('2026-02-07', 'YYYY-MM-DD'), 241.71, 'RECEIVED', 'SUP002', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1964', TO_DATE('2026-02-05', 'YYYY-MM-DD'), TO_DATE('2026-02-10', 'YYYY-MM-DD'), TO_DATE('2026-02-10', 'YYYY-MM-DD'), 414.28, 'RECEIVED', 'SUP006', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1965', TO_DATE('2026-02-05', 'YYYY-MM-DD'), TO_DATE('2026-02-10', 'YYYY-MM-DD'), TO_DATE('2026-02-13', 'YYYY-MM-DD'), 260.54, 'RECEIVED', 'SUP007', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1966', TO_DATE('2026-02-06', 'YYYY-MM-DD'), TO_DATE('2026-02-14', 'YYYY-MM-DD'), TO_DATE('2026-02-18', 'YYYY-MM-DD'), 388.0, 'RECEIVED', 'SUP008', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1967', TO_DATE('2026-02-07', 'YYYY-MM-DD'), TO_DATE('2026-02-12', 'YYYY-MM-DD'), TO_DATE('2026-02-11', 'YYYY-MM-DD'), 802.76, 'RECEIVED', 'SUP004', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1968', TO_DATE('2026-02-07', 'YYYY-MM-DD'), TO_DATE('2026-02-12', 'YYYY-MM-DD'), TO_DATE('2026-02-13', 'YYYY-MM-DD'), 582.98, 'RECEIVED', 'SUP007', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1969', TO_DATE('2026-02-07', 'YYYY-MM-DD'), TO_DATE('2026-02-12', 'YYYY-MM-DD'), TO_DATE('2026-02-13', 'YYYY-MM-DD'), 34.0, 'RECEIVED', 'SUP006', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1970', TO_DATE('2026-02-08', 'YYYY-MM-DD'), TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-10', 'YYYY-MM-DD'), 397.91, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1971', TO_DATE('2026-02-08', 'YYYY-MM-DD'), TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-09', 'YYYY-MM-DD'), 928.0, 'RECEIVED', 'SUP002', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1972', TO_DATE('2026-02-08', 'YYYY-MM-DD'), TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-09', 'YYYY-MM-DD'), 322.0, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1973', TO_DATE('2026-02-08', 'YYYY-MM-DD'), TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-12', 'YYYY-MM-DD'), 336.41, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1974', TO_DATE('2026-02-09', 'YYYY-MM-DD'), TO_DATE('2026-02-12', 'YYYY-MM-DD'), NULL, 204.16, 'CANCELLED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1975', TO_DATE('2026-02-09', 'YYYY-MM-DD'), TO_DATE('2026-02-14', 'YYYY-MM-DD'), TO_DATE('2026-02-17', 'YYYY-MM-DD'), 156.46, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1976', TO_DATE('2026-02-09', 'YYYY-MM-DD'), TO_DATE('2026-02-12', 'YYYY-MM-DD'), TO_DATE('2026-02-11', 'YYYY-MM-DD'), 357.73, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1977', TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-16', 'YYYY-MM-DD'), TO_DATE('2026-02-19', 'YYYY-MM-DD'), 257.88, 'RECEIVED', 'SUP006', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1978', TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-16', 'YYYY-MM-DD'), TO_DATE('2026-02-19', 'YYYY-MM-DD'), 201.4, 'RECEIVED', 'SUP007', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1979', TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-16', 'YYYY-MM-DD'), TO_DATE('2026-02-16', 'YYYY-MM-DD'), 442.2, 'RECEIVED', 'SUP004', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1980', TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-16', 'YYYY-MM-DD'), TO_DATE('2026-02-17', 'YYYY-MM-DD'), 85.91, 'RECEIVED', 'SUP006', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1981', TO_DATE('2026-02-11', 'YYYY-MM-DD'), TO_DATE('2026-02-14', 'YYYY-MM-DD'), TO_DATE('2026-02-15', 'YYYY-MM-DD'), 126.0, 'RECEIVED', 'SUP002', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1982', TO_DATE('2026-02-12', 'YYYY-MM-DD'), TO_DATE('2026-02-17', 'YYYY-MM-DD'), TO_DATE('2026-02-20', 'YYYY-MM-DD'), 288.5, 'RECEIVED', 'SUP006', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1983', TO_DATE('2026-02-12', 'YYYY-MM-DD'), TO_DATE('2026-02-15', 'YYYY-MM-DD'), TO_DATE('2026-02-15', 'YYYY-MM-DD'), 207.5, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1984', TO_DATE('2026-02-13', 'YYYY-MM-DD'), TO_DATE('2026-02-18', 'YYYY-MM-DD'), TO_DATE('2026-02-21', 'YYYY-MM-DD'), 112.95, 'RECEIVED', 'SUP004', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1985', TO_DATE('2026-02-14', 'YYYY-MM-DD'), TO_DATE('2026-02-19', 'YYYY-MM-DD'), TO_DATE('2026-02-21', 'YYYY-MM-DD'), 489.5, 'RECEIVED', 'SUP005', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1986', TO_DATE('2026-02-16', 'YYYY-MM-DD'), TO_DATE('2026-02-19', 'YYYY-MM-DD'), TO_DATE('2026-02-20', 'YYYY-MM-DD'), 35.0, 'RECEIVED', 'SUP001', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1987', TO_DATE('2026-02-18', 'YYYY-MM-DD'), TO_DATE('2026-02-21', 'YYYY-MM-DD'), TO_DATE('2026-02-19', 'YYYY-MM-DD'), 137.04, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1988', TO_DATE('2026-02-18', 'YYYY-MM-DD'), TO_DATE('2026-02-23', 'YYYY-MM-DD'), TO_DATE('2026-02-24', 'YYYY-MM-DD'), 356.0, 'RECEIVED', 'SUP007', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1989', TO_DATE('2026-02-18', 'YYYY-MM-DD'), TO_DATE('2026-02-26', 'YYYY-MM-DD'), TO_DATE('2026-03-02', 'YYYY-MM-DD'), 321.0, 'RECEIVED', 'SUP009', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1990', TO_DATE('2026-02-18', 'YYYY-MM-DD'), TO_DATE('2026-02-23', 'YYYY-MM-DD'), TO_DATE('2026-02-25', 'YYYY-MM-DD'), 183.0, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1991', TO_DATE('2026-02-18', 'YYYY-MM-DD'), TO_DATE('2026-02-21', 'YYYY-MM-DD'), TO_DATE('2026-02-20', 'YYYY-MM-DD'), 52.5, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1992', TO_DATE('2026-02-19', 'YYYY-MM-DD'), TO_DATE('2026-02-24', 'YYYY-MM-DD'), TO_DATE('2026-02-26', 'YYYY-MM-DD'), 994.2, 'RECEIVED', 'SUP006', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1993', TO_DATE('2026-02-19', 'YYYY-MM-DD'), TO_DATE('2026-02-27', 'YYYY-MM-DD'), TO_DATE('2026-03-02', 'YYYY-MM-DD'), 526.88, 'RECEIVED', 'SUP011', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1994', TO_DATE('2026-02-19', 'YYYY-MM-DD'), TO_DATE('2026-02-24', 'YYYY-MM-DD'), TO_DATE('2026-02-24', 'YYYY-MM-DD'), 36.0, 'RECEIVED', 'SUP007', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1995', TO_DATE('2026-02-19', 'YYYY-MM-DD'), TO_DATE('2026-02-22', 'YYYY-MM-DD'), TO_DATE('2026-02-23', 'YYYY-MM-DD'), 37.5, 'RECEIVED', 'SUP003', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1996', TO_DATE('2026-02-22', 'YYYY-MM-DD'), TO_DATE('2026-03-02', 'YYYY-MM-DD'), TO_DATE('2026-03-06', 'YYYY-MM-DD'), 475.0, 'RECEIVED', 'SUP010', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1997', TO_DATE('2026-02-22', 'YYYY-MM-DD'), TO_DATE('2026-02-27', 'YYYY-MM-DD'), TO_DATE('2026-03-02', 'YYYY-MM-DD'), 63.0, 'RECEIVED', 'SUP005', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1998', TO_DATE('2026-02-22', 'YYYY-MM-DD'), TO_DATE('2026-02-27', 'YYYY-MM-DD'), TO_DATE('2026-03-02', 'YYYY-MM-DD'), 95.6, 'RECEIVED', 'SUP007', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO1999', TO_DATE('2026-02-22', 'YYYY-MM-DD'), TO_DATE('2026-03-02', 'YYYY-MM-DD'), TO_DATE('2026-03-05', 'YYYY-MM-DD'), 493.77, 'RECEIVED', 'SUP009', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2000', TO_DATE('2026-02-22', 'YYYY-MM-DD'), TO_DATE('2026-02-25', 'YYYY-MM-DD'), TO_DATE('2026-02-24', 'YYYY-MM-DD'), 77.5, 'RECEIVED', 'SUP003', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2001', TO_DATE('2026-02-23', 'YYYY-MM-DD'), TO_DATE('2026-02-26', 'YYYY-MM-DD'), TO_DATE('2026-02-24', 'YYYY-MM-DD'), 187.25, 'RECEIVED', 'SUP002', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2002', TO_DATE('2026-02-24', 'YYYY-MM-DD'), TO_DATE('2026-03-04', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), 2006.5, 'RECEIVED', 'SUP011', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2003', TO_DATE('2026-02-27', 'YYYY-MM-DD'), TO_DATE('2026-03-02', 'YYYY-MM-DD'), TO_DATE('2026-03-03', 'YYYY-MM-DD'), 510.47, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2004', TO_DATE('2026-02-28', 'YYYY-MM-DD'), TO_DATE('2026-03-05', 'YYYY-MM-DD'), TO_DATE('2026-03-04', 'YYYY-MM-DD'), 2198.92, 'RECEIVED', 'SUP004', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2005', TO_DATE('2026-02-28', 'YYYY-MM-DD'), TO_DATE('2026-03-03', 'YYYY-MM-DD'), TO_DATE('2026-03-03', 'YYYY-MM-DD'), 1581.0, 'RECEIVED', 'SUP001', 'S0059');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2006', TO_DATE('2026-03-03', 'YYYY-MM-DD'), TO_DATE('2026-03-11', 'YYYY-MM-DD'), TO_DATE('2026-03-14', 'YYYY-MM-DD'), 837.5, 'RECEIVED', 'SUP011', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2007', TO_DATE('2026-03-04', 'YYYY-MM-DD'), TO_DATE('2026-03-12', 'YYYY-MM-DD'), TO_DATE('2026-03-14', 'YYYY-MM-DD'), 122.03, 'RECEIVED', 'SUP008', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2008', TO_DATE('2026-03-04', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), 400.0, 'RECEIVED', 'SUP006', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2009', TO_DATE('2026-03-04', 'YYYY-MM-DD'), TO_DATE('2026-03-07', 'YYYY-MM-DD'), TO_DATE('2026-03-07', 'YYYY-MM-DD'), 164.01, 'RECEIVED', 'SUP002', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2010', TO_DATE('2026-03-05', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), 487.0, 'RECEIVED', 'SUP005', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2011', TO_DATE('2026-03-05', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), 1415.74, 'RECEIVED', 'SUP005', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2012', TO_DATE('2026-03-05', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), 415.2, 'RECEIVED', 'SUP006', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2013', TO_DATE('2026-03-06', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), TO_DATE('2026-03-08', 'YYYY-MM-DD'), 265.0, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2014', TO_DATE('2026-03-06', 'YYYY-MM-DD'), TO_DATE('2026-03-11', 'YYYY-MM-DD'), TO_DATE('2026-03-11', 'YYYY-MM-DD'), 679.05, 'RECEIVED', 'SUP004', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2015', TO_DATE('2026-03-07', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), 254.06, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2016', TO_DATE('2026-03-07', 'YYYY-MM-DD'), TO_DATE('2026-03-10', 'YYYY-MM-DD'), TO_DATE('2026-03-11', 'YYYY-MM-DD'), 66.0, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2017', TO_DATE('2026-03-07', 'YYYY-MM-DD'), TO_DATE('2026-03-15', 'YYYY-MM-DD'), TO_DATE('2026-03-19', 'YYYY-MM-DD'), 70.0, 'RECEIVED', 'SUP011', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2018', TO_DATE('2026-03-08', 'YYYY-MM-DD'), TO_DATE('2026-03-11', 'YYYY-MM-DD'), TO_DATE('2026-03-11', 'YYYY-MM-DD'), 601.0, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2019', TO_DATE('2026-03-09', 'YYYY-MM-DD'), TO_DATE('2026-03-17', 'YYYY-MM-DD'), TO_DATE('2026-03-21', 'YYYY-MM-DD'), 142.24, 'RECEIVED', 'SUP011', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2020', TO_DATE('2026-03-10', 'YYYY-MM-DD'), TO_DATE('2026-03-15', 'YYYY-MM-DD'), TO_DATE('2026-03-17', 'YYYY-MM-DD'), 729.54, 'RECEIVED', 'SUP004', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2021', TO_DATE('2026-03-10', 'YYYY-MM-DD'), TO_DATE('2026-03-13', 'YYYY-MM-DD'), TO_DATE('2026-03-13', 'YYYY-MM-DD'), 314.48, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2022', TO_DATE('2026-03-12', 'YYYY-MM-DD'), TO_DATE('2026-03-15', 'YYYY-MM-DD'), TO_DATE('2026-03-14', 'YYYY-MM-DD'), 299.0, 'RECEIVED', 'SUP001', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2023', TO_DATE('2026-03-12', 'YYYY-MM-DD'), TO_DATE('2026-03-15', 'YYYY-MM-DD'), TO_DATE('2026-03-14', 'YYYY-MM-DD'), 238.7, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2024', TO_DATE('2026-03-12', 'YYYY-MM-DD'), TO_DATE('2026-03-17', 'YYYY-MM-DD'), TO_DATE('2026-03-17', 'YYYY-MM-DD'), 437.5, 'RECEIVED', 'SUP007', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2025', TO_DATE('2026-03-12', 'YYYY-MM-DD'), TO_DATE('2026-03-15', 'YYYY-MM-DD'), TO_DATE('2026-03-15', 'YYYY-MM-DD'), 446.5, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2026', TO_DATE('2026-03-13', 'YYYY-MM-DD'), TO_DATE('2026-03-18', 'YYYY-MM-DD'), TO_DATE('2026-03-20', 'YYYY-MM-DD'), 436.66, 'RECEIVED', 'SUP005', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2027', TO_DATE('2026-03-15', 'YYYY-MM-DD'), TO_DATE('2026-03-18', 'YYYY-MM-DD'), TO_DATE('2026-03-16', 'YYYY-MM-DD'), 144.2, 'RECEIVED', 'SUP002', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2028', TO_DATE('2026-03-15', 'YYYY-MM-DD'), TO_DATE('2026-03-18', 'YYYY-MM-DD'), TO_DATE('2026-03-19', 'YYYY-MM-DD'), 200.8, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2029', TO_DATE('2026-03-16', 'YYYY-MM-DD'), TO_DATE('2026-03-21', 'YYYY-MM-DD'), TO_DATE('2026-03-23', 'YYYY-MM-DD'), 573.9, 'RECEIVED', 'SUP007', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2030', TO_DATE('2026-03-16', 'YYYY-MM-DD'), TO_DATE('2026-03-24', 'YYYY-MM-DD'), TO_DATE('2026-03-29', 'YYYY-MM-DD'), 37.5, 'RECEIVED', 'SUP011', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2031', TO_DATE('2026-03-16', 'YYYY-MM-DD'), TO_DATE('2026-03-24', 'YYYY-MM-DD'), TO_DATE('2026-03-28', 'YYYY-MM-DD'), 422.5, 'RECEIVED', 'SUP010', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2032', TO_DATE('2026-03-17', 'YYYY-MM-DD'), TO_DATE('2026-03-22', 'YYYY-MM-DD'), TO_DATE('2026-03-25', 'YYYY-MM-DD'), 825.28, 'RECEIVED', 'SUP006', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2033', TO_DATE('2026-03-17', 'YYYY-MM-DD'), TO_DATE('2026-03-20', 'YYYY-MM-DD'), TO_DATE('2026-03-18', 'YYYY-MM-DD'), 70.5, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2034', TO_DATE('2026-03-18', 'YYYY-MM-DD'), TO_DATE('2026-03-21', 'YYYY-MM-DD'), TO_DATE('2026-03-19', 'YYYY-MM-DD'), 909.26, 'RECEIVED', 'SUP002', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2035', TO_DATE('2026-03-18', 'YYYY-MM-DD'), TO_DATE('2026-03-23', 'YYYY-MM-DD'), TO_DATE('2026-03-22', 'YYYY-MM-DD'), 35.0, 'RECEIVED', 'SUP004', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2036', TO_DATE('2026-03-21', 'YYYY-MM-DD'), TO_DATE('2026-03-24', 'YYYY-MM-DD'), TO_DATE('2026-03-24', 'YYYY-MM-DD'), 5023.1, 'RECEIVED', 'SUP003', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2037', TO_DATE('2026-03-21', 'YYYY-MM-DD'), TO_DATE('2026-03-26', 'YYYY-MM-DD'), TO_DATE('2026-03-27', 'YYYY-MM-DD'), 130.1, 'RECEIVED', 'SUP006', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2038', TO_DATE('2026-03-22', 'YYYY-MM-DD'), TO_DATE('2026-03-25', 'YYYY-MM-DD'), TO_DATE('2026-03-24', 'YYYY-MM-DD'), 937.5, 'RECEIVED', 'SUP001', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2039', TO_DATE('2026-03-22', 'YYYY-MM-DD'), TO_DATE('2026-03-27', 'YYYY-MM-DD'), TO_DATE('2026-03-27', 'YYYY-MM-DD'), 400.0, 'RECEIVED', 'SUP004', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2040', TO_DATE('2026-03-23', 'YYYY-MM-DD'), TO_DATE('2026-03-26', 'YYYY-MM-DD'), TO_DATE('2026-03-25', 'YYYY-MM-DD'), 322.0, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2041', TO_DATE('2026-03-23', 'YYYY-MM-DD'), TO_DATE('2026-03-26', 'YYYY-MM-DD'), TO_DATE('2026-03-26', 'YYYY-MM-DD'), 1157.92, 'RECEIVED', 'SUP002', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2042', TO_DATE('2026-03-24', 'YYYY-MM-DD'), TO_DATE('2026-04-01', 'YYYY-MM-DD'), TO_DATE('2026-04-07', 'YYYY-MM-DD'), 745.0, 'RECEIVED', 'SUP009', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2043', TO_DATE('2026-03-25', 'YYYY-MM-DD'), TO_DATE('2026-03-28', 'YYYY-MM-DD'), TO_DATE('2026-03-26', 'YYYY-MM-DD'), 366.41, 'RECEIVED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2044', TO_DATE('2026-03-25', 'YYYY-MM-DD'), TO_DATE('2026-03-28', 'YYYY-MM-DD'), TO_DATE('2026-03-28', 'YYYY-MM-DD'), 705.72, 'RECEIVED', 'SUP001', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2045', TO_DATE('2026-03-27', 'YYYY-MM-DD'), TO_DATE('2026-04-01', 'YYYY-MM-DD'), TO_DATE('2026-04-02', 'YYYY-MM-DD'), 562.7, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2046', TO_DATE('2026-03-28', 'YYYY-MM-DD'), TO_DATE('2026-04-05', 'YYYY-MM-DD'), TO_DATE('2026-04-08', 'YYYY-MM-DD'), 9983.26, 'RECEIVED', 'SUP008', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2047', TO_DATE('2026-03-28', 'YYYY-MM-DD'), TO_DATE('2026-04-05', 'YYYY-MM-DD'), TO_DATE('2026-04-06', 'YYYY-MM-DD'), 174.0, 'RECEIVED', 'SUP011', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2048', TO_DATE('2026-03-29', 'YYYY-MM-DD'), TO_DATE('2026-04-03', 'YYYY-MM-DD'), TO_DATE('2026-04-05', 'YYYY-MM-DD'), 620.0, 'RECEIVED', 'SUP004', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2049', TO_DATE('2026-04-04', 'YYYY-MM-DD'), TO_DATE('2026-04-07', 'YYYY-MM-DD'), TO_DATE('2026-04-05', 'YYYY-MM-DD'), 606.8, 'RECEIVED', 'SUP003', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2050', TO_DATE('2026-04-05', 'YYYY-MM-DD'), TO_DATE('2026-04-10', 'YYYY-MM-DD'), TO_DATE('2026-04-13', 'YYYY-MM-DD'), 249.5, 'RECEIVED', 'SUP005', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2051', TO_DATE('2026-04-05', 'YYYY-MM-DD'), TO_DATE('2026-04-08', 'YYYY-MM-DD'), TO_DATE('2026-04-08', 'YYYY-MM-DD'), 427.5, 'RECEIVED', 'SUP001', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2052', TO_DATE('2026-04-08', 'YYYY-MM-DD'), TO_DATE('2026-04-11', 'YYYY-MM-DD'), TO_DATE('2026-04-10', 'YYYY-MM-DD'), 210.0, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2053', TO_DATE('2026-04-09', 'YYYY-MM-DD'), TO_DATE('2026-04-14', 'YYYY-MM-DD'), TO_DATE('2026-04-16', 'YYYY-MM-DD'), 143.0, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2054', TO_DATE('2026-04-11', 'YYYY-MM-DD'), TO_DATE('2026-04-14', 'YYYY-MM-DD'), TO_DATE('2026-04-14', 'YYYY-MM-DD'), 46.68, 'RECEIVED', 'SUP001', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2055', TO_DATE('2026-04-16', 'YYYY-MM-DD'), TO_DATE('2026-04-19', 'YYYY-MM-DD'), TO_DATE('2026-04-20', 'YYYY-MM-DD'), 495.43, 'RECEIVED', 'SUP002', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2056', TO_DATE('2026-04-16', 'YYYY-MM-DD'), TO_DATE('2026-04-24', 'YYYY-MM-DD'), TO_DATE('2026-04-28', 'YYYY-MM-DD'), 487.5, 'RECEIVED', 'SUP010', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2057', TO_DATE('2026-04-17', 'YYYY-MM-DD'), TO_DATE('2026-04-22', 'YYYY-MM-DD'), TO_DATE('2026-04-24', 'YYYY-MM-DD'), 640.04, 'RECEIVED', 'SUP006', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2058', TO_DATE('2026-04-19', 'YYYY-MM-DD'), TO_DATE('2026-04-22', 'YYYY-MM-DD'), TO_DATE('2026-04-20', 'YYYY-MM-DD'), 646.65, 'RECEIVED', 'SUP002', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2059', TO_DATE('2026-04-19', 'YYYY-MM-DD'), TO_DATE('2026-04-22', 'YYYY-MM-DD'), TO_DATE('2026-04-22', 'YYYY-MM-DD'), 131.5, 'RECEIVED', 'SUP001', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2060', TO_DATE('2026-04-20', 'YYYY-MM-DD'), TO_DATE('2026-04-25', 'YYYY-MM-DD'), TO_DATE('2026-04-25', 'YYYY-MM-DD'), 777.0, 'RECEIVED', 'SUP006', 'S0013');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2061', TO_DATE('2026-04-22', 'YYYY-MM-DD'), TO_DATE('2026-04-25', 'YYYY-MM-DD'), TO_DATE('2026-04-23', 'YYYY-MM-DD'), 1541.95, 'RECEIVED', 'SUP003', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2062', TO_DATE('2026-04-23', 'YYYY-MM-DD'), TO_DATE('2026-04-26', 'YYYY-MM-DD'), TO_DATE('2026-04-24', 'YYYY-MM-DD'), 563.06, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2063', TO_DATE('2026-04-24', 'YYYY-MM-DD'), TO_DATE('2026-04-29', 'YYYY-MM-DD'), TO_DATE('2026-05-02', 'YYYY-MM-DD'), 760.5, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2064', TO_DATE('2026-04-28', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), TO_DATE('2026-04-29', 'YYYY-MM-DD'), 442.22, 'RECEIVED', 'SUP002', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2065', TO_DATE('2026-04-28', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), TO_DATE('2026-04-30', 'YYYY-MM-DD'), 144.67, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2066', TO_DATE('2026-04-30', 'YYYY-MM-DD'), TO_DATE('2026-05-05', 'YYYY-MM-DD'), TO_DATE('2026-05-04', 'YYYY-MM-DD'), 808.5, 'RECEIVED', 'SUP007', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2067', TO_DATE('2026-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-04', 'YYYY-MM-DD'), TO_DATE('2026-05-02', 'YYYY-MM-DD'), 991.5, 'RECEIVED', 'SUP003', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2068', TO_DATE('2026-05-02', 'YYYY-MM-DD'), TO_DATE('2026-05-05', 'YYYY-MM-DD'), TO_DATE('2026-05-05', 'YYYY-MM-DD'), 73.5, 'RECEIVED', 'SUP001', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2069', TO_DATE('2026-05-05', 'YYYY-MM-DD'), TO_DATE('2026-05-08', 'YYYY-MM-DD'), TO_DATE('2026-05-08', 'YYYY-MM-DD'), 227.44, 'RECEIVED', 'SUP002', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2070', TO_DATE('2026-05-06', 'YYYY-MM-DD'), TO_DATE('2026-05-14', 'YYYY-MM-DD'), TO_DATE('2026-05-18', 'YYYY-MM-DD'), 1927.5, 'RECEIVED', 'SUP008', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2071', TO_DATE('2026-05-06', 'YYYY-MM-DD'), TO_DATE('2026-05-11', 'YYYY-MM-DD'), TO_DATE('2026-05-14', 'YYYY-MM-DD'), 35.0, 'RECEIVED', 'SUP007', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2072', TO_DATE('2026-05-07', 'YYYY-MM-DD'), TO_DATE('2026-05-10', 'YYYY-MM-DD'), TO_DATE('2026-05-10', 'YYYY-MM-DD'), 228.0, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2073', TO_DATE('2026-05-08', 'YYYY-MM-DD'), TO_DATE('2026-05-13', 'YYYY-MM-DD'), TO_DATE('2026-05-12', 'YYYY-MM-DD'), 195.5, 'RECEIVED', 'SUP007', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2074', TO_DATE('2026-05-08', 'YYYY-MM-DD'), TO_DATE('2026-05-11', 'YYYY-MM-DD'), TO_DATE('2026-05-12', 'YYYY-MM-DD'), 1101.94, 'RECEIVED', 'SUP003', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2075', TO_DATE('2026-05-08', 'YYYY-MM-DD'), TO_DATE('2026-05-11', 'YYYY-MM-DD'), TO_DATE('2026-05-12', 'YYYY-MM-DD'), 70.0, 'RECEIVED', 'SUP003', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2076', TO_DATE('2026-05-10', 'YYYY-MM-DD'), TO_DATE('2026-05-13', 'YYYY-MM-DD'), TO_DATE('2026-05-13', 'YYYY-MM-DD'), 182.2, 'RECEIVED', 'SUP002', 'S0012');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2077', TO_DATE('2026-05-10', 'YYYY-MM-DD'), TO_DATE('2026-05-13', 'YYYY-MM-DD'), TO_DATE('2026-05-12', 'YYYY-MM-DD'), 1567.24, 'RECEIVED', 'SUP001', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2078', TO_DATE('2026-05-11', 'YYYY-MM-DD'), TO_DATE('2026-05-16', 'YYYY-MM-DD'), TO_DATE('2026-05-18', 'YYYY-MM-DD'), 1104.4, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2079', TO_DATE('2026-05-11', 'YYYY-MM-DD'), TO_DATE('2026-05-19', 'YYYY-MM-DD'), TO_DATE('2026-05-22', 'YYYY-MM-DD'), 298.0, 'RECEIVED', 'SUP008', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2080', TO_DATE('2026-05-12', 'YYYY-MM-DD'), TO_DATE('2026-05-15', 'YYYY-MM-DD'), TO_DATE('2026-05-14', 'YYYY-MM-DD'), 785.8, 'RECEIVED', 'SUP002', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2081', TO_DATE('2026-05-14', 'YYYY-MM-DD'), TO_DATE('2026-05-17', 'YYYY-MM-DD'), TO_DATE('2026-05-17', 'YYYY-MM-DD'), 716.52, 'RECEIVED', 'SUP001', 'S0020');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2082', TO_DATE('2026-05-16', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), TO_DATE('2026-05-26', 'YYYY-MM-DD'), 1961.16, 'RECEIVED', 'SUP009', 'S0002');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2083', TO_DATE('2026-05-16', 'YYYY-MM-DD'), TO_DATE('2026-05-19', 'YYYY-MM-DD'), TO_DATE('2026-05-19', 'YYYY-MM-DD'), 1297.32, 'RECEIVED', 'SUP003', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2084', TO_DATE('2026-05-17', 'YYYY-MM-DD'), TO_DATE('2026-05-22', 'YYYY-MM-DD'), TO_DATE('2026-05-21', 'YYYY-MM-DD'), 129.4, 'RECEIVED', 'SUP004', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2085', TO_DATE('2026-05-18', 'YYYY-MM-DD'), TO_DATE('2026-05-21', 'YYYY-MM-DD'), TO_DATE('2026-05-22', 'YYYY-MM-DD'), 35.0, 'RECEIVED', 'SUP001', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2086', TO_DATE('2026-05-19', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), 66.0, 'RECEIVED', 'SUP005', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2087', TO_DATE('2026-05-19', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), TO_DATE('2026-05-27', 'YYYY-MM-DD'), 205.64, 'RECEIVED', 'SUP005', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2088', TO_DATE('2026-05-19', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), TO_DATE('2026-05-27', 'YYYY-MM-DD'), 328.0, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2089', TO_DATE('2026-05-19', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), TO_DATE('2026-05-25', 'YYYY-MM-DD'), 291.5, 'RECEIVED', 'SUP005', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2090', TO_DATE('2026-05-21', 'YYYY-MM-DD'), TO_DATE('2026-05-29', 'YYYY-MM-DD'), TO_DATE('2026-06-04', 'YYYY-MM-DD'), 96.0, 'RECEIVED', 'SUP009', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2091', TO_DATE('2026-05-21', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), 115.5, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2092', TO_DATE('2026-05-21', 'YYYY-MM-DD'), TO_DATE('2026-05-24', 'YYYY-MM-DD'), TO_DATE('2026-05-25', 'YYYY-MM-DD'), 974.57, 'RECEIVED', 'SUP002', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2093', TO_DATE('2026-05-21', 'YYYY-MM-DD'), TO_DATE('2026-05-26', 'YYYY-MM-DD'), TO_DATE('2026-05-29', 'YYYY-MM-DD'), 952.5, 'RECEIVED', 'SUP007', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2094', TO_DATE('2026-05-23', 'YYYY-MM-DD'), TO_DATE('2026-05-26', 'YYYY-MM-DD'), TO_DATE('2026-05-27', 'YYYY-MM-DD'), 311.5, 'RECEIVED', 'SUP002', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2095', TO_DATE('2026-05-23', 'YYYY-MM-DD'), TO_DATE('2026-05-28', 'YYYY-MM-DD'), TO_DATE('2026-05-27', 'YYYY-MM-DD'), 973.64, 'RECEIVED', 'SUP006', 'S0050');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2096', TO_DATE('2026-05-23', 'YYYY-MM-DD'), TO_DATE('2026-05-26', 'YYYY-MM-DD'), TO_DATE('2026-05-25', 'YYYY-MM-DD'), 1968.0, 'RECEIVED', 'SUP003', 'S0018');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2097', TO_DATE('2026-05-25', 'YYYY-MM-DD'), TO_DATE('2026-05-28', 'YYYY-MM-DD'), TO_DATE('2026-05-29', 'YYYY-MM-DD'), 56.5, 'RECEIVED', 'SUP001', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2098', TO_DATE('2026-05-25', 'YYYY-MM-DD'), TO_DATE('2026-05-30', 'YYYY-MM-DD'), TO_DATE('2026-05-31', 'YYYY-MM-DD'), 383.0, 'RECEIVED', 'SUP006', 'S0036');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2099', TO_DATE('2026-05-26', 'YYYY-MM-DD'), TO_DATE('2026-05-31', 'YYYY-MM-DD'), TO_DATE('2026-05-30', 'YYYY-MM-DD'), 326.0, 'RECEIVED', 'SUP004', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2100', TO_DATE('2026-05-26', 'YYYY-MM-DD'), TO_DATE('2026-05-29', 'YYYY-MM-DD'), TO_DATE('2026-05-28', 'YYYY-MM-DD'), 146.68, 'RECEIVED', 'SUP002', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2101', TO_DATE('2026-05-27', 'YYYY-MM-DD'), TO_DATE('2026-06-04', 'YYYY-MM-DD'), TO_DATE('2026-06-07', 'YYYY-MM-DD'), 1125.74, 'RECEIVED', 'SUP010', 'S0004');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2102', TO_DATE('2026-05-27', 'YYYY-MM-DD'), TO_DATE('2026-05-30', 'YYYY-MM-DD'), TO_DATE('2026-05-30', 'YYYY-MM-DD'), 115.5, 'RECEIVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2103', TO_DATE('2026-05-27', 'YYYY-MM-DD'), TO_DATE('2026-06-01', 'YYYY-MM-DD'), TO_DATE('2026-06-02', 'YYYY-MM-DD'), 289.36, 'RECEIVED', 'SUP006', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2104', TO_DATE('2026-05-28', 'YYYY-MM-DD'), TO_DATE('2026-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-04', 'YYYY-MM-DD'), 43.2, 'RECEIVED', 'SUP004', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2105', TO_DATE('2026-05-29', 'YYYY-MM-DD'), TO_DATE('2026-06-03', 'YYYY-MM-DD'), TO_DATE('2026-06-03', 'YYYY-MM-DD'), 221.24, 'RECEIVED', 'SUP004', 'S0074');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2106', TO_DATE('2026-05-30', 'YYYY-MM-DD'), TO_DATE('2026-06-04', 'YYYY-MM-DD'), TO_DATE('2026-06-05', 'YYYY-MM-DD'), 110.4, 'RECEIVED', 'SUP006', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2107', TO_DATE('2026-05-30', 'YYYY-MM-DD'), TO_DATE('2026-06-07', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), 758.24, 'RECEIVED', 'SUP008', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2108', TO_DATE('2026-05-30', 'YYYY-MM-DD'), TO_DATE('2026-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-03', 'YYYY-MM-DD'), 257.5, 'RECEIVED', 'SUP001', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2109', TO_DATE('2026-05-30', 'YYYY-MM-DD'), TO_DATE('2026-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-02', 'YYYY-MM-DD'), 122.1, 'RECEIVED', 'SUP002', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2110', TO_DATE('2026-05-31', 'YYYY-MM-DD'), TO_DATE('2026-06-05', 'YYYY-MM-DD'), TO_DATE('2026-06-06', 'YYYY-MM-DD'), 1221.01, 'RECEIVED', 'SUP004', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2111', TO_DATE('2026-05-31', 'YYYY-MM-DD'), TO_DATE('2026-06-08', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), 871.5, 'RECEIVED', 'SUP008', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2112', TO_DATE('2026-05-31', 'YYYY-MM-DD'), TO_DATE('2026-06-03', 'YYYY-MM-DD'), TO_DATE('2026-06-02', 'YYYY-MM-DD'), 681.0, 'RECEIVED', 'SUP003', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2113', TO_DATE('2026-06-01', 'YYYY-MM-DD'), TO_DATE('2026-06-06', 'YYYY-MM-DD'), TO_DATE('2026-06-08', 'YYYY-MM-DD'), 357.5, 'RECEIVED', 'SUP007', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2114', TO_DATE('2026-06-02', 'YYYY-MM-DD'), TO_DATE('2026-06-05', 'YYYY-MM-DD'), TO_DATE('2026-06-03', 'YYYY-MM-DD'), 685.0, 'RECEIVED', 'SUP003', 'S0044');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2115', TO_DATE('2026-06-03', 'YYYY-MM-DD'), TO_DATE('2026-06-06', 'YYYY-MM-DD'), TO_DATE('2026-06-07', 'YYYY-MM-DD'), 235.0, 'RECEIVED', 'SUP003', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2116', TO_DATE('2026-06-04', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), TO_DATE('2026-06-16', 'YYYY-MM-DD'), 366.5, 'RECEIVED', 'SUP010', 'S0029');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2117', TO_DATE('2026-06-04', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), TO_DATE('2026-06-13', 'YYYY-MM-DD'), 290.0, 'RECEIVED', 'SUP009', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2118', TO_DATE('2026-06-05', 'YYYY-MM-DD'), TO_DATE('2026-06-08', 'YYYY-MM-DD'), TO_DATE('2026-06-06', 'YYYY-MM-DD'), 115.04, 'RECEIVED', 'SUP002', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2119', TO_DATE('2026-06-06', 'YYYY-MM-DD'), TO_DATE('2026-06-14', 'YYYY-MM-DD'), TO_DATE('2026-06-15', 'YYYY-MM-DD'), 458.13, 'RECEIVED', 'SUP010', 'S0051');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2120', TO_DATE('2026-06-08', 'YYYY-MM-DD'), TO_DATE('2026-06-16', 'YYYY-MM-DD'), TO_DATE('2026-06-22', 'YYYY-MM-DD'), 270.0, 'RECEIVED', 'SUP011', 'S0042');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2121', TO_DATE('2026-06-09', 'YYYY-MM-DD'), TO_DATE('2026-06-14', 'YYYY-MM-DD'), TO_DATE('2026-06-17', 'YYYY-MM-DD'), 436.0, 'RECEIVED', 'SUP006', 'S0061');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2122', TO_DATE('2026-06-09', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), TO_DATE('2026-06-10', 'YYYY-MM-DD'), 282.5, 'RECEIVED', 'SUP002', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2123', TO_DATE('2026-06-10', 'YYYY-MM-DD'), TO_DATE('2026-06-18', 'YYYY-MM-DD'), TO_DATE('2026-06-21', 'YYYY-MM-DD'), 535.0, 'RECEIVED', 'SUP009', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2124', TO_DATE('2026-06-11', 'YYYY-MM-DD'), TO_DATE('2026-06-14', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), 746.0, 'RECEIVED', 'SUP003', 'S0026');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2125', TO_DATE('2026-06-12', 'YYYY-MM-DD'), TO_DATE('2026-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-16', 'YYYY-MM-DD'), 279.24, 'RECEIVED', 'SUP005', 'S0060');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2126', TO_DATE('2026-06-12', 'YYYY-MM-DD'), TO_DATE('2026-06-15', 'YYYY-MM-DD'), TO_DATE('2026-06-14', 'YYYY-MM-DD'), 116.0, 'RECEIVED', 'SUP002', 'S0028');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2127', TO_DATE('2026-06-13', 'YYYY-MM-DD'), TO_DATE('2026-06-18', 'YYYY-MM-DD'), TO_DATE('2026-06-21', 'YYYY-MM-DD'), 111.0, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2128', TO_DATE('2026-06-13', 'YYYY-MM-DD'), TO_DATE('2026-06-21', 'YYYY-MM-DD'), TO_DATE('2026-06-23', 'YYYY-MM-DD'), 23.0, 'RECEIVED', 'SUP011', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2129', TO_DATE('2026-06-14', 'YYYY-MM-DD'), TO_DATE('2026-06-22', 'YYYY-MM-DD'), TO_DATE('2026-06-27', 'YYYY-MM-DD'), 1154.5, 'RECEIVED', 'SUP011', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2130', TO_DATE('2026-06-14', 'YYYY-MM-DD'), TO_DATE('2026-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-16', 'YYYY-MM-DD'), 804.0, 'RECEIVED', 'SUP001', 'S0077');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2131', TO_DATE('2026-06-14', 'YYYY-MM-DD'), TO_DATE('2026-06-19', 'YYYY-MM-DD'), TO_DATE('2026-06-18', 'YYYY-MM-DD'), 109.0, 'RECEIVED', 'SUP005', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2132', TO_DATE('2026-06-15', 'YYYY-MM-DD'), NULL, NULL, 77.5, 'PENDING', 'SUP003', 'S0035');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2133', TO_DATE('2026-06-15', 'YYYY-MM-DD'), TO_DATE('2026-06-20', 'YYYY-MM-DD'), TO_DATE('2026-06-20', 'YYYY-MM-DD'), 44.0, 'RECEIVED', 'SUP006', 'S0027');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2134', TO_DATE('2026-06-16', 'YYYY-MM-DD'), TO_DATE('2026-06-21', 'YYYY-MM-DD'), TO_DATE('2026-06-23', 'YYYY-MM-DD'), 520.0, 'RECEIVED', 'SUP004', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2135', TO_DATE('2026-06-16', 'YYYY-MM-DD'), TO_DATE('2026-06-19', 'YYYY-MM-DD'), TO_DATE('2026-06-19', 'YYYY-MM-DD'), 66.0, 'RECEIVED', 'SUP002', 'S0043');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2136', TO_DATE('2026-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-20', 'YYYY-MM-DD'), TO_DATE('2026-06-19', 'YYYY-MM-DD'), 187.1, 'RECEIVED', 'SUP003', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2137', TO_DATE('2026-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-22', 'YYYY-MM-DD'), TO_DATE('2026-06-25', 'YYYY-MM-DD'), 85.2, 'RECEIVED', 'SUP004', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2138', TO_DATE('2026-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-20', 'YYYY-MM-DD'), TO_DATE('2026-06-21', 'YYYY-MM-DD'), 674.03, 'RECEIVED', 'SUP003', 'S0075');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2139', TO_DATE('2026-06-19', 'YYYY-MM-DD'), NULL, NULL, 192.0, 'PENDING', 'SUP002', 'S0076');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2140', TO_DATE('2026-06-19', 'YYYY-MM-DD'), TO_DATE('2026-06-24', 'YYYY-MM-DD'), TO_DATE('2026-06-23', 'YYYY-MM-DD'), 1040.0, 'RECEIVED', 'SUP005', 'S0019');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2141', TO_DATE('2026-06-19', 'YYYY-MM-DD'), TO_DATE('2026-06-22', 'YYYY-MM-DD'), TO_DATE('2026-06-20', 'YYYY-MM-DD'), 77.5, 'RECEIVED', 'SUP003', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2142', TO_DATE('2026-06-20', 'YYYY-MM-DD'), TO_DATE('2026-06-25', 'YYYY-MM-DD'), TO_DATE('2026-06-27', 'YYYY-MM-DD'), 105.4, 'RECEIVED', 'SUP004', 'S0058');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2143', TO_DATE('2026-06-21', 'YYYY-MM-DD'), TO_DATE('2026-06-29', 'YYYY-MM-DD'), NULL, 327.0, 'APPROVED', 'SUP009', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2144', TO_DATE('2026-06-23', 'YYYY-MM-DD'), TO_DATE('2026-06-28', 'YYYY-MM-DD'), TO_DATE('2026-06-29', 'YYYY-MM-DD'), 3693.0, 'RECEIVED', 'SUP005', 'S0052');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2145', TO_DATE('2026-06-23', 'YYYY-MM-DD'), TO_DATE('2026-06-26', 'YYYY-MM-DD'), TO_DATE('2026-06-24', 'YYYY-MM-DD'), 421.28, 'RECEIVED', 'SUP002', 'S0011');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2146', TO_DATE('2026-06-23', 'YYYY-MM-DD'), TO_DATE('2026-06-26', 'YYYY-MM-DD'), TO_DATE('2026-06-24', 'YYYY-MM-DD'), 354.15, 'RECEIVED', 'SUP002', 'S0037');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2147', TO_DATE('2026-06-24', 'YYYY-MM-DD'), TO_DATE('2026-06-27', 'YYYY-MM-DD'), NULL, 342.0, 'APPROVED', 'SUP001', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2148', TO_DATE('2026-06-26', 'YYYY-MM-DD'), TO_DATE('2026-07-01', 'YYYY-MM-DD'), TO_DATE('2026-06-30', 'YYYY-MM-DD'), 353.21, 'RECEIVED', 'SUP007', 'S0066');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2149', TO_DATE('2026-06-26', 'YYYY-MM-DD'), NULL, NULL, 113.5, 'PENDING', 'SUP006', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2150', TO_DATE('2026-06-26', 'YYYY-MM-DD'), TO_DATE('2026-06-29', 'YYYY-MM-DD'), TO_DATE('2026-06-28', 'YYYY-MM-DD'), 62.0, 'RECEIVED', 'SUP002', 'S0083');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2151', TO_DATE('2026-06-27', 'YYYY-MM-DD'), TO_DATE('2026-07-05', 'YYYY-MM-DD'), TO_DATE('2026-06-30', 'YYYY-MM-DD'), 331.0, 'RECEIVED', 'SUP008', 'S0084');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2152', TO_DATE('2026-06-27', 'YYYY-MM-DD'), TO_DATE('2026-07-05', 'YYYY-MM-DD'), TO_DATE('2026-06-30', 'YYYY-MM-DD'), 2156.22, 'RECEIVED', 'SUP008', 'S0069');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2153', TO_DATE('2026-06-28', 'YYYY-MM-DD'), TO_DATE('2026-07-03', 'YYYY-MM-DD'), TO_DATE('2026-06-30', 'YYYY-MM-DD'), 219.18, 'RECEIVED', 'SUP004', 'S0053');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2154', TO_DATE('2026-06-29', 'YYYY-MM-DD'), TO_DATE('2026-07-02', 'YYYY-MM-DD'), TO_DATE('2026-06-30', 'YYYY-MM-DD'), 482.0, 'RECEIVED', 'SUP003', 'S0010');
INSERT INTO Purchase_Orders (PurchaseOrderID, OrderDate, ExpectedDeliveryDate, ReceivedDate, TotalAmount, Status, SupplierID, StaffID)
VALUES ('PO2155', TO_DATE('2026-06-29', 'YYYY-MM-DD'), TO_DATE('2026-07-02', 'YYYY-MM-DD'), NULL, 965.0, 'APPROVED', 'SUP001', 'S0005');

COMMIT;
