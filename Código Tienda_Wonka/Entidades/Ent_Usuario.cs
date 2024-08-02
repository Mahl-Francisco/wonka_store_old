using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ent_Usuario
    {
        ///CONSTRUCTOR
        ///
        public Ent_Usuario()
        {
        }

        public Ent_Usuario(int Id)
        {
            this.id = Id;
        }

        ///ATRIBUTOS
        ///
        private int id;
        private string nombre;
        private string apellido;
        private string telefono;
        private string mail;
        private string direccion;
        private string contrasenia;
        private bool admin;
        private bool estado;

        //Gets y sets
        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Mail { get => mail; set => mail = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Contrasenia { get => contrasenia; set => contrasenia = value; }
        public bool Admin { get => admin; set => admin = value; }
        public bool Estado { get => estado; set => estado = value; }
    }
}
