
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_4cbff304d69c0b2f50e51c231f503b3d]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."not_null_slvr_customers_customer_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_4cbff304d69c0b2f50e51c231f503b3d]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_4cbff304d69c0b2f50e51c231f503b3d]
  ;')