
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_a9a176147f6d5881f2b7a5189021f00b]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."not_null_brnz_sales_orders_order_detail_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_a9a176147f6d5881f2b7a5189021f00b]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_a9a176147f6d5881f2b7a5189021f00b]
  ;')