INSERT INTO [edfi].[Staff]
           ([PersonalTitlePrefix]
           ,[FirstName]
           ,[MiddleName]
           ,[LastSurname]
           ,[GenerationCodeSuffix]
           ,[MaidenName]
           ,[SexDescriptorId]
           ,[BirthDate]
           ,[HispanicLatinoEthnicity]
           ,[OldEthnicityDescriptorId]
           ,[CitizenshipStatusDescriptorId]
           ,[HighestCompletedLevelOfEducationDescriptorId]
           ,[YearsOfPriorProfessionalExperience]
           ,[YearsOfPriorTeachingExperience]
           ,[LoginId]
           ,[HighlyQualifiedTeacher]
           ,[StaffUniqueId]
           ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;