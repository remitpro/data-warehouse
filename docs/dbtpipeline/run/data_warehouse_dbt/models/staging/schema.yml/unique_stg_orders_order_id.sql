
  
  

  
  USE [remitpro];
  EXEC('create view 

    [dbt_test__audit.testview_cbb515d93bbbc680348d583aaab46356]
   as 
    
    

select
    order_id as unique_field,
    count(*) as n_records

from "remitpro"."demo"."stg_orders"
where order_id is not null
group by order_id
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_cbb515d93bbbc680348d583aaab46356]
  
  ) dbt_internal_test;

  USE [remitpro];
  EXEC('drop view 

    [dbt_test__audit.testview_cbb515d93bbbc680348d583aaab46356]
  ;')