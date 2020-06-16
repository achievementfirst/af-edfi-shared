SELECT DISTINCT
     s.StudentUniqueId AS StudentNumber
    ,a.AssessmentIdentifier AS AssessmentId
    ,sa.StudentAssessmentIdentifier AS StudentAssessmentId
    ,sa.AdministrationDate AS TestDate
    ,ssa.SchoolID AS SchoolNumber
    ,d.CodeValue AS GradeLevel
    ,CAST(sasr1.Result AS int) AS RawScore
    ,SUM(ai.MaxRawScore) AS PointsPossible
    ,CAST(sasr2.Result AS int) AS TestScore
    ,sy.SchoolYear AS EndYear
    ,NOW() AS LastUpdated
FROM
    edfi.StudentAssessment AS sa
    INNER JOIN edfi.Student AS s
        ON sa.StudentUSI = s.StudentUSI
    INNER JOIN edfi.Assessment AS a
        ON sa.AssessmentIdentifier = a.AssessmentIdentifier 
    INNER JOIN edfi.AssessmentItem ai
        ON ai.AssessmentIdentifier = a.AssessmentIdentifier 
    LEFT JOIN edfi.StudentAssessmentScoreResult sasr1
        ON sa.StudentAssessmentIdentifier = sasr1.StudentAssessmentIdentifier 
            AND sasr1.ResultDatatypeTypeDescriptorId = 218
    LEFT JOIN edfi.StudentAssessmentScoreResult sasr2
        ON sa.StudentAssessmentIdentifier = sasr2.StudentAssessmentIdentifier
            AND sasr2.ResultDatatypeTypeDescriptorId = 208
    INNER JOIN edfi.SchoolYearType sy
        ON 1 = 1 and sy.CurrentSchoolYear=1
    INNER JOIN edfi.StudentSchoolAssociation ssa 
        ON s.StudentUSI = ssa.StudentUSI
        AND sy.EndYear = ssa.SchoolYear
    INNER JOIN edfi.Descriptor d
        ON ssa.EntryGradeLevelDescriptorId=d.DescriptorId
       
