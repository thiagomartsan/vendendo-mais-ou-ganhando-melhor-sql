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
),

indicadores AS (
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
),

classificacao AS (
    SELECT
        nome_canal,
        nome_produto,
        categoria,
        unidades_vendidas,
        receita_total,
        lucro_bruto,
        margem_percentual,
        participacao_receita_percentual,
        participacao_lucro_percentual,

        CASE
            WHEN participacao_lucro_percentual >= 15
                 AND margem_percentual >= 50
                THEN 'Motor de Lucro'

            WHEN participacao_receita_percentual >= 15
                 AND margem_percentual < 25
                THEN 'Volume sem Valor'

            WHEN participacao_lucro_percentual < 5
                 AND margem_percentual >= 50
                THEN 'Oportunidade de Escala'

            WHEN participacao_lucro_percentual >= 5
                 AND margem_percentual >= 50
                THEN 'Produto Saudável'

            WHEN participacao_lucro_percentual < 5
                 AND margem_percentual < 30
                THEN 'Baixa Prioridade'

            ELSE 'Zona Neutra'
        END AS classificacao_estrategica

    FROM indicadores
)

SELECT
    nome_canal,
    nome_produto,
    categoria,
    unidades_vendidas,
    receita_total,
    lucro_bruto,
    margem_percentual,
    participacao_receita_percentual,
    participacao_lucro_percentual,
    classificacao_estrategica

FROM classificacao

ORDER BY
    CASE classificacao_estrategica
        WHEN 'Motor de Lucro' THEN 1
        WHEN 'Produto Saudável' THEN 2
        WHEN 'Volume sem Valor' THEN 3
        WHEN 'Oportunidade de Escala' THEN 4
        WHEN 'Zona Neutra' THEN 5
        WHEN 'Baixa Prioridade' THEN 6
    END,
    participacao_lucro_percentual DESC;