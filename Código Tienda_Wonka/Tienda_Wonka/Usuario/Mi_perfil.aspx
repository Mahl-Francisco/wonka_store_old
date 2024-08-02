<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mi_perfil.aspx.cs" Inherits="Tienda_Wonka.User.Mi_perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
 <link href="http://fonts.cdnfonts.com/css/willywonka" rel="stylesheet"/>
 <link rel="stylesheet" href="Wonka2.css"/>
    <title>Tienda Willy Wonka</title>
    <style type="text/css">
        .auto-styleA {
            font-style: italic;
            font-weight: bold;
            font-size: large;
            color: #FFFFF0;
        }
        .auto-style2 {
            font-weight: bold;
            font-size: medium;
            color: #FFFFF0;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style24 {
            width: 513px;
            height: 23px;
        }
        .auto-style23 {
            width: 269px;
            height: 23px;
        }
        .auto-style19 {
            width: 184px;
            height: 23px;
        }
        .auto-style13 {
            width: 74px;
            height: 23px;
        }
        .auto-style8 {
            width: 137px;
            height: 23px;
        }
        .auto-style25 {
            width: 379px;
            height: 23px;
        }
        .auto-style26 {
            margin-left: 540px;
        }
        </style>
</head>
<body>
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
    <form id="form1" runat="server">
        <div style="font-size: large; font-weight: bold; font-style: italic; color: #FFFFFF">
           <h2>Mi perfil</h2>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;<br />
            &nbsp; Bienvenido/a
            <asp:Label class="auto-styleA" ID="lblNombreus" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" Text="*Nombreusuario"></asp:Label>
            &nbsp;<asp:Label class="auto-styleA" ID="lblApellidous" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large" Text="*ApellidoUsuario"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label class="auto-style2" ID="lblEmail" runat="server" Font-Size="Medium"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style25">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink class="auto-style2" ID="hlCarrito" runat="server"  NavigateUrl="~/Compra/Carrito.aspx">Mi carrito</asp:HyperLink>
                    </td>
                    <td class="auto-style24">&nbsp;&nbsp;&nbsp;&nbsp; <asp:HyperLink class="auto-style2" ID="hlConfiguracion" runat="server"  NavigateUrl="~/Usuario/Configuracion.aspx">Configuración </asp:HyperLink>
                    </td>
                    <td class="auto-style23">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td class="auto-style19">&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td class="auto-style13">&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td class="auto-style8"></td>
                </tr>
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label class="auto-styleA" ID="lblMiscompras" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" Text="Mis compras:"></asp:Label>
            <br />
            <br />
            <asp:Label class="auto-style2" ID="lblMensaje" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium"></asp:Label>
            <br />
            <asp:GridView ID="grdComprados" runat="server" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="255px" CssClass="auto-style26">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <br />
        </div>
    </form>
<footer>
    <div class="FDiv">
        <img src="../Imagenes/Fowondo.png"/>
    </div>
</footer>
</body>
</html>
