INSERT INTO edfi.[Assessment] (
    [AssessmentIdentifier]
      ,[Namespace]
      ,[AssessmentTitle]
      ,[AssessmentCategoryDescriptorId]
      ,[AssessmentForm]
      ,[AssessmentVersion]
      ,[RevisionDate]
      ,[MaxRawScore]
      ,[Nomenclature]
      ,[AssessmentFamily]
      ,[EducationOrganizationId]
      ,[AdaptiveAssessment]
      ,[Discriminator]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,[Id]
)
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
