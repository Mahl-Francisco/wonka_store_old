 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;
using Entidades;

namespace Tienda_Wonka.User
{
    public partial class Mi_perfil : System.Web.UI.Page
    {
        Negocio_Usuario user = new Negocio_Usuario();
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
            else
            {
                Response.Redirect("~/Inicio/Home.aspx");
            }

            lblNombreus.Text = user.Ent.Nombre;
            lblApellidous.Text = user.Ent.Apellido;
            lblEmail.Text = user.Ent.Mail;

            if (!IsPostBack)
            {
                Negocio_Producto neg = new Negocio_Producto();

                string Id = user.Ent.Id.ToString();

                grdComprados.DataSource = neg.getCompras(Id);

                grdComprados.DataBind();

                if(grdComprados.Rows.Count == 0)
                {
                    lblMensaje.Text = "No ha realizado compras. ";
                }
              
            }

        }
    }
}