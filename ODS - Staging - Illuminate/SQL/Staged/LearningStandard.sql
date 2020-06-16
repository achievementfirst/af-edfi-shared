INSERT INTO edfi.[LearningStandard] (
     [LearningStandardId]
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
      ,[Id])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
