/*USE master

CREATE DATABASE Wonka
GO*/

USE Wonka
GO

----------------------------------------------Tablas----------------------------------------------

CREATE TABLE Tipos_Producto
(
	Id_TP char (4) NOT NULL, --PK
	Nombre_TP varchar(30) NOT NULL,
	Estado_TP bit NOT NULL DEFAULT 1

	CONSTRAINT PK_TiposProd PRIMARY KEY (Id_TP)
)
GO

--------------------------------------------------------------------------------------------------

CREATE TABLE Productos
(
	Id_PROD int IDENTITY (1, 1) NOT NULL, --PK
	IdTipoP_PROD char (4) NOT NULL, --FK
	Stock_PROD int DEFAULT 0 NOT NULL,
	Precio_PROD decimal (8,2) DEFAULT 0 NOT NULL,
	Nombre_PROD varchar (30) NOT NULL,
	PuntoPedido_PROD int DEFAULT 10 NULL,
	Estado_PROD bit NOT NULL DEFAULT 1,
	ImageLink_PROD varchar (50) NOT NULL DEFAULT '~\Imagenes\Productos\0.jpg'

	CONSTRAINT PK_Productos PRIMARY KEY (Id_PROD),
	CONSTRAINT FK_Productos FOREIGN KEY (IdTipoP_PROD)
		REFERENCES Tipos_Producto (Id_TP),
	CONSTRAINT CK_Productos CHECK (Precio_PROD>=0)
)
GO

--------------------------------------------------------------------------------------------------

CREATE TABLE Usuarios
(
	Id_USU int IDENTITY (1,1) NOT NULL, --PK
	Nombre_USU varchar (50) NOT NULL,
	Apellido_USU varchar (50) NOT NULL,
	Telefono_USU varchar (15) NULL,
	Mail_USU varchar (70) NOT NULL, --UK
	Direccion_USU varchar (50) NULL,
	Contrasegna_USU varchar (15) NOT NULL,
	Administrador_USU bit NOT NULL DEFAULT 0,
	Estado_USU bit NOT NULL DEFAULT 1

	CONSTRAINT PK_Usuarios PRIMARY KEY (Id_USU),
	CONSTRAINT UK_Mail UNIQUE (Mail_USU)
)
GO

--------------------------------------------------------------------------------------------------

CREATE TABLE Ventas
(
	Nro_VENT int IDENTITY (1,1) NOT NULL, --PK
	IdUsuario_VENT int NOT NULL, --FK
	Monto_VENT decimal (8,2) NOT NULL DEFAULT 0,
	Fecha_VENT smalldatetime NOT NULL DEFAULT GETDATE(),
	Estado_VENT bit NOT NULL DEFAULT 1

	CONSTRAINT PK_Ventas PRIMARY KEY (Nro_VENT),
	CONSTRAINT FK_Ventas FOREIGN KEY (IdUsuario_VENT)
		REFERENCES Usuarios (Id_USU),
	CONSTRAINT CK_Detalle_Ventas CHECK (Monto_VENT>=0)
)
GO

--------------------------------------------------------------------------------------------------

CREATE TABLE Detalle_Ventas
(
	NroVent_DV int NOT NULL, --PK, FK
	IdProd_DV int NOT NULL, --PK, FK
	Cantidad_DV int NOT NULL DEFAULT 1,
	Precio_DV decimal (8,2) NOT NULL DEFAULT 0,
	Estado_DV bit NOT NULL DEFAULT 1

	CONSTRAINT PK_Detalle_Ventas PRIMARY KEY (NroVent_DV, IdProd_DV),
	CONSTRAINT FK_Detalle_Ventas_dboVentas FOREIGN KEY (NroVent_DV)
		REFERENCES Ventas (Nro_VENT),
	CONSTRAINT FK_Detalle_Ventas_dboProductos FOREIGN KEY (IdProd_DV)
		REFERENCES Productos (Id_PROD),
	CONSTRAINT CK_Detalle_Ventas_Cantidad CHECK (Cantidad_DV>0),
	CONSTRAINT CK_Detalle_Ventas_Precio CHECK (Precio_DV>=0)
)
GO

--------------------------------------------------------------------------------------------------

CREATE TABLE Pedidos
(
	Id_PED int NOT NULL IDENTITY(1, 1), --PK
	UnidadesTotales_PED int NOT NULL DEFAULT 0,
	FechaPedido_PED smalldatetime NOT NULL DEFAULT GETDATE(),
	FechaSalida_PED smalldatetime NULL,
	FechaEntrega_PED smalldatetime NULL,
	Estado_PED bit NOT NULL DEFAULT 1

	CONSTRAINT PK_Pedidos PRIMARY KEY (Id_PED),
	CONSTRAINT CK_Pedidos CHECK (UnidadesTotales_PED>=0)
)
GO

--------------------------------------------------------------------------------------------------

CREATE TABLE Productos_X_Pedido
(
	IdPedido_PP int NOT NULL, --PK, FK
	IdProducto_PP int NOT NULL, --PK, FK
	Cantidad_PP int NOT NULL DEFAULT 0,
	Estado_PP bit NOT NULL DEFAULT 1

	CONSTRAINT PK_Productos_X_Pedido PRIMARY KEY (IdPedido_PP, IdProducto_PP),
	CONSTRAINT FK_Productos_X_Pedido_dboPedidos FOREIGN KEY (IdPedido_PP)
		REFERENCES Pedidos (Id_PED),
	CONSTRAINT FK_Productos_X_Pedido_dboProductos FOREIGN KEY (IdProducto_PP)
		REFERENCES Productos (Id_PROD),
	CONSTRAINT CK_Productos_X_Pedido CHECK (Cantidad_PP>=0)
)
GO

--------------------------------------------------------------------------------------------------

CREATE TABLE Tarjeta_Clientes
(
    Nro_TAR char (20) NOT NULL, --PK
    IdUsuario_TAR int NOT NULL, --FK
    bco_TAR varchar (50) NOT NULL,
    cod_TAR char (3) NOT NULL,
    tipo_TAR varchar (7) NOT NULL,

    CONSTRAINT PK_Tarjeta_Clientes PRIMARY KEY (IdUsuario_TAR, Nro_TAR),
    CONSTRAINT FK_Tarjeta_Clientes FOREIGN KEY (IdUsuario_TAR)
        REFERENCES Usuarios (id_USU)
)
GO