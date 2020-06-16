INSERT INTO [edfi].[Student]
           ([PersonalTitlePrefix]
           ,[FirstName]
           ,[MiddleName]
           ,[LastSurname]
           ,[GenerationCodeSuffix]
           ,[MaidenName]
           ,[BirthDate]
           ,[BirthCity]
           ,[BirthStateAbbreviationDescriptorId]
           ,[BirthInternationalProvince]
           ,[BirthCountryDescriptorId]
           ,[DateEnteredUS]
           ,[MultipleBirthStatus]
           ,[BirthSexDescriptorId]
           ,[CitizenshipStatusDescriptorId]
           ,[StudentUniqueId]
           ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
     

