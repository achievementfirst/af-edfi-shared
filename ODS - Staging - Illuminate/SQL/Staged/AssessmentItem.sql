INSERT INTO edfi.[AssessmentItem] (
     [AssessmentIdentifier]
      ,[IdentificationCode]
      ,[Namespace]
      ,[AssessmentItemCategoryDescriptorId]
      ,[MaxRawScore]
      ,[ItemText]
      ,[CorrectResponse]
      ,[ExpectedTimeAssessed]
      ,[Nomenclature]
      ,[AssessmentItemURI]
      ,[Discriminator]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,[Id]
)
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
