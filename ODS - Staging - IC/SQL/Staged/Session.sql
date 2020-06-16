INSERT INTO [edfi].[Session]
           ([SchoolId]
           ,[SchoolYear]
           ,[SessionName]
           ,[BeginDate]
           ,[EndDate]
           ,[TermDescriptorId]
           ,[TotalInstructionalDays]
           ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;