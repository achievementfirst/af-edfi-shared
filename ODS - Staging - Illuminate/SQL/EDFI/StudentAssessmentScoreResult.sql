SELECT [AssessmentIdentifier]
      ,[AssessmentReportingMethodDescriptorId]
      ,[Namespace]
      ,[StudentAssessmentIdentifier]
      ,[StudentUSI]
      ,[Result]
      ,[ResultDatatypeTypeDescriptorId]
      ,[CreateDate]
  FROM [edfi].[StudentAssessmentScoreResult]
   WHERE [Namespace] = 'uri://illuminateed.com';

