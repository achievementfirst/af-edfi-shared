SELECT [BeginDate]
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
      ,CAST([Id] AS varchar(36)) AS [Id]
  FROM [edfi].[StudentSectionAssociation];
