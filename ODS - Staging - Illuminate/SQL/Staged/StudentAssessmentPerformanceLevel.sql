INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AssessmentIdentifier]
           ,[AssessmentReportingMethodDescriptorId]
           ,[Namespace]
           ,[PerformanceLevelDescriptorId]
           ,[StudentAssessmentIdentifier]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
