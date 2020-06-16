INSERT INTO [edfi].[StudentAssessmentScoreResult]
           ([AssessmentIdentifier]
           ,[AssessmentReportingMethodDescriptorId]
           ,[Namespace]
           ,[StudentAssessmentIdentifier]
           ,[StudentUSI]
           ,[Result]
           ,[ResultDatatypeTypeDescriptorId]
           ,[CreateDate])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
