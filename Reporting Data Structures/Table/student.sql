create table studentdemographics.student
(
	studentnumber varchar(10) not null 
		constraint student_pkey
			primary key,
	stateid varchar(15),
	firstname varchar(50) not null,
	middlename varchar(50),
	lastname varchar(50) not null,
	fullname varchar(100),
	advisory varchar(50),
	raceethnicityprimary varchar(50) not null,
	hispanicethnicity boolean not null,
	gender varchar(10) not null,
	emailaddress varchar(50),
	charter varchar(10),
	originalcharter varchar(10),
	lastupdated timestamp default now() not null,
	dateofbirth date,
	classyear integer
)
;

