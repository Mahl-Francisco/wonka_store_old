using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Entidades;
using Datos;

namespace Negocio
{
    public class Neg_ProdXPedido
    {
        private Dao_ProdXPedido prodxpedido = new Dao_ProdXPedido();
        private Ent_ProductosXPedido productosxpedidos;

        public Ent_ProductosXPedido Productosxpedidos { get => productosxpedidos; set => productosxpedidos = value; }

        ///Constructores
        public Neg_ProdXPedido()
        {
        }

        public Neg_ProdXPedido(Ent_ProductosXPedido p)
        {
            Productosxpedidos = p;
        }

        ///Métodos

        public int crearPedido()
        {
            return prodxpedido.crearPedido();
        }

        public DataTable cargarDetallePedido(int id)
        {
            string cmd = "SELECT IdProducto_PP, Cantidad_PP FROM Productos_X_Pedido WHERE IdPedido_PP = " + id;

            return prodxpedido.obtenerTabla(cmd);
        }

        public bool guardarPedido()
        {
            return prodxpedido.guardarEnBD(Productosxpedidos);
        }

        public DataTable getTablaPxP()
        {
            DataTable tabla = prodxpedido.obtenerTabla();

            return tabla;
        }

        private void armarParametrosProductosActualizar(ref SqlCommand comando, Ent_ProductosXPedido producto)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@IdPedido_PP", SqlDbType.NVarChar, 20);
            parametro.Value = producto.Id_Pedido;
            parametro = comando.Parameters.Add("@IdProducto_PP", SqlDbType.Int);
            parametro.Value = producto.Id_Producto;
            parametro = comando.Parameters.Add("@Cantidad", SqlDbType.NVarChar, 40);
            parametro.Value = producto.CantidadProductos;
        }

        public bool actualizarProducto(Ent_ProductosXPedido producto)
        {
            //Establecer conección
            /*AccesoDatos coneccion = new AccesoDatos();
            SqlConnection cn = coneccion.conectar();
            //Escribir comando
            SqlCommand cmd = new SqlCommand("UPDATE Productos_X_Pedido SET IdPedido_PP = '" + producto.Id_Pedido + "', IdProducto_PP = '" + producto.Id_Producto + "', Cantidad= '" + producto.CantidadProductos + "' WHERE IdProducto_PP like '" + producto.Id_Producto + "'", cn);

            //Ejecutar comando
            int filasAfectadas = cmd.ExecuteNonQuery();

            //Validar            
            if (filasAfectadas == 1)
            {
                return true;
            }
            else
            {*/
                return false;
            //}
        }

            /* public bool ActualizarDatos(Ent_ProdXPedido productosxpedidos)
             {
                 SqlCommand comando = new SqlCommand();
                 ArmarParametros(ref comando, productosxpedidos);
                 AccesoDatos ad = new AccesoDatos();
                 int FilasInsertadas = ad.EjecutarProcedimientoAlmacenado(comando);
                 if(FilasInsertadas == 1)
                 {
                     return true;
                 }
                 else
                 {
                     return false;
                 }

             }*/

        public bool Eliminarpxp(string IdProducto)
        {
            string comando = "DELETE FROM Productos_X_Pedido WHERE IdProducto_PP = " + IdProducto;
            return prodxpedido.borrarDeBD(comando);
        }
    }
}
