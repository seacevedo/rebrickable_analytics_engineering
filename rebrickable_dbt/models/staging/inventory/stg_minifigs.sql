WITH stg_minifigs AS (
    SELECT
    CAST(name AS VARCHAR) AS name,
    CAST(fig_num AS VARCHAR) AS fig_num,
    CAST(img_url AS VARCHAR) AS img_url,
    CAST(num_parts AS INTEGER) AS num_parts
    FROM {{ source('rebrickable_raw', 'MINIFIGS') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_minifigs