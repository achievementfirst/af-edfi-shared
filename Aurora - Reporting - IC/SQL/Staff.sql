SELECT S.StaffUniqueID AS StaffNumber
,S.FirstName AS FirstName
,S.LastName AS LastName
,NOW() AS LastUpdated
,CONCAT(S.LastName,', ',S.FirstName) AS FullName
FROM edfi.Staff AS S