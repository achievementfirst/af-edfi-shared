create table illuminate.performancelevel
(
	assessmentid varchar(60),
	performancelevelnumeric integer,
	performancelevel varchar(20),
	studentnumber varchar(10),
	testyear integer,
	lastupdated timestamp default ('now'::character varying)::timestamp with time zone not null
)
;

