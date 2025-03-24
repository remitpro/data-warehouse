{{
config(
    materialized='incremental',
    unique_key='OrderID',
    sort='OrderID',
    alias='factsales',
    tags=['northwind', 'FactSales']
)
}}

SELECT 

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

prod.ProducID,
cus.CustomerID,
emp.EmployeeID,
ord.OrderDate,
ord.ShippedDate,
ord.OrderID,
ordd.Quantity,
ordd.UnitPrice as ExtendedPriceAmount,
ordd.UnitPrice * ordd.Discount as DiscountAmount,
ordd.Quantity * (1- ordd.Discount) * ordd.UnitPrice as SoldAmount



FROM  {{ ref('Orders') }}  Ord
LEFT JOIN {{ ref('Customers') }}  cus on cus.CustomerID=ord.CustomerID
LEFT JOIN {{ ref('Employees') }}  emp on emp.EmployeeID=ord.EmployeeID
LEFT JOIN {{ ref('OrderDetails') }}  ordd on ordd.OrderID=ord.OrderID
LEFT JOIN {{ ref('Products') }} prod on prod.ProductID=ordd.ProductID
