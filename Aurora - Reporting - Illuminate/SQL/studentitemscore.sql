SELECT DISTINCT
    s.StudentUniqueId AS StudentNumber
    ,a.AssessmentIdentifier AS AssessmentId
    ,sa.StudentAssessmentIdentifier AS StudentAssessmentId
    ,sa.AdministrationDate AS TestDate
    ,sai.IdentificationCode AS QuestionNumber
    ,sai.AssessmentResponse AS StudentResponse
    ,sai.RawScoreResult AS PointsEarned
    ,sy.SchoolYear AS EndYear
    ,CAST(d.CodeValue = 'Correct' AS int) AS IsCorrect
    ,NOW() AS LastUpdated
    ,ssa.SchoolID AS SchoolNumber
    ,gradedesc.CodeValue AS GradeLevel
    ,CASE WHEN itemcategory.CodeValue = 'Rubric'
        THEN sai.RawScoreResult
        ELSE 1 END AS RawPointsEarned
FROM
    edfi.StudentAssessment AS sa
    INNER JOIN edfi.Student AS s
        ON sa.StudentUSI = s.StudentUSI
    INNER JOIN edfi.Assessment AS a
        ON sa.AssessmentIdentifier = a.AssessmentIdentifier 
    INNER JOIN edfi.StudentAssessmentItem AS sai
        ON sa.StudentAssessmentIdentifier = sai.StudentAssessmentIdentifier 
    INNER JOIN edfi.Descriptor AS d
        ON sai.AssessmentItemResultDescriptorId = d.DescriptorId
    INNER JOIN edfi.SchoolYearType sy
        ON 1 = 1 and sy.CurrentSchoolYear=1
    INNER JOIN edfi.StudentSchoolAssociation ssa 
        ON s.StudentUSI = ssa.StudentUSI
        AND sy.EndYear = ssa.SchoolYear
    INNER JOIN edfi.Descriptor gradedesc
        ON ssa.EntryGradeLevelDescriptorId=d.DescriptorId
    INNER JOIN edfi.AssessmentItem ai 
        ON sai.AssessmentIdentifier = ai.AssessmentIdentifier
        AND sai.IdentificationCode = ai.IdentificationCode
    INNER JOIN edfi.Descriptor AS itemcategory
    ON ai.AssessmentItemCategoryDescriptorId =  itemcategory.DescriptorId

