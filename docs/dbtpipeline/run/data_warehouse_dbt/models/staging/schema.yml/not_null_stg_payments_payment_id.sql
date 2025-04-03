
  
  

  
  USE [remitpro];
  EXEC('create view 

    [dbt_test__audit.testview_0c1a3c557324245d7cf503c697d55f83]
   as 
    
    



select payment_id
from "remitpro"."demo"."stg_payments"
where payment_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_0c1a3c557324245d7cf503c697d55f83]
  
  ) dbt_internal_test;

  USE [remitpro];
  EXEC('drop view 

    [dbt_test__audit.testview_0c1a3c557324245d7cf503c697d55f83]
  ;')