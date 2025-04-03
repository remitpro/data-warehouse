with source as (

    select * from "remitpro"."dbo"."EmployeeTerritories"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source