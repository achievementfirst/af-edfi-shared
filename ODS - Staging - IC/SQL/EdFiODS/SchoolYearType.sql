SELECT [SchoolYear]
      ,[SchoolYearDescription]
      ,[CurrentSchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[SchoolYearType]


