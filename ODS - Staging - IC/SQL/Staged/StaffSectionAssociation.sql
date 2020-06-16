INSERT INTO [edfi].[StaffSectionAssociation]
           ([LocalCourseCode]
           ,[SchoolId]
           ,[SchoolYear]
           ,[SectionIdentifier]
           ,[SessionName]
           ,[StaffUSI]
           ,[ClassroomPositionDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[HighlyQualifiedTeacher]
           ,[TeacherStudentDataLinkExclusion]
           ,[PercentageContribution]
           ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate]
           ,[Id])
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
ON CONFLICT DO NOTHING;