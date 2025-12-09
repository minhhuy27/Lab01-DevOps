
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_bd2b6ffc3ab3618911226910f2449655]
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

    [dbt_test__audit.testview_bd2b6ffc3ab3618911226910f2449655]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_bd2b6ffc3ab3618911226910f2449655]
  ;')