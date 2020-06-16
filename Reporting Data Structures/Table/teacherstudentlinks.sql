create table roster.teacherstudentlinks
(
	sectionid bigint,
	courseid bigint,
	studentnumber varchar(10),
	rosterstartdate date,
	rosterenddate date,
	staffnumber varchar(15),
	staffstartdate date,
	staffenddate date,
	endyear integer,
	lastupdated timestamp default now() not null
)
;

