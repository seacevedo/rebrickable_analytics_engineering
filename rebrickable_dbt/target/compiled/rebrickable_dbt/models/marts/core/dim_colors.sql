WITH dim_color AS (
    SELECT md5(cast(coalesce(cast(id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS color_dim_id,
    id AS color_id, 
    is_trans,
    name,
    rgb
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_colors
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM dim_color