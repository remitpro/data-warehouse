USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "staging"."StgSuppliers__dbt_tmp" as with source as (

    select * from "remitpro"."dbo"."Suppliers"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source;
    ')

