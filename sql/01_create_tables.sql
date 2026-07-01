-- Projeto: Vendendo mais ou ganhando melhor?
-- Objetivo: criar a estrutura inicial do banco para análise de receita, margem, canais e clientes.

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS canais_venda;

CREATE TABLE clientes (
    cliente_id INTEGER PRIMARY KEY,
    nome_cliente TEXT NOT NULL,
    tipo_cliente TEXT NOT NULL,
    cidade TEXT NOT NULL,
    estado TEXT NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE produtos (
    produto_id INTEGER PRIMARY KEY,
    nome_produto TEXT NOT NULL,
    categoria TEXT NOT NULL,
    preco_lista REAL NOT NULL,
    custo_unitario REAL NOT NULL
);

CREATE TABLE canais_venda (
    canal_id INTEGER PRIMARY KEY,
    nome_canal TEXT NOT NULL,
    tipo_canal TEXT NOT NULL
);

CREATE TABLE pedidos (
    pedido_id INTEGER PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    canal_id INTEGER NOT NULL,
    data_pedido DATE NOT NULL,
    status_pedido TEXT NOT NULL,

    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (canal_id) REFERENCES canais_venda(canal_id)
);

CREATE TABLE itens_pedido (
    item_id INTEGER PRIMARY KEY,
    pedido_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario REAL NOT NULL,

    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);