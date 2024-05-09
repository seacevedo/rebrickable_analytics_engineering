
  create or replace   view REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_inventory_sets
  
   as (
    WITH stg_inventory_sets AS (
    SELECT
    CAST(set_num AS VARCHAR) AS set_num,
    CAST(quantity AS INTEGER) AS quantity,
    CAST(inventory_id AS INTEGER) AS inventory_id
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA.INVENTORY_SETS
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_inventory_sets
  );

