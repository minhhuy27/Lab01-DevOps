
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_73a3d5efda817725955d803db725705b]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."unique_slvr_products_product_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_73a3d5efda817725955d803db725705b]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_73a3d5efda817725955d803db725705b]
  ;')