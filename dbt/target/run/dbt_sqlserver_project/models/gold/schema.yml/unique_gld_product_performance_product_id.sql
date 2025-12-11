
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_512a2e05122dddce6de541b5347c8435]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."unique_gld_product_performance_product_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_512a2e05122dddce6de541b5347c8435]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_512a2e05122dddce6de541b5347c8435]
  ;')