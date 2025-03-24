
with source as (

    select * from {{ source('northwind', 'Categories') }}
)
select 
    *,
    CURRENT_TIMESTAMP() as ingestion_timestamp
from source
