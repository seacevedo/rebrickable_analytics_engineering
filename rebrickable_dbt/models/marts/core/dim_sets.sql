WITH dim_sets AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['set_num']) }} AS set_dim_id,
    set_num, 
    name,
    theme_id,
    num_parts
    FROM {{ ref('stg_sets') }}
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM dim_sets