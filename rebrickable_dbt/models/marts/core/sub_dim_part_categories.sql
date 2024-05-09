WITH sub_dim_part_categories AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['id']) }} AS element_part_sub_dim_id,
    id AS part_category_id,
    name AS category_name
    FROM {{ ref('stg_part_categories') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM sub_dim_part_categories