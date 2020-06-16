SELECT DISTINCT
    CAST(SR.SectionIdentifier AS INT) AS SectionID
    , CAST(C.CourseCode AS INT) AS CourseID
    , S.StudentUniqueID AS StudentNumber
    , SR.BeginDate AS RosterStartDate
    , SR.EndDate AS RosterEndDate
    , ST.StaffUniqueID AS StaffNumber
    , SA.BeginDate AS StaffStartDate
    , SA.EndDate AS StaffEndDate
    , SR.SchoolYear AS EndYear
    , NOW() AS LastUpdated
FROM edfi.StudentSectionAssociation SR
INNER JOIN edfi.CourseIdentificationCode C on SR.LocalCourseCode=C.IdentificationCode
INNER JOIN edfi.Student S on SR.StudentUSI=S.StudentUSI
INNER JOIN edfi.StaffSectionAssociation SA on SA.LocalCourseCode=C.IdentificationCode
    AND SR.SectionIdentifier=SA.SectionIdentifier
INNER JOIN edfi.Staff ST on SA.StaffUSI = ST.StaffUSI
INNER JOIN edfi.SchoolYearType as SYT ON SR.SchoolYear=SYT.SchoolYear AND SYT.CurrentSchoolYear=1

  