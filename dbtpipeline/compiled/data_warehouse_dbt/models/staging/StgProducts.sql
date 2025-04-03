with source as (

    select * from "remitpro"."dbo"."Products"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source