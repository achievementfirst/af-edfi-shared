SELECT DISTINCT
     a.AssessmentIdentifier AS AssessmentId
    ,ails.IdentificationCode AS QuestionId
    ,ls.LearningStandardId AS StandardId
    ,ls.LearningStandardItemCode AS StandardCode
    ,ls.Description AS StandardDescription
    ,sy.SchoolYear AS TestYear
    ,NOW() AS LastUpdated
FROM
    edfi.AssessmentItemLearningStandard as ails
    INNER JOIN edfi.Assessment AS a
        ON ails.AssessmentIdentifier = a.AssessmentIdentifier 
    INNER JOIN edfi.LearningStandard AS ls
        ON ails.LearningStandardId = ls.LearningStandardId
    INNER JOIN edfi.SchoolYearType sy
        ON 1 = 1 and sy.CurrentSchoolYear=1;

