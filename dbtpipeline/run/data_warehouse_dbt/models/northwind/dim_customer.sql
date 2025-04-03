
      
  
    USE [remitpro];
    USE [remitpro];
    
    

    

    
    USE [remitpro];
    EXEC('
        create view "northwind"."dim_customer__dbt_tmp_vw" as 

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
''Y'' as RowIsCurrent,
GETDATE() as  RowStartDate,
''12/31/9999'' as RowEndDate,
''Updated'' as RowChangeReason

 FROM "remitpro"."staging"."stg_customers"

 WHERE CustomerID IS NOT NULL;
    ')

EXEC('
            SELECT * INTO "remitpro"."northwind"."dim_customer" FROM "remitpro"."northwind"."dim_customer__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS northwind.dim_customer__dbt_tmp_vw')



    
    use [remitpro];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'northwind_dim_customer_cci'
        AND object_id=object_id('northwind_dim_customer')
    )
    DROP index "northwind"."dim_customer".northwind_dim_customer_cci
    CREATE CLUSTERED COLUMNSTORE INDEX northwind_dim_customer_cci
    ON "northwind"."dim_customer"

   


  
  