SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    cu.customer_id,
    cu.state                                                      AS customer_state,
    cu.city                                                       AS customer_city,
    st.store_id,
    st.state                                                      AS store_state,
    oi.item_id,
    oi.product_id,
    oi.quantity,
    oi.list_price,
    oi.discount,
    oi.list_price * oi.quantity * (1 - oi.discount)              AS montant_order,
    p.product_name,
    p.model_year,
    c.category_id,
    c.category_name,
    b.brand_id,
    b.brand_name,
    sta.staff_id

FROM {{ ref('stg_localbike_orders') }} o

JOIN {{ ref('stg_localbike_order_items') }} oi
    ON o.order_id = oi.order_id

JOIN {{ ref('stg_localbike_customers') }} cu
    ON o.customer_id = cu.customer_id

JOIN {{ ref('stg_localbike_stores') }} st
    ON o.store_id = st.store_id

JOIN {{ ref('stg_localbike_products') }} p
    ON oi.product_id = p.product_id

JOIN {{ ref('stg_localbike_categories') }} c
    ON p.category_id = c.category_id

JOIN {{ ref('stg_localbike_brands') }} b
    ON p.brand_id = b.brand_id

JOIN {{ ref('stg_localbike_staffs') }} sta
    ON o.staff_id = sta.staff_id