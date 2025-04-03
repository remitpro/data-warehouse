
      

    
        
            delete from "remitpro"."elementary"."dbt_snapshots"
            where (
                unique_id) in (
                select (unique_id)
                from "remitpro"."elementary"."dbt_snapshots__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "remitpro"."elementary"."dbt_snapshots" ("unique_id", "alias", "checksum", "materialization", "tags", "meta", "owner", "database_name", "schema_name", "depends_on_macros", "depends_on_nodes", "description", "name", "package_name", "original_path", "path", "patch_path", "generated_at", "metadata_hash")
    (
        select "unique_id", "alias", "checksum", "materialization", "tags", "meta", "owner", "database_name", "schema_name", "depends_on_macros", "depends_on_nodes", "description", "name", "package_name", "original_path", "path", "patch_path", "generated_at", "metadata_hash"
        from "remitpro"."elementary"."dbt_snapshots__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  