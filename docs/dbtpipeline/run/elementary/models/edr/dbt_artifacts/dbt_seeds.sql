
      

    
        
            delete from "Elementary"."elementary"."dbt_seeds"
            where (
                unique_id) in (
                select (unique_id)
                from "Elementary"."elementary"."dbt_seeds__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "Elementary"."elementary"."dbt_seeds" ("unique_id", "alias", "checksum", "tags", "meta", "owner", "database_name", "schema_name", "description", "name", "package_name", "original_path", "path", "generated_at", "metadata_hash")
    (
        select "unique_id", "alias", "checksum", "tags", "meta", "owner", "database_name", "schema_name", "description", "name", "package_name", "original_path", "path", "generated_at", "metadata_hash"
        from "Elementary"."elementary"."dbt_seeds__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  