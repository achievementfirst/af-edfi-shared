create table illuminate.studentitemscore
(
	studentnumber varchar(30) not null,
	assessmentid varchar(60) not null,
	studentassessmentid varchar(60) not null,		
	testdate date,
	questionid varchar(60) not null,
	studentresponse varchar(255),
	pointsearned numeric(13,10),
	endyear integer not null,
	iscorrect boolean default false,
	lastupdated timestamp default now() not null,
	schoolnumber integer,
	gradelevel varchar(20),
	rawpointsearned numeric(13,10)
	constraint studentitemscore_pkey
		primary key (studentnumber, assessmentid, questionid)
)
;

