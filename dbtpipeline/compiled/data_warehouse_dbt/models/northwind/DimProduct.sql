

SELECT 
ROW_NUMBER() OVER (ORDER BY [ProductID]) AS ProductKey
	,[ProductID]
      ,[ProductName]
      ,sup.CompanyName as  SupplierName
      ,cat.CategoryName
      ,[Discontinued]
	 ,'Y' as  RowIsCurrent
	, GETDATE() as 	RowStartDate
		,'12/31/9999' as RowEndDate
		, 'Updated' as RowChangeReason
  FROM  "DBNRemitproDemo"."staging"."Products"  p
  JOIN "DBNRemitproDemo"."staging"."Categories"  cat on cat.CategoryID=p.CategoryID
  JOIN  "DBNRemitproDemo"."staging"."Suppliers"     sup on sup.SupplierID=p.SupplierID