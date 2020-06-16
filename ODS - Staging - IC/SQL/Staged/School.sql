INSERT INTO [edfi].[School]
           ([SchoolId]
           ,[SchoolTypeDescriptorId]
           ,[CharterStatusDescriptorId]
           ,[TitleIPartASchoolDesignationDescriptorId]
           ,[MagnetSpecialProgramEmphasisSchoolDescriptorId]
           ,[AdministrativeFundingControlDescriptorId]
           ,[InternetAccessDescriptorId]
           ,[LocalEducationAgencyId]
           ,[CharterApprovalAgencyTypeDescriptorId]
           ,[CharterApprovalSchoolYear])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;
