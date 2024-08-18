/*9. Tabla Devolucion_Producto
	-Agregar
	-Buscar
	-Modificar
*/

--Insertar Devolucion del producto.
create procedure InsertDevolucionProducto
    @ID_Producto int,
    @ID_Prov int,
    @Cantidad int,
    @Fecha_Dev date,
    @Motivo_Dev nvarchar(100),
    @Total_Dev money
as
begin
    if @Cantidad <= 0 or isnumeric(@Cantidad) = 0
    begin
        print('No se puede ingresar números negativos ni texto. Ingrese una cantidad valida.')
    end
    else if @Total_Dev <= 0 or isnumeric(@Total_Dev) = 0
    begin
        print('No se puede ingresar números negativos ni texto. Ingrese una cantidad valida.')
    end
    else if @Motivo_Dev =''  or len(@Motivo_Dev) = 0
    begin
        print('El motivo de la devolución no puede estar vacío.')
    end
    else
    begin
        insert into Devolucion_Producto (ID_Producto, ID_Prov, Cantidad, Fecha_Dev, Motivo_Dev, Total_Dev)
        values (@ID_Producto, @ID_Prov, @Cantidad, @Fecha_Dev , @Motivo_Dev, @Total_Dev)
        print('Devolución registrada correctamente.')
    end
end

-- Modificar una Devolución de Producto
create procedure ModificarDevolucionProducto
    @ID_Dev int,
    @ID_Producto int,
    @ID_Prov int,
    @Cantidad int,
    @Fecha_Dev date,
    @Motivo_Dev nvarchar(100),
    @Total_Dev money
as
begin
    if ((@Cantidad < 0) or (isnumeric(@Cantidad) = 0))
    begin
        print('No se puede ingresar números negativos ni texto. Ingrese un número.');
    end
    else if (@Total_Dev < 0 or isnumeric(@Total_Dev) = 0)
    begin
        print('No se puede ingresar números negativos ni texto. Ingrese un número.');
    end
    else if (@Motivo_Dev is null or len(@Motivo_Dev) = 0)
    begin
        print('El motivo de la devolución no puede estar vacío.');
    end
    else
    begin
        update Devolucion_Producto
        set ID_Prov = @ID_Prov, 
            Cantidad = @Cantidad, 
            Fecha_Dev = getdate(), 
            Motivo_Dev = @Motivo_Dev, 
            Total_Dev = @Total_Dev
        where ID_Dev = @ID_Dev;
        print('Devolución actualizada correctamente.');
    end
end

--Buscar una devolucion
create procedure BuscarDevolucionProducto
    @Id_Evento int
as
declare @IdEvento as int
set @IdEvento  = (select ID_tipo_evento from Tipo_Evento  where ID_tipo_evento = @IdEvento)

begin
	if (@Id_Evento = @IdEvento)
	begin
		select * from  Tipo_Evento where ID_tipo_evento = @Id_Evento
	end
	else
	begin
		print('Envento no encontrado')
	end
end

