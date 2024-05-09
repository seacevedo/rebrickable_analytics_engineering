WITH stg_parts AS (
    SELECT
    CAST(name AS VARCHAR) AS name,
    CAST(year AS INTEGER) AS year,
    CAST(img_url AS VARCHAR) AS img_url,
    CAST(set_num AS VARCHAR) AS set_num,
    CAST(theme_id AS INTEGER) AS theme_id,
    CAST(num_parts AS INTEGER) AS num_parts
    FROM {{ source('rebrickable_raw', 'SETS') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_parts