WITH dim_color AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['id']) }} AS color_dim_id,
    id AS color_id, 
    is_trans,
    name,
    rgb
    FROM {{ ref('stg_colors') }}
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM dim_color