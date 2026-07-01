SELECT
    cv.nome_canal,
    cv.tipo_canal,
    ROUND(SUM(ip.quantidade * ip.preco_unitario), 2) AS receita_total
FROM pedidos p
JOIN canais_venda cv 
    ON p.canal_id = cv.canal_id
JOIN itens_pedido ip 
    ON p.pedido_id = ip.pedido_id
GROUP BY 
    cv.nome_canal,
    cv.tipo_canal
ORDER BY 
    receita_total DESC;