WITH self_join_theme AS (
    SELECT t2.id AS theme_id, t1.name AS parent_theme, t2.name AS child_theme
    FROM {{ ref('stg_themes') }} t1
    JOIN {{ ref('stg_themes') }} t2 ON t1.id = t2.parent_id
),

null_theme AS (
    SELECT id AS theme_id,
    name AS parent_theme,
    null AS child_theme,
    FROM {{ ref('stg_themes') }} 
    WHERE parent_id IS NULL
),

union_theme AS (
    SELECT *
    FROM self_join_theme
    UNION
    SELECT *
    FROM null_theme
    ORDER BY theme_id
),

sub_dim_theme AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['theme_id']) }} AS theme_sub_dim_id,
    theme_id,
    parent_theme,
    child_theme
    FROM union_theme
)


SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM sub_dim_theme