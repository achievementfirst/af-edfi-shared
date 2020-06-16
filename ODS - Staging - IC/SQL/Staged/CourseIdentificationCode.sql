INSERT INTO [edfi].[CourseIdentificationCode]
           ([CourseCode]
           ,[CourseIdentificationSystemDescriptorId]
           ,[EducationOrganizationId]
           ,[IdentificationCode]
           ,[AssigningOrganizationIdentificationCode]
           ,[CreateDate])
VALUES (%s,%s,%s,%s,%s,%s) ON CONFLICT DO NOTHING;