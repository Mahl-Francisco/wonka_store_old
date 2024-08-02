using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

using Entidades;

namespace Datos
{
    public class DAO_Producto
    {
        ///CONSTRUCTOR
        ///
        public DAO_Producto()
        {
        }

        ///ATRIBUTOS
        ///
        private AccesoDatos datos = new AccesoDatos();

        ///MÉTODOS
        ///
        public bool borrarProducto(Ent_Producto entProducto)
        {
            //Crear consulta
            string consulta = "UPDATE Productos SET Estado_PROD = 0 WHERE Id_PROD = " + entProducto.Id.ToString();

            //Borrar
            return datos.consulta_Cmd(consulta, 1);
        }

        public bool actualizarProducto(string consulta)
        {
            return datos.consulta_Cmd(consulta, 1);
        }

        public bool guardarProducto(string consulta)
        {
            return datos.consulta_Cmd(consulta, 1);
        }

        public DataTable obtenerTabla(string nombreTabla, string consulta)
        {
            return datos.obtenerTabla(nombreTabla, consulta);
        }

        public SqlDataReader obtenerDataReader(string consulta)
        {
            return datos.obtenerDataReader(consulta);
        }

        public DataTable obtenerTablaCompras(string id)
        {
            string consulta = id;

            DataTable tabla = datos.obtenerTabla("Productos", consulta);

            return tabla;
        }
    }
}
