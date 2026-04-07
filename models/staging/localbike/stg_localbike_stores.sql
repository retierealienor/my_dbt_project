select 
    city,
    email,
    phone,
    state,
    store_id,
    store_name,
    street,
    zip_code
from {{ source('localbike_dataset', 'stores') }}