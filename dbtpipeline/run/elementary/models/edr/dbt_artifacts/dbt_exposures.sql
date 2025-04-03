
      

    
        
            delete from "remitpro"."elementary"."dbt_exposures"
            where (
                unique_id) in (
                select (unique_id)
                from "remitpro"."elementary"."dbt_exposures__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "remitpro"."elementary"."dbt_exposures" ("unique_id", "name", "maturity", "type", "owner_email", "owner_name", "url", "depends_on_macros", "depends_on_nodes", "description", "tags", "meta", "package_name", "original_path", "path", "generated_at", "metadata_hash", "label", "raw_queries")
    (
        select "unique_id", "name", "maturity", "type", "owner_email", "owner_name", "url", "depends_on_macros", "depends_on_nodes", "description", "tags", "meta", "package_name", "original_path", "path", "generated_at", "metadata_hash", "label", "raw_queries"
        from "remitpro"."elementary"."dbt_exposures__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  