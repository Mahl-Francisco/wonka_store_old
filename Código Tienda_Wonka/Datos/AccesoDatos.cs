using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class AccesoDatos
    {
        ///CONSTRUCTOR
        ///
        public AccesoDatos()
        {
        }

        ///ATRIBUTOS
        ///
        private string ruta = "Data Source=localhost\\sqlexpress;Initial Catalog=Wonka;Integrated Security=True";

        ///MÉTODOS
        ///

        //Métodos privados
        private SqlConnection conectar()
        {
            SqlConnection cn = new SqlConnection(ruta);
            try
            {
                cn.Open();
                return cn;
            }
            catch
            {
                return null;
            }
        }

        private SqlDataAdapter obtenerAdaptador(string consulta, SqlConnection cn)
        {
            SqlDataAdapter adap;

            try
            {
                adap = new SqlDataAdapter(consulta, cn);
                return adap;
            }
            catch
            {
                return null;
            }
        }

        private int ejecutarCmd(string consulta, SqlConnection cn)
        {
            SqlCommand cmd = new SqlCommand(consulta, cn);
            try { return cmd.ExecuteNonQuery(); }
            catch { return -1; }
        }

        private DataSet obtenerDataSet(string nombreTabla, string consulta)
        {
            SqlConnection cn = conectar();
            SqlDataAdapter adap = obtenerAdaptador(consulta, cn);
            DataSet ds = new DataSet();

            try
            {
                adap.Fill(ds, nombreTabla);
                cn.Close();
                return ds;
            }
            catch
            {
                return null;
            }
        }

        //Métodos públicos

        public SqlDataReader obtenerDataReader(string consulta)
        {
            SqlConnection cn = conectar();
            SqlCommand cmd = new SqlCommand(consulta, cn);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                return dr;
            }
            catch
            {
                return null;
            }
        }

        public bool consulta_Cmd(string consulta, int filasObjetivo)
        {
            SqlConnection cn = conectar();
            int filasAfectadas = ejecutarCmd(consulta, cn);

            cn.Close();

            return (filasObjetivo == filasAfectadas);
        }

        public DataTable obtenerTabla(string nombreTabla, string consulta)
        {
            DataSet ds = obtenerDataSet(nombreTabla, consulta);

            try
            {
                if (ds == null) { return null; }
                else { return ds.Tables[nombreTabla]; }
            }
            catch
            {
                return null;
            }
        }
    }
}
