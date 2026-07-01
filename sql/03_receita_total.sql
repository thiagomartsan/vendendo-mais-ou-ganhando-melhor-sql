SELECT
    ROUND(SUM(quantidade * preco_unitario), 2) AS receita_total
FROM itens_pedido;