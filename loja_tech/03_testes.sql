use loja_tech;

call listar_categorias_ativas();

call buscar_pedidos_por_status('pendente');
call buscar_pedidos_por_status('entregue');

call inserir_categoria('acessórios', 'cabos, adaptadores e capas');
select * from categorias;

call atualizar_telefone_cliente(1, '11999998888');
select id_cliente, nome, telefone from clientes where id_cliente = 1;

call contar_produtos_categoria(3, @total);
select @total as total_produtos;

call contar_produtos_categoria(1, @total);
select @total as total_produtos;