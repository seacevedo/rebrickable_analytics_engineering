WITH sub_dim_element_color AS (
    SELECT {{ dbt_utils.generate_surrogate_key(['element_id', 'color_id']) }} AS element_color_sub_dim_id,
    element_id,
    color_id,
    design_id
    FROM {{ ref('stg_elements') }}
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM sub_dim_element_color