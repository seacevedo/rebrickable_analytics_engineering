WITH stg_parts AS (
    SELECT
    CAST(name AS VARCHAR) AS name,
    CAST(part_num AS VARCHAR) AS part_num,
    CAST(part_cat_id AS INTEGER) AS part_cat_id,
    CAST(part_material AS VARCHAR) AS part_material
    FROM {{ source('rebrickable_raw', 'PARTS') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_parts