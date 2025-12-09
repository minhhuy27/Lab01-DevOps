
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_bfbcfb714c927a7121f425865100dfb0]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."unique_gld_sales_summary_order_date"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_bfbcfb714c927a7121f425865100dfb0]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_bfbcfb714c927a7121f425865100dfb0]
  ;')