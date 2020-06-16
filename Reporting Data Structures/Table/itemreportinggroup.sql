create table illuminate.itemreportinggroup
(
	questionid varchar(60) not null,
	reportinggroupid bigint not null,
	reportinggrouplabel varchar(255),
	testyear integer not null,
	lastupdated timestamp default now() not null,
	assessmentid varchar(60),
	constraint itemreportinggroup_pkey
		primary key (questionid, reportinggroupid)
)
;

