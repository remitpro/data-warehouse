USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "staging"."StgCategories__dbt_tmp" as select 
tb.*,
CURRENT_TIMESTAMP as IngestionTimestamp

from "remitpro"."dbo"."Categories" tb;
    ')

