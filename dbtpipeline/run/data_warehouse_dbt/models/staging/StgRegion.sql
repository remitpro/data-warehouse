USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "staging"."StgRegion__dbt_tmp" as with source as (

    select * from "remitpro"."dbo"."Region"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source;
    ')

