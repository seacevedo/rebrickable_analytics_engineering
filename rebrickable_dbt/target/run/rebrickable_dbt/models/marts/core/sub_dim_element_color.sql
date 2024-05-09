
  
    

        create or replace transient table REBRICKABLE_DB.REBRICKABLE_SCHEMA_marts.sub_dim_element_color
         as
        (WITH sub_dim_element_color AS (
    SELECT md5(cast(coalesce(cast(element_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(color_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS element_color_sub_dim_id,
    element_id,
    color_id,
    design_id
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_elements
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM sub_dim_element_color
        );
      
  