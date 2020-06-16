SELECT DISTINCT
  a.AssessmentIdentifier AS AssessmentIdentifier
  ,ai.IdentificationCode AS QuestionID
  ,ai.IdentificationCode AS QuestionNumber
  ,SPLIT_PART(ai.IdentificationCode,':',2) AS QuestionSequence
  ,ai.MaxRawScore AS Maximum
  ,ai.CorrectResponse AS CorrectAnswer
  ,d.CodeValue AS QuestionType
  ,CASE WHEN rg.ReportingGroupLabel LIKE '%Difficulty%'
  THEN 1
   ELSE 0 END AS DifficultyFlag
  ,CASE WHEN rg.ReportingGroupLabel LIKE '%Fluency%'
  THEN 1
   ELSE 0 END AS FluencyFlag
  ,CASE WHEN d.CodeValue = 'Rubric'
  THEN ai.MaxRawScore
   ELSE ai.CorrectResponse END AS RawPointsWorth
  ,sy.SchoolYear AS TestYear
  ,NOW() AS LastUpdated
FROM
  edfi.AssessmentItem AS ai
  INNER JOIN edfi.Assessment AS a
    ON ai.AssessmentIdentifier = a.AssessmentIdentifier
  INNER JOIN edfi.Descriptor AS d
    ON ai.AssessmentItemCategoryDescriptorId =  d.DescriptorId
  INNER JOIN illuminate.Assessment AS illuminatea
    ON a.AssessmentIdentifier = illuminatea.AssessmentIdentifier
  INNER JOIN illuminate.AssessmentItem AS iai
    ON illuminatea.AssessmentID = iai.AssessmentID
       AND SPLIT_PART(ai.IdentificationCode,':',2) = iai.QuestionNumber
  INNER JOIN illuminate.ItemReportingGroup rg
    ON iai.FieldID = rg.FieldID
  INNER JOIN edfi.SchoolYearType sy
    ON 1 = 1 and sy.CurrentSchoolYear=1;
