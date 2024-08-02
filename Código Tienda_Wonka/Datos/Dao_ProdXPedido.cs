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
    public class Dao_ProdXPedido
    {
        private AccesoDatos cn = new AccesoDatos();

        public Dao_ProdXPedido()
        {
        }

        //
        public int crearPedido()
        {
            cn.consulta_Cmd("INSERT INTO Pedidos(FechaPedido_PED) VALUES(GETDATE())", 1);

            SqlDataReader dr = cn.obtenerDataReader("SELECT MAX(Id_PED)[id] FROM Pedidos");

            if (dr.Read())
            {
                return Convert.ToInt32(dr["id"].ToString());
            }
            else
            {
                return -1;
            }
        }

        public bool guardarEnBD(Ent_ProductosXPedido productosxpedido)
        {
            string consulta = "INSERT INTO Productos_X_Pedido (IdPedido_PP, IdProducto_PP, Cantidad_PP) " +
                "VALUES(" + productosxpedido.Id_Pedido + " , " + productosxpedido.Id_Producto + ", " + productosxpedido.CantidadProductos + ")";

            return cn.consulta_Cmd(consulta, 1);
        }

        public DataTable obtenerTabla(string consulta = "SELECT IdProducto_PP, Cantidad FROM Productos_X_Pedido")
        {
            DataTable tabla = cn.obtenerTabla("Productos_X_Pedido", consulta);

            return tabla;
        }

        /*public DataTable obtenerTablaPXP(string pxp)
        {
            string consulta = pxp;

            DataTable tabla = cn.obtenerTabla("Productos_X_Pedido", consulta);

            return tabla;
        }*/

        public bool borrarDeBD(string comando)
        {
            return cn.consulta_Cmd(comando, 1);
        }
    }
}
