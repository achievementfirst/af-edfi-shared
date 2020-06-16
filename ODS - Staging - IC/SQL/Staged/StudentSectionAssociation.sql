INSERT INTO [edfi].[StudentSectionAssociation]
           ([BeginDate]
           ,[LocalCourseCode]
           ,[SchoolId]
           ,[SchoolYear]
           ,[SectionIdentifier]
           ,[SessionName]
           ,[StudentUSI]
           ,[EndDate]
           ,[HomeroomIndicator]
           ,[RepeatIdentifierDescriptorId]
           ,[TeacherStudentDataLinkExclusion]
           ,[AttemptStatusDescriptorId]
           ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;