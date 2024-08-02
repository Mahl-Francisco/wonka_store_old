using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;

namespace Tienda_Wonka.Compra
{
    public partial class Carrito : System.Web.UI.Page
    {
        Negocio_Usuario user = new Negocio_Usuario();
        string error = "No se ha seleccionado ningún producto";
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

            //Rebotar
            if ((user.Ent.Id == -1) || (user.Ent.Admin))
            {
                Response.Redirect("~/Inicio/Home.aspx");
            }

            //Cargar tabla
            if(Session["Tabla_Carrito"] == null)
            {
                lb_msj.Text = error;
                gvCompras.Visible = false;
            }
            else 
            {
                lb_msj.Text = "";
                gvCompras.Visible = true;

                gvCompras.DataSource = (DataTable)Session["Tabla_Carrito"];
                gvCompras.DataBind();
            }
        }

        protected void btnVaciar_Click(object sender, EventArgs e)
        {
            Session["Tabla_Carrito"] = null;
            gvCompras.DataBind();
        }

        protected void gvCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCompras.PageIndex = e.NewPageIndex;
            gvCompras.DataBind();
        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuario/Mi_perfil.aspx");
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            if(Session["Tabla_Carrito"] != null)
            {
                Response.Redirect("~/Compra/Medio_Pago.aspx");
            }
            else
            {
                lb_msj.Text = error;
            }
        }
    }
}