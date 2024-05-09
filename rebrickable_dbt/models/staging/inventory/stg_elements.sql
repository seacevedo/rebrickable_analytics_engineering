WITH stg_elements AS (
    SELECT
    CAST(color_id AS INTEGER) AS color_id,
    CAST(part_num AS VARCHAR) AS part_num,
    TRY_CAST(design_id AS INTEGER) AS design_id, 
    CAST(element_id AS INTEGER) AS element_id
    FROM {{ source('rebrickable_raw', 'ELEMENTS') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_elements