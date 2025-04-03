with source as (

    select * from "remitpro"."dbo"."Order Details"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source