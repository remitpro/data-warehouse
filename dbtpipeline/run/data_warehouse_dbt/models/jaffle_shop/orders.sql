
  
    USE [remitpro];
    USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "demo"."orders__dbt_tmp__dbt_tmp_vw" as 

with orders as (

    select * from "remitpro"."demo"."stg_orders"

),

payments as (

    select * from "remitpro"."demo"."stg_payments"

),

order_payments as (

    select
        order_id,

        sum(case when payment_method = ''credit_card'' then amount else 0 end) as credit_card_amount,
        sum(case when payment_method = ''coupon'' then amount else 0 end) as coupon_amount,
        sum(case when payment_method = ''bank_transfer'' then amount else 0 end) as bank_transfer_amount,
        sum(case when payment_method = ''gift_card'' then amount else 0 end) as gift_card_amount,
        sum(amount) as total_amount

    from payments

    group by order_id

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,

        order_payments.credit_card_amount,

        order_payments.coupon_amount,

        order_payments.bank_transfer_amount,

        order_payments.gift_card_amount,

        order_payments.total_amount as amount

    from orders


    left join order_payments
        on orders.order_id = order_payments.order_id

)

select * from final;
    ')

EXEC('
            SELECT * INTO "remitpro"."demo"."orders__dbt_tmp" FROM "remitpro"."demo"."orders__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS demo.orders__dbt_tmp__dbt_tmp_vw')



    
    use [remitpro];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'demo_orders__dbt_tmp_cci'
        AND object_id=object_id('demo_orders__dbt_tmp')
    )
    DROP index "demo"."orders__dbt_tmp".demo_orders__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX demo_orders__dbt_tmp_cci
    ON "demo"."orders__dbt_tmp"

   


  