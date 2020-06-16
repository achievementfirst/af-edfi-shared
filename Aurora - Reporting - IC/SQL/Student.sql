SELECT DISTINCT ST.StudentUniqueID AS StudentNumber
    , S.StateID AS StateID
    , ST.FirstName AS FirstName
    , ST.MiddleName AS MiddleName
    , ST.LastName AS LastName
    , ST.LastName + ', ' + ST.FirstName AS FullName
	, NULL as Advisory 
    , CASE WHEN race.CodeValue IS NULL THEN 'Unknown' ELSE race.CodeValue END AS RaceEthnicityPrimary
    , CASE WHEN race.CodeValue <> 'Hispanic'  THEN CAST(0 AS BIT) else CAST(1 AS BIT) END AS HispanicEthnicity 
    , CASE WHEN Descriptor.Code IS NULL THEN 'Unknown' ELSE Descriptor.Code END AS Gender
    , EM.ElectronicMail AS EmailAddress
    , S.Charter AS Charter
	, S.OriginalCharter AS OriginalCharter
    , NOW() AS LastUpdated
	, ST.BirthDate AS DateOfBirth
	, SSA.ClassofSchoolYear AS ClassYear
FROM studentdemographics.Student AS S
INNER JOIN edfi.Student AS ST on S.StudentNumber=ST.StudentUniqueID
INNER JOIN edfi.StudentSchoolAssociation SSA ON ST.StudentUSI=SSA.StudentUSI
INNER JOIN edfi.SchoolYearType SYT ON SSA.SchoolYear=SYT.SchoolYear AND CurrentSchoolYear=1
LEFT JOIN edfi.Descriptor on ST.BirthSexdescriptorID=Descriptor.DescriptorID
LEFT JOIN edfi.StudentEducationOrganizationAssociationRace SRA ON ST.StudentUSI=SRA.StudentUSI 
    AND SSA.SchoolID=SRA.EducationOrganizationID
INNER JOIN edfi.StudentEducationOrganizationAssociationElectronicMail EM ON ST.StudentUSI=EM.StudentUSI
    AND SSA.SchoolID=EM.EducationOrganizationID
LEFT JOIN edfi.Descriptor as race on SRA.RaceDescriptorID=race.DescriptorID 
	
