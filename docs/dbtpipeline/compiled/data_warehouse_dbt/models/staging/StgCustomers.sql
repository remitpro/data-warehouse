with source as (

    select * from "remitpro"."dbo"."Customers"
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source