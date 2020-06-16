INSERT INTO [edfi].[AssessmentAssessedGradeLevel]
           ([AssessmentIdentifier]
           ,[GradeLevelDescriptorId]
           ,[Namespace]
           ,[CreateDate])
VALUES (%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
