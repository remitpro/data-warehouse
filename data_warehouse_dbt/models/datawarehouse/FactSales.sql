
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



FROM  {{ ref('StgOrders') }}  Ord
LEFT JOIN {{ ref('StgCustomers') }}  cus on cus.CustomerID=ord.CustomerID
LEFT JOIN {{ ref('StgEmployees') }}  emp on emp.EmployeeID=ord.EmployeeID
LEFT JOIN {{ ref('StgOrderDetails') }}  ordd on ordd.OrderID=ord.OrderID
LEFT JOIN {{ ref('StgProducts') }} prod on prod.ProductID=ordd.ProductID
