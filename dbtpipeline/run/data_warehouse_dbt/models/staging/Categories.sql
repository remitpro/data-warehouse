USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "staging"."Categories__dbt_tmp" as SELECT *  FROM Northwind.dbo.Categories
WHERE CategoryID IS NOT NULL;
    ')

