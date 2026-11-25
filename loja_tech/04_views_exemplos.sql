use loja_tech;

create or replace view vw_catalogo_produtos as
select
    p.id_produto,
    p.nome as produto,
    c.nome as categoria,
    p.preco,
    p.estoque
from produtos p
inner join categorias c on c.id_categoria = p.id_categoria
where p.ativo = true
  and c.ativo = true;

create or replace view vw_clientes_publico as
select
    id_cliente,
    nome,
    email
from clientes
where ativo = true;

create or replace view vw_pedidos_detalhados as
select
    pe.id_pedido,
    c.nome as cliente,
    pe.data_pedido,
    pe.status,
    pe.valor_total,
    count(ip.id_item) as qtd_itens
from pedidos pe
inner join clientes c on c.id_cliente = pe.id_cliente
left join itens_pedido ip on ip.id_pedido = pe.id_pedido
group by pe.id_pedido, c.nome, pe.data_pedido, pe.status, pe.valor_total;

create or replace view vw_estoque_baixo as
select
    p.id_produto,
    p.nome as produto,
    c.nome as categoria,
    p.estoque,
    p.estoque_minimo,
    p.estoque_minimo * 2 - p.estoque as sugestao_reposicao
from produtos p
inner join categorias c on c.id_categoria = p.id_categoria
where p.ativo = true
  and p.estoque <= p.estoque_minimo;

create or replace view vw_vendas_por_categoria as
select
    c.nome as categoria,
    sum(ip.quantidade) as qtd_vendida,
    sum(ip.subtotal) as total_vendido
from itens_pedido ip
inner join pedidos pe on pe.id_pedido = ip.id_pedido
inner join produtos pr on pr.id_produto = ip.id_produto
inner join categorias c on c.id_categoria = pr.id_categoria
where pe.status <> 'cancelado'
group by c.id_categoria, c.nome;