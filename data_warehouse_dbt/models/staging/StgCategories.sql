select 
tb.*,
CURRENT_TIMESTAMP as IngestionTimestamp

from {{ source('northwind', 'Categories') }} tb
