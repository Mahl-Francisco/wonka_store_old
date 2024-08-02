using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

using Negocio;
using Entidades;

namespace Tienda_Wonka.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //Usuario
        Negocio_Usuario user = new Negocio_Usuario();

        //Uso general
        Negocio_Producto neg = new Negocio_Producto();

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

            //Validators
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            this.Form.Attributes.Add("autocomplete", "off");

            //Carga
            if (!IsPostBack)
            {
                SqlDataReader dr = neg.cargarDdlTipoProd();

                if (dr == null)
                {
                    lblFalloDdl.Visible = true;
                }
                else
                {
                    lblFalloDdl.Visible = false;
                    while (dr.Read())
                    {
                        ListItem li = new ListItem();
                        li.Text = dr["Nombre_TP"].ToString();
                        li.Value = dr["Id_TP"].ToString();

                        ddlTipoProd.Items.Add(li);
                    }
                }
            }
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administrar_productos.aspx");
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            Ent_Producto ent_Producto = new Ent_Producto();

            ent_Producto.Nombre = tbNombreProd.Text.Trim();
            ent_Producto.Precio = tbPrecioUnitario.Text.Trim();
            ent_Producto.Stock = Convert.ToInt32(tbStockInicial.Text.Trim());
            ent_Producto.PuntoPedido = Convert.ToInt32(tbPuntoPedido.Text.Trim());
            ent_Producto.Tipo = ddlTipoProd.SelectedValue;

            neg.EntProducto = ent_Producto;

            string error = "";
            bool guardado = neg.guardarProducto(ref error);

            if (guardado)
            {
                lblMensaje.Text = "El producto se ha registrado exitosamente.";

                //Limpiar campos
                tbNombreProd.Text = tbPrecioUnitario.Text = tbStockInicial.Text = tbPuntoPedido.Text = "";
                ddlTipoProd.SelectedIndex = 0;
            }
            else {lblMensaje.Text = error; }
        }

        protected void cusval_tbStockInicial_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value[0] >= 0);
        }

        protected void cusval_tbPuntoPedido_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (args.Value[0] >= 0);
        }
    }
}