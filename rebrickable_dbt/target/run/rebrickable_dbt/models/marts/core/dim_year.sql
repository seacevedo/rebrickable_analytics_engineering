
  
    

        create or replace transient table REBRICKABLE_DB.REBRICKABLE_SCHEMA_marts.dim_year
         as
        (WITH distinct_year AS (
    SELECT DISTINCT year
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_sets
    ORDER BY year
),

surrogate_key_year AS (
    SELECT md5(cast(coalesce(cast(year as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS year_dim_id,
    year
    FROM distinct_year
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM surrogate_key_year
        );
      
  