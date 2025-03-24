

{{ config(
    materialized='incremental',
    unique_key='CustomerID',
    sort='CustomerKey',
    on_schema_change='fail',
    alias='dimcustomer',
    tags=['northwind', 'DimCustomer']
) }}

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
ingestion_timestamp as  RowStartDate,
'12/31/9999' as RowEndDate,
'Updated' as RowChangeReason

 FROM {{ ref('StgCustomers') }}

 WHERE CustomerID IS NOT NULL