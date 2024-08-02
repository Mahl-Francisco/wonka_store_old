using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades;
using Datos;

namespace Negocio
{
    public class Negocio_Usuario
    {
        ///CONSTRUCTOR
        ///
        public Negocio_Usuario()
        {
        }

        ///ATRIBUTOS
        ///
        private Ent_Usuario ent = new Ent_Usuario();
        private DAO_Usuario dao = new DAO_Usuario();

        //GETS y SETS
        public Ent_Usuario Ent { get => ent; set => ent = value; }

        ///MÉTODOS
        ///

        public void inicioSesion()
        {
            //Ejecutar consulta
            string consulta = "EXEC sp_IngresoUsuario '" + ent.Mail + "', '" + ent.Contrasenia + "'";
            ent.Id = dao.inicioSesion(consulta);

            //Cargar datos de usuario
            if (ent.Id > 0)
            {
                cargarDatosUsuario();
            }
            else { ent.Estado = false; }
        }

        public bool actualizarUsuario()
        {
            string consulta = "UPDATE Usuarios SET Nombre_USU = '" + ent.Nombre + "', Apellido_USU = '" + ent.Apellido + "', " +
                "Telefono_USU = '" + ent.Telefono + "', Mail_USU = '" + ent.Mail + "', Direccion_USU = '" + ent.Direccion + "', " +
                "Contrasegna_USU = '" + ent.Contrasenia + "' WHERE Id_USU = " + ent.Id;

            return dao.registrarUsuario(consulta);
        }

        public void cargarDatosUsuario()
        {
            //Crear consulta
            string consulta = "SELECT Nombre_USU[nombre], Apellido_USU[apellido], Telefono_USU[telefono], Mail_USU[mail]," +
                "Direccion_USU[direccion], Contrasegna_USU[contrasenia], Administrador_USU[admin], Estado_USU[estado]" +
                "FROM Usuarios WHERE Id_USU like " + ent.Id;

            //Ejecutar consulta
            dao.cargarDatosUsuario(consulta, ref ent);
        }

        public bool registrarUsuario()
        {
            string consulta = "EXEC sp_RegistroUsuario '" + ent.Nombre + "', '" + ent.Apellido + "', '" + ent.Mail + "', '" + ent.Contrasenia + "'";

            return dao.registrarUsuario(consulta);
        }
    }
}
