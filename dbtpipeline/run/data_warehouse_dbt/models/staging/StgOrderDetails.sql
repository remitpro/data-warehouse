USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "staging"."StgOrderDetails__dbt_tmp" as with source as (

    select * from "remitpro"."dbo"."Order Details"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source;
    ')

