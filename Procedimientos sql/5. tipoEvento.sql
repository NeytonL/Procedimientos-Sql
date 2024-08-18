/*5. Tabla Tipo_Evento
	-Agregar
	-Buscar
	-Modificar
*/
--Insertar tipoEventeo
create procedure InsertTipoEvento
    @IdTipoEvento int,
    @Tipo_Evento nvarchar(15)
as

declare @Id_tipoEvento as int
set @Id_tipoEvento = (select ID_tipo_evento from Tipo_Evento where ID_tipo_evento = @IdTipoEvento)

begin
    -- Verificar que la entrada no esté vacía
    if ((@Tipo_Evento = '') or (len(@Tipo_Evento) = 0))
    begin
        print('El Tipo de Evento no puede estar vacío.')
    end
    else
    begin
        if (@Id_tipoEvento = @IdTipoEvento)
        begin
            print('El tipo de evento ya se encuentra registrado')
        end
        else
        begin
            if (@Tipo_Evento like '%[^a-zA-Z ]%')
            begin
                print('El texto no debe tener caracteres inválidos. Solo se permite letras y espacios')
            end
            else
            begin
                if (len(@Tipo_Evento) <= 10)
                begin
                    print('El tipo de evento debe tener al menos 10 caracteres')
                end
                else
                begin
                    if (len(@Tipo_Evento) >= 15)
                    begin
                        print('El tipo de evento no puede exceder los 15 caracteres')
                    end
                    else
                    begin
                        insert into Tipo_Evento (ID_tipo_evento, Tipo_Evento)
                        values (@IdTipoEvento, @Tipo_Evento)
                        print('Evento registrado correctamente.')
                    end
                end
            end
        end
    end
end


--Modificar el tipo de evento
create procedure ModificarTipoEvento
@Id_Evento int,
@Tipo_Evento nvarchar(15)
as
if(@Tipo_Evento = '' or len(@Tipo_Evento)<0)
	print('No debe de estar vacio. Ingrese un tipo de evento')
else
begin
	update Tipo_Evento
	set Tipo_Evento = @Tipo_Evento
	where ID_tipo_evento = @Id_Evento
end


-- Buscar el tipo de evento
create procedure BuscarTipoEvento
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