/* 1. Tabla de Tipo_llamada
	-Agregar tipo de llamada (Exterior, Nacionales e internacionales)
	-Buscar los tipos de llamada
*/

-- Insertar un nuevo Tipo de Llamada (Exterior, Nacional, internaciopnal)
create procedure InsertTipoLlamada
	@IdTipoLlamada int,
    @Tipo_llamada nvarchar(15)
as
declare @type_call as nvarchar(15) -- Verifica el tipo de llamada (Varible)
set @type_call = (select Tipo_llamada from Tipo_llamada where Tipo_llamada = @Tipo_llamada)-- Asignar el valor de la llamada si ya existe en la bsdts
begin    
-- Verificar que la entrada no esté vacía
    if (@Tipo_llamada = '' OR @Tipo_llamada IS NULL OR LEN(@Tipo_llamada) = 0)
    begin
        print('Debe de ingresar un tipo de llamada. (Exterior) / (Nacional) / (Internacional)')
    end
    else 
    begin
        -- Verificar si el tipo de llamada esta registrado
        if (@type_call = @Tipo_llamada)
        begin
            print('El tipo de llamada ya se encuentra registrado.')
        end
        else
        begin
            -- Validar que la cadena no contenga caracteres especiales (solo letras y espacios)
            if (@Tipo_llamada like '%[^a-zA-Z ]%')
            begin
                print('El tipo de llamada contiene caracteres inválidos. Solo se permiten letras y espacios.')
            end
            else
            begin
                -- Verificar si la longitud es menor a 10 caracteres
                if (len(@Tipo_llamada) <= 10)
                begin
                    print('El tipo de llamada debe tener al menos 10 caracteres.')
                end
                -- Verificar si la longitud es mayor a 15 caracteres
                else if (len(@Tipo_llamada) >= 15)
                begin
                    print('Solo puede ingresar 15 caracteres para el tipo de llamada.')
                end
                else
                begin
                    -- Insertar el nuevo tipo de llamada
                    insert into Tipo_llamada (ID_tipo_llamada,Tipo_llamada) values (@IdTipoLlamada ,@Tipo_llamada)
                    print('Tipo de llamada registrado correctamente.')
                end
            end
        end
    end
end

--Buscar los tipos de llamada
create procedure buscarTipoLlamada
    @ID_tipo_llamada int
as
-- Verificar si coincide
declare @verificarTipo as int
set @verificarTipo = (select ID_tipo_llamada from Tipo_llamada where ID_tipo_llamada = @ID_tipo_llamada)

begin
    if(@verificarTipo = @ID_tipo_llamada)
    begin
	    select * from Tipo_llamada where ID_tipo_llamada = @ID_tipo_llamada
    end
    else
    begin
        print 'Tipo de llamada no encontrada'
    end
end
