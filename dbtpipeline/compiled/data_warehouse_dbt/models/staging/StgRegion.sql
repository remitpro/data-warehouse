with source as (

    select * from "remitpro"."dbo"."Region"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source