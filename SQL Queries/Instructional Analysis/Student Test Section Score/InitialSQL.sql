--ILLUMINATE INSTRUCTIONAL ANALYSIS REPORT QUERY

--Course-IA Links by studentassessmentid
select distinct
  sas.studentnumber
  , a.testsubjectgroup
  , sas.endyear
  , staff.fullname as teacher_name 
  , s.sectionnumber
  , s.sectionname
into temp courseia
from illuminate.studentaggregatescore sas
inner join illuminate.assessment a
  on sas.assessmentid = a.assessmentid
  and sas.endyear = a.testyear
  and a.isnetworkassessment = TRUE
inner join schedule.schoolyear sy
  on sas.endyear = sy.endyear
  and sy.active = 1
left join roster.course c
    on a.testsubjectgroup = c.department
left join roster.section s
    on c.courseid = s.courseid
left join roster.teacherstudentlinks tsl
  on sas.studentnumber = tsl.studentnumber
  and sas.endyear = tsl.endyear
  and c.sourseid = tsl.courseid
  and s.sectionid = tsl.sectionid
left join staffidentity.staff staff
  on tsl.staffnumber=staff.staffnumber
;


--State Test-Illuminate Subject Mapping
select distinct illuminatetestsubjectgroup, mappedtestsubjectgroup
into temp subj
from illuminate.subjectmapping
;


--Prev Yr State Test APL
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
inner join subj j
  on a.testsubjectgroup = j.illuminatetestsubjectgroup
where a.testscoretype = 'Test'
and a.testsubjectgroup in ('ELA','Math')
;


--Item-level Scores
select
  sis.studentassessmentid
  , sis.studentnumber
  , sis.schoolnumber
  , sis.assessmentid
  , a.testyear
  , sis.questionid
  , ai.questionnumber
  , ai.questiontype
  , ai.difficultyflag
  , sis.iscorrect
  , sis.studentresponse
  , sis.rawpointsearned
  , sis.testdate
  , ai.maximum
  , ai.rawpointsworth
  , apl.adjustedperformancelevel as stprev_apl
into temp scores
from illuminate.studentitemscore sis
inner join illuminate.assessment a
  on sis.assessmentid = a.assessmentid
  and sis.endyear = a.testyear
  and a.isnetworkassessment = TRUE  
inner join schedule.schoolyear sy
  on sis.endyear = sy.endyear
  and sy.active = 1
inner join illuminate.assessmentitem ai
  on sis.assessmentid = ai.assessmentid
  and sis.questionid = ai.questionid
  and sis.endyear = ai.testyear
  and ai.maximum<>0
left join apl apl
  on sis.studentnumber = apl.studentnumber
  and a.testsubjectgroup = apl.testsubjectgroup
  and sis.endyear = apl.join_endyear
;


--Question Group & Standard tags by assessment/item
select
  contenttype
  , assessmentid
  , questionid
  , contentid
  , contentlabel
  , testyear
into temp content
from (
  select
    'Question Group' as contenttype
    , assessmentid
    , questionid
    , reportinggroupid as contentid
    , reportinggrouplabel as contentlabel
    , testyear
  from illuminate.itemreportinggroup
  union
  select
    'Standard' as contenttype
    , assessmentid
    , questionid
    , standardid as contentid
    , standardcode as contentlabel
    , testyear
  from illuminate.itemstandard
) i
;


--Join content tags onto item-level scores
select
  s.studentassessmentid
  , s.studentnumber
  , s.schoolnumber
  , s.assessmentid
  , s.testyear
  , c.contenttype
  , c.contentid
  , c.contentlabel
  , s.questionid
  , s.questionnumber
  , s.difficultyflag
  , s.studentresponse
  , s.iscorrect
  , s.testdate
  , s.pointsearned
  , s.maximum
  , s.rawpointsworth
  , s.stprev_apl
into temp contentscores
from scores s
inner join content c
  on s.assessmentid = c.assessmentid
  and s.questionid = c.questionid
  and s.testyear = c.testyear
;


--Stack all item-level scores with content-tagged item-level scores
select
    studentassessmentid
    , studentnumber
    , schoolnumber
    , assessmentid
    , testyear
    , contenttype
    , contentid
    , contentlabel
    , questionid
    , questionnumber
    , difficultyflag
    , iscorrect
    , studentresponse
    , testdate
    , rawpointsearned
    , maximum
    , rawpointsworth
    , stprev_apl
into temp allcontent
from (
  select
    studentassessmentid
    , studentnumber
    , schoolnumber
    , assessmentid
    , testyear
    , 'Question' as contenttype
    , questionid as contentid
    , questiontype as contentlabel
    , questionid
    , questionnumber
    , difficultyflag
    , iscorrect
    , studentresponse
    , testdate
    , pointsearned
    , maximum
    , rawpointsworth
    , stprev_apl
  from scores
  union all
  select
    studentassessmentid
    , studentnumber
    , schoolnumber
    , assessmentid
    , testyear
    , contenttype
    , contentid
    , contentlabel
    , questionid
    , questionnumber
    , difficultyflag
    , iscorrect
    , studentresponse
    , testdate
    , rawpointsearned
    , maximum
    , rawpointsworth
    , stprev_apl
  from contentscores
) i
;