{% snapshot dim_customer_type_two %}

{{
    config(
      unique_key='id',
      strategy='check',
      check_cols='all',
      target_schema='snapshots'
    )
}}

select 
    customer_key as id,
    *
from 
    {{ ref('dim_customer') }}

{% endsnapshot %}