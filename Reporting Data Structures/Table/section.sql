create table roster.section
(
	sectionid bigint not null
		constraint section_pkey
			primary key,
	courseid bigint not null,
	sectionnumber integer not null,
	sectionstartdate date,
	sectionenddate date,
	endyear integer,
	lastupdated timestamp default now() not null,
	
)
;

