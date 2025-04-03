
with source as (

    select * from {{ source('northwind', 'Region') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source
