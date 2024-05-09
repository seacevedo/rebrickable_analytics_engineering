
  create or replace   view REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_inventory_minifigs
  
   as (
    WITH stg_inventory_minifigs AS (
    SELECT
    CAST(fig_num AS VARCHAR) AS fig_num,
    CAST(quantity AS INTEGER) AS quantity,
    CAST(inventory_id AS INTEGER) AS inventory_id
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA.INVENTORY_MINIFIGS
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_inventory_minifigs
  );

