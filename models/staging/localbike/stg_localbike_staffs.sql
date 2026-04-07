select 
    active,
    email,
    first_name,
    last_name,
    manager_id,
    phone,
    staff_id,
    store_id
from {{ source('localbike_dataset', 'staffs') }}