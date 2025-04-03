USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "staging"."stg_customers__dbt_tmp" as select * from Northwind.dbo.Customers;
    ')

