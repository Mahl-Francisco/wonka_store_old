using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using Entidades;
using Negocio;

namespace Pedidos
{
    public partial class Pedidos : System.Web.UI.Page
    {
        //Usuario
        Negocio_Usuario user = new Negocio_Usuario();
        //Fin usuario

        Neg_ProdXPedido neg = new Neg_ProdXPedido();

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
            //Fin validar sesión iniciada

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            this.Form.Attributes.Add("autocomplete", "off");

            if (IsPostBack == false) { lblIdPedido.Text = neg.crearPedido().ToString(); }
            else
            {
                grdPxP.DataSource = neg.cargarDetallePedido(Convert.ToInt32(lblIdPedido.Text));
                DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            
                Ent_ProductosXPedido productosxpedido = new Ent_ProductosXPedido();

            productosxpedido.Id_Pedido = Convert.ToInt32(lblIdPedido.Text);
                productosxpedido.Id_Producto = Convert.ToInt32(ddlProducto.SelectedValue);
                productosxpedido.CantidadProductos = Convert.ToInt32(txtCantidad.Text);

            //Neg_ProdXPedido neg = new Neg_ProdXPedido(productosxpedido);
            neg.Productosxpedidos = productosxpedido;


                bool guardado = neg.guardarPedido();

                if (guardado)
                {
                    lblMensaje.Text = "Agregado exitosamente. ";

                    ddlProducto.SelectedIndex = 1;
                    txtCantidad.Text = "";
                }
                else
                {
                    lblMensaje.Text = "No se pudo agregar al pedido. ";
                }
        }

        protected void grdPxP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String IdProd = ((Label)grdPxP.Rows[e.RowIndex].FindControl("lblIdProd")).Text;

            //Neg_ProdXPedido nxp = new Neg_ProdXPedido();

            neg.Eliminarpxp(IdProd);
        }

        /// ////////////////////

        protected void grdPxP_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdPxP.EditIndex = e.NewEditIndex;
        }

        protected void grdPxP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdPxP.EditIndex = -1;

        }

        protected void grdPxP_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String IdProd = ((Label)grdPxP.Rows[e.RowIndex].FindControl("lblEIdProd")).Text;
            String Cantidad = ((TextBox)grdPxP.Rows[e.RowIndex].FindControl("txtECant")).Text;

            if (Cantidad != "")
            {
                Ent_ProductosXPedido prodxped = new Ent_ProductosXPedido();

                prodxped.Id_Pedido = 1;
                prodxped.Id_Producto = Convert.ToInt32(IdProd);
                prodxped.CantidadProductos = Convert.ToInt32(Cantidad);


                Neg_ProdXPedido neg = new Neg_ProdXPedido(prodxped);

                neg.actualizarProducto(prodxped);

                grdPxP.EditIndex = -1;
            }
            else
            {
                lblMensaje2.Text = "No puede dejar campos vacios. ";
                grdPxP.EditIndex = -1;
            }

        }

        protected void btnBorrarTodo_Click(object sender, EventArgs e)
        {
            grdPxP.DataSource = null;
        }
    }
}