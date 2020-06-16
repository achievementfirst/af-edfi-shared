INSERT INTO edfi.[AssessmentPerformanceLevel] (
    [AssessmentIdentifier]
      ,[AssessmentReportingMethodDescriptorId]
      ,[Namespace]
      ,[PerformanceLevelDescriptorId]
      ,[MinimumScore]
      ,[MaximumScore]
      ,[ResultDatatypeTypeDescriptorId]
      ,[CreateDate]
)
VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
