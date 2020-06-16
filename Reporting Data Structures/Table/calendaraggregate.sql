create table schedule.calendaraggregate
(
	calendarnumber integer not null 
		constraint calendaraggregate_pkey
			primary key,
	attendancesytd integer not null,
	attendancesy integer not null,
	calendarstartdate date not null,
	calendarenddate date not null,
	endyear smallint not null,
	lastupdated timestamp default now() not null,
	schoolnumber integer
	);

