create table schedule.school
(
	schoolnumber integer not null
		constraint school_pkey
			primary key,
	schoolname varchar(50) not null,
	region varchar(2) not null,
	level varchar(2),
	schoolabbreviation varchar(10) not null,
	active boolean not null,
	lastupdated timestamp default now() not null
);

