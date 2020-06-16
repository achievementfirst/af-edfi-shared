SELECT DISTINCT
  a.AssessmentIdentifier AS AssessmentIdentifier
  ,'Illuminate' AS SourceSystem
  ,assess.AssessmentScope AS TestType
  ,CASE WHEN ((assess.AssessmentScope = 'Weekly Quizzes') AND (a.AssessmentTitle LIKE '%#%'))
     THEN concat('WQ ',trim(replace(substring(a.AssessmentTitle,strpos(a.AssessmentTitle,'#') + 1,2),'.',' ')))
   ELSE assess.AssessmentScope END AS TestSubType
  ,dsubject.CodeValue AS TestSubjectGroup
  ,dsubject.CodeValue AS TestSubject
  ,d.CodeValue AS TestGradeLevel
  ,CASE SPLIT_PART(LOWER(d.CodeValue),' ',1)
   WHEN 'kindergarten'
     THEN 0
   WHEN 'first'
     THEN 1
   WHEN 'second'
     THEN 2
   WHEN 'third'
     THEN 3
   WHEN 'fourth'
     THEN 4
   WHEN 'fifth'
     THEN 5
   WHEN 'sixth'
     THEN 6
   WHEN 'seventh'
     THEN 7
   WHEN 'eighth'
     THEN 8
   WHEN 'ninth'
     THEN 9
   WHEN 'tenth'
     THEN 10
   WHEN 'eleventh'
     THEN 11
   WHEN 'twelfth'
     THEN 12
   ELSE -1
   END AS NumericTestGradeLevel
  ,a.AssessmentTitle AS TestName
  ,'testadmin'AS TestCreatedBy
  ,1 AS IsNetworkAssessment
  ,sy.SchoolYear AS TestYear
  ,NOW() AS LastUpdated
FROM
  edfi.Assessment AS a
  INNER JOIN illuminate.Assessments assess 
    ON a.assessmentidentifier = assess.assessmentidentifier
  INNER JOIN edfi.AssessmentAcademicSubject aas
    ON a.assessmentidentifier=aas.assessmentidentifier
  INNER JOIN edfi.AssessmentAssessedGradeLevel aagl
    ON a.assessmentidentifier=aagl.assessmentidentifier
  INNER JOIN edfi.Descriptor AS d
    ON aagl.GradeLevelDescriptorId = d.DescriptorId
  INNER JOIN edfi.Descriptor AS dsubject
    ON aas.AcademicSubjectDescriptorId = dsubject.DescriptorId
  INNER JOIN edfi.SchoolYearType sy
    ON 1 = 1 and sy.CurrentSchoolYear=1;
