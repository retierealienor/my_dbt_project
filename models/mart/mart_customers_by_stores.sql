WITH base AS (
    SELECT
        customer_state                  AS state,
        customer_city                   AS city,
        COUNT(DISTINCT customer_id)     AS nb_customer,
        COUNT(DISTINCT store_id)        AS nb_store,
        COUNT(DISTINCT staff_id)        AS nb_staff
    FROM {{ ref('int_localbike_orders_enriched') }}
    GROUP BY ALL
)

SELECT *
FROM base
ORDER BY nb_customer DESC