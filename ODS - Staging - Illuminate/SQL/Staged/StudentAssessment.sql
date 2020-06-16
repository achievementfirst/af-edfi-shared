INSERT INTO edfi.[StudentAssessment] (
    [AssessmentIdentifier]
      ,[Namespace]
      ,[StudentAssessmentIdentifier]
      ,[StudentUSI]
      ,[AdministrationDate]
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[PlatformTypeDescriptorId]
      ,[Discriminator]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,[Id]
)
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
