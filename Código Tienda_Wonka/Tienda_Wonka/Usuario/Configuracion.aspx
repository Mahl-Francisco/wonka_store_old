<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Configuracion.aspx.cs" Inherits="Tienda_Wonka.User.Configuracion" %>

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
        .auto-style1 {
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
            <h2>Configuración</h2>
            <br />
            <a class="auto-style1">Cuenta</a><br />
            <br />
            <a class="auto-style2">Nombre de usuario:</a>
            <asp:Label class="auto-style2" ID="lblNombreusmostrar" runat="server" Text="*NombreUsuario"></asp:Label>
            <br />
            <a class="auto-style2">Apellido:</a>
            <asp:Label class="auto-style2" ID="lblApellidoC" runat="server" Text="*ApellidoUsuario"></asp:Label>
            <br />
            <a class="auto-style2">Telefono:</a>
            <asp:Label class="auto-style2" ID="lblTelefonoC" runat="server" Text="*TelefonoUsuario"></asp:Label>
            <br />
            <a class="auto-style2">Direccion:</a>
            <asp:Label class="auto-style2" ID="lblDireccionC" runat="server" Text="*DireccionUsuario"></asp:Label>
            <br />
            <a class="auto-style2">Correo electrónico:</a>
            <asp:Label class="auto-style2" ID="lblCorreoC" runat="server" Text="*CorreoUsuario"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="hlEditarInfo" runat="server" ForeColor="#660033" NavigateUrl="~/Usuario/Editar_Info.aspx">Editar información </asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="hlCambiarcontraseña" runat="server" ForeColor="#660033" NavigateUrl="~/Usuario/Cambiar_Contraseña.aspx">Cambiar contraseña</asp:HyperLink>
            <br />
            <br />
            &nbsp;<asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion" Width="174px" OnClick="btnCerrarSesion_Click1" />
        </div>
    </form>
 <footer>
    <div class="FDiv">
        <img src="../Imagenes/Fowondo.png"/>
    </div>
</footer>
</body>
</html>
