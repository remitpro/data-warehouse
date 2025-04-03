
with source as (

    select * from {{ source('northwind', 'Order Details') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source
