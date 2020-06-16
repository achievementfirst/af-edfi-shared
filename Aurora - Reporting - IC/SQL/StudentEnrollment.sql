WITH MinCalendar AS(
    SELECT CD.CalendarCode 
    , CD.SchoolYear AS EndYear
    , MIN(CD.Date) AS CalendarStartDate
    , MAX(CD.Date) AS CalendarEndDate
    FROM edfi.CalendarDate AS CD
    GROUP BY CD.CalendarCode, CD.SchoolYear
)

 SELECT DISTINCT
       S.StudentUniqueID AS StudentNumber
      , SSA.SchoolID AS SchoolNumber
      , C.CalendarCode AS CalendarNumber 
      , Grade.CodeValue as GradeLevel
      , CASE SPLIT_PART(LOWER(Grade.CodeValue),' ',1)
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
   END AS NumericGradeLevel      
      , SSA.EntryDate AS EnrollmentStartDate
      , SSA.ExitWithdrawDate AS EnrollmentEndDate
      , CASE WHEN SSA.ExitWithdrawDate IS NULL THEN MinCalendar.CalendarEndDate
          ELSE SSA.ExitWithdrawDate
          END AS EnrollmentExitDate
      , Withdraw.CodeValue AS WithdrawalCode
      , Withdraw.Description AS WithdrawalDescription
      , CASE WHEN SSA.RepeatGradeIndicator = 1 THEN 1
        ELSE 0
        END AS Retained	  
      , C.SchoolYear AS EndYear
      , SYT.SchoolYearDescription AS SchoolYear
	    , CASE WHEN SSA.ExitWithdrawDate IS null AND SYT.CurrentSchoolYear=1 THEN CAST(1 AS BIT)
		      ELSE CAST(0 AS BIT)
		      END AS ActiveEnrollment	 
      , CASE
          WHEN SSA.EntryDate = MAX(SSA.EntryDate)
            over (partition by S.StudentUSI, C.SchoolYear) THEN CAST(1 AS BIT)
            ELSE CAST(0 AS BIT)
          END AS MostRecentEnrollmentYear
      , Entry.CodeValue AS EntryCode
      , Entry.Description AS EntryDescription
      , now() AS LastUpdated
      , COALESCE(SSA.ExitWithdrawDate = MinCalendar.CalendarEndDate, true)::INT::BIT AS CompletedSchoolYear
	  
  FROM  edfi.StudentSchoolAssociation SSA
  INNER JOIN edfi.Student S on SSA.StudentUSI=S.StudentUSI
  INNER JOIN edfi.Calendar C on SSA.SchoolID=C.SchoolID
  INNER JOIN edfi.SchoolYearType SYT on C.SchoolYear=SYT.SchoolYear AND SYT.CurrentSchoolYear=1
  INNER JOIN edfi.Descriptor Grade on SSA.EntryGradeLevelDescriptorID=Grade.DescriptorID
  INNER JOIN MinCalendar ON C.CalendarCode=MinCalendar.CalendarCode
  INNER JOIN edfi.Descriptor Withdraw on SSA.ExitWithdrawTypeDescriptorID=Withdraw.DescriptorID
  INNER JOIN edfi.Descriptor Entry on SSA.EntryTypeDescriptorID=Entry.DescriptorID
  