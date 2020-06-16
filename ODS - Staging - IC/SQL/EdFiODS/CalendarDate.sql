SELECT [CalendarCode]
      ,[Date]
      ,[SchoolId]
      ,[SchoolYear]
      ,[Discriminator]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[CalendarDate];