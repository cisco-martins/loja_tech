# 🛒 TechStore — Consultas, Stored Procedures e Views

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?logo=mysql&logoColor=white)
![Nível](https://img.shields.io/badge/nível-muito%20fácil-brightgreen)

Atividade de **consultas SQL**, **stored procedures** e **views** em MySQL, feita sobre o banco `loja_tech`, o e-commerce da TechStore.

## 📁 Arquivos

```text
.
├── banco_loja_tech.sql       # cria o banco, as tabelas e os dados
├── parte1_consultas.sql      # 10 consultas
├── parte2_procedures.sql     # 5 stored procedures
├── parte2_testes.sql         # testes das procedures
├── views_exemplos.sql        # 5 views
├── views_testes.sql          # testes das views
└── views_vs_procedures.md    # pesquisa: quando usar view em vez de procedure
```

## 🚀 Como rodar

Execute no MySQL Workbench (ou com `mysql -u root -p < arquivo.sql`), nesta ordem:

1. `banco_loja_tech.sql`
2. `parte1_consultas.sql`
3. `parte2_procedures.sql` e depois `parte2_testes.sql`
4. `views_exemplos.sql` e depois `views_testes.sql`

> ⚠️ O `banco_loja_tech.sql` apaga e recria o `loja_tech` se ele já existir. Requer MySQL 8.0 ou superior.

## 🔎 Parte 1: consultas

10 consultas que cobrem `select`, `where`, `order by`, `like`, `count`, `sum` e `inner join`.

## ⚙️ Parte 2: stored procedures

| Procedure | Parâmetros | O que faz |
|---|---|---|
| `listar_categorias_ativas` | — | lista as categorias ativas em ordem alfabética |
| `buscar_pedidos_por_status` | `in p_status` | mostra os pedidos com o status informado |
| `inserir_categoria` | `in p_nome`, `in p_descricao` | cadastra uma categoria |
| `atualizar_telefone_cliente` | `in p_id_cliente`, `in p_telefone` | troca o telefone de um cliente |
| `contar_produtos_categoria` | `in p_id_categoria`, `out p_total` | devolve a quantidade de produtos da categoria |

```sql
call contar_produtos_categoria(3, @total);
select @total as total_produtos;
```

## 👁️ Parte 3: views

Cinco situações em que a view é melhor que a procedure: leitura de dados sempre com a mesma "forma", sem parâmetros e sem gravar nada.

| View | Situação |
|---|---|
| `vw_catalogo_produtos` | vitrine do site, cada consumidor aplica seu próprio filtro |
| `vw_clientes_publico` | esconde CPF, telefone e data de nascimento do atendimento |
| `vw_pedidos_detalhados` | pedido com cliente e quantidade de itens já juntados |
| `vw_estoque_baixo` | painel de alerta de reposição |
| `vw_vendas_por_categoria` | relatório gerencial, sem pedidos cancelados |

```sql
select * from vw_pedidos_detalhados where status = 'pendente';
```
