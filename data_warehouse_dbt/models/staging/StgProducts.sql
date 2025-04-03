
with source as (

    select * from {{ source('northwind', 'Products') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source
