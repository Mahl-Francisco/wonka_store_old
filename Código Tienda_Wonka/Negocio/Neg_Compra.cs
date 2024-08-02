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
    class Neg_Compra
    {
        public Neg_Compra()
        { }

        private Ent_DetalleVenta ent_Detalle = new Ent_DetalleVenta();
        private Ent_Venta ent_Venta = new Ent_Venta();
        
    }
}
