{{
    config(
        materialized = 'incremental',
        unique_key = 'id',
        on_schema_chnage = 'sync_all_column'
    )
}}

select * from {{ source('jaffle_shop', 'orders') -}}
{# dbt certification #}
{% if is_incremental() %}
where _etl_loaded_at > (select max(_etl_loaded_at) from {{this}})
{% endif %}
