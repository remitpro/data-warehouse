
  
  

  
  USE [remitpro];
  EXEC('create view 

    [dbt_test__audit.testview_1586ed3ee44ecaede1999cc78c38fa79]
   as 
    
    

select
    payment_id as unique_field,
    count(*) as n_records

from "remitpro"."demo"."stg_payments"
where payment_id is not null
group by payment_id
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

    [dbt_test__audit.testview_1586ed3ee44ecaede1999cc78c38fa79]
  
  ) dbt_internal_test;

  USE [remitpro];
  EXEC('drop view 

    [dbt_test__audit.testview_1586ed3ee44ecaede1999cc78c38fa79]
  ;')