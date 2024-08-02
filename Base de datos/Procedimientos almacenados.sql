--sp_IngresoUsuario | Útil para iniciar sesión y saber si un usuario existe o no.

USE Wonka
GO

CREATE PROC sp_IngresoUsuario
(
@mail varchar (70),
@contrasenia varchar (15)
)
AS BEGIN

	if exists (SELECT Id_USU FROM Usuarios WHERE Mail_USU like @mail AND Estado_USU = 1)
		begin
		if exists (SELECT Id_USU FROM Usuarios WHERE Mail_USU like @mail AND Contrasegna_USU like @contrasenia)
			SELECT Id_USU AS id FROM Usuarios WHERE Mail_USU like @mail AND Contrasegna_USU like @contrasenia
		else
			SELECT 0 AS id
		end
	else
		SELECT -1 AS id

END
GO

--Prueba
--EXEC sp_IngresoUsuario 'mail@gmail.com', 'contraseña'

-----------------------------------------------------------------------------------------------------------------

--sp_RegistroUsuario | Útil para registrar un usuario.

USE Wonka
GO

CREATE PROC sp_RegistroUsuario
(
@nombre varchar (50),
@apellido varchar (50),
@mail varchar (70),
@contrasenia varchar (15)
)
AS BEGIN

	if exists(SELECT Id_USU FROM Usuarios WHERE Mail_USU like @mail AND Estado_USU = 0)
		UPDATE Usuarios SET Estado_USU = 1 WHERE Mail_USU like @mail

	else
		INSERT INTO Usuarios (Nombre_USU, Apellido_USU, Mail_USU, Contrasegna_USU)
			VALUES (@nombre, @apellido, @mail, @contrasenia)

END
GO

--Prueba
--EXEC sp_RegistroUsuario 'nombre', 'apellido', 'mail@gmail.com', 'contraseña'