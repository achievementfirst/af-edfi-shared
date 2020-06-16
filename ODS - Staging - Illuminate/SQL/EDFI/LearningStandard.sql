SELECT [LearningStandardId]
      ,[Description]
      ,[LearningStandardItemCode]
      ,[URI]
      ,[CourseTitle]
      ,[SuccessCriteria]
      ,[ParentLearningStandardId]
      ,[Namespace]
      ,[LearningStandardCategoryDescriptorId]
      ,[LearningStandardScopeDescriptorId]
      ,[Discriminator]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[LearningStandard]
WHERE
    [Namespace] = 'uri://illuminateed.com/LearningStandards.xml' OR
    [Namespace] = 'uri://academicbenchmarks.com/LearningStandards.xml';
