
with source as (

    select * from {{ source('northwind', 'EmployeeTerritories') }}
)
select 
    *,
    CURRENT_TIMESTAMP as IngestionTimestamp
from source
