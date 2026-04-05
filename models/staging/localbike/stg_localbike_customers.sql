select 
    city,
    customer_id,
    email,
    first_name,
    last_name,
    phone,
    state,
    street,
    zip_code
from {{ source('localbike_dataset', 'customers') }}