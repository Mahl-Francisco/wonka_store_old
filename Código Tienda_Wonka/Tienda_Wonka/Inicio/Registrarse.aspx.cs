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
    public partial class Registrarse : System.Web.UI.Page
    {
        Negocio_Usuario neg = new Negocio_Usuario();

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

        protected void lbtnIniciarSesion_Click(object sender, EventArgs e)
        {
            if (Response.Cookies["user"] != null) { Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1); }
            Application["user"] = null;
        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            if(tbContrasenia.Text.Trim().Length < 8)
            {
                lblMensaje.Text = "La contraseña es demasiado corta. Debe ser de al menos 8 caracteres.";
            }
            else
            {
                //Tomar mail
                Negocio_Usuario neg = new Negocio_Usuario();
                neg.Ent.Mail = tbCorreoElectronico.Text.Trim();
                neg.Ent.Contrasenia = "";

                //Validar si existe
                neg.inicioSesion();

                //Existe
                if (neg.Ent.Id == 0)
                {
                    lblMensaje.Text = "El correo electrónico ingresado ya está registrado en la página.";
                }

                //No existe
                else
                {
                    lblMensaje.Text = "";

                    //Tomar datos
                    neg.Ent.Contrasenia = tbContrasenia.Text.Trim();
                    neg.Ent.Nombre = tbNombre.Text.Trim();
                    neg.Ent.Apellido = tbApellido.Text.Trim();

                    //Registrar
                    bool registrado = neg.registrarUsuario();

                    //Registrado
                    if (registrado)
                    {
                        //Iniciar sesión
                        neg.inicioSesion();

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

                    //No registrado
                    else
                    {
                        lblMensaje.Text = "Lo sentimos, hubo un error al crear su cuenta. Inténtelo de nuevo más tarde.";
                    }
                }
            }
        }

        protected void cbRecordarme_CheckedChanged(object sender, EventArgs e)
        {
            lblRecordarme.Visible = !cbRecordarme.Checked;
        }
    }
}