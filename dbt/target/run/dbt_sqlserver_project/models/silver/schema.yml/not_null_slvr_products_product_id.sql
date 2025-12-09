
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_b8a43d7f5e214b26fc2a073e7c00612f]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."not_null_slvr_products_product_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b8a43d7f5e214b26fc2a073e7c00612f]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_b8a43d7f5e214b26fc2a073e7c00612f]
  ;')