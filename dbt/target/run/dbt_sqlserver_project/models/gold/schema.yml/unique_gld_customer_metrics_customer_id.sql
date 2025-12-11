
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_e1901c37eddf3b3f8e1b0e3d9b481286]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."unique_gld_customer_metrics_customer_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e1901c37eddf3b3f8e1b0e3d9b481286]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_e1901c37eddf3b3f8e1b0e3d9b481286]
  ;')