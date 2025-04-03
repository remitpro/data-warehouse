
      

    
        
            delete from "remitpro"."elementary"."test_result_rows"
            where (
                elementary_test_results_id) in (
                select (elementary_test_results_id)
                from "remitpro"."elementary"."test_result_rows__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "remitpro"."elementary"."test_result_rows" ("elementary_test_results_id", "result_row", "detected_at", "created_at")
    (
        select "elementary_test_results_id", "result_row", "detected_at", "created_at"
        from "remitpro"."elementary"."test_result_rows__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  