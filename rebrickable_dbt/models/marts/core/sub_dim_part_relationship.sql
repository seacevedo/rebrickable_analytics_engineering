WITH sub_dim_part_relationship AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['child_part_num', 'parent_part_num']) }} AS part_relationship_sub_dim_id,
    rel_type,
    child_part_num,
    parent_part_num
    FROM {{ ref('stg_part_relationships') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM sub_dim_part_relationship