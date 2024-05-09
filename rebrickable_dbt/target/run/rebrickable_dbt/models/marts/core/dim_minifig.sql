
  
    

        create or replace transient table REBRICKABLE_DB.REBRICKABLE_SCHEMA_marts.dim_minifig
         as
        (WITH dim_minifig AS (
    SELECT md5(cast(coalesce(cast(fig_num as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS minifig_dim_id,
    fig_num, 
    name,
    num_parts,
    img_url
    FROM REBRICKABLE_DB.REBRICKABLE_SCHEMA_staging.stg_minifigs
)

SELECT *, CURRENT_TIMESTAMP() as transformed_timestamp
FROM dim_minifig
        );
      
  