/*4. Tabla Factura_O_Boleta
	-Agregar
	-Buscar
	-Modificar
*/

-- Insertar una nueva Factura o Boleta
create procedure InsertFacturaOBoleta
    @ID_Fac int,
	@RUT nvarchar(9),
    @ID_Cliente int,
    @Total_Pago money
as

declare @Idcliente as int
set @Idcliente = (select ID_Cliente from Clientes where ID_Cliente = @Idcliente)

begin
	if ((@Total_Pago <= 0) or (isnumeric(@Total_Pago) = 0))
		print('El monto debe ser un número mayor que cero y no puede contener texto.')
	else
		print('Factura/Boleta insertada correctamente');

    insert into Factura_O_Boleta (RUT, ID_Cliente, Total_Pago)
    values (@RUT, @Idcliente, @Total_Pago)
end

--Modificar factura o boleta
create procedure ModificarFacturaOBoleta
    @ID_Fac int,
    @RUT nvarchar(9),
    @ID_Cliente int,
    @Total_Pago money
as

declare @Idcliente as int
set @Idcliente = (select ID_Cliente from Clientes where ID_Cliente = @Idcliente)

begin
	if @Total_Pago <= 0 or isnumeric(@Total_Pago) = 0
		print('El monto debe ser un número mayor que cero y no puede contener texto.')
    begin
        update Factura_O_Boleta
        set RUT = @RUT,
			ID_Cliente = @ID_Cliente,
			Total_Pago = @Total_Pago
        where ID_Fac = @ID_Fac
		print('Factura/ Boleta actualzada correctamente')
    end
end


--Buscar boleta / factura
create procedure BuscarFacturaOBoleta
    @ID_Fac int
as

declare @Idfactura as int
set @Idfactura = (select ID_Fac from Factura_O_Boleta where ID_Fac = @Idfactura)

begin
	if (@ID_Fac = @Idfactura)
	begin
		select * from Factura_O_Boleta where ID_Fac = @Idfactura
	end
	else
	begin
		print('Boleta no encontrada')
	end
end