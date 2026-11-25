use loja_tech;

select * from vw_catalogo_produtos;

select produto, preco
from vw_catalogo_produtos
where categoria = 'periféricos'
order by preco;

select * from vw_clientes_publico;

select * from vw_pedidos_detalhados;

select * from vw_pedidos_detalhados where status = 'pendente';

select * from vw_pedidos_detalhados where cliente = 'ana silva';

select * from vw_estoque_baixo;

update produtos set estoque = 2 where id_produto = 8;

select * from vw_estoque_baixo;

update produtos set estoque = 12 where id_produto = 8;

select * from vw_vendas_por_categoria order by total_vendido desc;