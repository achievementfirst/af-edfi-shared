create table illuminate.studentaggregatescore
(
	studentnumber varchar(30) not null,
	assessmentid varchar(60) not null,
	testdate date,
	schoolnumber integer,
	gradelevel varchar(20),
	rawscore numeric(5,2),
	pointspossible numeric(5,2),
	testscore numeric(5,2),
	endyear integer not null,
	lastupdated timestamp default now() not null,
	studentassessmentid varchar(60) not null 
		constraint interimassessmentaggregatescore_pkey
			primary key
)
;

