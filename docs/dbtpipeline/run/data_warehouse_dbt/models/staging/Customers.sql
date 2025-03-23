USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "staging"."Customers__dbt_tmp" as select * from Northwind.dbo.Customers
WHERE CustomerID is not null;
    ')

