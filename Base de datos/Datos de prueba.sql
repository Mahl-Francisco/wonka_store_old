/*Reiniciar identities

DBCC CHECKIDENT ('Productos', RESEED, 0);
DBCC CHECKIDENT ('Usuarios', RESEED, 0);
DBCC CHECKIDENT ('Ventas', RESEED, 0);
DBCC CHECKIDENT ('Pedidos', RESEED, 0);

Borrar datos

DELETE FROM Productos_X_Pedido
DELETE FROM Pedidos
DELETE FROM Detalle_Ventas
DELETE FROM Productos
DELETE FROM Tipos_Producto
DELETE FROM Ventas
DELETE FROM Usuarios
DELETE FROM Tarjeta_Clientes
*/

USE Wonka
GO

---------------------------------------------Tipos Producto---------------------------------------------

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T001', 'Chocolate en barra')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T002', 'Especial de la casa')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T003', 'Edición limitada')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T004', 'Helado')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T005', 'Yogurt')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T006', 'Alfajor')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T007', 'Chicle')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T008', 'Caramelo')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T009', 'Algodón de azúcar')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T010', 'Veggie')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T011', 'De dieta')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T012', 'Libre de gluten')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T013', 'Bajo en azúcar')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T014', 'Snack')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T015', 'Maíz')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T016', 'Gaseosa')

INSERT INTO Tipos_Producto (Id_TP, Nombre_TP)
	VALUES ('T017', 'Jugo')

---------------------------------------------Productos---------------------------------------------

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T001', 'Wonka Bar', 20, 45000, 5000, '~\Imagenes\Productos\1.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T001', 'Wonka Bar Blanca', 20, 45000, 5000, '~\Imagenes\Productos\2.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T013', 'Wonka Bar sin Azúcar', 25, 15000, 1500, '~\Imagenes\Productos\3.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T009', 'Algodón de Azúcar Rosa', 40, 10000, 1500, '~\Imagenes\Productos\4.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T009', 'Algodón de Azúcar Blanco', 40, 10000, 1000, '~\Imagenes\Productos\5.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T002', 'Algodón de Azúcar Wonka', 70, 15000, 3500, '~\Imagenes\Productos\6.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T007', 'Infinite Wonka', 15, 8500, 3500, '~\Imagenes\Productos\7.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T010', 'Wonka Bar GREEN', 30, 12500, 500, '~\Imagenes\Productos\8.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T002', 'Wonka Bar SUPREMA', 55, 15700, 500, '~\Imagenes\Productos\9.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T017', 'Juguito de uva', 10, 25000, 2500, '~\Imagenes\Productos\10.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T008', 'Caja de caramelos', 18.75, 7500, 1250, '~\Imagenes\Productos\11.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T004', 'Barra Wonka FREEZE', 30, 7000, 1500, '~\Imagenes\Productos\12.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T006', 'Alfa-Wonka', 25, 25000, 1500, '~\Imagenes\Productos\13.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T006', 'Alfa-Wonka Triple', 35, 35000, 4000, '~\Imagenes\Productos\14.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T011', 'Choco-Wonkas Light', 20, 5000, 350, '~\Imagenes\Productos\15.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T014', 'Choco-Wonkas', 15, 7500, 350, '~\Imagenes\Productos\16.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T005', 'Wonkanino de frutilla', 30, 3000, 200, '~\Imagenes\Productos\17.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T003', 'Wonka Bar PRIDE', 60, 50000, 0, '~\Imagenes\Productos\18.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T007', 'Wonka-Loo', 15, 22000, 1350, '~\Imagenes\Productos\19.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T014', 'Wonkitos Flamin Hot', 35, 5000, 200, '~\Imagenes\Productos\20.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T010', 'Helado Wonka GREEN', 40, 3500, 100, '~\Imagenes\Productos\21.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T005', 'Yogurt de vainilla', 30, 3000, 200, '~\Imagenes\Productos\22.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T003', 'Wonka Bar HALLOWEEN', 50, 40000, 0, '~\Imagenes\Productos\23.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T008', 'Paleta Wonka', 15, 7000, 1000, '~\Imagenes\Productos\24.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T015', 'Pochoclos Wonka salados', 50, 3500, 300, '~\Imagenes\Productos\25.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T015', 'Pochoclos Wonka dulces', 50, 3500, 300, '~\Imagenes\Productos\26.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T012', 'Wonka Bar Libre de gluten', 20, 10000, 1500, '~\Imagenes\Productos\27.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T004', 'Bombón Helado Wonka', 45, 7500, 2000, '~\Imagenes\Productos\28.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T012', 'Alfa-Wonka Libre de gluten', 25, 3000, 200, '~\Imagenes\Productos\29.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T016', 'Wonka-Cola', 15.50, 16000, 3750, '~\Imagenes\Productos\30.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T016', 'Wonka-Up', 15.50, 14500, 3750, '~\Imagenes\Productos\31.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T011', 'Alfa-Wonka sin grasas', 30, 3000, 100, '~\Imagenes\Productos\32.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T011', 'Alfa-Wonka sin grasas Triple', 40, 3000, 100, '~\Imagenes\Productos\33.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T013', 'Wonka Bar Helada sin Azúcar', 40, 2500, 100, '~\Imagenes\Productos\34.jpg')

INSERT INTO Productos (IdTipoP_PROD, Nombre_PROD, Precio_PROD, Stock_PROD, PuntoPedido_PROD, ImageLink_PROD)
	VALUES ('T017', 'Jugo de mandarina', 17.25, 6800, 2500, '~\Imagenes\Productos\35.jpg')

---------------------------------------------Usuarios---------------------------------------------

INSERT INTO Usuarios (Nombre_USU, Apellido_USU ,Telefono_USU, Direccion_USU, Mail_USU, Contrasegna_USU, Administrador_USU)
	VALUES ('Administrador', 'Admin', '1134732210', 'Calle del admin 001', 'administrador@gmail.com', 'administrador', 1)

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Direccion_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Francisco', 'Mahl', 'Chacabuco 848', 'franciscomahl@gmail.com', 'franciscomahl')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Direccion_USU, Contrasegna_USU)
	VALUES ('Lucila', 'Hueras', 'lucilahuertas@gmail.com', 'Calle Principal 33', 'lucilahuertas')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Matias', 'Tremo', 'matiastremo@gmail.com', 'matiastremo')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Sofia', 'Nose', 'sofianose@gmail.com', 'sofianose')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Jack', 'Menendez', 'jackmenendez@gmail.com', 'jackmenendez')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Michel', 'Nostradamus', 'michelnostradamus@gmail.com', 'nostradamus')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Lu', 'Bu', 'lubu@gmail.com', 'lubulubu')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Grigori', 'Rasputin', 'grigorirasputin@gmail.com', 'grigorirasputin')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Benja', 'Calero', 'benjacalero@gmail.com', 'benjacalero')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Adam', 'Godson', 'adamgodson@gmail.com', 'adamgodson')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Nikola', 'Tesla', 'nikolatesla@gmail.com', 'nikolatesla')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Elon', 'Musk', 'elonmusk@gmail.com', 'elonmusk')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Rey', 'Leonidas', 'reyleonidas@gmail.com', 'reyleonidas')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Doom', 'Slayer', 'doomslayer@gmail.com', 'doomslayer')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Saitama', 'Sama', 'saitamasama@gmail.com', 'saitamasama')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Albert', 'Einstein', 'alberteinstein@gmail.com', 'alberteinstein')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Yujiro', 'Hanma', 'yujirohanma@gmail.com', 'yujirohanma')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Baki', 'Hanma', 'bakihanma@gmail.com', 'bakihanma')

INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
	VALUES ('Jack', 'Hanma', 'jackhanma@gmail.com', 'jackhanma')

---------------------------------------------Ventas---------------------------------------------

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (2)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (3)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (4)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (5)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (6)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (7)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (8)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (9)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (10)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (11)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (12)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (13)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (14)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (15)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (16)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (17)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (18)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (19)

INSERT INTO Ventas (IdUsuario_VENT)
	VALUES (20)

---------------------------------------------Detalle Ventas---------------------------------------------

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (1, 1)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (1, 2)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (2, 1)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (3, 1)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (4, 1)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (5, 25)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (6, 17)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (7, 1)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (8, 8)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (9, 17)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (10, 24)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (11, 14)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (12, 17)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (13, 18)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (14, 14)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (14, 9)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (14, 1)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (15, 3)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (16, 5)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (17, 7)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (17, 8)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (18, 6)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (19, 4)

INSERT INTO Detalle_Ventas (NroVent_DV, IdProd_DV)
	VALUES (19, 2)

---------------------------------------------Pedidos---------------------------------------------

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (20000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (25000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (40000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (13000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (25000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (25000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (100000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (22000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (23000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (35000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (52000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (46000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (25000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (20000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (150000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (15000)

INSERT INTO Pedidos (UnidadesTotales_PED)
	VALUES (45300)

---------------------------------------------Productos X Pedido---------------------------------------------

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (1, 1, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (1, 2, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (2, 17, 25000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (3, 1, 20000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (3, 2, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (3, 5, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (4, 5, 13000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (5, 24, 25000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (6, 21, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (6, 8, 15000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (7, 18, 100000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (8, 26, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (8, 25, 12000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (9, 13, 23000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (10, 7, 35000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (11, 23, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (11, 11, 33000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (11, 1, 19000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (12, 1, 20000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (12, 2, 19000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (12, 16, 4000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (13, 13, 25000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (14, 26, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (14, 15, 10000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (15, 1, 50000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (15, 2, 50000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (15, 3, 50000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (16, 3, 15000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (17, 1, 30000)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (17, 6, 12300)

INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP)
	VALUES (17, 4, 3000)

---------------------------------------------Tarjeta Clientes---------------------------------------------

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1111111111',15 , 'Banco Inferno', '111', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('2222222222',15 , 'Banco Marte', '222', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('3333333333', 2, 'Mastercard', '333', 'Dedito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('4444444444', 3, 'Banco Lucia', '444', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('5555555555', 4, 'Stanley Express', '555', 'Dedito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('6666666666', 5, 'Banco UTN', '666', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('7777777777', 6, 'Banco UTN', '777', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('8888888888', 7, 'Banco Nación', '888', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('9999999999', 8, 'Banco UTN', '999', 'Dedito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1010101010', 9, 'Banco UTN', '101', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1101101101', 10, 'Banco UTN', '110', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1212121212', 11, 'Banco UTN', '121', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1313131313', 12, 'Banco UTN', '133', 'Dedito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1414141414', 13, 'Banco UTN', '141', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1515151515', 14, 'Banco UTN', '151', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1616161616', 16, 'Banco UTN', '161', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1717171717', 17, 'Banco UTN', '171', 'Dedito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1818181818', 18, 'Banco UTN', '181', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('1919191919', 19, 'Banco UTN', '191', 'Credito')

INSERT INTO Tarjeta_Clientes (Nro_TAR, IdUsuario_TAR, bco_TAR, cod_TAR, tipo_TAR)
	VALUES ('2020202020', 20, 'Banco UTN', '202', 'Dedito')