
      
  
    USE [Elementary];
    USE [Elementary];
    
    

    

    
    USE [Elementary];
    EXEC('
        create view "elementary"."dbt_run_results__dbt_tmp_vw" as 

with empty_table as (
            select
            
                
        cast(''this_is_just_a_long_dummy_string'' as varchar(4096)) as model_execution_id

,
                
        cast(''this_is_just_a_long_dummy_string'' as varchar(4096)) as unique_id

,
                
        cast(''dummy_string'' as varchar(4096)) as invocation_id

,
                
        cast(''dummy_string'' as varchar(4096)) as generated_at

,
                cast(''2091-02-17'' as DATETIME2(6)) as created_at

,
                
        cast(''this_is_just_a_long_dummy_string'' as varchar(4096)) as name

,
                
        cast(''this_is_just_a_long_dummy_string'' as varchar(4096)) as message

,
                
        cast(''dummy_string'' as varchar(4096)) as status

,
                
        cast(''dummy_string'' as varchar(4096)) as resource_type

,
                
        cast(123456789.99 as FLOAT) as execution_time

,
                
        cast(''dummy_string'' as varchar(4096)) as execute_started_at

,
                
        cast(''dummy_string'' as varchar(4096)) as execute_completed_at

,
                
        cast(''dummy_string'' as varchar(4096)) as compile_started_at

,
                
        cast(''dummy_string'' as varchar(4096)) as compile_completed_at

,
                
        cast(31474836478 as bigint) as rows_affected

,
                
        cast (True as boolean) as full_refresh

,
                
        cast(''this_is_just_a_long_dummy_string'' as varchar(4096)) as compiled_code

,
                
        cast(31474836478 as bigint) as failures

,
                
        cast(''dummy_string'' as varchar(4096)) as query_id

,
                
        cast(''dummy_string'' as varchar(4096)) as thread_id

,
                
        cast(''dummy_string'' as varchar(4096)) as materialization

,
                
        cast(''dummy_string'' as varchar(4096)) as adapter_response


            )
        select * from empty_table
        where 1 = 0;
    ')

EXEC('
            SELECT * INTO "Elementary"."elementary"."dbt_run_results" FROM "Elementary"."elementary"."dbt_run_results__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS elementary.dbt_run_results__dbt_tmp_vw')



    
    use [Elementary];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'elementary_dbt_run_results_cci'
        AND object_id=object_id('elementary_dbt_run_results')
    )
    DROP index "elementary"."dbt_run_results".elementary_dbt_run_results_cci
    CREATE CLUSTERED COLUMNSTORE INDEX elementary_dbt_run_results_cci
    ON "elementary"."dbt_run_results"

   


  
  