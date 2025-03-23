
{{ config(
    materialized='incremental',
    unique_key='ProductID',
    sort='ProductKey',
    on_schema_change='fail',
    alias='dimproduct',
    tags=['northwind', 'DimProduct']
) }}

SELECT 
ROW_NUMBER() OVER (ORDER BY [ProductID]) AS ProductKey
	,[ProductID]
      ,[ProductName]
      ,sup.CompanyName as  SupplierName
      ,cat.CategoryName
      ,[Discontinued]
	 ,'Y' as  RowIsCurrent
	, GETDATE() as 	RowStartDate
		,'12/31/9999' as RowEndDate
		, 'Updated' as RowChangeReason
  FROM  {{ ref('Products')}}  p
  JOIN {{  ref('Categories')  }}  cat on cat.CategoryID=p.CategoryID
  JOIN  {{ ref('Suppliers')}}     sup on sup.SupplierID=p.SupplierID