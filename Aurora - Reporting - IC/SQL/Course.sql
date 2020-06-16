
SELECT DISTINCT
    CAST(CIC.CourseCode AS INT) AS CourseID
    , CIC.IdentificationCode AS CourseNumber
    , CAST(Cal.CalendarCode AS INT) AS CalendarNumber
    , C.CourseTitle AS CourseName
    , D.CodeValue AS Department
    , 1 AS Active
    , Cal.SchoolYear AS EndYear
    , NOW() AS LastUpdated
FROM edfi.CourseIdentificationCode CIC 
INNER JOIN edfi.Course C on CIC.CourseCode=C.CourseCode
INNER JOIN edfi.Calendar Cal on CIC.EducationOrganizationID=Cal.SchoolID
INNER JOIN edfi.Descriptor D on C.AcademicSubjectDescriptorID=D.DescriptorID
INNER JOIN edfi.SchoolYearType as SYT ON C.SchoolYear=SYT.SchoolYear AND SYT.CurrentSchoolYear=1

