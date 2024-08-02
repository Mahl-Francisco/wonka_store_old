using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ent_Venta
    {
        ///CONSTRUCTOR
        ///
        public Ent_Venta()
        {
        }

        ///ATRIBUTOS
        ///
        private int NroVenta;
        private Ent_Usuario Usuario=new Ent_Usuario();
        private float montoTotal;
        private string fecha;
        private bool estado;

        public int NroVenta1 { get => NroVenta; set => NroVenta = value; }
        public Ent_Usuario Usuario1 { get => Usuario; set => Usuario = value; }
        public float MontoTotal { get => montoTotal; set => montoTotal = value; }
        public string Fecha { get => fecha; set => fecha = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
