select *
from {{ source('localbike_dataset', 'categories') }}