{{
    config(
        materialized='table',
    
    )
}}

SELECT 
ROW_NUMBER() OVER (ORDER BY [EmployeeID]) AS EmployeeKey,
EmployeeID
, CONCAT(LastName, ', ', FirstName) as EmployeeName
,Title as EmployeeTitle
,'Y' as RowIsCurrent
,IngestionTimestamp as  RowStartDate,
CAST('9999-12-31' AS DATE) as RowEndDate,
'Updated' as  RowChangeReason

FROM {{ ref('StgEmployees') }}
    
WHERE EmployeeID IS NOT NULL

