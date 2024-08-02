using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ent_Pedidos
    {
        ///CONSTRUCTOR
        ///
        public Ent_Pedidos()
        {
        }

        ///ATRIBUTOS
        ///
        private int id;
        private int unidadesTotales;
        private string fechaPedido;
        private string fechaSalida;
        private string fechaEntrega;
        private bool estado;
    }
}
