<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medio_Pago.aspx.cs" Inherits="Tienda_Wonka.Compra.Medio_Pago" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
 <link href="http://fonts.cdnfonts.com/css/willywonka" rel="stylesheet"/>
 <link rel="stylesheet" href="Wonka3.css"/>
    <title>Tienda Willy Wonka</title>
     <style type="text/css">
         .auto-style1 {
             left: 0px;
             top: 228px;
         }
         .auto-style2 {
            font-style: italic;
            font-weight: bold;
            font-size: large;
            color: #FFFFF0;
        }
         .auto-style3 {
             height: 608px;
             width: 80%;
             float: right;
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
        <!-- Submenú -->
        <div style="height:500px;width:15%;float:left">
            <asp:Button ID="btnPerfil" runat="server" Height="43px" Text="Mi perfil" Width="131px" OnClick="btnPerfil_Click" />
            <br />
            <br />
            <asp:Button ID="btnCarrito" runat="server" Height="43px" Text="Carrito de compras" Width="131px" OnClick="btnCarrito_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>

        <!-- Cuerpo -->
        <div class="auto-style3">
           <a class="auto-style2">Seleccione un medio de pago:&nbsp;&nbsp;&nbsp;</a> 
            <asp:DropDownList ID="ddlMedioPago" runat="server">
                <asp:ListItem>Credito</asp:ListItem>
                <asp:ListItem>Debito</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="usuario" runat="server" Visible="False" ForeColor="Ivory"></asp:Label>
            <br />
            <asp:Label class="auto-style2" ID="lblSeleccionTarjeta" runat="server" Text="Seleccione una tarjeta:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlTarjeta" runat="server" DataSourceID="Wonka_Paid">
                <asp:ListItem>Walá</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="Wonka_Paid" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT bco_TAR FROM Tarjeta_Clientes WHERE (IdUsuario_TAR = @IdUsuario) AND (tipo_TAR = @TipoPago)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="usuario" DefaultValue="" Name="IdUsuario" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddlMedioPago" DefaultValue="Credito" Name="TipoPago" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <a class="auto-style2">*GridView: Datos de la tarjeta seleccionada*</a> <br />
            <asp:GridView class="auto-style2" ID="gvTarjetaSeleccionadisima" runat="server" AutoGenerateColumns="False" DataSourceID="Wonka_Card">
                <Columns>
                    <asp:BoundField DataField="Nro_TAR" HeaderText="Nro" SortExpression="Nro_TAR" />
                    <asp:BoundField DataField="Apellido_USU" HeaderText="Apellido" SortExpression="Apellido_USU" />
                    <asp:BoundField DataField="Nombre_USU" HeaderText="Nombre" SortExpression="Nombre_USU" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Wonka_Card" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT Tarjeta_Clientes.Nro_TAR, Usuarios.Apellido_USU, Usuarios.Nombre_USU FROM Tarjeta_Clientes INNER JOIN Usuarios ON Tarjeta_Clientes.IdUsuario_TAR = Usuarios.Id_USU WHERE (Tarjeta_Clientes.bco_TAR = @Banco) AND (Usuarios.Id_USU = @Usuario)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTarjeta" Name="Banco" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="usuario" Name="Usuario" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label class="auto-style2" ID="lblAgregarTarjeta" runat="server" Text="Agregar nueva tarjeta:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlAgregarTarjeta" runat="server">
                <asp:ListItem>Credito</asp:ListItem>
                <asp:ListItem>Debito</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <a class="auto-style2">Banco:&nbsp;&nbsp;&nbsp;</a>
            <asp:DropDownList ID="ddlBanco" runat="server" ValidateRequestMode="Enabled">
                <asp:ListItem>Santander Río</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label class="auto-style2" ID="lblNumeroTarjeta" runat="server" Text="Número de la tarjeta:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbNumTarjeta" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label class="auto-style2" ID="lblCodSeguridad" runat="server" Text="Código de seguridad:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tbCodSeguridad" runat="server"></asp:TextBox>
            &nbsp;<br />
            <br />
            <asp:Button ID="btnGuardarTarjeta" runat="server" Text="Guardar tarjeta" Width="115px" />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnConfirmarCompra" runat="server" Height="33px" Text="Confirmar compra" Width="159px" />
            </div>
 <footer>
    <div class="FDiv">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img src="../Imagenes/Fowondo.png" class="auto-style1"/>
    </div>
 </footer>
    </form>
 </body>
</html>
