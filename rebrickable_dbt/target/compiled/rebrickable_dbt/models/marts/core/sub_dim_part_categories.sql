WITH sub_dim_part_categories AS (
    SELECT md5(cast(coalesce(cast(id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS element_part_sub_dim_id,
    id AS part_category_id,
    name AS category_name
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_part_categories
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM sub_dim_part_categories