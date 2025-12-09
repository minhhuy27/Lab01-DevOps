
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_af6c260b1c32938500a0c28f7f8e124d]
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

    [dbt_test__audit.testview_af6c260b1c32938500a0c28f7f8e124d]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_af6c260b1c32938500a0c28f7f8e124d]
  ;')