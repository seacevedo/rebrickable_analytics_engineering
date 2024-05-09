WITH dim_sets AS (
    SELECT md5(cast(coalesce(cast(set_num as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS set_dim_id,
    set_num, 
    name,
    theme_id,
    num_parts
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_sets
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM dim_sets