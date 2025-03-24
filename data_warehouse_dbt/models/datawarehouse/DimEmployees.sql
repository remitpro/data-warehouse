
{{
    config(
        materialized='incremental',
        unique_key='EmployeeID',
        check_cols=['EmployeeID'],
        alias='dimemployee',
        tags=['northwind', 'DimEmployee']
    
    )
}}

SELECT 
ROW_NUMBER() OVER (ORDER BY [EmployeeID]) AS EmployeeKey,
EmployeeID
, CONCAT(LastName, ', ', FirstName) as EmployeeName
    ,Title as EmployeeTitle
    ,'Y' as RowIsCurrent
 ,GETDATE() as  RowStartDate,
CAST('9999-12-31' AS DATE) as RowEndDate,
CASE 
    WHEN UpdatedAt > (SELECT MAX(RowStartDate) FROM {{ this }}) THEN 'Updated'
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY EmployeeID ORDER BY UpdatedAt DESC) AS row_num
    FROM {{ ref('StgEmployees') }}
) filtered_employees
WHERE row_num = 1
END as RowChangeReason

FROM {{ ref('StgEmployees') }}

{% if is_incremental() %}
WHERE UpdatedAt > (SELECT MAX(RowStartDate) FROM {{ this }})
{% endif %}
