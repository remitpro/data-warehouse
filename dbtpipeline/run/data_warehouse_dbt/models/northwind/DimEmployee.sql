
      
  
    USE [DBNRemitproDemo];
    USE [DBNRemitproDemo];
    
    

    

    
    USE [DBNRemitproDemo];
    EXEC('
        create view "northwind"."DimEmployee__dbt_tmp_vw" as 

SELECT 
ROW_NUMBER() OVER (ORDER BY [EmployeeID]) AS EmployeeKey,
EmployeeID
, CONCAT(LastName,'' '',FirstName) as EmployeeName
    ,Title as EmployeeTitle
    ,''Y'' as RowIsCurrent
 ,GETDATE() as  RowStartDate,
''12/31/9999'' as RowEndDate,
''Updated'' as RowChangeReason

FROM "DBNRemitproDemo"."staging"."Employees";
    ')

EXEC('
            SELECT * INTO "DBNRemitproDemo"."northwind"."DimEmployee" FROM "DBNRemitproDemo"."northwind"."DimEmployee__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS northwind.DimEmployee__dbt_tmp_vw')



    
    use [DBNRemitproDemo];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'northwind_DimEmployee_cci'
        AND object_id=object_id('northwind_DimEmployee')
    )
    DROP index "northwind"."DimEmployee".northwind_DimEmployee_cci
    CREATE CLUSTERED COLUMNSTORE INDEX northwind_DimEmployee_cci
    ON "northwind"."DimEmployee"

   


  
  