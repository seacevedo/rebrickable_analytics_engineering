WITH dim_minifig AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['fig_num']) }} AS minifig_dim_id,
    fig_num, 
    name,
    num_parts,
    img_url
    FROM {{ ref('stg_minifigs') }}
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM dim_minifig