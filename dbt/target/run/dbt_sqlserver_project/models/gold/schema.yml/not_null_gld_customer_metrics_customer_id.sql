
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_af8d9b7670856301d07eae59d2a24629]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."not_null_gld_customer_metrics_customer_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_af8d9b7670856301d07eae59d2a24629]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_af8d9b7670856301d07eae59d2a24629]
  ;')