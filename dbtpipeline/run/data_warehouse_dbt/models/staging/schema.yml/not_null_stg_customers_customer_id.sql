
  
  

  
  USE [remitpro];
  EXEC('create view 

    [dbt_test__audit.testview_cf00731b87b7e3cdfeff09717df4a266]
   as 
    
    



select customer_id
from "remitpro"."demo"."stg_customers"
where customer_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_cf00731b87b7e3cdfeff09717df4a266]
  
  ) dbt_internal_test;

  USE [remitpro];
  EXEC('drop view 

    [dbt_test__audit.testview_cf00731b87b7e3cdfeff09717df4a266]
  ;')