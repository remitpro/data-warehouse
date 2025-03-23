
      

    
        
            delete from "Elementary"."elementary"."dbt_tests"
            where (
                unique_id) in (
                select (unique_id)
                from "Elementary"."elementary"."dbt_tests__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "Elementary"."elementary"."dbt_tests" ("unique_id", "database_name", "schema_name", "name", "short_name", "alias", "test_column_name", "severity", "warn_if", "error_if", "test_params", "test_namespace", "tags", "model_tags", "model_owners", "meta", "depends_on_macros", "depends_on_nodes", "parent_model_unique_id", "description", "package_name", "type", "original_path", "path", "generated_at", "metadata_hash", "quality_dimension")
    (
        select "unique_id", "database_name", "schema_name", "name", "short_name", "alias", "test_column_name", "severity", "warn_if", "error_if", "test_params", "test_namespace", "tags", "model_tags", "model_owners", "meta", "depends_on_macros", "depends_on_nodes", "parent_model_unique_id", "description", "package_name", "type", "original_path", "path", "generated_at", "metadata_hash", "quality_dimension"
        from "Elementary"."elementary"."dbt_tests__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  