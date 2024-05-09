WITH sub_dim_part_relationship AS (
    SELECT md5(cast(coalesce(cast(child_part_num as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(parent_part_num as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS part_relationship_sub_dim_id,
    rel_type,
    child_part_num,
    parent_part_num
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_part_relationships
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM sub_dim_part_relationship