/*3. Tabla Cuenta_Cliente
	-Agregar
	-Buscar
	-Modificar
	-Dar de baja (Cuenta del cliente) (Faltante)
*/

--Agregar cuenta del cliente
create procedure InsertCuentaCliente
@ID_Cliente int,
@ID_Hab int,
@ID_Reserva int,
@Forma_Pago nvarchar(10),
@Total_llamadas money,
@Total_Refrigerador money,
@Total_estancia money,
@Total_a_pagar money
as
begin
    if (@Forma_Pago ='' or len(@Forma_Pago) = 0)
    begin
        print('La forma de pago no puede estar vacía.')
    end
    else if ((@Total_llamadas <= 0) or (isnumeric(@Total_llamadas)) = 0)
    begin
        print('El monto total de las llamadas debe ser un número mayor que cero y no puede contener texto.')
    end
    else if (@Total_Refrigerador <= 0 or isnumeric(@Total_Refrigerador) = 0)
    begin
        print('El monto total del refrigerador debe ser un número mayor que cero y no puede contener texto.')
        return
    end
    else if (@Total_estancia <= 0 or isnumeric(@Total_estancia) = 0)
    begin
        print('El monto total de la estancia debe ser un número mayor que cero y no puede contener texto.')
        return
    end
    else if (@Total_a_pagar <= 0 or isnumeric(@Total_a_pagar) = 0)
    begin
        print('El monto total a pagar debe ser un número mayor que cero y no puede contener texto.')
        return
    end
    else
    begin
	    -- Sumar los totales
        set @Total_a_pagar = @Total_llamadas + @Total_Refrigerador + @Total_estancia

        insert into Cuenta_Cliente (ID_Cliente, ID_Hab, ID_Reserva, Forma_Pago, Total_llamadas, Total_Refrigerador, Total_estancia, Total_a_pagar)
        values (@ID_Cliente, @ID_Hab, @ID_Reserva, @Forma_Pago, @Total_llamadas, @Total_Refrigerador, @Total_estancia, @Total_a_pagar)
    end
end

--Modificar la cuenta del cliente
create procedure ModificarCuentaCliente
    @ID_Cuenta int,
    @ID_Cliente int,
    @ID_Hab int,
    @ID_Reserva int,
    @Forma_Pago nvarchar(10),
    @Total_llamadas money,
    @Total_Refrigerador money,
    @Total_estancia money,
    @Total_a_pagar money
as

declare @Idcuenta as int
set @Idcuenta = (select ID_Cuenta from Cuenta_Cliente where ID_Cuenta = @Idcuenta)

declare @Idcliente as int
set @Idcliente = (select ID_Cliente from Clientes where ID_Cliente = @Idcliente)

declare @Idhabitacion as int
set @Idhabitacion = (select ID_Hab from Habitaciones where ID_Hab = @Idhabitacion)

declare @Idreserva as int
set @Idreserva = (select ID_reserva from Reservaciones where ID_reserva = @Idreserva)

declare @formaPago as nvarchar(10)
set @formaPago = (select Forma_Pago from Cuenta_Cliente where Forma_Pago = @formaPago)

declare @montoLlamada as money
set @montoLlamada = (select Total_llamadas from Cuenta_Cliente where Total_llamadas = @montoLlamada)

declare @montoRefrigerador as money
set @montoRefrigerador = (select Total_Refrigerador from Cuenta_Cliente where Total_Refrigerador = @montoRefrigerador)

declare @montoEstancia as money
set @montoEstancia = (select Total_estancia from Cuenta_Cliente where Total_estancia = @montoEstancia)

declare @montoAPagar as money
set @montoAPagar = (select Total_a_pagar from Cuenta_Cliente where Total_a_pagar = @montoAPagar)

begin
    if (@Forma_Pago = '' or len(@Forma_Pago) = 0)
    begin
        print('La forma de pago no puede estar vacía.')
    end
    else if (@Total_llamadas <= 0 or isnumeric(@Total_llamadas) = 0)
    begin
        print('El total a actualizar de llamadas debe ser un número mayor que cero y no puede contener texto.')
    end
    else if (@Total_Refrigerador <= 0 or isnumeric(@Total_Refrigerador) = 0)
    begin
        print('El monto total a actualzar del refrigerador debe ser un número mayor que cero y no puede contener texto.')
    end
    else if (@Total_estancia <= 0 or isnumeric(@Total_estancia) = 0)
    begin
        print('El monto total de la estancia a actualizar debe ser un número mayor que cero y no puede contener texto.')
    end
    else if @Total_a_pagar <= 0 or isnumeric(@Total_a_pagar) = 0
    begin
        print('El monto total a actualizar debe ser un número mayor que cero y no puede contener texto.')
    end
    else
    begin
        update Cuenta_Cliente
        set Forma_Pago = @formaPago, 
            Total_llamadas = @montoLlamada, 
            Total_Refrigerador = @montoRefrigerador, 
            Total_estancia = @montoEstancia, 
            Total_a_pagar = @montoAPagar
        where ID_Cuenta = @Idcuenta
    end
end


--Buscar cuenta cliente
create procedure BuscarCuentaCliente
    @ID_Cuenta int
as

declare @Idcuenta as int
set @Idcuenta = (select ID_Cuenta from Cuenta_Cliente where ID_Cuenta = @Idcuenta)

begin
	if (@Idcuenta = @ID_Cuenta)
	begin
		select * from  Cuenta_Cliente where ID_Cuenta = @ID_Cuenta
	end
	else
	begin
		print('Cuenta no encontrada')
	end
end