
  
  

  
  USE [remitpro];
  EXEC('create view 

    [dbt_test__audit.testview_911b22e97d72393528b5becc4abded78]
   as 
    
    

with all_values as (

    select
        payment_method as value_field,
        count(*) as n_records

    from "remitpro"."demo"."stg_payments"
    group by payment_method

)

select *
from all_values
where value_field not in (
    ''credit_card'',''coupon'',''bank_transfer'',''gift_card''
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

    [dbt_test__audit.testview_911b22e97d72393528b5becc4abded78]
  
  ) dbt_internal_test;

  USE [remitpro];
  EXEC('drop view 

    [dbt_test__audit.testview_911b22e97d72393528b5becc4abded78]
  ;')