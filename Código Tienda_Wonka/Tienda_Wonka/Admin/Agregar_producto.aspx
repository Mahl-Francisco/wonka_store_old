<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agregar_producto.aspx.cs" Inherits="Tienda_Wonka.Admin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link href="http://fonts.cdnfonts.com/css/willywonka" rel="stylesheet"/>
<link rel="stylesheet" href="Wonka1.css"/>
    <title>Tienda Willy Wonka</title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-styleA{
            font-style: italic;
            font-weight: bold;
            font-size: large;
            color: #FFFFF0;
        }
        .auto-styleB{
            font-weight: bold;
            font-size: medium;
            color: #FFFFF0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <header>
        <div class="HDiv">
            <div class="HleftDiv">
                <a href="../Inicio/Home.aspx">
                    <img src="../Imagenes/LogoWonka.png" onmouseover="this.src='../Imagenes/LogoHome.png'" onmouseout="this.src='../Imagenes/LogoWonka.png'" border="0" alt="" />
                </a>
            </div>
            <div class="HrightDiv">
                <h1>Willy Wonka&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
            </div>
        </div>
    </header>
        <!-- Submenú -->
        <div style="height:500px;width:15%;float:left">
            <asp:Button ID="btnPerfil" runat="server" Height="43px" Text="Mi perfil" Width="131px" />
            <br />
            <br />
            <asp:Button ID="btnCarrito" runat="server" Height="43px" Text="Carrito de compras" Width="131px" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnAdmin" runat="server" Height="43px" Text="Administrar productos" Width="131px" OnClick="btnAdmin_Click" />
        </div>

        <!-- Cuerpo -->
        <div style="height:500px;width:80%;float:right">
            <h2>Agregar producto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
            <br />
            <a class="auto-styleA">Tipo de producto:&nbsp;&nbsp;&nbsp;</a>
            <asp:DropDownList ID="ddlTipoProd" runat="server" ValidationGroup="grupo_btnAgregarProducto">
                <asp:ListItem Selected="True" Value="NULL">-- Seleccione una categoría --</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:Label class="auto-styleB" ID="lblFalloDdl" runat="server" Visible="False">Hubo un error al cargar las categorías.</asp:Label>
            <asp:RequiredFieldValidator ID="rfv_ddlTipoProd" runat="server" ControlToValidate="ddlTipoProd" ErrorMessage="Seleccione una categoría." InitialValue="NULL" ValidationGroup="grupo_btnAgregarProducto">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <a class="auto-styleA">Nombre producto:&nbsp;&nbsp;&nbsp;</a>
            <asp:TextBox ID="tbNombreProd" runat="server" MaxLength="30" ValidationGroup="grupo_btnAgregarProducto"></asp:TextBox>
            <asp:RequiredFieldValidator class="auto-styleB" ID="rfv_tbNombreProd" runat="server" ControlToValidate="tbNombreProd" ErrorMessage="Ingrese un nombre para el producto." ValidationGroup="grupo_btnAgregarProducto">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <a class="auto-styleA">Precio unitario:&nbsp;&nbsp;&nbsp;</a>
            <asp:TextBox ID="tbPrecioUnitario" runat="server" TextMode="Number" Height="20px" MaxLength="9" ValidationGroup="grupo_btnAgregarProducto"></asp:TextBox>
            <asp:RequiredFieldValidator class="auto-styleB" ID="rfv_tbPrecioUnitario" runat="server" ControlToValidate="tbPrecioUnitario" ErrorMessage="Ingrese el precio del producto." ValidationGroup="grupo_btnAgregarProducto">*</asp:RequiredFieldValidator>
            <asp:CompareValidator class="auto-styleB" ID="cv_Precio" runat="server" ControlToValidate="tbPrecioUnitario" ErrorMessage="El precio no puede ser cero ni negativo" Operator="GreaterThan" Type="Integer" ValidationGroup="grupo_btnAgregarProducto" ValueToCompare="0">*</asp:CompareValidator>
            <br />
            <br />
            <a class="auto-styleA">Stock inicial:&nbsp;&nbsp;&nbsp;</a>
            <asp:TextBox ID="tbStockInicial" runat="server" TextMode="Number" MaxLength="5" ValidationGroup="grupo_btnAgregarProducto"></asp:TextBox>
            <asp:RequiredFieldValidator class="auto-styleB" ID="rfv_tbStockInicial" runat="server" ControlToValidate="tbStockInicial" ErrorMessage="Ingrese el stock inicial." ValidationGroup="grupo_btnAgregarProducto">*</asp:RequiredFieldValidator>
            <asp:CompareValidator class="auto-styleB" ID="cv_tbStockInicial" runat="server" ControlToValidate="tbStockInicial" ErrorMessage="El stock inicial no puede ser negativo" Operator="GreaterThanEqual" Type="Integer" ValidationGroup="grupo_btnAgregarProducto" ValueToCompare="0">*</asp:CompareValidator>
            <asp:CompareValidator class="auto-styleB" ID="cv_tbStockInicial0" runat="server" ControlToValidate="tbStockInicial" ErrorMessage="El stock inicial no puede ser menor que el punto de pedido." Operator="GreaterThan" Type="Integer" ValidationGroup="grupo_btnAgregarProducto" ControlToCompare="tbPuntoPedido">*</asp:CompareValidator>
            <br />
            <br />
            <a class="auto-styleA">Punto de pedido:&nbsp;&nbsp;&nbsp;</a> <asp:TextBox ID="tbPuntoPedido" runat="server" TextMode="Number" MaxLength="3" ValidationGroup="grupo_btnAgregarProducto"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv_tbPuntoPedido" runat="server" ControlToValidate="tbPuntoPedido" ErrorMessage="Ingrese el punto de pedido." ValidationGroup="grupo_btnAgregarProducto">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cv_tbPuntoPedido" runat="server" ControlToValidate="tbPuntoPedido" Operator="GreaterThanEqual" Type="Integer" ValidationGroup="grupo_btnAgregarProducto" ValueToCompare="0">*</asp:CompareValidator>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="ImgBtnProd" runat="server" Height="32px" Width="37px" />
            <br />
            <br />
            <asp:Button ID="btnAgregarProducto" runat="server" Height="37px" Text="Agregar producto" Width="181px" OnClick="btnAgregarProducto_Click" ValidationGroup="grupo_btnAgregarProducto" />
            <br />
            <asp:Label class="auto-styleA" ID="lblMensaje" runat="server"></asp:Label>
            <br />
            <asp:ValidationSummary class="auto-styleB" ID="vs_grupo_btnAgregarProducto" runat="server" ValidationGroup="grupo_btnAgregarProducto" />
        </div>
    </form>
    <footer>
    <div class="FDiv3">
        &nbsp;</div>
</footer>
</body>
</html>
