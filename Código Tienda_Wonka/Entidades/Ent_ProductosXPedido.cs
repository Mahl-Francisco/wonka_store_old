using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ent_ProductosXPedido
    {
        ///CONSTRUCTOR
        ///
        public Ent_ProductosXPedido()
        {
        }

        public Ent_ProductosXPedido(int id_pedido, int id_producto, int cantidad, Boolean estado)
        {
            this.id_Pedido = id_pedido;
            this.id_Producto = id_producto;
            this.cantidadProductos = cantidad;
            this.estado = estado;
        }

        ///ATRIBUTOS
        ///
        private int id_Pedido;
        private int id_Producto; //Tiene que ser un objeto Ent_Producto
        private int cantidadProductos;
        private Boolean estado;

        ///GETS y SETS
        ///

        public int Id_Pedido { get => id_Pedido; set => id_Pedido = value; }
        public int Id_Producto { get => id_Producto; set => id_Producto = value; }
        public int CantidadProductos { get => cantidadProductos; set => cantidadProductos = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
