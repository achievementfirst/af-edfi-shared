create table roster.studentroster
(
	sectionid bigint,
	courseid bigint,
	studentnumber varchar(10),
	rosterstartdate date,
	rosterenddate date,
	endyear integer,
	lastupdated timestamp default now() not null 
)
;

