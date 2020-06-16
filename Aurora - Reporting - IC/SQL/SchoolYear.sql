SELECT sy.SchoolYearDescription AS SchoolYear
, CONCAT(SUBSTRING(sy.SchoolYearDescription, 3,2), '-', SUBSTRING(sy.SchoolYearDescription, 3,2)) AS SchoolYearShort
, sy.SchoolYear AS EndYear
, sy.CurrentSchoolYear AS Active
, NULL as YearsAgo -- This field is manually updated in this table. The value is 0 for the current year and an increment of 1 for every year prior to the current year.
, NOW() AS LastUpdated
FROM edfi.SchoolYearType sy