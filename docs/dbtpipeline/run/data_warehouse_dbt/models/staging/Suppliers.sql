USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "staging"."Suppliers__dbt_tmp" as SELECT * FROM Northwind.dbo.Suppliers;
    ')

