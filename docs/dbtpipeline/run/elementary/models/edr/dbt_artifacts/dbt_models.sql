
      

    
        
            delete from "Elementary"."elementary"."dbt_models"
            where (
                unique_id) in (
                select (unique_id)
                from "Elementary"."elementary"."dbt_models__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "Elementary"."elementary"."dbt_models" ("unique_id", "alias", "checksum", "materialization", "tags", "meta", "owner", "database_name", "schema_name", "depends_on_macros", "depends_on_nodes", "description", "name", "package_name", "original_path", "path", "patch_path", "generated_at", "metadata_hash")
    (
        select "unique_id", "alias", "checksum", "materialization", "tags", "meta", "owner", "database_name", "schema_name", "depends_on_macros", "depends_on_nodes", "description", "name", "package_name", "original_path", "path", "patch_path", "generated_at", "metadata_hash"
        from "Elementary"."elementary"."dbt_models__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  