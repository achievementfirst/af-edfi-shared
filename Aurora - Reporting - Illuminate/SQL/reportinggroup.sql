SELECT
  DISTINCT
  rg.ReportingGroupID
  ,rtrim(ltrim(rg.ReportingGroupLabel))
  ,Assessments.TestYear
  ,NOW() AS LastUpdatedDate
FROM
  illuminate.AssessmentItem ai
  INNER JOIN illuminate.ItemReportingGroup irg
    ON ai.FieldID = irg.FieldID
  INNER JOIN illuminate.Assessments
    ON ai.AssessmentID = Assessments.AssessmentID
  INNER JOIN illuminate.ReportingGroup rg
    ON irg.ReportingGroupID = rg.ReportingGroupID
 