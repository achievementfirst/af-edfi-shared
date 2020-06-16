SELECT [EducationOrganizationId]
      ,[NameOfInstitution]
      ,[ShortNameOfInstitution]
      ,[WebSite]
      ,[OperationalStatusDescriptorId]
      ,[Discriminator]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[EducationOrganization]


