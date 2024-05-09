WITH stg_part_categories AS (
    SELECT
    CAST(id AS INTEGER) AS id,
    CAST(name AS VARCHAR) AS name
    FROM {{ source('rebrickable_raw', 'PART_CATEGORIES') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_part_categories