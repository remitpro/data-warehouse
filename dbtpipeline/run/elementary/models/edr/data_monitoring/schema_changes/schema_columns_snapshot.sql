
      
  
    USE [remitpro];
    USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "elementary"."schema_columns_snapshot__dbt_tmp_vw" as 


    with empty_table as (
            select
            
                
        cast(''dummy_string'' as varchar(4096)) as column_state_id

,
                
        cast(''dummy_string'' as varchar(4096)) as full_column_name

,
                
        cast(''dummy_string'' as varchar(4096)) as full_table_name

,
                
        cast(''dummy_string'' as varchar(4096)) as column_name

,
                
        cast(''dummy_string'' as varchar(4096)) as data_type

,
                
        cast (True as boolean) as is_new

,
                cast(''2091-02-17'' as DATETIME2(6)) as detected_at

,
                cast(''2091-02-17'' as DATETIME2(6)) as created_at


            )
        select * from empty_table
        where 1 = 0
;
    ')

EXEC('
            SELECT * INTO "remitpro"."elementary"."schema_columns_snapshot" FROM "remitpro"."elementary"."schema_columns_snapshot__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS elementary.schema_columns_snapshot__dbt_tmp_vw')



    
    use [remitpro];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'elementary_schema_columns_snapshot_cci'
        AND object_id=object_id('elementary_schema_columns_snapshot')
    )
    DROP index "elementary"."schema_columns_snapshot".elementary_schema_columns_snapshot_cci
    CREATE CLUSTERED COLUMNSTORE INDEX elementary_schema_columns_snapshot_cci
    ON "elementary"."schema_columns_snapshot"

   


  
  