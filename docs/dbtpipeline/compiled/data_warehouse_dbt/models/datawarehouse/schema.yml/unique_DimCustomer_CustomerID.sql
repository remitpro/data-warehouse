
    
    

select
    CustomerID as unique_field,
    count(*) as n_records

from "remitpro"."data_marts"."DimCustomer"
where CustomerID is not null
group by CustomerID
having count(*) > 1


