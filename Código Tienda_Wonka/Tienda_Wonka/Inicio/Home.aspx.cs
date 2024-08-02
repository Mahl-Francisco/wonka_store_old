using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using Negocio;

namespace Tienda_Wonka
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validar sesión iniciada
            Negocio_Usuario user = new Negocio_Usuario();
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

                //Mostrar botones de usuario
                btnPerfil.Visible = true;
                PROVISORIO.Visible = true;

                //Ocultar botones de inicio y registro
                btnRegistrarse.Visible = false;
                btnIniciarSesion.Visible = false;

                //Usuario administrador
                btnCarrito.Visible = !user.Ent.Admin;
                btnAdministrarProds.Visible = user.Ent.Admin;
                btnInformes.Visible = user.Ent.Admin;
            }

            //Cargar ddl_categoria
            if (!IsPostBack)
            {
                cargarDdlCategoria();
                actualizarFiltros();
            }
        }
        //Funciones para Page_Load
        void cargarDdlCategoria()
        {
            Negocio_Producto neg = new Negocio_Producto();
            SqlDataReader dr = neg.cargarDdlTipoProd();

            ListItem li = new ListItem("Todas las categorías", "NULL");
            li.Selected = true;
            ddl_categoria.Items.Add(li);

            if (dr != null)
            {
                while (dr.Read())
                {
                    li = new ListItem();
                    li.Text = dr["Nombre_TP"].ToString();
                    li.Value = " AND [IdTipoP_PROD] LIKE '" + dr["Id_TP"].ToString() + "'";

                    ddl_categoria.Items.Add(li);
                }
            }
        }
        void actualizarFiltros()
        {
            //Consulta original
            string newQuerry = "SELECT [Id_PROD], [ImageLink_PROD], [Nombre_PROD], [IdTipoP_PROD], [Nombre_TP], " +
            "[Stock_PROD], [PuntoPedido_PROD], [Precio_PROD] " +
            "FROM[Productos] INNER JOIN[Tipos_Producto] ON[IdTipoP_PROD] LIKE[Id_TP] " +
            "WHERE (([Estado_PROD] = 1) AND ([Stock_PROD] > [PuntoPedido_PROD]))";

            //Categoría
            if (ddl_categoria.SelectedIndex != 0) { newQuerry += ddl_categoria.SelectedValue; }

            //Nombre
            newQuerry += " AND [Nombre_PROD] LIKE '%" + tbBuscar.Text.Trim() + "%' ";

            //Precio
            newQuerry += ddl_precio.SelectedValue;

            //Actualizar
            SqlDataSource_lvProductos.SelectCommand = newQuerry;
        }
        //Fin Page_Load

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Iniciar_Sesion.aspx");
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrarse.aspx");
        }

        protected void PROVISORIO_Click(object sender, EventArgs e)
        {
            Application["user"] = null;
            if (Request.Cookies["user"] != null)
            {
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            }
            Response.Redirect("Home.aspx");
        }

        protected void btnInformes_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Informe_Productos.aspx");
        }

        protected void btnAdministrarProds_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Administrar_productos.aspx");
        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuario/Mi_perfil.aspx");
        }

        protected void btnCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Compra/Carrito.aspx");
        }

        protected void btn_noFiltros_Click(object sender, EventArgs e)
        {
            ddl_categoria.SelectedIndex = 0;
            ddl_precio.SelectedIndex = 0;
            tbBuscar.Text = "";

            actualizarFiltros();
        }

        protected void ddl_precio_SelectedIndexChanged(object sender, EventArgs e)
        {
            //NOTA: Todos los controles que manipulan los filtros llaman a este evento.
            actualizarFiltros();
        }

        protected void btnComprar_Command(object sender, CommandEventArgs e)
        {
            Negocio_Producto neg = new Negocio_Producto();
            
            if(e.CommandName == "agregarCarrito")
            {
                //Crear session
                if(Session["Tabla_Carrito"] == null) { Session["Tabla_Carrito"] = neg.crearSession(); }

                //Añadir al carrito
                Session["Tabla_Carrito"] = neg.aniadirAlCarrito(e.CommandArgument.ToString(), (DataTable)Session["Tabla_Carrito"]);
            }
        }
    }
}