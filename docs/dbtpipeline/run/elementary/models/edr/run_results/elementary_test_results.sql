
      

    
        
            delete from "Elementary"."elementary"."elementary_test_results"
            where (
                id) in (
                select (id)
                from "Elementary"."elementary"."elementary_test_results__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "Elementary"."elementary"."elementary_test_results" ("id", "data_issue_id", "test_execution_id", "test_unique_id", "model_unique_id", "invocation_id", "detected_at", "created_at", "database_name", "schema_name", "table_name", "column_name", "test_type", "test_sub_type", "test_results_description", "owners", "tags", "test_results_query", "other", "test_name", "test_params", "severity", "status", "failures", "test_short_name", "test_alias", "result_rows", "failed_row_count")
    (
        select "id", "data_issue_id", "test_execution_id", "test_unique_id", "model_unique_id", "invocation_id", "detected_at", "created_at", "database_name", "schema_name", "table_name", "column_name", "test_type", "test_sub_type", "test_results_description", "owners", "tags", "test_results_query", "other", "test_name", "test_params", "severity", "status", "failures", "test_short_name", "test_alias", "result_rows", "failed_row_count"
        from "Elementary"."elementary"."elementary_test_results__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  