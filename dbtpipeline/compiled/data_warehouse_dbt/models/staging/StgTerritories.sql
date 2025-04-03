with source as (

    select * from "remitpro"."dbo"."Territories"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source