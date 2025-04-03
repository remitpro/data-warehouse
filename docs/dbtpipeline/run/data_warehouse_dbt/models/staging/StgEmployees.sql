USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "staging"."StgEmployees__dbt_tmp" as with source as (

    select * from "remitpro"."dbo"."Employees"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source;
    ')

