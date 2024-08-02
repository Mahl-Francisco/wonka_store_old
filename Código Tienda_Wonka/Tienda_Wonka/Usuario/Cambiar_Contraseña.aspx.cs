using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;

namespace Tienda_Wonka.Usuario
{
    public partial class Cambiar_Contraseña : System.Web.UI.Page
    {
        Negocio_Usuario user = new Negocio_Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Validator
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            this.Form.Attributes.Add("autocomplete", "off");

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
        }

        protected void btnGuardarCambioscontraseña_Click(object sender, EventArgs e)
        {
            Negocio_Usuario neg = user;
            ///Verificar que la contraseña original sea la correct
            if (txtbC.Text == neg.Ent.Contrasenia)
            {

                ///Verificar que la contraseña nueva y la repeticion sean iguales
                if (txtbCNC.Text == txtbNC.Text)
                {
                    neg.Ent.Contrasenia = txtbCNC.Text;
                    neg.actualizarUsuario();
                    bool actualizado = neg.actualizarUsuario();
                    if (actualizado == false) { lbl.Text = "Lo sentimos, hubo un error al modificar su contraseña. Inténtelo de nuevo más tarde."; }
                    else { lbl.Text = "Se guardo correctamente la nueva contraseña."; }
                }
                else
                {
                    lbl.Text = "La nueva contraseña y su repeticion no coinciden ";
                }
            }
            else { lbl.Text = "La contraseña actual es incorrecta"; }
        }
    }
}