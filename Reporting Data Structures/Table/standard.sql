create table illuminate.standard
(
	standardid varchar(60) not null 
		constraint standard_pkey
			primary key,
	standardcode varchar(255),
	standardlabel varchar(255),
	customcode varchar(200),
	standarddescription varchar(1000),
	testyear integer not null,
	lastupdated timestamp default now() not null 
)

;

