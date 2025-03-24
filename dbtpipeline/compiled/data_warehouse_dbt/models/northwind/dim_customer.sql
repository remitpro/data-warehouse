

SELECT
ROW_NUMBER() OVER (ORDER BY [CustomerID]) AS CustomerKey,
CustomerID,
CompanyName,
ContactName,
ContactTitle,
Country as CustomerCountry,
Region as CustomerRegion,
City as CustomerCity,
PostalCode as CustomerPostalCode,
'Y' as RowIsCurrent,
GETDATE() as  RowStartDate,
'12/31/9999' as RowEndDate,
'Updated' as RowChangeReason

 FROM "remitpro"."staging"."stg_customers"

 WHERE CustomerID IS NOT NULL