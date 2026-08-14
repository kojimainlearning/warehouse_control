DROP SEQUENCE Branch_Dim_Seq;

CREATE SEQUENCE Branch_Dim_Seq
START WITH 1
INCREMENT BY 1;


MERGE INTO Branch_Dim T
USING (
    SELECT
        BranchID,
        BranchName,
        City,
        State,
        PostCode,                     
        OpeningDate,
        ClosingDate
    FROM Branches
) S
ON (T.Branch_ID = S.BranchID)

WHEN MATCHED THEN
    UPDATE SET
        T.Branch_Name  = S.BranchName,
        T.City         = S.City,
        T.State        = S.State,
        T.Post_Code    = S.PostCode,
        T.Opening_Date = S.OpeningDate,
        T.Closing_Date = S.ClosingDate

WHEN NOT MATCHED THEN
    INSERT (
        Branch_Key,
        Branch_ID,
        Branch_Name,
        City,
        State,
        Post_Code,
        Opening_Date,
        Closing_Date
    )
    VALUES (
        Branch_Dim_Seq.NEXTVAL,
        S.BranchID,
        S.BranchName,
        S.City,
        S.State,
        S.PostCode,
        S.OpeningDate,
        S.ClosingDate
    );

COMMIT;