SELECT DISTINCT E.EducationOrganizationID AS SchoolNumber
    , S.NameOfInstitution AS SchoolName
    , Descriptor.CodeValue AS Region
    , CASE WHEN gradedesc.CodeValue = 'Fifth grade'
        THEN 'MS'
        WHEN gradedesc.CodeValue = 'Ninth grade'
        THEN 'HS'
        WHEN gradedesc.CodeValue='Kindergarten'
        THEN 'ES' END AS Level
    , SMA.SchoolAbbreviation AS SchoolAbbreviation
    , SMA.Active AS Active
    , NOW() AS LastUpdated
FROM edfi.EducationOrganization AS E
INNER JOIN schedule.SchoolManualAttributes AS SMA
    ON E.EducationOrganizationID = CAST(SMA.SchoolNumber AS INT)
INNER JOIN edfi.School AS S
    ON E.EducationOrganizationID=S.SchoolID
INNER JOIN edfi.EducationOrganizationAddress as EOA
	ON S.EducationOrganizationID = EOA.EducationOrganizationID
INNER JOIN edfi.Descriptor 
	ON EOA.StateAbbreviationDescriptorID=Descriptor.DescriptorID
INNER JOIN edfi.SchoolGradeLevel SGL
    ON S.SchoolID=SGL.SchoolID
INNER JOIN edfi.Descriptor GradeDesc
    ON GradeDesc.GradeLevelDescriptorID=Descriptor.Descriptor.DescriptorID
