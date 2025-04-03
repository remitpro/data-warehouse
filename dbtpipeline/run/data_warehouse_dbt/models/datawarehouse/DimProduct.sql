
  
    USE [remitpro];
    USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "data_marts"."DimProduct__dbt_tmp__dbt_tmp_vw" as 

ROW_NUMBER() OVER (ORDER BY [ProductID]) AS ProductKey
,[ProductID]
,[ProductName]
,sup.CompanyName as  SupplierName
,cat.CategoryName
,[Discontinued]
,''Y'' as  RowIsCurrent
-- Indicates the current active row in a Slowly Changing Dimension (SCD) implementation
,IngestionTimestamp as RowStartDate -- Placeholder for an open-ended date
,''12/31/9999'' as RowEndDate
, ''Updated'' as RowChangeReason -- Indicates the reason for the row change, can be parameterized for dynamic updates
FROM  "remitpro"."staging"."StgProducts" AS p
JOIN "remitpro"."staging"."StgCategories" AS cat on cat.CategoryID=p.CategoryID
JOIN  "remitpro"."staging"."StgSuppliers" AS sup ON sup.SupplierID = p.SupplierID;
    ')

EXEC('
            SELECT * INTO "remitpro"."data_marts"."DimProduct__dbt_tmp" FROM "remitpro"."data_marts"."DimProduct__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS data_marts.DimProduct__dbt_tmp__dbt_tmp_vw')



    
    use [remitpro];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'data_marts_DimProduct__dbt_tmp_cci'
        AND object_id=object_id('data_marts_DimProduct__dbt_tmp')
    )
    DROP index "data_marts"."DimProduct__dbt_tmp".data_marts_DimProduct__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX data_marts_DimProduct__dbt_tmp_cci
    ON "data_marts"."DimProduct__dbt_tmp"

   


  