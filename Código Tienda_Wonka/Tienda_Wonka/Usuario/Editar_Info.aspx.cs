using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;

namespace Tienda_Wonka.User
{
    public partial class Editar_Info : System.Web.UI.Page
    {
        Negocio_Usuario user = new Negocio_Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validators
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            this.Form.Attributes.Add("autocomplete", "off");
            lbl.Text = "";
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
                if (!IsPostBack)
                {
                    tbTel.Text = user.Ent.Telefono;
                    tbDir.Text = user.Ent.Direccion;
                    tbEmail.Text = user.Ent.Mail;
                }
            }
            else
            {
                Response.Redirect("~/Inicio/Home.aspx");
            }
        }
        protected void btnGuardarcambios_Click(object sender, EventArgs e)
        {
            Negocio_Usuario neg = user;

            if (tbTel.Text.Trim().Length == 10 || tbTel.Text.Trim() == "")
            {
                //Tomar dato
                neg.Ent.Telefono = tbTel.Text.Trim();

            }
            else { lbl.Text = "Telefono no valido. Debe contener 10 numeros."; }


            //Tomar dato
            neg.Ent.Direccion = tbDir.Text.Trim();

            if (tbEmail.Text.Trim() != "")
            {
                //Tomar dato
                neg.Ent.Mail = tbEmail.Text.Trim();
            }
            if (tbEmail.Text.Trim() == "" && tbDir.Text.Trim() == "" && tbTel.Text.Trim() == "")
            {
                lbl.Text = "No hay cambios a realizar. Los campos estan vacios.";
            }
            neg.actualizarUsuario();
            bool actualizado = neg.actualizarUsuario();
            if (actualizado == false) { lbl.Text = "Lo sentimos, hubo un error al modificar sus datos. Inténtelo de nuevo más tarde."; }
            else { lbl.Text = "Se guardo correctamente la nueva contraseña."; }
        }
    }
}
  