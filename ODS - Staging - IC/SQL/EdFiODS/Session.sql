SELECT [SchoolId]
      ,[SchoolYear]
      ,[SessionName]
      ,[BeginDate]
      ,[EndDate]
      ,[TermDescriptorId]
      ,[TotalInstructionalDays]
      ,[Discriminator]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[Session];

