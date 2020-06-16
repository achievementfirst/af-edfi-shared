create table schedule.calendar
(
	calendarnumber integer not null,
	calendarname varchar(50) not null,
	calendarstartdate date not null,
	calendarenddate date not null,
	date date not null,
	attendance boolean not null,
	endyear smallint not null,
	schoolyear varchar(10) not null,
	lastupdated timestamp default now() not null,
	schoolnumber integer,
	constraint calendar_pkey
		primary key (calendarnumber, date)
);

