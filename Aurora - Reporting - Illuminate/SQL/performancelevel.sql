SELECT DISTINCT sa.assessmentidentifier AS AssessmentId
, pl.CodeValue AS PerformanceLevelNumeric
, pl.CodeValue AS PerformanceLevel
, s.studentuniqueid AS StudentNumber
, sa.SchoolYear AS TestYear
, NOW() as LastUpdated
FROM edfi.StudentAssessment sa
    INNER JOIN edfi.StudentAssessmentPerformanceLevel sapl 
        on a.studentassessmentidentifier = sapl.studentassessmentidentifier
    INNER JOIN edfi.Descriptor pl
        on sapl.performanceleveldescriptorid = pl.descriptorid
    INNER JOIN edfi.Student s 
        on sa.studentusi = s.studentusi
 INNER JOIN edfi.SchoolYearType sy
        on sa.schoolyear=sy.schoolyear and sy.CurrentSchoolYear=1;