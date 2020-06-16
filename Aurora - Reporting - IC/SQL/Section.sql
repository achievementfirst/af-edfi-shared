SELECT DISTINCT
    CAST(S.SectionIdentifier AS INT) AS SectionID
    , CAST(S.CourseCode AS INT) AS CourseID
    , RS.SectionNumber AS SectionNumber
    , MIN(Session.BeginDate) AS SectionStartDate
    , MIN(Session.EndDate) AS SectionEndDate
    , S.SchoolYear AS EndYear
    , NOW() AS LastUpdated
FROM edfi.Section S 
    INNER JOIN edfi.CourseIdentificationCode C on S.LocalCourseCode=C.IdentificationCode
    INNER JOIN edfi.Session Session ON S.SchoolYear=Session.SchoolYear AND S.SessionName=Session.SessionName
                                        AND S.SchoolId=Session.SchoolID
    INNER JOIN roster.Section RS on S.SectionIdentifier=RS.SectionID
    INNER JOIN edfi.SchoolYearType as SYT ON C.SchoolYear=SYT.SchoolYear AND SYT.CurrentSchoolYear=1


