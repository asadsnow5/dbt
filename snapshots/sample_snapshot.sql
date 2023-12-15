{% snapshot new_snap %}
    {{
        config(
            target_schema = 'snap',
            unique_key = 'idf',
            strategy = 'check',
            check_cols = ['status','is_cancelled']
        )

         
    }}

    select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}