using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ent_Producto
    {
        ///CONSTRUCTOR
        ///
        public Ent_Producto()
        {
        }

        public Ent_Producto(int id)
        {
            this.Id = id;
        }

        public Ent_Producto(int id_prod, string nombre)
        {
            this.id = id_prod;
            this.Nombre = nombre;
        }

        ///ATRIBUTOS
        ///
        private int id;
        private string tipo;
        private int stock;
        private string precio;
        private string nombre;
        private int puntoPedido;
        private bool estado;

        ///GETS y SETS
        ///
        public int Id { get => id; set => id = value; }
        public string Tipo { get => tipo; set => tipo = value; }
        public int Stock { get => stock; set => stock = value; }
        public string Precio { get => precio; set => precio = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public int PuntoPedido { get => puntoPedido; set => puntoPedido = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
