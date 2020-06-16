import re
from datetime import datetime

date_regex = re.compile('.{4}-.{2}-.{2}')

def parse_calendar(rows):
    parsed_rows = []

    for row in rows:
        CalendarCode = row[0]
        SchoolId = row[1]
        SchoolYear = row[2]
        CalendarTypeDescriptorId = row[3]
        Discriminator = row[4]
        CreateDate = row[5]
        LastModifiedDate = row[6]
        Id = row[7]
        parsed_rows.append((CalendarCode,SchoolId,SchoolYear,CalendarTypeDescriptorId,Discriminator,CreateDate
        ,LastModifiedDate,Id))
    return parsed_rows

def parse_calendardate(rows):
    parsed_rows = []

    for row in rows:
        CalendarCode = row[0]
        Date = row[1]
        SchoolId = row[2]
        SchoolYear = row[3]
        Discriminator = row[4]
        CreateDate = row[5]
        LastModifiedDate = row[6]
        Id = row[7]
        parsed_rows.append((CalendarCode,Date,SchoolId,SchoolYear,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_calendardatecalendarevent(rows):
    parsed_rows = []

    for row in rows:
        CalendarCode = row[0]
        CalendarEventDescriptorId = row[1]
        Date = row[2]
        SchoolId = row[3]
        SchoolYear = row[4]
        CreateDate = row[5]
        parsed_rows.append((CalendarCode,CalendarEventDescriptorId,Date,SchoolId,SchoolYear,CreateDate))
    return parsed_rows

def parse_calendareventdescriptor(rows):
    parsed_rows = []

    for row in rows:
        CalendarEventDescriptorId = row[0]
        parsed_rows.append((CalendarEventDescriptorId))
    return parsed_rows

def parse_course(rows):
    parsed_rows = []

    for row in rows:
        CourseCode = row[0]
        EducationOrganizationId = row[1]
        CourseTitle = row[2]
        NumberOfParts = row[3]
        AcademicSubjectDescriptorId = row[4]
        CourseDescription = row[5]
        TimeRequiredForCompletion = row[6]
        DateCourseAdopted = row[7]
        HighSchoolCourseRequirement = row[8]
        CourseGPAApplicabilityDescriptorId = row[9]
        CourseDefinedByDescriptorId = row[10]
        MinimumAvailableCredits = row[11]
        MinimumAvailableCreditTypeDescriptorId = row[12]
        MinimumAvailableCreditConversion = row[13]
        MaximumAvailableCredits = row[14]
        MaximumAvailableCreditTypeDescriptorId = row[15]
        MaximumAvailableCreditConversion = row[16]
        CareerPathwayDescriptorId = row[17]
        MaxCompletionsForCredit = row[18]
        Discriminator = row[19]
        CreateDate = row[20]
        LastModifiedDate = row[21]
        Id = row[22]
        parsed_rows.append((CourseCode,EducationOrganizationId,CourseTitle,NumberOfParts,AcademicSubjectDescriptorId
        ,CourseDescription,TimeRequiredForCompletion,DateCourseAdopted,HighSchoolCourseRequirement,CourseGPAApplicabilityDescriptorId
        ,CourseDefinedByDescriptorId,MinimumAvailableCredits,MinimumAvailableCreditTypeDescriptorId,MinimumAvailableCreditConversion
        ,MaximumAvailableCredits,MaximumAvailableCreditTypeDescriptorId,MaximumAvailableCreditConversion
        ,CareerPathwayDescriptorId,MaxCompletionsForCredit,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_courseidentificationcode(rows):
    parsed_rows = []

    for row in rows:
        CourseCode = row[0]
        CourseIdentificationSystemDescriptorId = row[1]
        EducationOrganizationId = row[2]
        IdentificationCode = row[3]
        AssigningOrganizationIdentificationCode = row[4]
        CreateDate = row[5]
        parsed_rows.append((CourseCode,CourseIdentificationSystemDescriptorId,EducationOrganizationId
        ,IdentificationCode,AssigningOrganizationIdentificationCode,CreateDate))
    return parsed_rows

def parse_descriptor(rows):
    parsed_rows = []

    for row in rows:
        DescriptorId = row[0]
        Namespace = row[1]
        CodeValue = row[2]
        ShortDescription = row[3]
        Description = row[4]
        PriorDescriptorId = row[5]
        EffectiveBeginDate = row[6]
        EffectiveEndDate = row[7]
        CreateDate = row[8]
        LastModifiedDate = row[9]
        Id = row[10]
        parsed_rows.append((DescriptorId,Namespace,CodeValue,ShortDescription,Description,PriorDescriptorId
        ,EffectiveBeginDate,EffectiveEndDate,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_educationorganization(rows):
    parsed_rows = []

    for row in rows:
        EducationOrganizationId = row[0]
        NameOfInstitution = row[1]
        ShortNameOfInstitution = row[2]
        WebSite = row[3]
        OperationalStatusDescriptorId = row[4]
        Discriminator = row[5]
        CreateDate = row[6]
        LastModifiedDate = row[7]
        Id = row[8]
        parsed_rows.append((EducationOrganizationId,NameOfInstitution,ShortNameOfInstitution,WebSite,OperationalStatusDescriptorId
        ,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_educationorganizationaddress(rows):
    parsed_rows = []

    for row in rows:
        AddressTypeDescriptorId = row[0]
        City = row[1]
        EducationOrganizationId = row[2]
        PostalCode = row[3]
        StateAbbreviationDescriptorId = row[4]
        StreetNumberName = row[5]
        ApartmentRoomSuiteNumber = row[6]
        BuildingSiteNumber = row[7]
        NameOfCounty = row[8]
        CountyFIPSCode = row[9]
        Latitude = row[10]
        Longitude = row[11]
        DoNotPublishIndicator = row[12]
        CongressionalDistrict = row[13]
        LocaleDescriptorId = row[14]
        CreateDate = row[15]
        parsed_rows.append((AddressTypeDescriptorId,City,EducationOrganizationId,PostalCode,StateAbbreviationDescriptorId
        ,StreetNumberName,ApartmentRoomSuiteNumber,BuildingSiteNumber,NameOfCounty,CountyFIPSCode,Latitude,Longitude
        ,DoNotPublishIndicator,CongressionalDistrict,LocaleDescriptorId,CreateDate))
    return parsed_rows
    
def parse_gradeleveldescriptor(rows):
    parsed_rows = []

    for row in rows:
        GradeLevelDescriptorId = row[0]
        parsed_rows.append((GradeLevelDescriptorId))
    return parsed_rows

def parse_school(rows):
    parsed_rows = []

    for row in rows:
        SchoolId = row[0]
        SchoolTypeDescriptorId = row[1]
        CharterStatusDescriptorId = row[2]
        TitleIPartASchoolDesignationDescriptorId = row[3]
        MagnetSpecialProgramEmphasisSchoolDescriptorId = row[4]
        AdministrativeFundingControlDescriptorId = row[5]
        InternetAccessDescriptorId = row[6]
        LocalEducationAgencyId = row[7]
        CharterApprovalAgencyTypeDescriptorId = row[8]
        CharterApprovalSchoolYear = row[9]
        parsed_rows.append((SchoolId,SchoolTypeDescriptorId,CharterStatusDescriptorId,TitleIPartASchoolDesignationDescriptorId
        ,MagnetSpecialProgramEmphasisSchoolDescriptorId,AdministrativeFundingControlDescriptorId,InternetAccessDescriptorId
        ,LocalEducationAgencyId,CharterApprovalAgencyTypeDescriptorId,CharterApprovalSchoolYear))
    return parsed_rows

def parse_schoolgradelevel(rows):
    parsed_rows = []

    for row in rows:
        GradeLevelDescriptorId = row[0]
        SchoolId = row[1]
        CreateDate = row[2]
        parsed_rows.append((GradeLevelDescriptorId,SchoolId,CreateDate))
    return parsed_rows

def parse_schoolyeartype(rows):
    parsed_rows = []

    for row in rows:
        SchoolYear = row[0]
        SchoolYearDescription = row[1]
        CurrentSchoolYear = row[2]
        CreateDate = row[3]
        LastModifiedDate = row[4]
        Id = row[5]
        parsed_rows.append((SchoolYear,SchoolYearDescription,CurrentSchoolYear,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_section(rows):
    parsed_rows = []

    for row in rows:
        LocalCourseCode = row[0]
        SchoolId = row[1]
        SchoolYear = row[2]
        SectionIdentifier = row[3]
        SessionName = row[4]
        SequenceOfCourse = row[5]
        EducationalEnvironmentDescriptorId = row[6]
        MediumOfInstructionDescriptorId = row[7]
        PopulationServedDescriptorId = row[8]
        AvailableCredits = row[9]
        AvailableCreditTypeDescriptorId = row[10]
        AvailableCreditConversion = row[11]
        InstructionLanguageDescriptorId = row[12]
        LocationSchoolId = row[13]
        LocationClassroomIdentificationCode = row[14]
        OfficialAttendancePeriod = row[15]
        Discriminator = row[16]
        CreateDate = row[17]
        LastModifiedDate = row[18]
        Id = row[19]
        parsed_rows.append((LocalCourseCode,SchoolId,SchoolYear,SectionIdentifier,SessionName,SequenceOfCourse
        ,EducationalEnvironmentDescriptorId,MediumOfInstructionDescriptorId,PopulationServedDescriptorId,AvailableCredits
        ,AvailableCreditTypeDescriptorId,AvailableCreditConversion,InstructionLanguageDescriptorId,LocationSchoolId
        ,LocationClassroomIdentificationCode,OfficialAttendancePeriod,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_session(rows):
    parsed_rows = []

    for row in rows:
        SchoolId = row[0]
        SchoolYear = row[1]
        SessionName = row[2]
        BeginDate = row[3]
        EndDate = row[4]
        TermDescriptorId = row[5]
        TotalInstructionalDays = row[6]
        Discriminator = row[7]
        CreateDate = row[8]
        LastModifiedDate = row[9]
        Id = row[10]
        parsed_rows.append((SchoolId,SchoolYear,SessionName,BeginDate,EndDate,TermDescriptorId,TotalInstructionalDays
        ,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_student(rows):
    parsed_rows = []

    for row in rows:
        StudentUSI = row[0]
        PersonalTitlePrefix = row[1]
        FirstName = row[2]
        MiddleName = row[3]
        LastSurname = row[4]
        GenerationCodeSuffix = row[5]
        MaidenName = row[6]
        BirthDate = row[7]
        BirthCity = row[8]
        BirthStateAbbreviationDescriptorId = row[9]
        BirthInternationalProvince = row[10]
        BirthCountryDescriptorId = row[11]
        DateEnteredUS = row[12]
        MultipleBirthStatus = row[13]
        BirthSexDescriptorId = row[14]
        CitizenshipStatusDescriptorId = row[15]
        StudentUniqueId = row[16]
        Discriminator = row[17]
        CreateDate = row[18]
        LastModifiedDate = row[19]
        Id = row[20]
        parsed_rows.append((StudentUSI,PersonalTitlePrefix,FirstName,MiddleName,LastSurname,GenerationCodeSuffix
        ,MaidenName,BirthDate,BirthCity,BirthStateAbbreviationDescriptorId,BirthInternationalProvince,BirthCountryDescriptorId
        ,DateEnteredUS,MultipleBirthStatus,BirthSexDescriptorId,CitizenshipStatusDescriptorId,StudentUniqueId
        ,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_studenteducationorganizationassociationelectronicmail(rows):
    parsed_rows = []

    for row in rows:
        EducationOrganizationId = row[0]
        ElectronicMailTypeDescriptorId = row[1]
        StudentUSI = row[2]
        ElectronicMailAddress = row[3]
        PrimaryEmailAddressIndicator = row[4]
        DoNotPublishIndicator = row[5]
        CreateDate = row[6]
        parsed_rows.append((EducationOrganizationId,ElectronicMailTypeDescriptorId,StudentUSI,ElectronicMailAddress
        ,PrimaryEmailAddressIndicator,DoNotPublishIndicator,CreateDate))
    return parsed_rows

def parse_studenteducationorganizationassociationrace(rows):
    parsed_rows = []

    for row in rows:
        EducationOrganizationId = row[0]
        RaceDescriptorId = row[1]
        StudentUSI = row[2]
        CreateDate = row[3]
        parsed_rows.append((EducationOrganizationId,RaceDescriptorId,StudentUSI,CreateDate))
    return parsed_rows

def parse_studentschoolassociation(rows):
    parsed_rows = []

    for row in rows:
        EntryDate = row[0]
        SchoolId = row[1]
        StudentUSI = row[2]
        PrimarySchool = row[3]
        EntryGradeLevelDescriptorId = row[4]
        EntryGradeLevelReasonDescriptorId = row[5]
        EntryTypeDescriptorId = row[6]
        RepeatGradeIndicator = row[7]
        ClassOfSchoolYear = row[8]
        SchoolChoiceTransfer = row[9]
        ExitWithdrawDate = row[10]
        ExitWithdrawTypeDescriptorId = row[11]
        ResidencyStatusDescriptorId = row[12]
        GraduationPlanTypeDescriptorId = row[13]
        EducationOrganizationId = row[14]
        GraduationSchoolYear = row[15]
        EmployedWhileEnrolled = row[16]
        CalendarCode = row[17]
        SchoolYear = row[18]
        FullTimeEquivalency = row[19]
        TermCompletionIndicator = row[20]
        Discriminator = row[21]
        CreateDate = row[22]
        LastModifiedDate = row[23]
        Id = row[24]
        parsed_rows.append((EntryDate,SchoolId,StudentUSI,PrimarySchool,EntryGradeLevelDescriptorId,EntryGradeLevelReasonDescriptorId
        ,EntryTypeDescriptorId,RepeatGradeIndicator,ClassOfSchoolYear,SchoolChoiceTransfer,ExitWithdrawDate,ExitWithdrawTypeDescriptorId
        ,ResidencyStatusDescriptorId,GraduationPlanTypeDescriptorId,EducationOrganizationId,GraduationSchoolYear,EmployedWhileEnrolled
        ,CalendarCode,SchoolYear,FullTimeEquivalency,TermCompletionIndicator,Discriminator,CreateDate,LastModifiedDate
        ,Id))
    return parsed_rows

def parse_studentsectionassociation(rows):
    parsed_rows = []

    for row in rows:
        BeginDate = row[0]
        LocalCourseCode = row[1]
        SchoolId = row[2]
        SchoolYear = row[3]
        SectionIdentifier = row[4]
        SessionName = row[5]
        StudentUSI = row[6]
        EndDate = row[7]
        HomeroomIndicator = row[8]
        RepeatIdentifierDescriptorId = row[9]
        TeacherStudentDataLinkExclusion = row[10]
        AttemptStatusDescriptorId = row[11]
        Discriminator = row[12]
        CreateDate = row[13]
        LastModifiedDate = row[14]
        Id = row[15]
        parsed_rows.append((BeginDate,LocalCourseCode,SchoolId,SchoolYear,SectionIdentifier,SessionName
        ,StudentUSI,EndDate,HomeroomIndicator,RepeatIdentifierDescriptorId,TeacherStudentDataLinkExclusion
        ,AttemptStatusDescriptorId,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_staff(rows):
    parsed_rows = []

    for row in rows:
        StaffUSI = row[0]
        PersonalTitlePrefix = row[1]
        FirstName = row[2]
        MiddleName = row[3]
        LastSurname = row[4]
        GenerationCodeSuffix = row[5]
        MaidenName = row[6]
        SexDescriptorId = row[7]
        BirthDate = row[8]
        HispanicLatinoEthnicity = row[9]
        OldEthnicityDescriptorId = row[10]
        CitizenshipStatusDescriptorId = row[11]
        HighestCompletedLevelOfEducationDescriptorId = row[12]
        YearsOfPriorProfessionalExperience = row[13]
        YearsOfPriorTeachingExperience = row[14]
        LoginId = row[15]
        HighlyQualifiedTeacher = row[16]
        StaffUniqueId = row[17]
        Discriminator = row[18]
        CreateDate = row[19]
        LastModifiedDate = row[20]
        Id = row[21]
        parsed_rows.append(( StaffUSI,PersonalTitlePrefix,FirstName,MiddleName,LastSurname,GenerationCodeSuffix
        ,MaidenName,SexDescriptorId,BirthDate,HispanicLatinoEthnicity,OldEthnicityDescriptorId,CitizenshipStatusDescriptorId
        ,HighestCompletedLevelOfEducationDescriptorId,YearsOfPriorProfessionalExperience,YearsOfPriorTeachingExperience
        ,LoginId,HighlyQualifiedTeacher,StaffUniqueId,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_staffsectionassociation(rows):
    parsed_rows = []

    for row in rows:
        LocalCourseCode = row[0]
        SchoolId = row[1]
        SchoolYear = row[2]
        SectionIdentifier = row[3]
        SessionName = row[4]
        StaffUSI = row[5]
        ClassroomPositionDescriptorId = row[6]
        BeginDate = row[7]
        EndDate = row[8]
        HighlyQualifiedTeacher = row[9]
        TeacherStudentDataLinkExclusion = row[10]
        PercentageContribution = row[11]
        Discriminator = row[12]
        CreateDate = row[13]
        LastModifiedDate = row[14]
        Id = row[15]
        parsed_rows.append((LocalCourseCode,SchoolId,SchoolYear,SectionIdentifier,SessionName
        ,StaffUSI,ClassroomPositionDescriptorId,BeginDate,EndDate,HighlyQualifiedTeacher
        ,TeacherStudentDataLinkExclusion,PercentageContribution,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows