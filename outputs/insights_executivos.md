# Vendendo mais ou ganhando melhor?

## Objetivo

Este projeto analisa uma base comercial fictícia para responder uma pergunta de negócio:

> A empresa está vendendo mais ou ganhando melhor?

A análise utiliza SQL para cruzar dados de clientes, produtos, pedidos, canais de venda e itens vendidos, buscando identificar quais combinações de produto e canal realmente geram valor econômico.

---

## 1. Receita total

A empresa faturou R$ 28.337,00 no período analisado.

Esse número, isoladamente, não responde se o negócio está saudável. Receita mostra volume de venda, mas não mostra qualidade econômica da venda.

---

## 2. Receita por canal

A análise por canal mostrou:

| Canal | Receita |
|---|---:|
| Venda Consultiva | R$ 14.170 |
| Marketplace | R$ 9.974 |
| Loja Física | R$ 1.720 |
| E-commerce | R$ 1.375 |
| WhatsApp | R$ 1.098 |

A primeira leitura indicaria que Venda Consultiva e Marketplace são os canais mais relevantes.

Mas essa conclusão é incompleta.

O Marketplace tem receita alta, mas precisa ser analisado junto com margem e lucro bruto.

---

## 3. Margem por canal

Ao analisar lucro bruto e margem, a diferença fica clara:

| Canal | Receita | Lucro Bruto | Margem |
|---|---:|---:|---:|
| Venda Consultiva | R$ 14.170 | R$ 8.750 | 61,75% |
| Marketplace | R$ 9.974 | R$ 1.338 | 13,41% |
| Loja Física | R$ 1.720 | R$ 1.045 | 60,76% |
| E-commerce | R$ 1.375 | R$ 618 | 44,95% |
| WhatsApp | R$ 1.098 | R$ 583 | 53,10% |

A Venda Consultiva é o principal motor econômico do negócio.

O Marketplace, apesar de ser o segundo maior canal em receita, apresenta margem muito baixa.

---

## 4. Produto e rentabilidade

A análise por produto mostrou que os principais geradores de lucro são:

| Produto | Receita | Lucro Bruto | Margem |
|---|---:|---:|---:|
| Produto Profissional | R$ 7.540 | R$ 4.100 | 54,38% |
| Consultoria Avulsa | R$ 4.470 | R$ 3.390 | 75,84% |
| Produto Premium | R$ 2.980 | R$ 1.630 | 54,70% |

Por outro lado, o Kit Promocional aparece como ponto de atenção:

| Produto | Receita | Lucro Bruto | Margem |
|---|---:|---:|---:|
| Kit Promocional | R$ 7.665 | R$ 915 | 11,94% |

O Kit Promocional gera muita receita, mas pouca contribuição de lucro.

---

## 5. Produto x Canal

O cruzamento entre produto e canal mostrou que o Marketplace concentra vendas de itens com baixa margem:

| Canal | Produto | Receita | Lucro Bruto | Margem |
|---|---|---:|---:|---:|
| Marketplace | Kit Promocional | R$ 7.665 | R$ 915 | 11,94% |
| Marketplace | Produto Entrada | R$ 2.309 | R$ 423 | 18,32% |

Isso explica por que o Marketplace parece forte quando olhamos faturamento, mas fraco quando olhamos lucro.

A Venda Consultiva, por outro lado, concentra produtos premium e serviços:

| Canal | Produto | Receita | Lucro Bruto | Margem |
|---|---|---:|---:|---:|
| Venda Consultiva | Produto Profissional | R$ 7.540 | R$ 4.100 | 54,38% |
| Venda Consultiva | Consultoria Avulsa | R$ 4.470 | R$ 3.390 | 75,84% |

---

## 6. Matriz estratégica

A classificação estratégica separou as combinações em categorias:

### Motor de Lucro

Combinações com alta participação no lucro e margem elevada.

- Venda Consultiva + Produto Profissional
- Venda Consultiva + Consultoria Avulsa

Essas combinações devem receber prioridade comercial.

### Volume sem Valor

Combinações com alta participação na receita, mas margem baixa.

- Marketplace + Kit Promocional

Esse item infla faturamento, mas contribui pouco para o lucro.

### Oportunidade de Escala

Combinações com margem alta, mas baixa participação no lucro.

- Loja Física + Serviço Adicional
- E-commerce + Assinatura Mensal
- WhatsApp + Assinatura Mensal
- WhatsApp + Serviço Adicional
- Venda Consultiva + Serviço Adicional

Esses itens podem ser explorados como upsell, recorrência ou complemento de margem.

### Produto Saudável

Combinações com margem boa e participação intermediária.

- Venda Consultiva + Produto Premium
- Loja Física + Produto Premium

São linhas saudáveis, mas ainda não dominam o resultado.

---

## 7. Conclusão executiva

A empresa não tem apenas um problema de vender mais.

Ela precisa vender melhor.

A análise mostra que:

1. A Venda Consultiva é o principal motor econômico.
2. O Marketplace gera volume, mas entrega baixa rentabilidade.
3. Produtos premium e serviços carregam o lucro.
4. O Kit Promocional aumenta receita, mas comprime margem.
5. Canais próprios como E-commerce e WhatsApp podem ter oportunidades em produtos de maior margem, especialmente assinatura e serviços.

---

## 8. Recomendações

1. Priorizar comercialmente Produto Profissional e Consultoria Avulsa na Venda Consultiva.

2. Revisar a estratégia do Kit Promocional no Marketplace, avaliando aumento de preço, redução de custo ou mudança de papel estratégico.

3. Não medir Marketplace apenas por receita. Caso ele seja usado como canal de aquisição, acompanhar recompra, migração para canais próprios e LTV.

4. Testar expansão de Assinatura Mensal e Serviço Adicional em canais próprios, como E-commerce e WhatsApp.

5. Separar indicadores de crescimento em duas camadas:
   - crescimento de receita;
   - crescimento de lucro bruto.

A pergunta final não deve ser apenas:

> Quanto vendemos?

Mas sim:

> Quanto capturamos de valor em cada venda?