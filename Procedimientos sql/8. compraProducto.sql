
/*8. Tabla Compra_Producto
	-Agregar
	-Buscar
	-Modificar
*/

--Insertar compra producto
create procedure InsertarCompraProducto
@ID_Prov int,
@ID_Producto int,
@Cantidad int,
@Fecha_Compra date,
@Total_pago money
as
begin
    if (@Cantidad < 0 or isnumeric(@Cantidad) = 0)
    begin
        print('No se puede ingresar números negativos ni texto. Ingrese una cantidad valida.')
    end
    else if (@Total_pago < 0 or isnumeric(@Total_pago) = 0)
    begin
        print('No se puede ingresar números negativos ni texto. Ingrese una cantidad valida.')
    end
    else
    begin
        insert into Compra_Producto (ID_Prov, ID_Producto, Cantidad, Fecha_Compra, Total_pago)
        values (@ID_Prov, @ID_Producto, @Cantidad, @Fecha_Compra, @Total_pago);
        print('Compra registrada correctamente.')
    end
end

--Modificar Compra de producto
create procedure ModificarCompraProducto
    @ID_Compra int,
    @ID_Prov int,
    @ID_Producto int,
    @Cantidad int,
    @Fecha_Compra date,
    @Total_pago money
as
begin
    if ((@Cantidad < 0) or (isnumeric(@Cantidad) = 0))
    begin
        print('No se puede ingresar números negativos ni texto. Ingrese una cantidad valida.');
    end
    else if ((@Total_pago <= 0) or (isnumeric(@Total_pago) = 0))
    begin
        print('No se puede ingresar números negativos ni texto. Ingrese una cantidad valida.');
    end
    else
    begin
        update Compra_Producto
        set ID_Producto = @ID_Producto, 
            Cantidad = @Cantidad, 
            Fecha_Compra = getdate(), 
            Total_pago = @Total_pago
        where ID_Compra = @ID_Compra;
        print('Compra actualizada correctamente.');
    end
end



--Buscar compra compra producto
create procedure BuscarCompraProducto
    @ID_Compra int
as

declare @IdCompra as int
set @IdCompra = (select ID_Compra from Compra_Producto  where ID_Compra = @IdCompra)

begin
	if (@IdCompra = @ID_Compra)
	begin
		select * from  Compra_Producto where ID_Compra = @ID_Compra
	end
	else
	begin
		print('Compra no encontrada')
	end
end
