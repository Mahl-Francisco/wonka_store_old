<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Iniciar_Sesion.aspx.cs" Inherits="Tienda_Wonka.Inicio.Iniciar_Sesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
 <link href="http://fonts.cdnfonts.com/css/willywonka" rel="stylesheet"/>
 <link rel="stylesheet" href="Wonka.css"/>
    <title>Tienda Willy Wonka</title>
    <style type="text/css">
        .auto-style4 {
            height: 441px;
            width: 35%;
            float: left;
            margin-left: 515px;
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
       <h2>Iniciar sesión</h2>
        <div class="auto-style4">
            
            <br />
            <br />
               <a class="auto-styleA">Ingese su correo electrónico:</a> <br />
            <br />
                <asp:TextBox ID="tbCorreoElectronico" runat="server" Height="25px" Width="269px" MaxLength="70" TextMode="Email"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator class="auto-styleB" ID="tfv_tbCorreoElectronico" runat="server" ControlToValidate="tbCorreoElectronico" ErrorMessage="*Este campo es obligatorio." ValidationGroup="gr_btnIngresar"></asp:RequiredFieldValidator>
            <br />
            <br />
                <a class="auto-styleA">Ingese su contrase&ntilde;a:</a><br />
            <br />
                <asp:TextBox ID="tbContrasenia" runat="server" Height="25px" Width="269px" TextMode="Password" MaxLength="15"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator class="auto-styleB" ID="tfv_tbContrasenia" runat="server" ControlToValidate="tbContrasenia" ErrorMessage="*Este campo es obligatorio." ValidationGroup="gr_btnIngresar"></asp:RequiredFieldValidator>
            <br />
            <asp:Label class="auto-styleB" ID="lblMensaje" runat="server" ></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" Width="113px" OnClick="btnIngresar_Click" ValidationGroup="gr_btnIngresar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Volver al inicio" Width="113px" OnClick="btnCancelar_Click" />
            <br />
            <asp:CheckBox class="auto-styleA" ID="cbRecordarme" runat="server" Checked="True" Text="Recordarme" OnCheckedChanged="cbRecordarme_CheckedChanged" AutoPostBack="True" />
            <br />
            <asp:Label class="auto-styleB" ID="lblRecordarme" runat="server" Text="Si desactiva esta opción, tendrá que iniciar sesión manualmente cada vez que entre a la página." Visible="False"></asp:Label>
            <br />
            <br />
            <a class="auto-styleA">¿No está registrado en nuestra página?</a><br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnRegistrarse" runat="server" PostBackUrl="~/Inicio/Registrarse.aspx" OnClick="lbtnRegistrarse_Click">Cree una cuenta gratuita</asp:LinkButton>
        </div>
    </form>
 <footer>
    <div class="FDiv">
        <img src="../Imagenes/Fowondo.png"/>
    </div>
 </footer>
</body>
</html>
