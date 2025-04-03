
      

    
        
            delete from "DBNRemitproDemo"."northwind"."dimcustomer"
            where (
                CustomerID) in (
                select (CustomerID)
                from "DBNRemitproDemo"."northwind"."dimcustomer__dbt_tmp"
            )
    OPTION (LABEL = 'dbt-sqlserver');

        
    

    insert into "DBNRemitproDemo"."northwind"."dimcustomer" ("CustomerKey", "CustomerID", "CompanyName", "ContactName", "ContactTitle", "CustomerCountry", "CustomerRegion", "CustomerCity", "CustomerPostalCode", "RowIsCurrent", "RowStartDate", "RowEndDate", "RowChangeReason")
    (
        select "CustomerKey", "CustomerID", "CompanyName", "ContactName", "ContactTitle", "CustomerCountry", "CustomerRegion", "CustomerCity", "CustomerPostalCode", "RowIsCurrent", "RowStartDate", "RowEndDate", "RowChangeReason"
        from "DBNRemitproDemo"."northwind"."dimcustomer__dbt_tmp"
    )
    OPTION (LABEL = 'dbt-sqlserver');


  