USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "demo"."stg_customers__dbt_tmp" as with source as (
    select * from "remitpro"."demo"."raw_customers"

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed;
    ')

