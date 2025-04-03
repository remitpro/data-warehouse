
    
    

select
    EmployeeID as unique_field,
    count(*) as n_records

from "remitpro"."data_marts"."DimEmployee"
where EmployeeID is not null
group by EmployeeID
having count(*) > 1


