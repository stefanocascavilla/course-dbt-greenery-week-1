{% snapshot snapshot_products %}

    {{
        config(
            target_schema='snapshots',
            unique_key='product_id',
            strategy='check',
            check_cols=['quantity']
        )
    }}

    select
        product_id,
        name,
        price,
        quantity
    from {{ source('data', 'products') }}

{% endsnapshot %}