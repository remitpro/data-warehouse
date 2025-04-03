
  
    USE [remitpro];
    USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "data_marts"."DimCustomer__dbt_tmp__dbt_tmp_vw" as 

SELECT
ROW_NUMBER() OVER (ORDER BY [CustomerID]) AS CustomerKey,
CustomerID,
CompanyName,
ContactName,
ContactTitle,
Country as CustomerCountry,
Region as CustomerRegion,
City as CustomerCity,
PostalCode as CustomerPostalCode,
''Y'' as RowIsCurrent,
IngestionTimestamp as  RowStartDate,
''12/31/9999'' as RowEndDate,
''Updated'' as RowChangeReason

 FROM "remitpro"."staging"."StgCustomers"

 WHERE CustomerID IS NOT NULL;
    ')

EXEC('
            SELECT * INTO "remitpro"."data_marts"."DimCustomer__dbt_tmp" FROM "remitpro"."data_marts"."DimCustomer__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS data_marts.DimCustomer__dbt_tmp__dbt_tmp_vw')



    
    use [remitpro];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'data_marts_DimCustomer__dbt_tmp_cci'
        AND object_id=object_id('data_marts_DimCustomer__dbt_tmp')
    )
    DROP index "data_marts"."DimCustomer__dbt_tmp".data_marts_DimCustomer__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX data_marts_DimCustomer__dbt_tmp_cci
    ON "data_marts"."DimCustomer__dbt_tmp"

   


  