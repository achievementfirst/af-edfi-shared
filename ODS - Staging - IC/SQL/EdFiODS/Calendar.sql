SELECT [CalendarCode]
      ,[SchoolId]
      ,[SchoolYear]
      ,[CalendarTypeDescriptorId]
      ,[Discriminator]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[Calendar];