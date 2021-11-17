{% snapshot snapshot_products %}

    {{
        config(
            target_schema='snapshots',
            unique_key='product_id',
            strategy='timestamp',
            updated_at='quantity'
        )
    }}

    select
        product_id,
        name,
        price,
        quantity
    from {{ source('data', 'products') }}

{% endsnapshot %}