SELECT [AssessmentIdentifier]
      ,[AssessmentReportingMethodDescriptorId]
      ,[Namespace]
      ,[MinimumScore]
      ,[MaximumScore]
      ,[ResultDatatypeTypeDescriptorId]
      ,[CreateDate]
  FROM [edfi].[AssessmentScore]
WHERE [Namespace] = 'uri://illuminateed.com';

