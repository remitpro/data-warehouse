
{{ config(
    materialized='incremental',
    sort='ProductID',
    on_schema_change='fail',
    alias='dimproduct',
    tags=['northwind', 'dim_product']
) }}

ROW_NUMBER() OVER (ORDER BY [ProductID]) AS ProductKey
	,[ProductID]
      ,[ProductName]
      ,sup.CompanyName as  SupplierName
      ,cat.CategoryName
      ,[Discontinued]
	 ,'Y' as  RowIsCurrent
    -- Indicates the current active row in a Slowly Changing Dimension (SCD) implementation
        ,'12/31/9999' as RowEndDate -- Placeholder for an open-ended date
		,'12/31/9999' as RowEndDate
        , 'Updated' as RowChangeReason -- Indicates the reason for the row change, can be parameterized for dynamic updates
  FROM  {{ ref('StgProducts') }} AS p
  JOIN {{  ref('StgCategories')  }} AS cat on cat.CategoryID=p.CategoryID
  JOIN  {{ ref('StgSuppliers') }} AS sup ON sup.SupplierID = p.SupplierID