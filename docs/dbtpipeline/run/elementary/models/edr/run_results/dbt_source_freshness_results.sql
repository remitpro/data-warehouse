
      

    
        
            delete from "Elementary"."elementary"."dbt_source_freshness_results"
            where (
                source_freshness_execution_id) in (
                select (source_freshness_execution_id)
                from "Elementary"."elementary"."dbt_source_freshness_results__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "Elementary"."elementary"."dbt_source_freshness_results" ("source_freshness_execution_id", "unique_id", "max_loaded_at", "snapshotted_at", "generated_at", "created_at", "max_loaded_at_time_ago_in_s", "status", "error", "compile_started_at", "compile_completed_at", "execute_started_at", "execute_completed_at", "invocation_id", "warn_after", "error_after", "filter")
    (
        select "source_freshness_execution_id", "unique_id", "max_loaded_at", "snapshotted_at", "generated_at", "created_at", "max_loaded_at_time_ago_in_s", "status", "error", "compile_started_at", "compile_completed_at", "execute_started_at", "execute_completed_at", "invocation_id", "warn_after", "error_after", "filter"
        from "Elementary"."elementary"."dbt_source_freshness_results__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  