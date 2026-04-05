WITH base AS (
    SELECT
        customer_state                                        AS state,
        order_id,
        SUM(montant_ligne)                                    AS montant_commande,
        SUM(quantity)                                         AS nb_produits,
        AVG(list_price)                                       AS prix_moyen_produit

    FROM {{ ref('int_localbike_orders_enriched') }}

    GROUP BY
        customer_state,
        order_id
)

SELECT
    state,
    ROUND(SUM(montant_commande), 2)    AS ca_global,
    ROUND(AVG(montant_commande), 2)    AS panier_moyen,
    COUNT(order_id)                    AS nb_commandes,
    ROUND(AVG(nb_produits), 1)         AS nb_moyen_produits_par_panier,
    ROUND(AVG(prix_moyen_produit), 2)  AS prix_moyen_produit,
    RANK() OVER (
        ORDER BY AVG(montant_commande) DESC
    )                                  AS ranking_panier_moyen

FROM base

GROUP BY state