{{ config(materialized='table') }}



with source as (
  select * from {{ source('raw','heart_raw') }}
),

cleaned as (
  select
    age,
    cp as chest_pain,
    trestbps as resting_bp,
    chol as cholesterol,
    fbs as fasting_bs,
    restecg as rest_ecg,
    thalach as max_hr,
    exang as exercise_angina,
    slope,
    oldpeak,
    ca,
    thal,
    target as heart_disease_flag,
    current_timestamp as processed_at
  from source
  where age is not null
)

select * from cleaned
