WITH base AS (
    SELECT
        customer_state   AS state,
        category_name,
        COUNT(DISTINCT order_id)  AS nb_commandes,
        SUM(total_order)        AS ca_global

    FROM {{ ref('int_localbike_orders_enriched') }}

    GROUP BY
        customer_state,
        category_name
)

SELECT
    state,
    category_name,
    nb_commandes,
    ROUND(ca_global, 2)          AS ca_global,
    DENSE_RANK() OVER (
        PARTITION BY state
        ORDER BY nb_commandes DESC
    )                            AS ranking_categorie

FROM base

ORDER BY
    state,
    ranking_categorie