SELECT
    cv.nome_canal,
    cv.tipo_canal,

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

FROM pedidos p
JOIN canais_venda cv
    ON p.canal_id = cv.canal_id
JOIN itens_pedido ip
    ON p.pedido_id = ip.pedido_id
JOIN produtos pr
    ON ip.produto_id = pr.produto_id

GROUP BY
    cv.nome_canal,
    cv.tipo_canal

ORDER BY
    lucro_bruto DESC;