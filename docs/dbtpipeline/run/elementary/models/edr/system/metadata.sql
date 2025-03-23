
  
    USE [Elementary];
    USE [Elementary];
    
    

    

    
    USE [Elementary];
    EXEC('
        create view "elementary"."metadata__dbt_tmp__dbt_tmp_vw" as 

SELECT
    ''0.12.1'' as dbt_pkg_version;
    ')

EXEC('
            SELECT * INTO "Elementary"."elementary"."metadata__dbt_tmp" FROM "Elementary"."elementary"."metadata__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS elementary.metadata__dbt_tmp__dbt_tmp_vw')



    
    use [Elementary];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'elementary_metadata__dbt_tmp_cci'
        AND object_id=object_id('elementary_metadata__dbt_tmp')
    )
    DROP index "elementary"."metadata__dbt_tmp".elementary_metadata__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX elementary_metadata__dbt_tmp_cci
    ON "elementary"."metadata__dbt_tmp"

   


  