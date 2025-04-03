USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "staging"."StgEmployeeTerritories__dbt_tmp" as with source as (

    select * from "remitpro"."dbo"."EmployeeTerritories"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source;
    ')

