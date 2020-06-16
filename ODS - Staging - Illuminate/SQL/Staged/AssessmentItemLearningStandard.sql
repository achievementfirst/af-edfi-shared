INSERT INTO edfi.[AssessmentItemLearningStandard] (
    [AssessmentIdentifier]
      ,[IdentificationCode]
      ,[LearningStandardId]
      ,[Namespace]
      ,[CreateDate]
)
VALUES (%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
