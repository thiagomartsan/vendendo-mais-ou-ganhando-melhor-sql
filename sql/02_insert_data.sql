-- Projeto: Vendendo mais ou ganhando melhor?
-- Objetivo: inserir dados fictícios para análise de receita, margem, canais e clientes.

INSERT INTO clientes (cliente_id, nome_cliente, tipo_cliente, cidade, estado, data_cadastro) VALUES
(1, 'Alpha Comércio', 'Empresa', 'Porto Alegre', 'RS', '2025-01-10'),
(2, 'Beta Serviços', 'Empresa', 'Caxias do Sul', 'RS', '2025-01-18'),
(3, 'Carla Mendes', 'Pessoa Física', 'Novo Hamburgo', 'RS', '2025-02-02'),
(4, 'Delta Market', 'Empresa', 'Curitiba', 'PR', '2025-02-15'),
(5, 'Eduardo Lima', 'Pessoa Física', 'Florianópolis', 'SC', '2025-03-01'),
(6, 'Fênix Distribuidora', 'Empresa', 'São Paulo', 'SP', '2025-03-08'),
(7, 'Gamma Tech', 'Empresa', 'Belo Horizonte', 'MG', '2025-03-20'),
(8, 'Helena Costa', 'Pessoa Física', 'Porto Alegre', 'RS', '2025-04-05');

INSERT INTO produtos (produto_id, nome_produto, categoria, preco_lista, custo_unitario) VALUES
(1, 'Produto Entrada', 'Linha Básica', 120.00, 82.00),
(2, 'Produto Intermediário', 'Linha Média', 250.00, 140.00),
(3, 'Produto Premium', 'Linha Premium', 600.00, 270.00),
(4, 'Serviço Adicional', 'Serviços', 180.00, 45.00),
(5, 'Assinatura Mensal', 'Recorrência', 99.00, 25.00),
(6, 'Kit Promocional', 'Linha Básica', 199.00, 150.00),
(7, 'Produto Profissional', 'Linha Premium', 950.00, 430.00),
(8, 'Consultoria Avulsa', 'Serviços', 750.00, 180.00);

INSERT INTO canais_venda (canal_id, nome_canal, tipo_canal) VALUES
(1, 'Loja Física', 'Offline'),
(2, 'E-commerce', 'Online'),
(3, 'Marketplace', 'Online'),
(4, 'WhatsApp', 'Conversacional'),
(5, 'Venda Consultiva', 'Consultiva');

INSERT INTO pedidos (pedido_id, cliente_id, canal_id, data_pedido, status_pedido) VALUES
(1, 1, 5, '2025-04-10', 'Concluído'),
(2, 2, 5, '2025-04-12', 'Concluído'),
(3, 3, 2, '2025-04-13', 'Concluído'),
(4, 4, 3, '2025-04-15', 'Concluído'),
(5, 5, 4, '2025-04-18', 'Concluído'),
(6, 6, 3, '2025-04-20', 'Concluído'),
(7, 7, 5, '2025-04-22', 'Concluído'),
(8, 8, 2, '2025-04-25', 'Concluído'),
(9, 1, 1, '2025-05-02', 'Concluído'),
(10, 4, 3, '2025-05-04', 'Concluído'),
(11, 6, 5, '2025-05-08', 'Concluído'),
(12, 2, 4, '2025-05-12', 'Concluído'),
(13, 3, 2, '2025-05-15', 'Concluído'),
(14, 5, 1, '2025-05-17', 'Concluído'),
(15, 7, 5, '2025-05-20', 'Concluído');

INSERT INTO itens_pedido (item_id, pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 7, 2, 950.00),
(2, 1, 8, 1, 750.00),
(3, 2, 3, 3, 600.00),
(4, 2, 4, 2, 180.00),
(5, 3, 1, 2, 110.00),
(6, 3, 5, 1, 99.00),
(7, 4, 6, 10, 179.00),
(8, 4, 1, 5, 105.00),
(9, 5, 2, 1, 250.00),
(10, 5, 4, 1, 180.00),
(11, 6, 6, 20, 170.00),
(12, 6, 1, 10, 100.00),
(13, 7, 7, 1, 950.00),
(14, 7, 8, 2, 750.00),
(15, 8, 5, 3, 99.00),
(16, 8, 2, 1, 240.00),
(17, 9, 3, 1, 600.00),
(18, 9, 4, 2, 180.00),
(19, 10, 6, 15, 165.00),
(20, 10, 1, 8, 98.00),
(21, 11, 7, 3, 930.00),
(22, 11, 8, 1, 720.00),
(23, 12, 2, 2, 235.00),
(24, 12, 5, 2, 99.00),
(25, 13, 1, 4, 105.00),
(26, 13, 5, 1, 99.00),
(27, 14, 3, 1, 580.00),
(28, 14, 4, 1, 180.00),
(29, 15, 7, 2, 950.00),
(30, 15, 8, 2, 750.00);