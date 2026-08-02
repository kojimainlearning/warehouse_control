-- Branchs Data
INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B001', 'Ampang 88 Speedmart', '512 Jalan Padungan', 'Ampang', 'Selangor', '68000', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B002', 'Cheras 88 Speedmart', '491 Persiaran Shah Alam', 'Cheras', 'Kuala Lumpur', '56000', TO_DATE('2020-04-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B003', 'Petaling Jaya 88 Speedmart', '502 Jalan Hang Tuah', 'Petaling Jaya', 'Selangor', '47300', TO_DATE('2020-07-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B004', 'Shah Alam 88 Speedmart', '944 Jalan Tebrau', 'Shah Alam', 'Selangor', '40000', TO_DATE('2020-10-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B005', 'Klang 88 Speedmart', '849 Jalan Cheras', 'Klang', 'Selangor', '41000', TO_DATE('2021-01-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B006', 'Johor Bahru 88 Speedmart', '214 Jalan PJU', 'Johor Bahru', 'Johor', '80000', TO_DATE('2021-04-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B007', 'Ipoh 88 Speedmart', '660 Jalan Penang', 'Ipoh', 'Perak', '30000', TO_DATE('2021-07-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B008', 'George Town 88 Speedmart', '876 Jalan Padungan', 'George Town', 'Penang', '10000', TO_DATE('2021-10-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B009', 'Seremban 88 Speedmart', '994 Jalan Ampang', 'Seremban', 'Negeri Sembilan', '70000', TO_DATE('2022-01-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B010', 'Melaka 88 Speedmart', '970 Jalan Cheras', 'Melaka', 'Melaka', '75000', TO_DATE('2022-06-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B011', 'Kota Kinabalu 88 Speedmart', '924 Jalan Cheras', 'Kota Kinabalu', 'Sabah', '88000', TO_DATE('2023-01-01','YYYY-MM-DD'), NULL);

INSERT INTO Branches (BranchID, BranchName, Address, City, State, PostCode, OpeningDate, ClosingDate)
VALUES ('B012', 'Kuching 88 Speedmart', '963 Jalan Cheras', 'Kuching', 'Sarawak', '93000', TO_DATE('2023-06-30','YYYY-MM-DD'), TO_DATE('2025-09-01','YYYY-MM-DD'));


-- Staffs Data
INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0001', 'Azman Othman', 'ADMIN', 'azman.othman@gmail.com', '+60198627103', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL, 'B001');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0002', 'Azman Zulkifli', 'MANAGER', 'azman.zulkifli@gmail.com', '+60132946409', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL, 'B001');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0003', 'Rosli Yusof', 'MANAGER', 'rosli.yusof@speedmart.com.my', '+60131615411', TO_DATE('2020-01-01','YYYY-MM-DD'), TO_DATE('2022-09-01','YYYY-MM-DD'), 'B001');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0004', 'Hassan Ibrahim', 'STOCK_STAFF', 'hassan.ibrahim@yahoo.com', '+60132728942', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL, 'B001');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0005', 'Mohd Yusof', 'STOCK_STAFF', 'mohd.yusof@yahoo.com', '+60100920851', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL, 'B001');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0006', 'Liyana Hassan', 'CASHIER', 'liyana.hassan@speedmart.com.my', '+60128318536', TO_DATE('2020-01-01','YYYY-MM-DD'), NULL, 'B001');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0007', 'Rosli Ibrahim', 'CASHIER', 'rosli.ibrahim@shop.com', '+60193118630', TO_DATE('2020-01-01','YYYY-MM-DD'), TO_DATE('2023-06-15','YYYY-MM-DD'), 'B001');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0008', 'Hassan Hussein', 'CASHIER', 'hassan.hussein@outlook.com', '+60138480851', TO_DATE('2020-03-01','YYYY-MM-DD'), NULL, 'B001');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0009', 'Liyana Razak', 'ADMIN', 'liyana.razak@gmail.com', '+60166430060', TO_DATE('2020-04-01','YYYY-MM-DD'), NULL, 'B002');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0010', 'Ahmad Razak', 'MANAGER', 'ahmad.razak@gmail.com', '+60193233139', TO_DATE('2020-04-01','YYYY-MM-DD'), NULL, 'B002');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0011', 'Rohani Abdullah', 'MANAGER', 'rohani.abdullah@gmail.com', '+60183752745', TO_DATE('2020-04-01','YYYY-MM-DD'), NULL, 'B002');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0012', 'Ali Ibrahim', 'STOCK_STAFF', 'ali.ibrahim@outlook.com', '+60142467119', TO_DATE('2020-04-01','YYYY-MM-DD'), NULL, 'B002');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0013', 'Khalid Razak', 'STOCK_STAFF', 'khalid.razak@yahoo.com', '+60131009427', TO_DATE('2020-04-01','YYYY-MM-DD'), NULL, 'B002');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0014', 'Hassan Razak', 'CASHIER', 'hassan.razak@gmail.com', '+60135605738', TO_DATE('2020-04-01','YYYY-MM-DD'), NULL, 'B002');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0015', 'Mohd Hassan', 'CASHIER', 'mohd.hassan@yahoo.com', '+60199014900', TO_DATE('2020-04-01','YYYY-MM-DD'), NULL, 'B002');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0016', 'Khalid Abdullah', 'CASHIER', 'khalid.abdullah@yahoo.com', '+60161722075', TO_DATE('2020-06-01','YYYY-MM-DD'), NULL, 'B002');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0017', 'Nor Zulkifli', 'ADMIN', 'nor.zulkifli@yahoo.com', '+60147753092', TO_DATE('2020-07-01','YYYY-MM-DD'), NULL, 'B003');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0018', 'Siti Hassan', 'MANAGER', 'siti.hassan@speedmart.com.my', '+60112896083', TO_DATE('2020-07-01','YYYY-MM-DD'), NULL, 'B003');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0019', 'Ali Yusof', 'MANAGER', 'ali.yusof@speedmart.com.my', '+60194567026', TO_DATE('2020-07-01','YYYY-MM-DD'), NULL, 'B003');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0020', 'Azman Ahmad', 'STOCK_STAFF', 'azman.ahmad@speedmart.com.my', '+60178384656', TO_DATE('2020-07-01','YYYY-MM-DD'), NULL, 'B003');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0021', 'Rohani Hussein', 'STOCK_STAFF', 'rohani.hussein@speedmart.com.my', '+60138171560', TO_DATE('2020-07-01','YYYY-MM-DD'), TO_DATE('2025-11-01','YYYY-MM-DD'), 'B003');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0022', 'Mohd Abdullah', 'CASHIER', 'mohd.abdullah@shop.com', '+60193902521', TO_DATE('2020-07-01','YYYY-MM-DD'), NULL, 'B003');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0023', 'Siti Salleh', 'CASHIER', 'siti.salleh@yahoo.com', '+60129115857', TO_DATE('2020-07-01','YYYY-MM-DD'), NULL, 'B003');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0024', 'Fairuz Abdullah', 'CASHIER', 'fairuz.abdullah@outlook.com', '+60110289526', TO_DATE('2020-09-01','YYYY-MM-DD'), NULL, 'B003');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0025', 'Khalid Ibrahim', 'ADMIN', 'khalid.ibrahim@outlook.com', '+60124498156', TO_DATE('2020-10-01','YYYY-MM-DD'), NULL, 'B004');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0026', 'Fatimah Zulkifli', 'MANAGER', 'fatimah.zulkifli@gmail.com', '+60180392700', TO_DATE('2020-10-01','YYYY-MM-DD'), NULL, 'B004');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0027', 'Nor Yusof', 'MANAGER', 'nor.yusof@yahoo.com', '+60146967338', TO_DATE('2020-10-01','YYYY-MM-DD'), NULL, 'B004');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0028', 'Liyana Hussein', 'STOCK_STAFF', 'liyana.hussein@gmail.com', '+60142433454', TO_DATE('2020-10-01','YYYY-MM-DD'), NULL, 'B004');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0029', 'Fatimah Othman', 'STOCK_STAFF', 'fatimah.othman@shop.com', '+60134419154', TO_DATE('2020-10-01','YYYY-MM-DD'), NULL, 'B004');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0030', 'Ismail Razak', 'CASHIER', 'ismail.razak@speedmart.com.my', '+60135611703', TO_DATE('2020-10-01','YYYY-MM-DD'), NULL, 'B004');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0031', 'Rosli Othman', 'CASHIER', 'rosli.othman@shop.com', '+60176989419', TO_DATE('2020-10-01','YYYY-MM-DD'), NULL, 'B004');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0032', 'Fatimah Hassan', 'CASHIER', 'fatimah.hassan@speedmart.com.my', '+60142300528', TO_DATE('2020-12-01','YYYY-MM-DD'), NULL, 'B004');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0033', 'Ali Zulkifli', 'ADMIN', 'ali.zulkifli@outlook.com', '+60107816586', TO_DATE('2021-01-01','YYYY-MM-DD'), NULL, 'B005');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0034', 'Nur Ali', 'MANAGER', 'nur.ali@shop.com', '+60142710697', TO_DATE('2021-01-01','YYYY-MM-DD'), TO_DATE('2023-10-01','YYYY-MM-DD'), 'B005');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0035', 'Ali Ali', 'MANAGER', 'ali.ali@yahoo.com', '+60106696164', TO_DATE('2021-01-01','YYYY-MM-DD'), NULL, 'B005');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0036', 'Ismail Hassan', 'STOCK_STAFF', 'ismail.hassan@speedmart.com.my', '+60126473387', TO_DATE('2021-01-01','YYYY-MM-DD'), NULL, 'B005');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0037', 'Zainal Ibrahim', 'STOCK_STAFF', 'zainal.ibrahim@outlook.com', '+60100793414', TO_DATE('2021-01-01','YYYY-MM-DD'), NULL, 'B005');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0038', 'Fairuz Salleh', 'CASHIER', 'fairuz.salleh@outlook.com', '+60116146186', TO_DATE('2021-01-01','YYYY-MM-DD'), NULL, 'B005');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0039', 'Rosli Ahmad', 'CASHIER', 'rosli.ahmad@outlook.com', '+60178451818', TO_DATE('2021-01-01','YYYY-MM-DD'), TO_DATE('2025-04-01','YYYY-MM-DD'), 'B005');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0040', 'Fatimah Abdullah', 'CASHIER', 'fatimah.abdullah@speedmart.com.my', '+60107385138', TO_DATE('2021-03-01','YYYY-MM-DD'), NULL, 'B005');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0041', 'Mohd Ahmad', 'ADMIN', 'mohd.ahmad@yahoo.com', '+60177743600', TO_DATE('2021-04-01','YYYY-MM-DD'), NULL, 'B006');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0042', 'Rohani Salleh', 'MANAGER', 'rohani.salleh@yahoo.com', '+60100941403', TO_DATE('2021-04-01','YYYY-MM-DD'), NULL, 'B006');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0043', 'Zainal Ali', 'MANAGER', 'zainal.ali@yahoo.com', '+60105733379', TO_DATE('2021-04-01','YYYY-MM-DD'), NULL, 'B006');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0044', 'Fatimah Hussein', 'STOCK_STAFF', 'fatimah.hussein@yahoo.com', '+60116961944', TO_DATE('2021-04-01','YYYY-MM-DD'), NULL, 'B006');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0045', 'Fairuz Zulkifli', 'STOCK_STAFF', 'fairuz.zulkifli@yahoo.com', '+60170655154', TO_DATE('2021-04-01','YYYY-MM-DD'), TO_DATE('2025-01-01','YYYY-MM-DD'), 'B006');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0046', 'Nur Salleh', 'CASHIER', 'nur.salleh@yahoo.com', '+60123931321', TO_DATE('2021-04-01','YYYY-MM-DD'), TO_DATE('2025-06-01','YYYY-MM-DD'), 'B006');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0047', 'Ismail Hussein', 'CASHIER', 'ismail.hussein@shop.com', '+60130503057', TO_DATE('2021-04-01','YYYY-MM-DD'), NULL, 'B006');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0048', 'Ahmad Ahmad', 'CASHIER', 'ahmad.ahmad@yahoo.com', '+60170806568', TO_DATE('2021-06-01','YYYY-MM-DD'), NULL, 'B006');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0049', 'Mohd Hussein', 'ADMIN', 'mohd.hussein@gmail.com', '+60161814426', TO_DATE('2021-07-01','YYYY-MM-DD'), NULL, 'B007');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0050', 'Nor Ibrahim', 'MANAGER', 'nor.ibrahim@gmail.com', '+60168222570', TO_DATE('2021-07-01','YYYY-MM-DD'), NULL, 'B007');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0051', 'Ismail Yusof', 'MANAGER', 'ismail.yusof@outlook.com', '+60196991231', TO_DATE('2021-07-01','YYYY-MM-DD'), NULL, 'B007');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0052', 'Azman Ali', 'STOCK_STAFF', 'azman.ali@shop.com', '+60102616421', TO_DATE('2021-07-01','YYYY-MM-DD'), NULL, 'B007');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0053', 'Fatimah Ibrahim', 'STOCK_STAFF', 'fatimah.ibrahim@gmail.com', '+60119122013', TO_DATE('2021-07-01','YYYY-MM-DD'), NULL, 'B007');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0054', 'Nor Salleh', 'CASHIER', 'nor.salleh@shop.com', '+60139182803', TO_DATE('2021-07-01','YYYY-MM-DD'), NULL, 'B007');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0055', 'Mohd Salleh', 'CASHIER', 'mohd.salleh@shop.com', '+60179925346', TO_DATE('2021-07-01','YYYY-MM-DD'), NULL, 'B007');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0056', 'Rosli Hussein', 'CASHIER', 'rosli.hussein@yahoo.com', '+60143495007', TO_DATE('2021-09-01','YYYY-MM-DD'), TO_DATE('2025-07-15','YYYY-MM-DD'), 'B007');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0057', 'Azman Hussein', 'ADMIN', 'azman.hussein@outlook.com', '+60173738595', TO_DATE('2021-10-01','YYYY-MM-DD'), NULL, 'B008');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0058', 'Siti Zulkifli', 'MANAGER', 'siti.zulkifli@shop.com', '+60107715859', TO_DATE('2021-10-01','YYYY-MM-DD'), NULL, 'B008');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0059', 'Rohani Ali', 'MANAGER', 'rohani.ali@outlook.com', '+60146792578', TO_DATE('2021-10-01','YYYY-MM-DD'), NULL, 'B008');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0060', 'Ismail Othman', 'STOCK_STAFF', 'ismail.othman@speedmart.com.my', '+60107851162', TO_DATE('2021-10-01','YYYY-MM-DD'), NULL, 'B008');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0061', 'Ali Salleh', 'STOCK_STAFF', 'ali.salleh@speedmart.com.my', '+60100239232', TO_DATE('2021-10-01','YYYY-MM-DD'), NULL, 'B008');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0062', 'Ali Othman', 'CASHIER', 'ali.othman@yahoo.com', '+60165867964', TO_DATE('2021-10-01','YYYY-MM-DD'), TO_DATE('2025-07-01','YYYY-MM-DD'), 'B008');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0063', 'Ali Hassan', 'CASHIER', 'ali.hassan@speedmart.com.my', '+60164197935', TO_DATE('2021-10-01','YYYY-MM-DD'), NULL, 'B008');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0064', 'Nor Razak', 'CASHIER', 'nor.razak@yahoo.com', '+60115036057', TO_DATE('2021-12-01','YYYY-MM-DD'), TO_DATE('2025-11-15','YYYY-MM-DD'), 'B008');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0065', 'Rosli Hassan', 'ADMIN', 'rosli.hassan@outlook.com', '+60125814483', TO_DATE('2022-01-01','YYYY-MM-DD'), NULL, 'B009');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0066', 'Khalid Ahmad', 'MANAGER', 'khalid.ahmad@yahoo.com', '+60113793871', TO_DATE('2022-01-01','YYYY-MM-DD'), NULL, 'B009');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0067', 'Nur Zulkifli', 'MANAGER', 'nur.zulkifli@shop.com', '+60161929096', TO_DATE('2022-01-01','YYYY-MM-DD'), TO_DATE('2024-03-15','YYYY-MM-DD'), 'B009');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0068', 'Siti Yusof', 'STOCK_STAFF', 'siti.yusof@yahoo.com', '+60121013005', TO_DATE('2022-01-01','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'B009');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0069', 'Khalid Zulkifli', 'STOCK_STAFF', 'khalid.zulkifli@shop.com', '+60161222620', TO_DATE('2022-01-01','YYYY-MM-DD'), NULL, 'B009');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0070', 'Ahmad Hussein', 'CASHIER', 'ahmad.hussein@shop.com', '+60109609133', TO_DATE('2022-01-01','YYYY-MM-DD'), NULL, 'B009');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0071', 'Khalid Hassan', 'CASHIER', 'khalid.hassan@outlook.com', '+60123735373', TO_DATE('2022-01-01','YYYY-MM-DD'), NULL, 'B009');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0072', 'Fairuz Hussein', 'CASHIER', 'fairuz.hussein@shop.com', '+60101991012', TO_DATE('2022-04-01','YYYY-MM-DD'), NULL, 'B009');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0073', 'Fairuz Ibrahim', 'ADMIN', 'fairuz.ibrahim@speedmart.com.my', '+60125127958', TO_DATE('2022-06-01','YYYY-MM-DD'), NULL, 'B010');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0074', 'Mohd Othman', 'MANAGER', 'mohd.othman@speedmart.com.my', '+60178600833', TO_DATE('2022-06-01','YYYY-MM-DD'), NULL, 'B010');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0075', 'Rosli Ali', 'MANAGER', 'rosli.ali@gmail.com', '+60137978893', TO_DATE('2022-06-01','YYYY-MM-DD'), NULL, 'B010');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0076', 'Siti Ibrahim', 'STOCK_STAFF', 'siti.ibrahim@yahoo.com', '+60102208063', TO_DATE('2022-06-01','YYYY-MM-DD'), NULL, 'B010');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0077', 'Fatimah Razak', 'STOCK_STAFF', 'fatimah.razak@gmail.com', '+60175254616', TO_DATE('2022-06-01','YYYY-MM-DD'), NULL, 'B010');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0078', 'Ismail Ali', 'CASHIER', 'ismail.ali@outlook.com', '+60172005646', TO_DATE('2022-06-01','YYYY-MM-DD'), NULL, 'B010');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0079', 'Nor Abdullah', 'CASHIER', 'nor.abdullah@yahoo.com', '+60181414050', TO_DATE('2022-06-01','YYYY-MM-DD'), NULL, 'B010');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0080', 'Liyana Ibrahim', 'CASHIER', 'liyana.ibrahim@yahoo.com', '+60117827612', TO_DATE('2022-12-01','YYYY-MM-DD'), NULL, 'B010');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0081', 'Fatimah Ahmad', 'ADMIN', 'fatimah.ahmad@speedmart.com.my', '+60174487873', TO_DATE('2023-01-01','YYYY-MM-DD'), NULL, 'B011');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0082', 'Liyana Yusof', 'MANAGER', 'liyana.yusof@speedmart.com.my', '+60134669426', TO_DATE('2023-01-01','YYYY-MM-DD'), TO_DATE('2025-06-15','YYYY-MM-DD'), 'B011');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0083', 'Ahmad Abdullah', 'MANAGER', 'ahmad.abdullah@shop.com', '+60107191015', TO_DATE('2023-01-01','YYYY-MM-DD'), NULL, 'B011');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0084', 'Nor Hassan', 'STOCK_STAFF', 'nor.hassan@speedmart.com.my', '+60179357183', TO_DATE('2023-01-01','YYYY-MM-DD'), NULL, 'B011');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0085', 'Rohani Zulkifli', 'STOCK_STAFF', 'rohani.zulkifli@speedmart.com.my', '+60167311514', TO_DATE('2023-01-01','YYYY-MM-DD'), TO_DATE('2025-10-01','YYYY-MM-DD'), 'B011');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0086', 'Ahmad Ali', 'CASHIER', 'ahmad.ali@gmail.com', '+60143767694', TO_DATE('2023-01-01','YYYY-MM-DD'), NULL, 'B011');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0087', 'Fairuz Ali', 'CASHIER', 'fairuz.ali@shop.com', '+60162190897', TO_DATE('2023-01-01','YYYY-MM-DD'), NULL, 'B011');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0088', 'Nor Ahmad', 'CASHIER', 'nor.ahmad@shop.com', '+60140838033', TO_DATE('2023-06-01','YYYY-MM-DD'), NULL, 'B011');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0089', 'Khalid Othman', 'ADMIN', 'khalid.othman@outlook.com', '+60130853940', TO_DATE('2023-06-30','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'B012');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0090', 'Mohd Ali', 'MANAGER', 'mohd.ali@shop.com', '+60127987724', TO_DATE('2023-06-30','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'B012');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0091', 'Ismail Zulkifli', 'MANAGER', 'ismail.zulkifli@outlook.com', '+60167183663', TO_DATE('2023-06-30','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'B012');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0092', 'Zainal Abdullah', 'STOCK_STAFF', 'zainal.abdullah@speedmart.com.my', '+60117999905', TO_DATE('2023-06-30','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'B012');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0093', 'Nur Hassan', 'STOCK_STAFF', 'nur.hassan@outlook.com', '+60111439238', TO_DATE('2023-06-30','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'B012');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0094', 'Ahmad Othman', 'CASHIER', 'ahmad.othman@speedmart.com.my', '+60184964764', TO_DATE('2023-06-30','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'B012');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0095', 'Rosli Abdullah', 'CASHIER', 'rosli.abdullah@yahoo.com', '+60142529900', TO_DATE('2023-06-30','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'B012');

INSERT INTO Staffs (StaffID, StaffName, Role, Email, PhoneNo, HireDate, ResignedDate, BranchID) VALUES ('S0096', 'Liyana Abdullah', 'CASHIER', 'liyana.abdullah@gmail.com', '+60163797486', TO_DATE('2023-09-01','YYYY-MM-DD'), TO_DATE('2025-09-01','YYYY-MM-DD'), 'B012');


