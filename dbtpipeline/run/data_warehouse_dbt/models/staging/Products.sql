USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "staging"."Products__dbt_tmp" as SELECT * FROM Northwind.dbo.Products
WHERE ProductID IS NOT NULL;
    ')

