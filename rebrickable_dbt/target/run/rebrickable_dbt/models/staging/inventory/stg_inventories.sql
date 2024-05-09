
  create or replace   view REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_inventories
  
   as (
    WITH stg_inventories AS (
    SELECT
    CAST(id AS INTEGER) AS id,
    CAST(set_num AS VARCHAR) AS set_num,
    CAST(version AS INTEGER) AS version
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA.INVENTORIES
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_inventories
  );

