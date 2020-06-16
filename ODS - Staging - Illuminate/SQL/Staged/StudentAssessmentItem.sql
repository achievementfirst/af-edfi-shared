INSERT INTO [edfi].[StudentAssessmentItem]
           ([AssessmentIdentifier]
           ,[IdentificationCode]
           ,[Namespace]
           ,[StudentAssessmentIdentifier]
           ,[StudentUSI]
           ,[AssessmentResponse]
           ,[DescriptiveFeedback]
           ,[ResponseIndicatorDescriptorId]
           ,[AssessmentItemResultDescriptorId]
           ,[RawScoreResult]
           ,[TimeAssessed]
           ,[CreateDate])
     
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;

