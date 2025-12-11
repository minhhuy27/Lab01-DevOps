
  
  

  
  USE [AdventureWorks2014];
  EXEC('create view 

    [dbt_test__audit.testview_1170c3c673432db25b09a186c8671d52]
   as 
        select * from "AdventureWorks2014"."dbt_test__audit"."unique_gld_sales_summary_order_date"
    ;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_1170c3c673432db25b09a186c8671d52]
  
  ) dbt_internal_test;

  USE [AdventureWorks2014];
  EXEC('drop view 

    [dbt_test__audit.testview_1170c3c673432db25b09a186c8671d52]
  ;')