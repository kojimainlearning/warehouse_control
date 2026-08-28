SET DEFINE OFF;
SET SQLBLANKLINES ON;
SET ECHO OFF;
SET SERVEROUTPUT ON;
WHENEVER SQLERROR CONTINUE;

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

COMMIT;