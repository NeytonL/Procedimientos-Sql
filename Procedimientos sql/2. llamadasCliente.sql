/*2. Tabla llamadas_Cliente
	-Agregar
	-Buscar
	-Modificar
*/

-- Agregar una Llamada de Cliente
create procedure insertllamadacliente
    @costo_llamada money,
    @id_tel int,
    @id_tipo_llamada int,
    @id_cliente int,
    @id_hab int
as
begin
    -- Validar si el valor es nulo o no es numérico (por ejemplo, si se recibe un carácter)
    if ((@costo_llamada = '') or (@costo_llamada = NULL))
    begin
        print('No puede estar vacio el costo de la llamada.')
    end
    else if (@costo_llamada <= 0)
    begin
        print('El costo de la llamada debe ser mayor o igual que cero. No puede ser negativo.')
    end
    else
    begin
        -- Insertar los valores en la tabla si todas las validaciones son correctas
        insert into llamadas_cliente (costo_llamada, id_tel, id_tipo_llamada, id_cliente, id_hab)
        values (@costo_llamada, @id_tel, @id_tipo_llamada, @id_cliente, @id_hab);
    end
end


--Modificar llamada del cliente
create procedure ModificarLlamadaCliente
@ID_llamada int,
@Costo_llamada money,
@ID_Tel int,
@ID_tipo_llamada int,
@ID_Cliente int,
@ID_Hab int
as
declare @id_call as int
set @id_call = (select ID_llamada from llamadas_Cliente where ID_llamada = @id_call)

declare @costo_call as money
set @costo_call = (select Costo_llamada from llamadas_Cliente where Costo_llamada = @costo_call)

declare @id_telefono as int
set @id_telefono = (select ID_Tel from Telefonos_Hab where ID_Tel = @id_telefono)

declare @Idtipo_llamada as int
set @Idtipo_llamada = (select ID_tipo_llamada from Tipo_llamada where ID_tipo_llamada = @Idtipo_llamada)

declare @Idcliente as int
set @Idcliente = (select ID_Cliente from Clientes where ID_Cliente = @Idcliente)

declare @Idhabitacion as int
set @Idhabitacion = (select  ID_Hab from Habitaciones where ID_Hab = @Idhabitacion)

begin
	-- Validación de tipo numérico
    if (isnumeric(@Costo_llamada) = 0)
    begin
        print('El Costo de la Llamada debe ser un valor numérico.')
    end
    -- Validación de valor positivo
    else if (@Costo_llamada <= 0)
    begin
        print('El Costo de la Llamada debe ser mayor que cero.')
    end
    else
    begin
	update llamadas_Cliente
        set Costo_llamada = @costo_call,
            ID_Tel = @id_telefono,
            ID_tipo_llamada = @Idtipo_llamada,
            ID_Cliente = @Idcliente,
            ID_Hab = @Idhabitacion
        where ID_llamada = @ID_llamada
	end
end


-- Buscar la llamada del cliente
create procedure buscarLlamadaCliente
    @ID_llamada_cliente int
as

declare @verificaLlamada as int
set @verificaLlamada = (select ID_llamada from llamadas_Cliente where ID_tipo_llamada = @ID_llamada_cliente)

begin
    if(@verificaLlamada = @ID_llamada_cliente)
    begin
	    select * from llamadas_Cliente where ID_llamada = @ID_llamada_cliente
    end
    else
    begin
        print ('Llamada del cliente no encontrada')
    end
end
