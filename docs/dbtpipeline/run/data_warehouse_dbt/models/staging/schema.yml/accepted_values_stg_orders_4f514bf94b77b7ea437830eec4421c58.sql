
  
  

  
  USE [remitpro];
  EXEC('create view 

    [dbt_test__audit.testview_14a7830c0ff617831242c293edc58d26]
   as 
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from "remitpro"."demo"."stg_orders"
    group by status

)

select *
from all_values
where value_field not in (
    ''placed'',''shipped'',''completed'',''return_pending'',''returned''
)


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_14a7830c0ff617831242c293edc58d26]
  
  ) dbt_internal_test;

  USE [remitpro];
  EXEC('drop view 

    [dbt_test__audit.testview_14a7830c0ff617831242c293edc58d26]
  ;')