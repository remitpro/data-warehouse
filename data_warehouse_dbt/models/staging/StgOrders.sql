

with source as (

    select * from {{ source('northwind', 'Orders') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source
