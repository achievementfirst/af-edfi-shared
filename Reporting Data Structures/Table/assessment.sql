create table illuminate.assessment
(
	assessmentid varchar(60) not null 
		constraint assessment_pkey
			primary key,
	sourcesystem varchar(20),
	testtype varchar(20),
	testsubtype varchar(20),
	testsubjectgroup varchar(50),
	testsubject varchar(100),
	testgradelevel varchar(30),
	numerictestgradelevel integer,
	testname varchar(255),
	testcreatedby varchar(50),
	isnetworkassessment boolean,
	testyear integer not null,
	lastupdated timestamp default now() not null 
)
;

