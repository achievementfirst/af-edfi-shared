create table roster.course
(
	courseid bigint not null
		constraint course_pkey
			primary key,
	coursenumber varchar(15),
	calendarnumber integer,
	coursename varchar(50),
	department varchar(50),
	active boolean,
	endyear integer,
	lastupdated timestamp default now() not null,
)
;

