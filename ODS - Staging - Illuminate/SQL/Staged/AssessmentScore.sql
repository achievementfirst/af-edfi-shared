INSERT INTO edfi.[AssessmentScore] (
    [AssessmentIdentifier]
      ,[AssessmentReportingMethodDescriptorId]
      ,[Namespace]
      ,[MinimumScore]
      ,[MaximumScore]
      ,[ResultDatatypeTypeDescriptorId]
      ,[CreateDate]
)
VALUES (%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
