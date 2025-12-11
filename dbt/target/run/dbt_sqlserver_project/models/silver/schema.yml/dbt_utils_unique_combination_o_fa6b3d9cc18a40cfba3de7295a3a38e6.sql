
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_80c09e47c3fb1f305721fd860b779f1c]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."dbt_utils_unique_combination_o_fa6b3d9cc18a40cfba3de7295a3a38e6"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_80c09e47c3fb1f305721fd860b779f1c]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_80c09e47c3fb1f305721fd860b779f1c]
  ;')