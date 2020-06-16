SELECT DISTINCT
    CAST(SR.SectionIdentifier AS INT) AS SectionID
    , CAST(C.CourseCode AS INT) AS CourseID
    , S.StudentUniqueID AS StudentNumber
    , SR.BeginDate AS RosterStartDate
    , SR.EndDate AS RosterEndDate
    , SR.SchoolYear AS EndYear
    , NOW() AS LastUpdated
FROM edfi.StudentSectionAssociation SR
INNER JOIN edfi.CourseIdentificationCode C on SR.LocalCourseCode=C.IdentificationCode
INNER JOIN edfi.Student S on SR.StudentUSI=S.StudentUSI
INNER JOIN edfi.SchoolYearType as SYT ON SR.SchoolYear=SYT.SchoolYear AND SYT.CurrentSchoolYear=1

  