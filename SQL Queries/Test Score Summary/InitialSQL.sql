select distinct testsubjectgroup as illuminatetestsubjectgroup
into temp subj
from illuminate.assessment
;


select
  a.testyear+1 as join_endyear
  , sas.studentnumber
  , a.testsubjectgroup
  , j.illuminatetestsubjectgroup
  , sas.adjustedperformancelevel
into temp apl
from stateassessments.studentassessmentscore sas
inner join stateassessments.assessment a
  on sas.assessmentid = a.assessmentid
inner join schedule.schoolyear sy
  on a.testyear = sy.endyear
  and sy.yearsago in (1,2)
inner join subj j
  on a.testsubjectgroup = j.mappedtestsubjectgroup
where a.testscoretype = 'Test'
and a.testsubjectgroup in ('ELA','Math')
;