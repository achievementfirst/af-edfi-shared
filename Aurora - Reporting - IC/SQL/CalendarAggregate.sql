WITH AttendanceSYTDBlock AS 
(
     SELECT CE.CalendarCode AS CalendarNumber
        , count(*) filter (where Descriptor.Code Value = 'Instructional Day') AS AttendanceSYTD
    FROM edfi.calendarDateCalendarEvent CE 
	INNER JOIN edfi.Descriptor on CE.CalendarDateDescriptorID=Descriptor.DescriptorID
    WHERE CE.Date < CURRENT_DATE
    GROUP BY CE.CalendarCode
),

AttendanceSYBlock AS 
(
     SELECT CE.CalendarCode AS CalendarNumber
        , count(*) filter (where Descriptor.Code Value = 'Instructional Day') AS AttendanceSY
    FROM edfi.calendarDateCalendarEvent CE 
	INNER JOIN edfi.Descriptor on CE.CalendarDateDescriptorID=Descriptor.DescriptorID
    GROUP BY CE.CalendarCode
),

SELECT DISTINCT CAST(C.CalendarCode AS INT) AS CalendarNumber
    , A.AttendanceSYTD AS AttendanceSYTD
    , ASB.AttendanceSY AS AttendanceSY
    , MIN(CD.Date) AS CalendarStartDate
    , MAX(CD.Date)  AS CalendarEndDate
    , C.SchoolYear AS EndYear
    , NOW() AS LastUpdated
    , C.SchoolID AS SchoolNumber
FROM edfi.Calendar C
INNER JOIN edfi.CalendarDate as CD on C.CalendarCode=CD.CalendarCode
INNER JOIN AttendanceSYTDBlock AS A
    ON C.CalendarNumber = A.CalendarNumber
INNER JOIN AttendanceSYBlock AS ASB
    ON C.CalendarNumber = ASB.CalendarNumber
INNER JOIN edfi.SchoolYearType as SYT ON C.SchoolYear=SYT.SchoolYear AND SYT.CurrentSchoolYear=1
GROUP BY C.CalendarCode
        ,C.SchoolYear
        ,C.SchoolId
        ,A.AttendanceSYTD AS AttendanceSYTD
        ,ASB.AttendanceSY AS AttendanceSY
