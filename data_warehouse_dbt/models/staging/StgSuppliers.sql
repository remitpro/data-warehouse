

with source as (

    select * from {{ source('northwind', 'Suppliers') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source
