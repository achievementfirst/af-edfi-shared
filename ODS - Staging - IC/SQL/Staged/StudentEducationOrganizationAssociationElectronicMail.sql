INSERT INTO [edfi].[StudentEducationOrganizationAssociationElectronicMail]
           ([EducationOrganizationId]
           ,[ElectronicMailTypeDescriptorId]
           ,[StudentUSI]
           ,[ElectronicMailAddress]
           ,[PrimaryEmailAddressIndicator]
           ,[DoNotPublishIndicator]
           ,[CreateDate])
  VALUES (%s,%s,%s,%s,%s,%s,%s) ON CONFLICT DO NOTHING;