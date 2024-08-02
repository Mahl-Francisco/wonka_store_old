using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ent_DetalleVenta
    {
        ///CONSTRUCTOR
        ///
        public Ent_DetalleVenta()
        {
        }

        ///ATRIBUTOS
        ///
        private int NroVenta;
        private Ent_Producto Producto = new Ent_Producto();
        private int cantidad;
        private float precioUnitario;
        private bool estado;

        public int NroVenta1 { get => NroVenta; set => NroVenta = value; }
        public Ent_Producto Producto1 { get => Producto; set => Producto = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
        public float PrecioUnitario { get => precioUnitario; set => precioUnitario = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
