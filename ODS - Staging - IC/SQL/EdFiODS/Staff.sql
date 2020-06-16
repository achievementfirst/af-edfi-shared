SELECT [StaffUSI]
      ,[PersonalTitlePrefix]
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
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[Staff]