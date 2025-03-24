
      
  
    USE [DBNRemitproDemo];
    USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "northwind"."dimproduct__dbt_tmp_vw" as 

SELECT 
ROW_NUMBER() OVER (ORDER BY [ProductID]) AS ProductKey
	,[ProductID]
      ,[ProductName]
      ,sup.CompanyName as  SupplierName
      ,cat.CategoryName
      ,[Discontinued]
	 ,''Y'' as  RowIsCurrent
	, GETDATE() as 	RowStartDate
		,''12/31/9999'' as RowEndDate
		, ''Updated'' as RowChangeReason
  FROM  "DBNRemitproDemo"."staging"."Products"  p
  JOIN "DBNRemitproDemo"."staging"."Categories"  cat on cat.CategoryID=p.CategoryID
  JOIN  "DBNRemitproDemo"."staging"."Suppliers"     sup on sup.SupplierID=p.SupplierID;
    ')

EXEC('
            SELECT * INTO "DBNRemitproDemo"."northwind"."dimproduct" FROM "DBNRemitproDemo"."northwind"."dimproduct__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS northwind.dimproduct__dbt_tmp_vw')



    
    use [DBNRemitproDemo];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'northwind_dimproduct_cci'
        AND object_id=object_id('northwind_dimproduct')
    )
    DROP index "northwind"."dimproduct".northwind_dimproduct_cci
    CREATE CLUSTERED COLUMNSTORE INDEX northwind_dimproduct_cci
    ON "northwind"."dimproduct"

   


  
  