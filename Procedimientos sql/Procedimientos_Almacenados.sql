/* Mis tablas son 9, algunas necesitaran triggers y funciones. 
	-Insertar (Agregar)
	-Dar de baja
	-Actualizar (Modificar)
	-Buscar
*/

--Mis tablas son las siguientes:
create table Tipo_llamada( --1. Hecho
ID_tipo_llamada int identity(1,1) primary key not null,
Tipo_llamada nvarchar(15) not null
)

create table llamadas_Cliente( --2- Hecho
ID_llamada int identity(1,1) primary key not null,
Costo_llamada money not null,
ID_Tel int foreign key references Telefonos_Hab(ID_Tel) not null,
ID_tipo_llamada int foreign key references Tipo_llamada(ID_tipo_llamada) not null,
ID_Cliente int foreign key references Clientes(ID_Cliente) not null,
ID_Hab int foreign key references Habitaciones(ID_Hab) not null
)

create table Cuenta_Cliente( --3. Hecho (Medio)
ID_Cuenta int identity(1,1) primary key not null,
ID_Cliente int foreign key references Clientes(ID_Cliente) not null,
ID_Hab int foreign key references Habitaciones(ID_Hab) not null,
ID_Reserva int foreign key references Reservaciones(ID_Reserva) not null,
Forma_Pago nvarchar(10) not null,
Total_llamadas money not null,
Total_Refrigerador money not null,
Total_estancia money not null,
Total_a_pagar money not null
) 

create table Factura_O_Boleta( --4. Hecho
ID_Fac int identity(1,1) not null,
RUT nvarchar(9),
ID_Cliente int foreign key references Clientes(ID_Cliente) not null,
Total_Pago money not null
)

create table Tipo_Evento(--5. Hecho
ID_tipo_evento int identity(1,1) primary key not null,
Tipo_Evento nvarchar(15) not null
)

create table Eventos( --6.  Hecho
ID_Evento int identity(1,1) primary key not null,
ID_Cliente int foreign key references Clientes(ID_Cliente) not null,
ID_tipo_evento int foreign key references Tipo_Evento(ID_tipo_evento) not null,
Costo_Evento money not null,
Fecha_Evento date not null
)

Create table Proveedor( --7. Hecho
ID_Prov int identity(1,1) primary key not null,
PNP nvarchar(15) not null,
SNP nvarchar(15),
PAP nvarchar(15) not null,
SAP nvarchar(15),
TelP char(8) check(TelP like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)


create table Compra_Producto( --8. (Medio)
ID_Compra int identity(1,1) primary key not null,
ID_Prov int foreign key references Proveedor(ID_Prov) not null,
ID_Producto int foreign key references Productos(ID_Producto) not null,
Cantidad int not null,
Fecha_Compra date not null,
Total_pago money not null
)

create table Devolucion_Producto( --9. Hecho (Medio)
ID_Dev int identity(1,1) primary key not null,
ID_Producto int foreign key references Productos(ID_Producto) not null,
ID_Prov int foreign key references Proveedor(ID_Prov) not null,
Cantidad int not null,
Fecha_Dev date not null,
Motivo_Dev nvarchar(100) not null,
Total_Dev money not null
)


-------------------------------------------
create table Clientes(
ID_Cliente int identity(1,1) primary key not null,
PNC nvarchar(15) not null,
SNC nvarchar(15),
PAC nvarchar(15) not null,
SAC nvarchar(15),
TelC char(8) check(TelC like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

create table Tipo_Hab(
ID_TipoHab int identity(1,1) primary key not null,
Tipo_hab nvarchar(10) not null
)

create table Habitaciones(
ID_Hab int identity(1,1) primary key not null,
Numero_hab int not null,
Precio money not null,
ID_TipoHab int foreign key references Tipo_Hab(ID_TipoHab) not null
)

create table Reservaciones(
ID_reserva int identity(1,1) primary key not null,
fecha_reserva date not null,
ID_Hab int foreign key references Habitaciones(ID_Hab) not null,
ID_Cliente int foreign key references Clientes(ID_Cliente) not null,
tiempo_instancia int not null,
Forma_Pago nvarchar(20) not null,
Estado_salida bit default 1 not null
)

create table Refrigeradores(
ID_Refrigerador int identity(1,1) primary key not null,
Marca nvarchar(30) not null,
ID_Hab int foreign key references Habitaciones(ID_Hab) not null
)

create table Productos(
ID_Producto int identity(1,1) primary key not null,
Nombre nvarchar(30) not null,
fecha_vencimiento date not null,
Existencia int not null,
Precio money not null,
)

create table Refrigerador_Productos(
ID int identity(1,1) primary key not null,
Cantidad int not null,
ID_Refrigerador int foreign key references Refrigeradores(ID_Refrigerador) not null,
ID_Producto int foreign key references Productos(ID_Producto) not null
)

create table Consumo_Cliente(
ID_consumo int identity(1,1) primary key not null,
ID_Cliente int foreign key references Clientes(ID_Cliente) not null,
ID_Refrigerador int foreign key references Refrigeradores(ID_Refrigerador) not null,
ID_Hab int foreign key references Habitaciones(ID_Hab) not null,
ID_Producto int foreign key references Productos(ID_Producto) not null,
Cantidad_Consumida int not null,
Total_pago money not null
)

create table Productos_bajo_hab(
ID int identity(1,1) primary key not null,
Cantidad int not null,
ID_Producto int foreign key references Productos(ID_Producto) not null,
ID_Hab int foreign key references Habitaciones(ID_Hab) not null,
)

create table Telefonos_Hab(
ID_Tel int identity(1,1) primary key not null,
ID_Hab int foreign key references Habitaciones(ID_Hab) not null
)



-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------


-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
