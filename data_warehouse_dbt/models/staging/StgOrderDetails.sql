
with source as (

    select * from {{ source('northwind', 'OrderDetails') }}
)
select 
    *,
    CURRENT_TIMESTAMP() as IngestionTimestamp
from source
