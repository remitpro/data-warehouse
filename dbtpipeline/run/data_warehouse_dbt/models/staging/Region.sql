USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "staging"."Region__dbt_tmp" as SELECT * FROM Northwind.dbo.Region;
    ')

