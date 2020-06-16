INSERT INTO [edfi].[CalendarDate]
           ([CalendarCode]
           ,[Date]
           ,[SchoolId]
           ,[SchoolYear]
           ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s) ON CONFLICT DO NOTHING;
