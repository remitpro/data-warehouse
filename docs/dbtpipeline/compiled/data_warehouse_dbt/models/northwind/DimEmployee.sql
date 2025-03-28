

SELECT 
ROW_NUMBER() OVER (ORDER BY [EmployeeID]) AS EmployeeKey,
EmployeeID
, CONCAT(LastName,' ',FirstName) as EmployeeName
    ,Title as EmployeeTitle
    ,'Y' as RowIsCurrent
 ,GETDATE() as  RowStartDate,
'12/31/9999' as RowEndDate,
'Updated' as RowChangeReason

FROM "DBNRemitproDemo"."staging"."Employees"