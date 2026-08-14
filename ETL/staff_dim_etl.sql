DROP SEQUENCE Staff_Dim_Seq;

CREATE SEQUENCE Staff_Dim_Seq
START WITH 1
INCREMENT BY 1;

MERGE INTO Staff_Dim T
USING (
    SELECT
        StaffID,
        StaffName,
        Role,
        HireDate,
        ResignedDate
    FROM Staffs
) S
ON (T.Staff_ID = S.StaffID)

WHEN MATCHED THEN
    UPDATE SET
        T.Staff_Name    = S.StaffName,
        T.Role          = S.Role,
        T.Hire_Date     = S.HireDate,
        T.Resigned_Date = S.ResignedDate

WHEN NOT MATCHED THEN
    INSERT (
        Staff_Key,
        Staff_ID,
        Staff_Name,
        Role,
        Hire_Date,
        Resigned_Date
    )
    VALUES (
        Staff_Dim_Seq.NEXTVAL,
        S.StaffID,
        S.StaffName,
        S.Role,
        S.HireDate,
        S.ResignedDate
    );

COMMIT;