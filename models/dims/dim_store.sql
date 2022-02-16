{{ config(materialized='table') }}

select
    stage_store.store_id,
    stage_address.district,
    stage_address.address,
    stage_address.phone,
    stage_staff.last_name
from
    {{ ref('stage_store') }}
left join {{ ref('stage_address') }}
    on stage_store.address_id = stage_address.address_id
left join {{ ref('stage_staff') }}
    on stage_store.manager_staff_id = stage_staff.staff_id