USE Wonka
GO

CREATE TRIGGER tg_FacturaTotal
ON Detalle_Ventas
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @id int
	SET @id = (SELECT IdProd_DV FROM inserted)
	DECLARE @nro int
	SET @nro = (SELECT NroVent_DV FROM inserted)
	DECLARE @precio decimal (8, 2)
	SET @precio = (SELECT Precio_PROD FROM Productos WHERE Id_PROD = @id)

	UPDATE Detalle_Ventas SET Detalle_Ventas.Precio_DV = @precio
	WHERE Detalle_Ventas.NroVent_DV = @nro AND Detalle_Ventas.IdProd_DV = @id
	
	UPDATE Ventas set Monto_VENT = Monto_VENT + (SELECT Cantidad_DV*@precio FROM inserted)
	WHERE Nro_VENT = @nro
END
GO

CREATE TRIGGER tg_ActualizarStock
ON Detalle_Ventas
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Productos set Stock_PROD = Stock_PROD - (SELECT Cantidad_DV FROM inserted)
	WHERE Id_PROD = (SELECT IdProd_DV FROM inserted)
END
GO