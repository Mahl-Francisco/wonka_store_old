<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="Tienda_Wonka.Inicio.Registrarse" %>

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
        .auto-style1 {
            height: 884px;
            width: 34%;
            margin-left: 506px;
            margin-right: 361px;
        }
        .auto-style2 {
            margin-bottom: 0px;
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
         <h2>Registrarse</h2>
        <div style="align-content:center;" class="auto-style1">
           
               <a class="auto-styleA">  Ingrese su nombre:</a><br />
            <br />
                <asp:TextBox ID="tbNombre" runat="server" Height="25px" Width="269px" MaxLength="50"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator class="auto-styleB" ID="rvf_tbNombre" runat="server" ControlToValidate="tbNombre" ErrorMessage="*Este campo es obligatorio." ValidationGroup="grupo_registro"></asp:RequiredFieldValidator>
            <br />
            <br />
             <a class="auto-styleA">Ingrese su apellido:</a><br />
            <br />
                <asp:TextBox ID="tbApellido" runat="server" Height="25px" Width="269px" MaxLength="50"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator class="auto-styleB" ID="rvf_tbApellido" runat="server" ControlToValidate="tbApellido" ErrorMessage="*Este campo es obligatorio." ValidationGroup="grupo_registro"></asp:RequiredFieldValidator>
            <br />
            <br />
                <a class="auto-styleA"> Ingese su correo electrónico:</a><br />
            <br />
                <asp:TextBox ID="tbCorreoElectronico" runat="server" Height="25px" Width="269px" MaxLength="70" TextMode="Email"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator class="auto-styleB" ID="rvf_tbMail" runat="server" ControlToValidate="tbCorreoElectronico" ErrorMessage="*Este campo es obligatorio." ValidationGroup="grupo_registro"></asp:RequiredFieldValidator>
            <br />
            <br />
            <a class="auto-styleA"> Confirme su correo electrónico:</a><br />
            <br />
                <asp:TextBox ID="tbConfirmarCorreoElectronico" runat="server" Height="25px" Width="269px" MaxLength="70" TextMode="Email"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator class="auto-styleB" ID="rvf_tbConfMail" runat="server" ControlToValidate="tbConfirmarCorreoElectronico" ErrorMessage="*Este campo es obligatorio."  ValidationGroup="grupo_registro"></asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator class="auto-styleB" ID="cv_Conf" runat="server" ControlToCompare="tbCorreoElectronico" ControlToValidate="tbConfirmarCorreoElectronico" ErrorMessage="*Los correos electrónicos no coinciden." ValidationGroup="grupo_registro"></asp:CompareValidator>
            <br />
            <br />
                <a class="auto-styleA">Ingese su contrase&ntilde;a:</a> <br />
            <br />
                <asp:TextBox ID="tbContrasenia" runat="server" Height="25px" Width="269px" TextMode="Password" MaxLength="15"></asp:TextBox>
            <br />
                <asp:RequiredFieldValidator class="auto-styleB" ID="rvf_tbContrasenia" runat="server" ControlToValidate="tbContrasenia" ErrorMessage="*Este campo es obligatorio." ValidationGroup="grupo_registro"></asp:RequiredFieldValidator>
            <br />
                <br />
            <a class="auto-styleA">Confirme su contrase&ntilde;a:</a><br />
                <asp:TextBox ID="tbConfirmarContrasenia" runat="server" Height="25px" Width="269px" TextMode="Password" MaxLength="15"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator class="auto-styleB" ID="rvf_tbConfContrasenia" runat="server" ControlToValidate="tbConfirmarContrasenia" ErrorMessage="*Este campo es obligatorio." ValidationGroup="grupo_registro"></asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator class="auto-styleB" ID="cv_ConfContrasenia" runat="server" ControlToCompare="tbContrasenia" ControlToValidate="tbConfirmarContrasenia" ErrorMessage="*Las contraseñas no coinciden." ValidationGroup="grupo_registro"></asp:CompareValidator>
            <br />
            <asp:Label class="auto-styleB" ID="lblMensaje" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnCrearCuenta" runat="server" Text="Crear cuenta" Width="113px" Height="26px" OnClick="btnCrearCuenta_Click" ValidationGroup="grupo_registro" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Volver al inicio" Width="113px" OnClick="btnCancelar_Click" />
            <br />
            <asp:CheckBox class="auto-styleA" ID="cbRecordarme" runat="server" Checked="True" Text="Recordarme" AutoPostBack="True" OnCheckedChanged="cbRecordarme_CheckedChanged" />
            <br />
            <asp:Label class="auto-styleB" ID="lblRecordarme" runat="server" Text="Si desactiva esta opción, tendrá que iniciar sesión manualmente cada vez que entre a la página." Visible="False"></asp:Label>
            <br />
            <br />
               <a class="auto-styleA">¿Ya está registrado en nuestra página?</a><br />
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbtnIniciarSesion" runat="server" PostBackUrl="~/Inicio/Iniciar_Sesion.aspx" OnClick="lbtnIniciarSesion_Click">Iniciar sesión</asp:LinkButton>
        </div>
    </form>
 <footer>
    <div class="FDiv">
        <img src="../Imagenes/Fowondo.png" class="auto-style2"/>
    </div>
 </footer>
</body>
</html>
