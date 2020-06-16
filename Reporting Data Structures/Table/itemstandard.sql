create table illuminate.itemstandard
(
	assessmentid varchar(60) not null,
	questionid varchar(60) not null ,
	standardid varchar(60) not null,
	standardcode varchar(255),
	standarddescription varchar(1000),
	testyear integer not null,
	lastupdated timestamp default now() not null,
	constraint itemstandard_pkey
		primary key (assessmentid, questionid, standardid)
	
)
;

