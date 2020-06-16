INSERT INTO [edfi].[EducationOrganization]
           ([EducationOrganizationId]
           ,[NameOfInstitution]
           ,[ShortNameOfInstitution]
           ,[WebSite]
           ,[OperationalStatusDescriptorId]
           ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;