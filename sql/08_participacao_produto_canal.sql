WITH base AS (
    SELECT
        cv.nome_canal,
        pr.nome_produto,
        pr.categoria,

        SUM(ip.quantidade) AS unidades_vendidas,

        SUM(ip.quantidade * ip.preco_unitario) AS receita_total,

        SUM(ip.quantidade * pr.custo_unitario) AS custo_total,

        SUM(ip.quantidade * ip.preco_unitario)
        - SUM(ip.quantidade * pr.custo_unitario) AS lucro_bruto

    FROM pedidos p
    JOIN canais_venda cv
        ON p.canal_id = cv.canal_id
    JOIN itens_pedido ip
        ON p.pedido_id = ip.pedido_id
    JOIN produtos pr
        ON ip.produto_id = pr.produto_id

    GROUP BY
        cv.nome_canal,
        pr.nome_produto,
        pr.categoria
),

totais AS (
    SELECT
        SUM(receita_total) AS receita_geral,
        SUM(lucro_bruto) AS lucro_geral
    FROM base
)

SELECT
    b.nome_canal,
    b.nome_produto,
    b.categoria,
    b.unidades_vendidas,

    ROUND(b.receita_total, 2) AS receita_total,
    ROUND(b.lucro_bruto, 2) AS lucro_bruto,

    ROUND(
        100.0 * b.lucro_bruto / b.receita_total,
        2
    ) AS margem_percentual,

    ROUND(
        100.0 * b.receita_total / t.receita_geral,
        2
    ) AS participacao_receita_percentual,

    ROUND(
        100.0 * b.lucro_bruto / t.lucro_geral,
        2
    ) AS participacao_lucro_percentual

FROM base b
CROSS JOIN totais t

ORDER BY
    participacao_lucro_percentual DESC;