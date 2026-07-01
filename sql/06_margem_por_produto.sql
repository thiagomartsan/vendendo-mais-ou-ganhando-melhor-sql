WITH resultado_produtos AS (
    SELECT
        pr.nome_produto,
        pr.categoria,

        SUM(ip.quantidade) AS unidades_vendidas,

        ROUND(SUM(ip.quantidade * ip.preco_unitario), 2) AS receita_total,

        ROUND(SUM(ip.quantidade * pr.custo_unitario), 2) AS custo_total,

        ROUND(
            SUM(ip.quantidade * ip.preco_unitario)
            - SUM(ip.quantidade * pr.custo_unitario),
            2
        ) AS lucro_bruto,

        ROUND(
            100.0 * (
                SUM(ip.quantidade * ip.preco_unitario)
                - SUM(ip.quantidade * pr.custo_unitario)
            ) / SUM(ip.quantidade * ip.preco_unitario),
            2
        ) AS margem_percentual

    FROM itens_pedido ip
    JOIN produtos pr
        ON ip.produto_id = pr.produto_id

    GROUP BY
        pr.nome_produto,
        pr.categoria
)

SELECT
    nome_produto,
    categoria,
    unidades_vendidas,
    receita_total,
    custo_total,
    lucro_bruto,
    margem_percentual
FROM resultado_produtos
ORDER BY
    lucro_bruto DESC;