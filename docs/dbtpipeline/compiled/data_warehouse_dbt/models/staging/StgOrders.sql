with source as (

    select * from "remitpro"."dbo"."Orders"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source