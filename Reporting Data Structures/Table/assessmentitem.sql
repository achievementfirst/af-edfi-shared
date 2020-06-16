create table illuminate.assessmentitem
(
	assessmentid varchar(60) not null,
	questionid varchar(60) not null,
	questionnumber varchar(60),
	questionsequence varchar(10),
	maximum real,
	correctanswer varchar(50) not null,
	questiontype varchar(10),
	difficultyflag varchar(10),
	fluencyflag varchar(20),
	rawpointsworth numeric(13,10),
	testyear integer not null,
	lastupdated timestamp default now() not null,	
	constraint assessmentitem_pkey
		primary key (assessmentid, questionid)
)
;

