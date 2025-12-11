
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_1bb4f78e1f4e9c4d0b65e795a3f6288e]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."not_null_slvr_sales_orders_line_total"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_1bb4f78e1f4e9c4d0b65e795a3f6288e]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_1bb4f78e1f4e9c4d0b65e795a3f6288e]
  ;')