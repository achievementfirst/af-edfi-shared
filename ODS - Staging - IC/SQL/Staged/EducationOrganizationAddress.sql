INSERT INTO [edfi].[EducationOrganizationAddress]
           ([AddressTypeDescriptorId]
           ,[City]
           ,[EducationOrganizationId]
           ,[PostalCode]
           ,[StateAbbreviationDescriptorId]
           ,[StreetNumberName]
           ,[ApartmentRoomSuiteNumber]
           ,[BuildingSiteNumber]
           ,[NameOfCounty]
           ,[CountyFIPSCode]
           ,[Latitude]
           ,[Longitude]
           ,[DoNotPublishIndicator]
           ,[CongressionalDistrict]
           ,[LocaleDescriptorId]
           ,[CreateDate])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
   
