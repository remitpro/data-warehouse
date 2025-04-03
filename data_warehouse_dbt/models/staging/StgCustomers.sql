
with source as (

    select * from {{ source('northwind', 'Customers') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source

