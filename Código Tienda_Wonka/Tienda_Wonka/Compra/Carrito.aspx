<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Tienda_Wonka.Compra.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
 <link href="http://fonts.cdnfonts.com/css/willywonka" rel="stylesheet"/>
 <link rel="stylesheet" href="Wonka3.css"/>
    <title>Tienda Willy Wonka</title>
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
            <br />
            <br />
            <br />
            <asp:Button ID="btnVaciar" runat="server" Height="41px" Text="Vaciar carrito" Width="133px" OnClick="btnVaciar_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnAdmin" runat="server" Height="43px" Text="Administrar productos" Width="131px" Visible="False" />
        </div>
      <h2>Carrito de compras&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
        <!-- Cuerpo -->
        <div style="height:500px;width:80%;float:right">
            &nbsp;<br />
            
            <asp:Label ID="lb_msj" runat="server" ForeColor="White"></asp:Label>
            <br />
            
            <br />
            <asp:GridView class="auto-style2" ID="gvCompras" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvCompras_PageIndexChanging" PageSize="3" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="Tu compra">
                        <ItemTemplate>
                            <asp:ImageButton ID="it_imageButton" runat="server" Height="75px" ImageUrl='<%# Eval("Imagen") %>' Width="150px" />
                            <br />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Como se llama">
                        <ItemTemplate>
                            <asp:Label ID="it_lblNombre" runat="server" ForeColor="Black" Text='<%# Eval("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Que es">
                        <ItemTemplate>
                            <asp:Label ID="it_lblTipo" runat="server" ForeColor="Black" Text='<%# Eval("Tipo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Te llevas">
                        <ItemTemplate>
                            <asp:Label ID="it_lblCantidad" runat="server" ForeColor="Black" Text='<%# Eval("Cantidad") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="A solo">
                        <ItemTemplate>
                            <asp:Label ID="it_lblPrecio" runat="server" ForeColor="Black" Text='<%# Eval("Precio") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="btnComprar" runat="server" Height="41px" Text="Comprar" Width="133px" OnClick="btnComprar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
    </form>
 <footer>
    <div class="FDiv">
        <img src="../Imagenes/Fowondo.png"/>
    </div>
 </footer>
</body>
</html>
