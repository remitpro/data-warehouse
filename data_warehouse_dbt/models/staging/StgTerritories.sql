with source as (

    select * from {{ source('northwind', 'Territories') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source
