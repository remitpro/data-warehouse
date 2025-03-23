USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "staging"."OrderDetails__dbt_tmp" as SELECT * FROM Northwind.dbo.OrderDetails;
    ')

