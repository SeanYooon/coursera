{{ config(materialized='table') }}

with stg as (
  select * from {{ ref('stg_heart') }}
)

select
  age,
  avg(cholesterol)      as avg_chol,
  count(*)              as positive_cases   -- use count(*) to count all rows per age
from stg
group by age
