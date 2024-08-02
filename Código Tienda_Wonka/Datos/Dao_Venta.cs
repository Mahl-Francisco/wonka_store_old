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
    class Dao_Venta
    {
        public Dao_Venta()
        { }

        private AccesoDatos dat = new AccesoDatos();

        public bool borrarVenta(Ent_Venta entVent)
        {
            string consulta = "UPDATE Ventas SET Estado_VENT = 0 WHERE Nro_VENT = " + entVent.NroVenta1.ToString();

            return dat.consulta_Cmd(consulta, 1);
        }

        public bool actualizarVenta(string consulta)
        {
            return dat.consulta_Cmd(consulta, 1);
        }

        public bool guardarVenta(string consulta)
        {
            return dat.consulta_Cmd(consulta, 1);
        }

        public DataTable obtenerTabla(string nombre, string consulta)
        {
            return dat.obtenerTabla(nombre, consulta);
        }

        public SqlDataReader sqlDataReader(string consulta)
        {
            return dat.obtenerDataReader(consulta);
        }
    }
}
