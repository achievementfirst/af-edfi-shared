/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [AssessmentIdentifier]
      ,[IdentificationCode]
      ,[LearningStandardId]
      ,[Namespace]
      ,[CreateDate]
  FROM [edfi].[AssessmentItemLearningStandard]   
WHERE [Namespace] = 'uri://illuminateed.com';

