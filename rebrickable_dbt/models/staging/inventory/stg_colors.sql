WITH stg_colors AS (
    SELECT
    CAST(id AS INTEGER) AS id,
    CAST(is_trans AS BOOLEAN) AS is_trans,
    CAST(CASE WHEN CONTAINS(name, '[') THEN NULL ELSE name END AS VARCHAR) AS name,
    CAST(rgb AS VARCHAR) AS rgb
    FROM {{ source('rebrickable_raw', 'COLORS') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_colors