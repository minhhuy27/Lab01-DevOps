
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_6392fadf2e1298f137a27967991a9176]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."unique_slvr_customers_customer_id"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_6392fadf2e1298f137a27967991a9176]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_6392fadf2e1298f137a27967991a9176]
  ;')