WITH stg_inventory_sets AS (
    SELECT
    CAST(set_num AS VARCHAR) AS set_num,
    CAST(quantity AS INTEGER) AS quantity,
    CAST(inventory_id AS INTEGER) AS inventory_id
    FROM {{ source('rebrickable_raw', 'INVENTORY_SETS') }}
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_inventory_sets