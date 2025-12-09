
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_afb81578f56f328c4bd265dc946e08cd]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."not_null_slvr_sales_orders_order_detail_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_afb81578f56f328c4bd265dc946e08cd]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_afb81578f56f328c4bd265dc946e08cd]
  ;')