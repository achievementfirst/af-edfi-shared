WITH CalendarAggregate AS(
    SELECT CD.CalendarCode
    , MIN(CD.Date) AS CalendarStartDate
    , MAX(CD.Date) AS CalendarEndDate
    FROM edfi.CalendarDate AS CD
    GROUP BY CD.CalendarCode
)

SELECT DISTINCT CAST(C.CalendarCode AS INT) AS CalendarNumber
    , CA.CalendarName AS CalendarName
    , CalendarStartDate AS CalendarStartDate
    , CalendarEndDate AS CalendarEndDate
    , CD.Date AS Date
    , CASE WHEN Descriptor.CodeValue = 'Instructional day' THEN 1 ELSE 0 END AS Instruction
    , C.SchoolYear AS EndYear
    , (C.SchoolYear-1) + '-' + C.SchoolYear AS SchoolYear
    , NOW() AS LastUpdated
    , C.SchoolId AS SchoolNumber
FROM edfi.Calendar as C
INNER JOIN schedule.Calendar as CA ON C.CalendarCode=CA.CalendarID
INNER JOIN edfi.CalendarDate as CD on C.CalendarCode=CD.CalendarCode
INNER JOIN edfi.SchoolYearType as SYT ON C.SchoolYear=SYT.SchoolYear AND SYT.CurrentSchoolYear=1
INNER JOIN CalendarAggregate AS CAgg ON C.CalendarCode=CAgg.CalendarCode
LEFT JOIN edfi.CalendarDateCalendarEvent CE on C.CalendarCode=CE.CalendarCode
LEFT JOIN edfi.Descriptor on CE.CalendarEventDescriptorID=Descriptor.DescriptorID


      