INSERT INTO [edfi].[SchoolGradeLevel]
           ([GradeLevelDescriptorId]
           ,[SchoolId]
           ,[CreateDate])
VALUES (%s,%s,%s)
ON CONFLICT DO NOTHING;
