using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;

namespace Tienda_Wonka.User
{
    public partial class Configuracion : System.Web.UI.Page
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


            if (!IsPostBack)
            {
                lblNombreusmostrar.Text = user.Ent.Nombre;
                lblApellidoC.Text = user.Ent.Apellido;
                lblTelefonoC.Text = user.Ent.Telefono;
                lblDireccionC.Text = user.Ent.Direccion;
                lblCorreoC.Text = user.Ent.Mail;
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Application["user"] = null;
            if (Request.Cookies["user"] != null)
            {
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            }
            Response.Redirect("~/Inicio/Home.aspx");
        }
    }
}