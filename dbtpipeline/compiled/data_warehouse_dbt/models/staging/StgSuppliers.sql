with source as (

    select * from "remitpro"."dbo"."Suppliers"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source