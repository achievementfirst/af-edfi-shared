SELECT [DescriptorId]
      ,[Namespace]
      ,[CodeValue]
      ,[ShortDescription]
      ,[Description]
      ,[PriorDescriptorId]
      ,[EffectiveBeginDate]
      ,[EffectiveEndDate]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[Descriptor];

