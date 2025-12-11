
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_ea3b2180890cb8dbe5c8c1bd94865b22]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."dbt_utils_unique_combination_o_67f0da2d4853f9b58f45c2538ec21c2c"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_ea3b2180890cb8dbe5c8c1bd94865b22]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_ea3b2180890cb8dbe5c8c1bd94865b22]
  ;')