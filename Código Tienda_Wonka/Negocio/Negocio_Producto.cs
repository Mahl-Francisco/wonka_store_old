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
    public class Negocio_Producto
    {
        ///CONSTRUCTOR
        ///
        public Negocio_Producto()
        {
        }

        public Negocio_Producto(Ent_Producto ent)
        {
            EntProducto = ent;
        }

        ///ATRIBUTOS
        ///
        private Ent_Producto entProducto = new Ent_Producto();
        private DAO_Producto dao = new DAO_Producto();

        //GETS y SETS
        public Ent_Producto EntProducto { get => entProducto; set => entProducto = value; }

        ///MÉTODOS
        ///

        //Métodos públicos
        public bool borrarProducto()
        {
            return dao.borrarProducto(EntProducto);
        }

        public bool actualizarProducto(ref string error)
        {
            if (validarCampos(ref error))
            {
                EntProducto.Precio = puntoDecimal(EntProducto.Precio);
                entProducto.Nombre = entProducto.Nombre.Replace('*', '.');

                //Crear consulta
                string consulta = "UPDATE Productos SET Nombre_PROD = '" + entProducto.Nombre +
                "', IdTipoP_PROD = '" + entProducto.Tipo +
                "', Precio_PROD = " + entProducto.Precio +
                ", PuntoPedido_PROD = " + entProducto.PuntoPedido.ToString() +
                ", Stock_PROD = " + entProducto.Stock.ToString() +
                " WHERE Id_PROD = " + entProducto.Id.ToString();
                //Fin consulta

                bool exito = dao.actualizarProducto(consulta);

                if (!exito) { error += "*No se pudo actualizar el producto porque falló la conección con la base de datos.<br>"; }

                return exito;
            }
            else
            {
                return false;
            }
        }

        public bool guardarProducto(ref string error)
        {
            //Reemplazar * en el nombre
            entProducto.Nombre = entProducto.Nombre.Replace('*', '.');

            //Validar formato precio
            decimal precio = 0;

            if(validarFormatoPrecio(ref error, ref precio))
            {
                if(precio < 0)
                {
                    error += "*El precio no puede ser negativo.<br>";
                    return false;
                }
            }
            else { return false; }

            entProducto.Precio = puntoDecimal(entProducto.Precio);

            //Consulta
            string consulta = "INSERT INTO Productos (IdTipoP_PROD, Stock_PROD, Precio_PROD, Nombre_PROD, PuntoPedido_PROD) " +
                "VALUES ('" + entProducto.Tipo + "', " + entProducto.Stock + ", '" + 
                entProducto.Precio + "', '" + entProducto.Nombre + "'," + entProducto.PuntoPedido + ")";

            //Guardado
            bool guardado = dao.guardarProducto(consulta);
            if (!guardado) { error = "Error al agregar el producto. Intente nuevamente."; }
            return guardado;
        }

        public SqlDataReader cargarDdlTipoProd()
        {
            return dao.obtenerDataReader("SELECT Nombre_TP, Id_TP FROM Tipos_Producto WHERE Estado_TP = 1 ORDER BY Nombre_TP");
        }

        //Métodos privados
        private bool validarFormatoPrecio(ref string error, ref decimal precioN)
        {
            try
            {
                string[] aux = EntProducto.Precio.Split('.');
                aux[1] = "";

                error += errorFormatoPrecio();
                return false;
            }
            catch
            {
                try { precioN = Convert.ToDecimal(EntProducto.Precio); return true; }
                catch { error += errorFormatoPrecio(); return false; }
            }
        }

        private bool validarCampos(ref string error)
        {
            //Validar formato de precio
            decimal precioN = 1;

            bool camposValidos = validarFormatoPrecio(ref error, ref precioN);

            //Validar campos numéricos
            string[] precio = EntProducto.Precio.Split(',');

            if (EntProducto.Stock < 0) { error += "*El stock no puede ser un número negativo.<br>"; camposValidos = false; }
            if (EntProducto.PuntoPedido < 0) { error += "*El punto de pedido no puede ser negativo.<br>"; camposValidos = false; }
            if (precio[0].Length > 6) { error += "*El precio no puede tener más de 6 cifras.<br>"; camposValidos = false; }
            if (precioN == 0) { error += "*El precio no puede ser cero.<br>"; camposValidos = false; }
            if (precioN < 0) { error += "*El precio no puede ser un número negativo.<br>"; camposValidos = false; }

            return camposValidos;
        }

        private string puntoDecimal(string precio)
        {
            string[] aux = precio.Split(',');

            precio = aux[0] + ".";

            try { precio += aux[1]; }
            catch { precio += "00"; }

            return precio;
        }

        private string errorFormatoPrecio()
        {
            return "*En el campo precio solo pude ingresar números y comas. (Ejemplo: 12,45)<br>";
        }

        //////
        public DataTable getCompras(string Id)
        {
            string consulta = Id;
            DataTable tabla = dao.obtenerTablaCompras("SELECT Nombre_PROD [Producto], Cantidad_DV [Cantidad] FROM Productos INNER JOIN detalle_ventas ON idprod_dv = id_prod INNER JOIN Ventas ON Nro_vent = nrovent_dv INNER JOIN Usuarios ON Id_usu = idusuario_vent WHERE Id_usu = " + Id);

            return tabla;
        }

        ///SESSION CARRITO
        ///

        //Métodos públicos
        public DataTable crearSession()
        {
            DataTable tbl = new DataTable();

            DataColumn col = new DataColumn("Id", System.Type.GetType("System.String"));
            tbl.Columns.Add(col);

            col = new DataColumn("Imagen", System.Type.GetType("System.String"));
            tbl.Columns.Add(col);

            col = new DataColumn("Nombre", System.Type.GetType("System.String"));
            tbl.Columns.Add(col);

            col = new DataColumn("Tipo", System.Type.GetType("System.String"));
            tbl.Columns.Add(col);

            col = new DataColumn("Cantidad", System.Type.GetType("System.String"));
            tbl.Columns.Add(col);

            col = new DataColumn("Precio", System.Type.GetType("System.String"));
            tbl.Columns.Add(col);

            return tbl;
        }

        public DataTable aniadirAlCarrito(string guardar, DataTable tBL)
        {
            //Validar añadido
            bool aniadido = validarProductoAniadido(guardar, tBL);

            string[] aux = guardar.Split('*');

            //Agregar al carro
            if (!aniadido)
            {
                tBL = agregarAlCarro(tBL, aux[0], aux[1], aux[2], aux[3], "1", aux[4]);
            }

            return tBL;
        }

        //Métodos privados
        private bool validarProductoAniadido(string aux, DataTable tBL)
        {
        //aux contiene primero el commandArgument y despés el id sacado del data table
            //Tomar id
            string[] id = aux.Split('*');

            //Contar filas
            int fila = tBL.Rows.Count;

            //Recorrer tabla, si una id coincide, está añadido
            for (int i = 0; i < fila; i++)
            {
                aux = tBL.Rows[i]["Id"].ToString();

                if (id[0] == aux)
                {
                    return true;
                }
            }
            
            //No se añadió
            return false;
        }

        private DataTable agregarAlCarro(DataTable tbl, string id, string imagen, string nombre, string tipo, string cantidad, string precio)
        {
            //Declarar columna
            DataRow daro = tbl.NewRow();

            daro["Id"] = id;
            daro["Imagen"] = imagen;
            daro["Nombre"] = nombre;
            daro["Tipo"] = tipo;
            daro["Cantidad"] = cantidad;
            daro["Precio"] = precio;

            //Añadir columna
            tbl.Rows.Add(daro);

            //Devolver
            return tbl;
        }

    }
}
