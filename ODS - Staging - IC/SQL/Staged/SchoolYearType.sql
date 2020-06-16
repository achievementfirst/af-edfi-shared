INSERT INTO [edfi].[SchoolYearType]
           ([SchoolYear]
           ,[SchoolYearDescription]
           ,[CurrentSchoolYear]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id])
VALUES (%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;