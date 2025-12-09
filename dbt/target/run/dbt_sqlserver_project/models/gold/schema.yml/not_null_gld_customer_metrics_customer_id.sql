
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_6f005b3b1fbb5fdf7924d08ee9aa500b]
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

    [dbt_test__audit.testview_6f005b3b1fbb5fdf7924d08ee9aa500b]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_6f005b3b1fbb5fdf7924d08ee9aa500b]
  ;')