# Vendendo mais ou ganhando melhor?  
## Análise comercial com SQL aplicada a receita, margem e canais de venda

Este projeto utiliza SQL para analisar uma base comercial fictícia e responder uma pergunta central de negócio:

> A empresa está vendendo mais ou está ganhando melhor?

A análise cruza dados de clientes, produtos, pedidos, canais de venda e itens vendidos para identificar quais combinações de produto e canal realmente geram valor econômico.

---

## Objetivo do projeto

O objetivo é demonstrar como SQL pode ser usado para apoiar decisões comerciais e estratégicas, indo além da análise de faturamento.

A proposta é separar crescimento aparente de crescimento com rentabilidade.

Em muitos negócios, olhar apenas para receita pode esconder problemas importantes:

- canais que vendem muito, mas geram pouca margem;
- produtos que inflam faturamento, mas contribuem pouco para o lucro;
- canais menores que vendem com maior qualidade;
- oportunidades de escala em produtos com alta margem;
- necessidade de separar volume de valor.

---

## Pergunta de negócio

A pergunta central da análise é:

> A empresa deveria priorizar os canais e produtos que mais vendem ou aqueles que mais contribuem para o lucro bruto?

---

## Base de dados

A base é fictícia e foi criada para simular uma empresa com diferentes canais de venda e mix de produtos.

### Tabelas utilizadas

| Tabela | Descrição |
|---|---|
| `clientes` | Cadastro dos clientes |
| `produtos` | Produtos, categorias, preços e custos |
| `canais_venda` | Canais comerciais utilizados pela empresa |
| `pedidos` | Pedidos realizados pelos clientes |
| `itens_pedido` | Produtos vendidos dentro de cada pedido |

---

## Estrutura do projeto

```text
vendendo-mais-ou-ganhando-melhor-sql/
│
├── data/
│   └── empresa.db
│
├── outputs/
│   └── insights_executivos.md
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_receita_total.sql
│   ├── 04_receita_por_canal.sql
│   ├── 05_margem_por_canal.sql
│   ├── 06_margem_por_produto.sql
│   ├── 07_produto_por_canal.sql
│   ├── 08_participacao_produto_canal.sql
│   └── 09_matriz_decisao_portfolio.sql
│
├── run_sql.py
├── setup_database.py
└── README.md