
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_b595cac67b02833d2404a49f646cbe07]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."not_null_brnz_sales_orders_sales_order_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b595cac67b02833d2404a49f646cbe07]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_b595cac67b02833d2404a49f646cbe07]
  ;')