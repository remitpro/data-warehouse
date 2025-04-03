
  
  

  
  USE [remitpro];
  EXEC('create view 

    [dbt_test__audit.testview_9a8cce9354d8d8b2c1e6e925a918f7b0]
   as 
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "remitpro"."demo"."stg_customers"
where customer_id is not null
group by customer_id
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

    [dbt_test__audit.testview_9a8cce9354d8d8b2c1e6e925a918f7b0]
  
  ) dbt_internal_test;

  USE [remitpro];
  EXEC('drop view 

    [dbt_test__audit.testview_9a8cce9354d8d8b2c1e6e925a918f7b0]
  ;')