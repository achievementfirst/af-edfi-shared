INSERT INTO [edfi].[AssessmentAcademicSubject]
           ([AcademicSubjectDescriptorId]
           ,[AssessmentIdentifier]
           ,[Namespace]
           ,[CreateDate])
 VALUES (%s,%s,%s,%s)
ON CONFLICT DO NOTHING;