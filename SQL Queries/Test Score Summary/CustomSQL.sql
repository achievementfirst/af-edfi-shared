select
  sas.studentassessmentid
  , sy.schoolyear
  , sy.yearsago
  , sas.studentnumber
  , s.fullname
  , e.advisory
  , staff.fullname as teacher_name 
  , sec.sectionname
  , sec.sectionnumber
  , pe.sped_status
  , pe._504_status
  , pe.lep_status
  , pe.frl_status
  , l.schoolname
  , l.schoolabbreviation
  , l.region
  , l.level
  , sas.gradelevel
  , sas.assessmentid
  , a.testtype
  , a.testsubtype
  , bm.testsubtypenewscope
  , a.testsubjectgroup
  , a.testsubject
  , a.testname
  , a.testgradelevel
  , sas.testdate
  , sas.testscore
  , sas.rawscore
  , sas.pointspossible
  , cast(percent_rank() over(partition by a.assessmentid order by sas.testscore) as numeric(38,2)) as pctilerank_network
  , cast(percent_rank() over(partition by a.assessmentid, l.region order by sas.testscore) as numeric(38,2)) as pctilerank_region
  , cast(percent_rank() over(partition by a.assessmentid, l.schoolnumber order by sas.testscore) as numeric(38,2)) as pctilerank_school
  , pl.performancelevel
  , pl.performancelevelnumeric
  , apl.adjustedperformancelevel as prevst_apl

from illuminate.studentaggregatescore sas
inner join illuminate.assessment a
  on sas.assessmentid = a.assessmentid
  and sas.endyear = a.testyear
  and a.isnetworkassessment = TRUE
inner join schedule.schoolyear sy
  on sas.endyear = sy.endyear
  and sy.yearsago in (0,1,2)
inner join enrollment.studentenrollment e
  on sas.studentnumber = e.studentnumber
  and sas.endyear = e.endyear
  and e.mostrecentenrollmentyear = TRUE
inner join studentdemographics.student s
  on sas.studentnumber = s.studentnumber
inner join schedule.school l
  on sas.schoolnumber = l.schoolnumber
left join apl apl
  on sas.studentnumber = apl.studentnumber
  and a.testsubjectgroup = apl.illuminatetestsubjectgroup
  and sas.endyear = apl.join_endyear
left join roster.course c
    on a.testsubjectgroup = c.department
left join roster.section sec
    on c.courseid = sec.courseid
left join roster.teacherstudentlinks tsl
  on sas.studentnumber = tsl.studentnumber
  and sas.endyear = tsl.endyear
  and c.sourseid = tsl.courseid
  and sec.sectionid = tsl.sectionid
left join staffidentity.staff staff
  on tsl.staffnumber=staff.staffnumber
left join illuminate.performancelevel pl
  on sas.assessmentid = pl.assessmentid
	and sas.studentnumber = pl.studentnumber
