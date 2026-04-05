select 
CONCAT(`product_id`, '-', `store_id`) as stock_unique_id,
product_id,
quantity,
store_id
from {{ source('localbike_dataset', 'stocks') }}