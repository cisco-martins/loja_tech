use loja_tech;

select nome, email
from clientes;

select nome, preco
from produtos
where preco < 500.00;

select *
from pedidos
where status = 'pendente';

select nome, preco
from produtos
order by preco desc;

select id_produto, nome, preco
from produtos
where nome like '%monitor%';

select nome, estoque
from produtos
where id_categoria = 3
  and estoque > 40;

select count(*) as total_clientes
from clientes;

select sum(valor_total) as faturamento_bruto
from pedidos;

select p.nome as produto, c.nome as categoria
from produtos p
inner join categorias c on c.id_categoria = p.id_categoria;

select pe.id_pedido, pe.status, pe.valor_total
from pedidos pe
inner join clientes c on c.id_cliente = pe.id_cliente
where c.nome = 'ana silva';