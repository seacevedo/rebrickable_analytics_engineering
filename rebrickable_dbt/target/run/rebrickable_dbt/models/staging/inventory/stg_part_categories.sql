
  create or replace   view REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_part_categories
  
   as (
    WITH stg_part_categories AS (
    SELECT
    CAST(id AS INTEGER) AS id,
    CAST(name AS VARCHAR) AS name
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA.PART_CATEGORIES
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_part_categories
  );

