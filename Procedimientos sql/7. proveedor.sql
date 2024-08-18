/*7. Tabla Proveedor
	-Agregar
	-Buscar
	-Modificar
	-Dar de baja (Cuenta del cliente) (Faltante)
*/


-- Insertar un nuevo Proveedor
create procedure InsertarProveedor
@Id_Proveedor int,
@PNP nvarchar(15),
@SNP nvarchar(15),
@PAP nvarchar(15),
@SAP nvarchar(15),
@TelP char(8)
as
begin
    if (@PNP = '' OR LEN(@PNP) = 0)
    begin
        print('El Primer Nombre del Proveedor no puede estar vacío.');
    end 
    else 
    begin
        if ((@PAP = '') OR (LEN(@PAP) = 0))
        begin
            print('El Primer Apellido del Proveedor no puede estar vacío.');
        end
        else
        begin
            insert into Proveedor (ID_Prov, PNP, SNP, PAP, SAP, TelP)
            values (@Id_Proveedor, @PNP, @SNP, @PAP, @SAP, @TelP);
		end
	end
end

--Modificar proveedor
CREATE PROCEDURE UpdateProveedor
@Id_Proveedor int,
@PNP nvarchar(15),
@SNP nvarchar(15),
@PAP nvarchar(15),
@SAP nvarchar(15),
@TelP char(8)
as
begin
   if (@PNP = '' OR LEN(@PNP) = 0)
    begin
        print('El Primer Nombre del Proveedor no puede estar vacío.');
    end 
    else 
    begin
        if (@PAP = '' OR LEN(@PAP) = 0)
        begin
            print('El Primer Apellido del Proveedor no puede estar vacío.');
        end
        else
        begin
            update Proveedor
			set PNP = @PNP, 
				SNP = @SNP, 
				PAP = @PAP, 
				SAP = @SAP, 
				TelP = @TelP
				where ID_Prov = @Id_Proveedor;
		end
	end
end

--Buscar cuenta proveedor
create procedure BuscarCuentaCliente
    @ID_Proveedor int
as

declare @IdProveedor as int
set @IdProveedor = (select ID_Prov from Proveedor where ID_Prov = @IdProveedor)

begin
	if (@IdProveedor = @ID_Proveedor)
	begin
		select * from  Proveedor where ID_Prov = @IdProveedor
	end
	else
	begin
		print('Proveedor no encontrado no encontrada')
	end
end