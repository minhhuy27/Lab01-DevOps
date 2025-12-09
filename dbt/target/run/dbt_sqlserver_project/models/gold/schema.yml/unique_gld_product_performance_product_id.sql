
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_02b6c31ea88b81c5ba459b2c266188da]
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

    [dbt_test__audit.testview_02b6c31ea88b81c5ba459b2c266188da]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_02b6c31ea88b81c5ba459b2c266188da]
  ;')