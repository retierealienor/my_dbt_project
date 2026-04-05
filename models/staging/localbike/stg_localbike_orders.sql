select 
    customer_id,
    order_date,
    order_id,
    order_status,
    required_date,
    shipped_date,
    staff_id,
    store_id
from {{ source('localbike_dataset', 'orders') }}