
  
    USE [remitpro];
    USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "data_marts"."DimEmployee__dbt_tmp__dbt_tmp_vw" as 

SELECT 
ROW_NUMBER() OVER (ORDER BY [EmployeeID]) AS EmployeeKey,
EmployeeID
, CONCAT(LastName, '', '', FirstName) as EmployeeName
,Title as EmployeeTitle
,''Y'' as RowIsCurrent
,IngestionTimestamp as  RowStartDate,
CAST(''9999-12-31'' AS DATE) as RowEndDate,
''Updated'' as  RowChangeReason

FROM "remitpro"."staging"."StgEmployees"
    
WHERE EmployeeID IS NOT NULL;
    ')

EXEC('
            SELECT * INTO "remitpro"."data_marts"."DimEmployee__dbt_tmp" FROM "remitpro"."data_marts"."DimEmployee__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS data_marts.DimEmployee__dbt_tmp__dbt_tmp_vw')



    
    use [remitpro];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'data_marts_DimEmployee__dbt_tmp_cci'
        AND object_id=object_id('data_marts_DimEmployee__dbt_tmp')
    )
    DROP index "data_marts"."DimEmployee__dbt_tmp".data_marts_DimEmployee__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX data_marts_DimEmployee__dbt_tmp_cci
    ON "data_marts"."DimEmployee__dbt_tmp"

   


  