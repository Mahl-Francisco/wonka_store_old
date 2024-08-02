using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;

namespace Tienda_Wonka.Admin
{
    public partial class Informe_Productos : System.Web.UI.Page
    {
        //Usuario
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

            if ((user.Ent.Id == -1) || (!user.Ent.Admin))
            {
                Response.Redirect("~/Inicio/Home.aspx");
            }
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            
        }
    }
}