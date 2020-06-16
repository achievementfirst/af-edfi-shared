SELECT [AssessmentIdentifier]
      ,[AssessmentReportingMethodDescriptorId]
      ,[Namespace]
      ,[PerformanceLevelDescriptorId]
      ,[MinimumScore]
      ,[MaximumScore]
      ,[ResultDatatypeTypeDescriptorId]
      ,[CreateDate]
  FROM [edfi].[AssessmentPerformanceLevel]
    WHERE [Namespace] = 'uri://illuminateed.com';

