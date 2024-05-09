WITH stg_inventory_parts AS (
    SELECT
    CAST(img_url AS VARCHAR) as img_url,
    CAST(color_id AS INTEGER) AS color_id,
    CAST(is_spare AS BOOLEAN) AS is_spare,
    CAST(part_num AS VARCHAR) AS part_num,
    CAST(quantity AS INTEGER) AS quantity,
    CAST(inventory_id AS INTEGER) AS inventory_id
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA.INVENTORY_PARTS
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_inventory_parts