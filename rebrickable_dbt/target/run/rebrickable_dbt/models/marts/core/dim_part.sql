
  
    

        create or replace transient table REBRICKABLE_DB.REBRICKABLE_SCHEMA_marts.dim_part
         as
        (WITH dim_part AS (
    SELECT md5(cast(coalesce(cast(part_num as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS minifig_dim_id
    part_num,
    name,
    part_cat_id,
    part_material
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_parts
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM dim_part
        );
      
  