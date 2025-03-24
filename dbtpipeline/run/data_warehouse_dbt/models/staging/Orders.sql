USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "staging"."Orders__dbt_tmp" as SELECT * FROM Northwind.dbo.Orders;
    ')

