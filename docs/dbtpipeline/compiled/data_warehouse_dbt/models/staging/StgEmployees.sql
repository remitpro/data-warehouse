with source as (

    select * from "remitpro"."dbo"."Employees"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source