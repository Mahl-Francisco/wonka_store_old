using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entidades;
using Negocio;

namespace Tienda_Wonka
{
    public partial class Home_Admin : System.Web.UI.Page
    {
        //Usuario
        Negocio_Usuario user = new Negocio_Usuario();

        //Uso general
        Negocio_Producto neg = new Negocio_Producto();

        //Para seleccionar el tipo de producto correcto en el ddl del edit_it
        bool editing = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Validar sesión iniciada
            user.Ent.Id = -1;

            if (Application["user"] != null)
            {
                user.Ent.Id = Convert.ToInt32(Application["user"].ToString());
            }
            else if (Request.Cookies["user"] != null)
            {
                if (Request.Cookies["user"].Value != "")
                {
                    user.Ent.Id = Convert.ToInt32(Request.Cookies["user"].Value);
                }
            }

            //Cargar datos usuario
            if (user.Ent.Id != -1)
            {
                user.cargarDatosUsuario();
            }

            if((user.Ent.Id==-1)||(!user.Ent.Admin))
            {
                Response.Redirect("~/Inicio/Home.aspx");
            }
        }

        protected void btnPedido_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pedidos.aspx");
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Agregar_producto.aspx");
        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Crear entidad Producto
            int idProd = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("it_lblIdProducto")).Text);

            Ent_Producto entProducto = new Ent_Producto(idProd);

            //Llamar a negocio borrar
            neg.EntProducto = entProducto; //Negocio_Producto neg = new Negocio_Producto(entProducto);

            bool borrado = neg.borrarProducto();

            if (borrado)
            {
                lblMensaje.Text = "El producto ha sido eliminado.";
            }
            else
            {
                lblMensaje.Text = "No se pudo borrar el producto.";
            }
        }

        protected void gvProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Guardar el tipo de producto
            string edit_it;

            edit_it = e.NewEditIndex.ToString() + "*";
            edit_it += ((Label)gvProductos.Rows[e.NewEditIndex].FindControl("it_lblIdTipoP")).Text + "*";
            editing = true;

            Response.Cookies["edit_it"].Value = edit_it;
            Response.Cookies["edit_it"].Expires = DateTime.Now.AddHours(1);

            //Condigurar edit index
            gvProductos.EditIndex = e.NewEditIndex;
            gvProductos.DataBind();
        }

        protected void gvProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            editing = false;
            Response.Cookies["edit_it"].Expires = DateTime.Now.AddDays(-1);
            string error = "";

            //Crear entidad Producto
            Ent_Producto entProducto = crearEntidadProducto(gvProductos, e, ref error);

            if (entProducto == null)
            {
                lblMensaje.Text = error;
            }
            else
            {
                //Actualizar producto
                //Negocio_Producto neg = new Negocio_Producto(entProducto);
                neg.EntProducto = entProducto;
                bool actualizado = neg.actualizarProducto(ref error);

                //Informamos
                if (actualizado)
                {
                    lblMensaje.Text = "Se han guardado los cambios.";
                }
                else { lblMensaje.Text = error; }
            }
            
        }

        //Funciones para evento gvProductos_RowUpdating
        public Ent_Producto crearEntidadProducto(GridView gvProductos, GridViewUpdateEventArgs e, ref string error)
        {
            //Declarar
            Ent_Producto entProducto = new Ent_Producto();

            //Tomar valores string
            int id = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("edit_it_lblIdProducto")).Text);
            string nombre = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("edit_it_tbDescripcionProducto")).Text.Trim();
            string precio = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("edit_it_tbPrecioProducto")).Text.Trim();
            string tipo = ((DropDownList)gvProductos.Rows[e.RowIndex].FindControl("edit_it_ddlTipoProducto")).SelectedValue.ToString();
            string auxPuntoPedido = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("edit_it_tbPuntoPedidoProducto")).Text.Trim();
            string auxStock = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("edit_it_tbStockProducto")).Text.Trim();

            //Validar campos vacíos
            if (nombre == "" || precio == "" || auxPuntoPedido == "" || auxStock == "")
            {
                error += "*No puede dejar espacios en blanco.<br>";
                return null;
            }

            //Tomar valores numéricos
            int puntoPedido = 0;
            int stock = 0;
            bool salir = false;

            try { puntoPedido = Convert.ToInt32(auxPuntoPedido); }
            catch { error += "* No puede ingresar valores decimales en punto pedido.<br>"; salir = true; }
            try { stock = Convert.ToInt32(auxStock); }
            catch { error += "*No puede ingresar valores decimales en stock.<br>"; salir = true; }
            if (salir) { return null; }

            //Asignar valores
            entProducto.Id = id;
            entProducto.Nombre = nombre;
            entProducto.Precio = precio;
            entProducto.PuntoPedido = puntoPedido;
            entProducto.Stock = stock;
            entProducto.Tipo = tipo;

            //Devolver
            return entProducto;
        }

        protected void gvProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            lblMensaje.Text = "Cambios cancelados.";
            editing = false;
            Response.Cookies["edit_it"].Expires = DateTime.Now.AddDays(-1);
        }

        protected void gvProductos_DataBound(object sender, EventArgs e)
        {
            if (editing) { seleccionarDdlTipo(); }
        }
        //Función para databound
        void seleccionarDdlTipo()
        {
            //Desarmamos la cookie
            string[] edit_it = Response.Cookies["edit_it"].Value.Split('*');

            int editIndex = Convert.ToInt32(edit_it[0]);

            //Asignamos valores
            ((DropDownList)gvProductos.Rows[editIndex].FindControl("edit_it_ddlTipoProducto")).SelectedValue = edit_it[1];
        }
    }
}