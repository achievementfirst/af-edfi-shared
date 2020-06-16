SELECT [AssessmentIdentifier]
      ,[AssessmentReportingMethodDescriptorId]
      ,[Namespace]
      ,[PerformanceLevelDescriptorId]
      ,[StudentAssessmentIdentifier]
      ,[StudentUSI]
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentPerformanceLevel]    
WHERE [Namespace] = 'uri://illuminateed.com';

