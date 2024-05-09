WITH stg_part_relationships AS (
    SELECT
    CAST(rel_type AS CHAR) AS rel_type,
    CAST(child_part_num AS VARCHAR) AS child_part_num,
    CAST(parent_part_num AS VARCHAR) AS parent_part_num
    FROM {{ source('rebrickable_raw', 'PART_RELATIONSHIPS') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_part_relationships