using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Negocio;
using Entidades;

namespace Tienda_Wonka.Inicio
{
    public partial class Iniciar_Sesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validar sesión iniciada
            if (Application["user"] != null) { Response.Redirect("Home.aspx"); }
            else if (Request.Cookies["user"] != null)
            {
                if (Request.Cookies["user"].Value != "") { Response.Redirect("Home.aspx"); }
            }

            //Validators
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            this.Form.Attributes.Add("autocomplete", "off");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (Response.Cookies["user"] != null) { Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1); }
            Application["user"] = null;

            Response.Redirect("Home.aspx");
        }

        protected void lbtnRegistrarse_Click(object sender, EventArgs e)
        {
            if (Response.Cookies["user"] != null) { Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1); }
            Application["user"] = null;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            //Tomar datos
            Negocio_Usuario neg = new Negocio_Usuario();
            neg.Ent = new Ent_Usuario();

            neg.Ent.Mail = tbCorreoElectronico.Text.Trim();
            neg.Ent.Contrasenia = tbContrasenia.Text.Trim();

            //Ingreso
            neg.inicioSesion();

            //Existe
            if (neg.Ent.Id > 0 && neg.Ent.Estado)
            {
                //Guardar en Aplication
                Application["user"] = neg.Ent.Id;

                //Recordar
                if (cbRecordarme.Checked)
                {
                    Response.Cookies["user"].Value = neg.Ent.Id.ToString();
                    Response.Cookies["user"].Expires = DateTime.Now.AddYears(1);
                }

                //Ingresar
                Response.Redirect("Home.aspx");
            }
            //No existe
            else
            {
                lblMensaje.Text = "Verifique si el correo electrónico y la contraseña son correctos.";
            }
        }

        protected void cbRecordarme_CheckedChanged(object sender, EventArgs e)
        {
            lblRecordarme.Visible = !cbRecordarme.Checked;
        }
    }
}