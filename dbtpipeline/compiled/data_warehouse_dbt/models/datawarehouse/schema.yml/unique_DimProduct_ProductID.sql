
    
    

select
    ProductID as unique_field,
    count(*) as n_records

from "remitpro"."data_marts"."DimProduct"
where ProductID is not null
group by ProductID
having count(*) > 1


