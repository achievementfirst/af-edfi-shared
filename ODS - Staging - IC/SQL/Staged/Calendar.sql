INSERT INTO [edfi].[Calendar]
           ([CalendarCode]
           ,[SchoolId]
           ,[SchoolYear]
           ,[CalendarTypeDescriptorId]
           ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id]) 
VALUES (%s,%s,%s,%s,%s,%s,%s,%s) ON CONFLICT DO NOTHING;