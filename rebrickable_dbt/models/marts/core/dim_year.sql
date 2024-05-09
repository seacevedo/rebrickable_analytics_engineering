WITH distinct_year AS (
    SELECT DISTINCT year
    FROM {{ ref('stg_sets') }}
    ORDER BY year
),

surrogate_key_year AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['year']) }} AS year_dim_id,
    year
    FROM distinct_year
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM surrogate_key_year