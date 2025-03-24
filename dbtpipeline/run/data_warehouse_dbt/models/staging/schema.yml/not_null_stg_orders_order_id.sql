
  
  

  
  USE [remitpro];
  EXEC('create view 

    [dbt_test__audit.testview_111d84510433e4c877c7cc38c410a20a]
   as 
    
    



select order_id
from "remitpro"."demo"."stg_orders"
where order_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_111d84510433e4c877c7cc38c410a20a]
  
  ) dbt_internal_test;

  USE [remitpro];
  EXEC('drop view 

    [dbt_test__audit.testview_111d84510433e4c877c7cc38c410a20a]
  ;')