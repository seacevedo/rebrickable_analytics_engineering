WITH stg_themes AS (
    SELECT
    CAST(id AS INTEGER) AS id,
    CAST(name AS VARCHAR) AS name,
    TRY_CAST(parent_id AS INTEGER) AS parent_id
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA.THEMES
)

SELECT *, CURRENT_TIMESTAMP() AS transformed_timestamp 
FROM stg_themes