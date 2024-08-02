using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;

using Entidades;

namespace Datos
{
    public class DAO_Usuario
    {
        ///CONSTRUCTOR
        ///
        public DAO_Usuario()
        {
        }

        ///ATRIBUTOS
        ///
        private AccesoDatos datos = new AccesoDatos();

        ///MÉTODOS
        ///
        public int inicioSesion(string consulta)
        {
            //Ejecutar consulta
            SqlDataReader dr = datos.obtenerDataReader(consulta);
            int id = -1;

            //Leer
            if (dr != null)
            {
                if (dr.Read()) { id = Convert.ToInt32(dr["id"].ToString()); }
            }

            //Devolver
            return id;
        }

        public void cargarDatosUsuario(string consulta, ref Ent_Usuario user)
        {
            //Obtener data reader
            SqlDataReader dr = datos.obtenerDataReader(consulta);

            //Cargar datos
            if (dr != null)
            {
                if (dr.Read())
                {
                    user.Nombre = dr["nombre"].ToString();
                    user.Apellido = dr["apellido"].ToString();
                    user.Telefono = dr["telefono"].ToString();
                    user.Mail = dr["mail"].ToString();
                    user.Direccion = dr["direccion"].ToString();
                    user.Contrasenia = dr["contrasenia"].ToString();
                    user.Admin = Convert.ToBoolean(dr["admin"]);
                    user.Estado = Convert.ToBoolean(dr["estado"]);
                }
            }
        }

        public bool registrarUsuario(string consulta)
        {
            return datos.consulta_Cmd(consulta, 1);
        }
    }
}
