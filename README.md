# 🛒 TechStore — Consultas SQL e Stored Procedures

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?logo=mysql&logoColor=white)
![Nível](https://img.shields.io/badge/nível-muito%20fácil-brightgreen)

Atividade de **consultas SQL** e **stored procedures** em MySQL, feita sobre o banco `loja_tech`, o e-commerce da TechStore.

## 📁 Arquivos

```text
.
├── banco_loja_tech.sql       # cria o banco, as tabelas e os dados
├── parte1_consultas.sql      # 10 consultas
├── parte2_procedures.sql     # 5 stored procedures
├── parte2_testes.sql         # chamadas para testar as procedures
├── exercicio1_*.sql          # bônus: atualizar_preco_categoria
└── exercicio2_*.sql          # bônus: consultar_extrato_cliente
```

## 🚀 Como rodar

Execute no MySQL Workbench (ou com `mysql -u root -p < arquivo.sql`), nesta ordem:

1. `banco_loja_tech.sql`
2. `parte1_consultas.sql`
3. `parte2_procedures.sql`
4. `parte2_testes.sql`

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

## 🎁 Bônus

Os dois desafios da aula também estão resolvidos: `atualizar_preco_categoria` (reajuste de preços com limites e log) e `consultar_extrato_cliente` (3 result sets). Os testes do primeiro alteram preços de verdade; para recomeçar, rode o `banco_loja_tech.sql` de novo.

---

Feito com ☕ e muito `select * from` 💙
