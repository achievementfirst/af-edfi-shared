import re
from datetime import datetime

date_regex = re.compile('.{4}-.{2}-.{2}')

def parse_assessment(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        Namespace = row[1]
        AssessmentTitle = row[2]
        AssessmentCategoryDescriptorId = row[3]
        AssessmentForm = row[4]
        AssessmentVersion = row[5]
        RevisionDate = row[6]
        MaxRawScore = row[7]
        Nomenclature = row[8]
        AssessmentFamily = row[9]
        EducationOrganizationId = row[10]
        AdaptiveAssessment = row[11]
        Discriminator = row[12]
        CreateDate = row[13]
        LastModifiedDate = row[14]
        Id = row[15]
        parsed_rows.append((AssessmentIdentifier,Namespace,AssessmentTitle,AssessmentCategoryDescriptorId
        ,AssessmentForm,AssessmentVersion,RevisionDate,MaxRawScore,Nomenclature,AssessmentFamily
        ,EducationOrganizationId,AdaptiveAssessment,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_assessmentacademicsubject(rows):
    parsed_rows = []

    for row in rows:
        AcademicSubjectDescriptorId = row[0]
        AssessmentIdentifier = row[1]
        Namespace = row[2]
        CreateDate = row[3]
        parsed_rows.append((AcademicSubjectDescriptorId,AssessmentIdentifier,Namespace,CreateDate))
    return 
    
def parse_assessmentassessedgradelevel(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        GradeLevelDescriptorId = row[1]
        Namespace = row[2]
        CreateDate = row[3]
        parsed_rows.append((AssessmentIdentifier,GradeLevelDescriptorId,Namespace,CreateDate))
    return parsed_rows

def parse_assessmentitem(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        IdentificationCode = row[1]
        Namespace = row[2]
        AssessmentItemCategoryDescriptorId = row[3]
        MaxRawScore = row[4]
        ItemText = row[5]
        CorrectResponse = row[6]
        ExpectedTimeAssessed = row[7]
        Nomenclature = row[8]
        AssessmentItemURI = row[9]
        Discriminator = row[10]
        CreateDate = row[11]
        LastModifiedDate = row[12]
        Id = row[13]
        parsed_rows.append((AssessmentIdentifier,IdentificationCode,Namespace,AssessmentItemCategoryDescriptorId
        ,MaxRawScore,ItemText,CorrectResponse,ExpectedTimeAssessed,Nomenclature,AssessmentItemURI
        ,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows


def parse_assessmentitemcategorydescriptor(rows):
    parsed_rows = []

    for row in rows:
        AssessmentItemCategoryDescriptorId = row[0]
        parsed_rows.append((AssessmentItemCategoryDescriptorId))
    return parsed_rows

def parse_assessmentitemlearningstandard(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        IdentificationCode = row[1]
        LearningStandardId = row[2]
        Namespace = row[3]
        CreateDate = row[4]
        parsed_rows.append((AssessmentIdentifier,IdentificationCode,LearningStandardId,Namespace,CreateDate))
    return parsed_rows
    
def assessmentitemresultdescriptor(rows):
    parsed_rows = []

    for row in rows:
        AssessmentItemResultDescriptorId = row[0]
        parsed_rows.append((AssessmentItemResultDescriptorId))
    return parsed_rows

def parse_assessmentperformancelevel(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        AssessmentReportingMethodDescriptorId = row[1]
        Namespace = row[2]
        PerformanceLevelDescriptorId = row[3]
        MinimumScore = row[4]
        MaximumScore = row[5]
        ResultDatatypeTypeDescriptorId = row[6]
        CreateDate = row[7]
        parsed_rows.append((AssessmentIdentifier,AssessmentReportingMethodDescriptorId,Namespace
        ,PerformanceLevelDescriptorId,MinimumScore,MaximumScore,ResultDatatypeTypeDescriptorId,CreateDate))
    return parsed_rows

def parse_assessmentreportingmethodtype(rows):
    parsed_rows = []

    for row in rows:
        AssessmentReportingMethodDescriptorId = row[0]
        parsed_rows.append((AssessmentReportingMethodDescriptorId))
    return parsed_rows

def parse_assessmentscore(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        AssessmentReportingMethodDescriptorId = row[1]
        Namespace = row[2]
        MinimumScore = row[3]
        MaximumScore = row[4]
        ResultDatatypeTypeDescriptorId = row[5]
        CreateDate = row[6]
        parsed_rows.append((AssessmentIdentifier,AssessmentReportingMethodDescriptorId
        ,Namespace,MinimumScore,MaximumScore,ResultDatatypeTypeDescriptorId,CreateDate))
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

def parse_learningstandard(rows):
    parsed_rows = []

    for row in rows:
        LearningStandardId = row[0]
        Description = row[1]
        LearningStandardItemCode = row[2]
        URI = row[3]
        CourseTitle = row[4]
        SuccessCriteria = row[5]
        ParentLearningStandardId = row[6]
        Namespace = row[7]
        LearningStandardCategoryDescriptorId = row[8]
        LearningStandardScopeDescriptorId = row[9]
        Discriminator = row[10]
        CreateDate = row[11]
        LastModifiedDate = row[12]
        Id = row[13]
        parsed_rows.append((LearningStandardId,Description,LearningStandardItemCode,URI
        ,CourseTitle,SuccessCriteria,ParentLearningStandardId,Namespace,LearningStandardCategoryDescriptorId
        ,LearningStandardScopeDescriptorId,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_studentassessment(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        Namespace = row[1]
        StudentAssessmentIdentifier = row[2]
        StudentUSI = row[3]
        AdministrationDate = row[4]
        AdministrationEndDate = row[5]
        SerialNumber = row[6]
        AdministrationLanguageDescriptorId = row[7]
        AdministrationEnvironmentDescriptorId = row[8]
        RetestIndicatorDescriptorId = row[9]
        ReasonNotTestedDescriptorId = row[10]
        WhenAssessedGradeLevelDescriptorId = row[11]
        EventCircumstanceDescriptorId = row[12]
        EventDescription = row[13]
        SchoolYear = row[14]
        PlatformTypeDescriptorId = row[15]
        Discriminator = row[16]
        CreateDate = row[17]
        LastModifiedDate = row[18]
        Id = row[19]
        parsed_rows.append((AssessmentIdentifier,Namespace,StudentAssessmentIdentifier,StudentUSI
        ,AdministrationDate,AdministrationEndDate,SerialNumber,AdministrationLanguageDescriptorId
        ,AdministrationEnvironmentDescriptorId,RetestIndicatorDescriptorId,ReasonNotTestedDescriptorId
        ,WhenAssessedGradeLevelDescriptorId,EventCircumstanceDescriptorId,EventDescription
        ,SchoolYear,PlatformTypeDescriptorId,Discriminator,CreateDate,LastModifiedDate,Id))
    return parsed_rows

def parse_studentassessmentitem(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        IdentificationCode = row[1]
        Namespace = row[2]
        StudentAssessmentIdentifier = row[3]
        StudentUSI = row[4]
        AssessmentResponse = row[5]
        DescriptiveFeedback = row[6]
        ResponseIndicatorDescriptorId = row[7]
        AssessmentItemResultDescriptorId = row[8]
        RawScoreResult = row[9]
        TimeAssessed = row[10]
        CreateDate = row[11]        
        parsed_rows.append((AssessmentIdentifier,IdentificationCode,Namespace,StudentAssessmentIdentifier
        ,StudentUSI,AssessmentResponse,DescriptiveFeedback,ResponseIndicatorDescriptorId,AssessmentItemResultDescriptorId
        ,RawScoreResult,TimeAssessed,CreateDate))
    return parsed_rows

def parse_studentassessmentperformancelevel(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        AssessmentReportingMethodDescriptorId = row[1]
        Namespace = row[2]
        PerformanceLevelDescriptorId = row[3]
        StudentAssessmentIdentifier = row[4]
        StudentUSI = row[5]
        PerformanceLevelMet = row[6]
        CreateDate = row[7]
        parsed_rows.append((AssessmentIdentifier,AssessmentReportingMethodDescriptorId
        ,Namespace,PerformanceLevelDescriptorId,StudentAssessmentIdentifier,StudentUSI
        ,PerformanceLevelMet,CreateDate))
    return parsed_rows

def parse_studentassessmentscoreresult(rows):
    parsed_rows = []

    for row in rows:
        AssessmentIdentifier = row[0]
        AssessmentReportingMethodDescriptorId = row[1]
        Namespace = row[2]
        StudentAssessmentIdentifier = row[3]
        StudentUSI = row[4]
        Result = row[5]
        ResultDatatypeTypeDescriptorId = row[6]
        CreateDate = row[7]
        parsed_rows.append((AssessmentIdentifier,AssessmentReportingMethodDescriptorId,Namespace
        ,StudentAssessmentIdentifier,StudentUSI,Result,ResultDatatypeTypeDescriptorId,CreateDate))
    return parsed_rows



