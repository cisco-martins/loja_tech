use loja_tech;

drop procedure if exists listar_categorias_ativas;

delimiter //
create procedure listar_categorias_ativas()
begin
    select id_categoria, nome, descricao
    from categorias
    where ativo = true
    order by nome;
end //
delimiter ;

drop procedure if exists buscar_pedidos_por_status;

delimiter //
create procedure buscar_pedidos_por_status(
    in p_status varchar(20)
)
begin
    select id_pedido, id_cliente, data_pedido, valor_total
    from pedidos
    where status = p_status;
end //
delimiter ;

drop procedure if exists inserir_categoria;

delimiter //
create procedure inserir_categoria(
    in p_nome varchar(100),
    in p_descricao text
)
begin
    insert into categorias (nome, descricao)
    values (p_nome, p_descricao);
end //
delimiter ;

drop procedure if exists atualizar_telefone_cliente;

delimiter //
create procedure atualizar_telefone_cliente(
    in p_id_cliente int,
    in p_telefone varchar(15)
)
begin
    update clientes
    set telefone = p_telefone
    where id_cliente = p_id_cliente;
end //
delimiter ;

drop procedure if exists contar_produtos_categoria;

delimiter //
create procedure contar_produtos_categoria(
    in p_id_categoria int,
    out p_total int
)
begin
    select count(*)
    into p_total
    from produtos
    where id_categoria = p_id_categoria;
end //
delimiter ;