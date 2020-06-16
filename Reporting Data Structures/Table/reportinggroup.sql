create table illuminate.reportinggroup
(
	reportinggroupid bigint not null 
		constraint reportinggroup_pkey
			primary key,
	reportinggrouplabel varchar(255),
	testyear integer not null ,
	lastupdated timestamp default now() not null
)
;

