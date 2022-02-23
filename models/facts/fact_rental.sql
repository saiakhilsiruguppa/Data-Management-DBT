{{ config(materialized='table')}}

select
    r.rental_id,
    c.customer_key,
    s.staff_key,
    1 as rental_quantity
from 
    {{ ref('stage_rental') }} r
    -- join back to dim_customer
    left join {{ ref('dim_customer') }} c on r.customer_id = c.customer_id
    -- join back to dim_staff
    left join {{ ref('dim_staff') }} s on r.staff_id = s.staff_id