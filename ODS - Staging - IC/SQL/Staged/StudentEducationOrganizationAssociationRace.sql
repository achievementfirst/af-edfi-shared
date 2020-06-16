INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace]
           ([EducationOrganizationId]
           ,[RaceDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
VALUES (%s,%s,%s,%s) ON CONFLICT DO NOTHING;