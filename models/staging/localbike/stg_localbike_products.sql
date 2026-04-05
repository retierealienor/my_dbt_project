select 
    brand_id,
    category_id,
    list_price,
    model_year,
    product_id,
    product_name
from {{ source('localbike_dataset', 'products') }}