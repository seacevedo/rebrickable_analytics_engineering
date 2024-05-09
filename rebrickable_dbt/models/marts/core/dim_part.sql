WITH dim_part AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['part_num']) }} AS minifig_dim_id
    part_num,
    name,
    part_cat_id,
    part_material
    FROM {{ ref('stg_parts') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM dim_part