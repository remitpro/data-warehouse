with source as (

    select * from "remitpro"."dbo"."Shippers"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source