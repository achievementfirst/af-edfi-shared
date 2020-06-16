SELECT
  DISTINCT
  iai.IdentificationCode AS QuestionID
  ,rg.ReportingGroupID
  ,rtrim(ltrim(rg.ReportingGroupLabel))
  ,Assessments.TestYear
  ,NOW() AS LastUpdatedDate
  ,iai.AssessmentIdentifier
FROM
  illuminate.AssessmentItem ai
  INNER JOIN illuminate.ItemReportingGroup irg
    ON ai.FieldID = irg.FieldID
  INNER JOIN illuminate.Assessments
    ON ai.AssessmentID = Assessments.AssessmentID
  INNER JOIN illuminate.ReportingGroup rg
    ON irg.ReportingGroupID = rg.ReportingGroupID
  INNER JOIN edfi.AssessmentItem AS iai
    ON ai.AssessmentIdentifier = iai.AssessmentIdentifier
       AND SPLIT_PART(iai.IdentificationCode,':',2) = ai.QuestionNumber