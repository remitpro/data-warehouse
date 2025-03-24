USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "northwind"."FactSales__dbt_tmp" as SELECT 

* 

FROM  Northwind.dbo.Orders Ord
LEFT JOIN Northwind.dbo.Customers cus on cus.CustomerID=ord.CustomerID
LEFT JOIN Northwind.dbo.Employees emp on emp.EmployeeID=ord.EmployeeID
LEFT JOIN Northwind.dbo.[OrderDetails] ordd on ordd.OrderID=ord.OrderID
LEFT JOIN Northwind.dbo.Products prod on prod.ProductID=ordd.ProductID

SELECT 

--ProductKey
--CustomerKey
--EmployeeKey
--OrderDateKey
--ShippedDateKey
--OrderID
--Quantity
--ExtendedPriceAmount
--DiscountAmount
--SoldAmount

prod.ProductKey,
cus.CustomerKey,
emp.EmployeeKey,
ord.OrderDate,
ord.ShippedDate,
ord.OrderID,
ordd.Quantity,
ordd.UnitPrice as ExtendedPriceAmount,
ordd.UnitPrice * ordd.Discount as DiscountAmount,
ordd.Quantity * (1- ordd.Discount) * ordd.UnitPrice as SoldAmount



FROM  "DBNRemitproDemo"."staging"."Orders"  Ord
LEFT JOIN "DBNRemitproDemo"."staging"."Customers"  cus on cus.CustomerID=ord.CustomerID
LEFT JOIN "DBNRemitproDemo"."staging"."Employees"  emp on emp.EmployeeID=ord.EmployeeID
LEFT JOIN "DBNRemitproDemo"."staging"."OrderDetails"  ordd on ordd.OrderID=ord.OrderID
LEFT JOIN "DBNRemitproDemo"."staging"."Products" prod on prod.ProductID=ordd.ProductID;
    ')

