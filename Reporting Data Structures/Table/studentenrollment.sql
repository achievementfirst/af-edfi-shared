create table enrollment.studentenrollment
(
	studentnumber varchar(15) not null,
	schoolnumber integer not null,
	calendarnumber integer not null,
	gradelevel varchar(4) not null,
	numericgradelevel integer not null,
	enrollmentstartdate date not null,
	enrollmentenddate date,
	enrollmentexitdate date not null,
	withdrawalcode varchar(50),
	withdrawaldescription varchar(50),
	retained boolean not null,
	endyear smallint not null,
	schoolyear varchar(20) not null,
	activeenrollment boolean not null,
	mostrecentenrollmentyear boolean not null,
	entrycode varchar(50),
	entrydescription varchar(50),
	lastupdated timestamp,
	completedschoolyear boolean default false,
	constraint studentenrollment_pkey
		primary key (studentnumber, enrollmentstartdate)
)
;

