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
    class Dao_DetalleVenta
    {
        public Dao_DetalleVenta()
        {
        }
        private AccesoDatos dat = new AccesoDatos();

        public bool guardarDetalle(string consulta)
        {
            return dat.consulta_Cmd(consulta, 1);
        }

        public DataTable obtenerTabla(string nombre, string consulta)
        {
            return dat.obtenerTabla(nombre, consulta);
        }

        public SqlDataReader obtenerDataReader(string consulta)
        {
            return dat.obtenerDataReader(consulta);
        }
    }
}
