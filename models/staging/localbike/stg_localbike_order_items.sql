select 
    CONCAT(item_id, '_', product_id, '-',order_id) AS order_item_unique_id,
    discount,
    item_id,
    list_price,
    order_id,
    product_id,
    quantity
from {{ source('localbike_dataset', 'order_items') }}