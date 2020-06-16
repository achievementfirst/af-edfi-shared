select
    c.studentassessmentid
    , c.studentnumber
    , s.fullname
    , e.advisory
    , ci.teacher_name 
    , ci.sectionnumber
    , ci.sectionname
    , e.gradelevel
    , p.sped_status
    , p._504_status
    , p.lep_status
    , p.frl_status
    , l.schoolname
    , l.schoolabbreviation
    , l.level
    , l.region
    , c.assessmentid
    , a.testsubtype
    , a.testsubject
    , a.testgradelevel
    , a.testname
    , c.contenttype
    , c.contentid
    , c.contentlabel
    , c.questionid
    , c.questionnumber
    , c.difficultyflag
    , c.iscorrect
    , c.testdate
    , c.studentresponse
    , c.rawpointsearned
    , c.maximum
    , c.rawpointsworth
    , c.stprev_apl
from allcontent c
inner join schedule.school l
  on c.schoolnumber = l.schoolnumber
inner join studentdemographics.student s
  on c.studentnumber = s.studentnumber
inner join enrollment.studentenrollment e
  on c.studentnumber = e.studentnumber
  and c.testyear = e.endyear
  and e.activeenrollment = TRUE
inner join illuminate.assessment a
  on c.assessmentid = a.assessmentid
  and c.testyear = a.testyear
inner join courseia ci
  on c.studentnumber = ci.studentnumber
  and a.testsubjectgroup = ci.testsubjectgroup
  and c.testyear = ci.endyear
;