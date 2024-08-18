/*6. Tabla Eventos
	-Agregar
	-Buscar
	-Modificar
*/
--Insertar evento
create procedure InsertarEventos
    @Id_Evento int,
    @Id_Cliente int,
    @Id_tipo_evento int,
    @Costo_Evento money,
    @Fecha_Evento date
as
declare @IdCliente as int
set @IdCliente = (select ID_Cliente from Clientes where ID_Cliente = @Id_Cliente)

declare @IdtipoEvento as int
set @IdtipoEvento = (select ID_Evento from Eventos where ID_Evento = @Id_tipo_evento)

begin
    if((@Costo_Evento <= 0) or (isnumeric(@Costo_Evento) = 0))
    begin
        print('El costo del evento debe ser mayor que 0 y no puede contener texto, debe ser un número.')
    end
    else
    begin
        insert into Eventos (ID_Evento, ID_Cliente, ID_tipo_evento, Costo_Evento, Fecha_Evento)
        values (@Id_Evento, @IdCliente, @IdtipoEvento, @Costo_Evento, getdate()) -- NO me la esta obteniendo
    end
end

--Modificar evento
create procedure ModificarEventos
    @Id_Evento int,
    @Id_Cliente int,
    @Id_tipo_evento int,
    @Costo_Evento money,
    @Fecha_Evento date
as
begin
    declare @IdCliente as int
    set @IdCliente = (select ID_Cliente from Clientes where ID_Cliente = @Id_Cliente)

    declare @IdtipoEvento as int
    set @IdtipoEvento = (select ID_Evento from Eventos where ID_Evento = @Id_tipo_evento)

    if((@Costo_Evento <= 0) or (isnumeric(@Costo_Evento) = 0))
    begin
        print('El costo a actualizar del evento debe ser mayor que 0 y no puede contener texto, debe ser un número.')
    end
    else
    begin
        update Eventos
        set Costo_Evento = @Costo_Evento,
            Fecha_Evento = getdate()  
        where ID_Evento = @Id_Evento
    end
end

--Buscar Evento
create procedure BuscarEvento
    @ID_Evento int
as

declare @IdEvento as int
set @IdEvento = (select ID_Evento from Eventos where ID_Evento = @IdEvento)

begin
	if (@IdEvento = @ID_Evento)
	begin
		select * from  Eventos where ID_Evento = @ID_Evento 
	end
	else
	begin
		print('Evento no encontrado')
	end
end