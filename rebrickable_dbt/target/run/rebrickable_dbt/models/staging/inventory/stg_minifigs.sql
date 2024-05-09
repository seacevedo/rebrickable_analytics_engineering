
  create or replace   view REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_minifigs
  
   as (
    WITH stg_minifigs AS (
    SELECT
    CAST(name AS VARCHAR) AS name,
    CAST(fig_num AS VARCHAR) AS fig_num,
    CAST(img_url AS VARCHAR) AS img_url,
    CAST(num_parts AS INTEGER) AS num_parts
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA.MINIFIGS
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_minifigs
  );

