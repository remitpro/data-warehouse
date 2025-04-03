
with source as (

    select * from {{ source('northwind', 'Employees') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source
