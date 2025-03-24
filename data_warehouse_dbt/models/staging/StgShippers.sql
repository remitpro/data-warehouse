

with source as (

    select * from {{ source('northwind', 'Shippers') }}
)
select 
    *,
    CURRENT_TIMESTAMP() as IngestionTimestamp
from source
