
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_9f5366d3b0d4b5067d7a024a07f6d25e]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."not_null_gld_product_performance_product_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_9f5366d3b0d4b5067d7a024a07f6d25e]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_9f5366d3b0d4b5067d7a024a07f6d25e]
  ;')