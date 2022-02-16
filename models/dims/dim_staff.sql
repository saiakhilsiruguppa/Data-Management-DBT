{{ config(materialized='table')}}

select
    staff_id as staff_key,
    store_id as store_key,
    address_id as adress_key,
    CONCAT_WS(' ', last_name, first_name) as full_name,
    username as staff_username
from
    {{ ref('stage_staff') }}
