using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;

namespace Tienda_Wonka.Compra
{
    public partial class Medio_Pago : System.Web.UI.Page
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
                usuario.Text = user.Ent.Id.ToString();
            }
            
            if ((user.Ent.Id == -1) || (user.Ent.Admin))
            {
                Response.Redirect("~/Inicio/Home.aspx");
            }
        }

        protected void btnCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Compra/Carrito.aspx");
        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuario/Mi_perfil.aspx");
        }
    }
}