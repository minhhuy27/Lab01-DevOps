
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_ffcde961c141bf542990dc73966342c0]
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

    [dbt_test__audit.testview_ffcde961c141bf542990dc73966342c0]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_ffcde961c141bf542990dc73966342c0]
  ;')