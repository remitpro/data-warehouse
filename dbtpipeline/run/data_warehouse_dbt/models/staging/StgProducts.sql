USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "staging"."StgProducts__dbt_tmp" as with source as (

    select * from "remitpro"."dbo"."Products"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source;
    ')

