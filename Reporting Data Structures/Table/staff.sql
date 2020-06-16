create table staff.staffidentity
(
	staffnumber varchar(20) not null
        constraint staffidentity_pkey
			primary key,
	firstname varchar(50),
	lastname varchar(50),
	lastupdated timestamp default now() not null,
	fullname varchar(100)
)
;

