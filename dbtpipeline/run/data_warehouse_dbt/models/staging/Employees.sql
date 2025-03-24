USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "staging"."Employees__dbt_tmp" as SELECT * FROM Northwind.dbo.Employees
WHERE EmployeeID IS NOT NULL;
    ')

