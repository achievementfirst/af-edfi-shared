SELECT DISTINCT
     ls.LearningStandardId AS StandardId
    ,ls.LearningStandardItemCode AS StandardCode
    ,s.StandardLabel AS StandardLabel
    ,s.CustomCode AS CustomCode
    ,ls.Description AS StandardDescription
    ,sy.SchoolYear AS TestYear
    ,NOW() AS LastUpdated
FROM
    edfi.LearningStandard ls
    INNER JOIN illuminate.Standard s 
        ON ls.LearningStandardItemCode=s.StandardCode
    INNER JOIN edfi.SchoolYearType sy
        ON 1 = 1 and sy.CurrentSchoolYear=1;
