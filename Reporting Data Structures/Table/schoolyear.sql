create table schedule.schoolyear
(
	schoolyear varchar(10) not null,
	schoolyearshort varchar(10) not null,
	endyear smallint not null
		constraint schoolyear_pkey
			primary key,
	active boolean not null,
	yearsago int,
	lastupdated timestamp default now() not null
)
;

