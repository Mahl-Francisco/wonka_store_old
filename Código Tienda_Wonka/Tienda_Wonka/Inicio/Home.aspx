<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Tienda_Wonka.Home" %>

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

        .auto-style2 {
            width: 100%;
            margin-left: 14px;
        }
        .auto-style3 {
            width: 197px;
        }
        .auto-style4 {
            width: 116px;
        }
        .auto-style5 {
            width: 339px;
        }
        .auto-style6 {
            width: 218px;
        }
        .auto-style7 {
            width: 160px;
        }
        .auto-style8 {
            width: 197px;
            height: 30px;
        }
        .auto-style9 {
            width: 218px;
            height: 30px;
        }
        .auto-style10 {
            width: 116px;
            height: 30px;
        }
        .auto-style11 {
            height: 30px;
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
        <div style="height:1100px;width:15%;float:left">
            <br />
            <br />
            <asp:Button ID="btnPerfil" runat="server" Height="43px" Text="Mi perfil" Width="140px" OnClick="btnPerfil_Click" Visible="False" />
            <br />
            <br />
            <asp:Button ID="btnIniciarSesion" runat="server" Height="43px" Text="Iniciar sesión" Width="140px" OnClick="btnIniciarSesion_Click" />
            <br />
            <br />
            <asp:Button ID="btnRegistrarse" runat="server" Height="43px" Text="Registrarse" Width="140px" OnClick="btnRegistrarse_Click" />
            <br />
            <br />
            <asp:Button ID="btnCarrito" runat="server" Height="43px" Text="Carrito de compras" Width="140px" OnClick="btnCarrito_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnAdministrarProds" runat="server" Height="43px" Text="Administrar productos" Visible="False" Width="140px" OnClick="btnAdministrarProds_Click" />
            <br />
            <br />
            <asp:Button ID="btnInformes" runat="server" Height="43px" Text="Informes" Visible="False" Width="140px" OnClick="btnInformes_Click" />
        </div>

        <!-- Cuerpo -->
        <div style="height:1100px;width:85%;float:left">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style8">
                        <asp:Label class="txt" ID="lb_cat" runat="server" Font-Bold="True"  Text="Categoría"></asp:Label>
&nbsp;
                        <asp:DropDownList ID="ddl_categoria" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_precio_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style9">
                        <asp:Label class="txt" ID="lb_pre" runat="server" Font-Bold="True" Text="Precio"></asp:Label>
&nbsp;
                        <asp:DropDownList ID="ddl_precio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_precio_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="ORDER BY [Id_PROD] ASC">Sin orden de precio</asp:ListItem>
                            <asp:ListItem Value="ORDER BY [Precio_PROD] ASC">Menor precio primero</asp:ListItem>
                            <asp:ListItem Value="ORDER BY [Precio_PROD] DESC">Mayor precio primero</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style10">
                        <asp:Button ID="btn_noFiltros" runat="server" Text="Quitar filtros" OnClick="btn_noFiltros_Click" />
                    </td>
                    <td class="auto-style11">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label class="txt" ID="lb_busqueda" runat="server" Font-Bold="True" Text="¿Buscas algo en especial?"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tbBuscar" runat="server" MaxLength="30" Width="199px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btn_buscar" runat="server" Text="Buscar" OnClick="ddl_precio_SelectedIndexChanged" />
                    </td>
                    <td>
                        <asp:Button ID="PROVISORIO" runat="server" OnClick="PROVISORIO_Click" Text="PROVISORIO" Visible="False" />
                    </td>
                </tr>
            </table>
            <asp:ListView ID="lvProductos" runat="server" DataKeyNames="Id_PROD" DataSourceID="SqlDataSource_lvProductos" GroupItemCount="3" OnPagePropertiesChanged="ddl_precio_SelectedIndexChanged">
                <AlternatingItemTemplate>
                    <td runat="server" style="background-color: #FFFFFF;color: #284775;" class="auto-style5">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="150px" ImageUrl='<%# Eval("ImageLink_PROD") %>' Width="300px" />
                        <br />
                        <asp:Label ID="Nombre_PRODLabel" runat="server" Text='<%# Eval("Nombre_PROD") %>' />
                        <br />
                        <asp:Label ID="Nombre_TPLabel" runat="server" Text='<%# Eval("Nombre_TP") %>' />
                        <br />Solo a $<asp:Label ID="Precio_PRODLabel" runat="server" Text='<%# Eval("Precio_PROD") %>' />
                        <br /> 
                        <asp:Button ID="btnComprar" runat="server" Height="32px" Text="Añadir al carrito" Width="275px" CommandArgument='<%# Eval("Id_PROD")+"*"+Eval("ImageLink_PROD")+"*"+Eval("Nombre_PROD")+"*"+Eval("Nombre_TP")+"*"+Eval("Precio_PROD") %>' CommandName="agregarCarrito" OnCommand="btnComprar_Command" />
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="background-color: #999999;">Id_PROD:
                        <asp:Label ID="Id_PRODLabel1" runat="server" Text='<%# Eval("Id_PROD") %>' />
                        <br />ImageLink_PROD:
                        <asp:TextBox ID="ImageLink_PRODTextBox" runat="server" Text='<%# Bind("ImageLink_PROD") %>' />
                        <br />Nombre_PROD:
                        <asp:TextBox ID="Nombre_PRODTextBox" runat="server" Text='<%# Bind("Nombre_PROD") %>' />
                        <br />IdTipoP_PROD:
                        <asp:TextBox ID="IdTipoP_PRODTextBox" runat="server" Text='<%# Bind("IdTipoP_PROD") %>' />
                        <br />Nombre_TP:
                        <asp:TextBox ID="Nombre_TPTextBox" runat="server" Text='<%# Bind("Nombre_TP") %>' />
                        <br />Stock_PROD:
                        <asp:TextBox ID="Stock_PRODTextBox" runat="server" Text='<%# Bind("Stock_PROD") %>' />
                        <br />PuntoPedido_PROD:
                        <asp:TextBox ID="PuntoPedido_PRODTextBox" runat="server" Text='<%# Bind("PuntoPedido_PROD") %>' />
                        <br />Precio_PROD:
                        <asp:TextBox ID="Precio_PRODTextBox" runat="server" Text='<%# Bind("Precio_PROD") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr runat="server">
                            <td runat="server" class="auto-style7">No hay productos que coincidan con tu búsqueda.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
<td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">ImageLink_PROD:
                        <asp:TextBox ID="ImageLink_PRODTextBox" runat="server" Text='<%# Bind("ImageLink_PROD") %>' />
                        <br />Nombre_PROD:
                        <asp:TextBox ID="Nombre_PRODTextBox" runat="server" Text='<%# Bind("Nombre_PROD") %>' />
                        <br />IdTipoP_PROD:
                        <asp:TextBox ID="IdTipoP_PRODTextBox" runat="server" Text='<%# Bind("IdTipoP_PROD") %>' />
                        <br />Nombre_TP:
                        <asp:TextBox ID="Nombre_TPTextBox" runat="server" Text='<%# Bind("Nombre_TP") %>' />
                        <br />Stock_PROD:
                        <asp:TextBox ID="Stock_PRODTextBox" runat="server" Text='<%# Bind("Stock_PROD") %>' />
                        <br />PuntoPedido_PROD:
                        <asp:TextBox ID="PuntoPedido_PRODTextBox" runat="server" Text='<%# Bind("PuntoPedido_PROD") %>' />
                        <br />Precio_PROD:
                        <asp:TextBox ID="Precio_PRODTextBox" runat="server" Text='<%# Bind("Precio_PROD") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="150px" ImageUrl='<%# Eval("ImageLink_PROD") %>' Width="300px" />
                        <br />
                        <asp:Label ID="Nombre_PRODLabel" runat="server" Text='<%# Eval("Nombre_PROD") %>' />
                        <br />
                        <asp:Label ID="Nombre_TPLabel" runat="server" Text='<%# Eval("Nombre_TP") %>' />
                        <br />Solo a $<asp:Label ID="Precio_PRODLabel" runat="server" Text='<%# Eval("Precio_PROD") %>' />
                        <br />
                        <asp:Button ID="btnComprar" runat="server" Height="32px" Text="Añadir al carrito" Width="300px" OnCommand="btnComprar_Command" CommandArgument='<%# Eval("Id_PROD")+"*"+Eval("ImageLink_PROD")+"*"+Eval("Nombre_PROD")+"*"+Eval("Nombre_TP")+"*"+Eval("Precio_PROD") %>' CommandName="agregarCarrito" />
                        <br /></td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Id_PROD:
                        <asp:Label ID="Id_PRODLabel" runat="server" Text='<%# Eval("Id_PROD") %>' />
                        <br />ImageLink_PROD:
                        <asp:Label ID="ImageLink_PRODLabel" runat="server" Text='<%# Eval("ImageLink_PROD") %>' />
                        <br />Nombre_PROD:
                        <asp:Label ID="Nombre_PRODLabel" runat="server" Text='<%# Eval("Nombre_PROD") %>' />
                        <br />IdTipoP_PROD:
                        <asp:Label ID="IdTipoP_PRODLabel" runat="server" Text='<%# Eval("IdTipoP_PROD") %>' />
                        <br />Nombre_TP:
                        <asp:Label ID="Nombre_TPLabel" runat="server" Text='<%# Eval("Nombre_TP") %>' />
                        <br />Stock_PROD:
                        <asp:Label ID="Stock_PRODLabel" runat="server" Text='<%# Eval("Stock_PROD") %>' />
                        <br />PuntoPedido_PROD:
                        <asp:Label ID="PuntoPedido_PRODLabel" runat="server" Text='<%# Eval("PuntoPedido_PROD") %>' />
                        <br />Precio_PROD:
                        <asp:Label ID="Precio_PRODLabel" runat="server" Text='<%# Eval("Precio_PROD") %>' />
                        <br /></td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource_lvProductos" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT [Id_PROD], [ImageLink_PROD], [Nombre_PROD], [IdTipoP_PROD], [Nombre_TP], [Stock_PROD], [PuntoPedido_PROD],
	[Precio_PROD]
FROM [Productos] INNER JOIN [Tipos_Producto] ON [IdTipoP_PROD] = [Id_TP]
WHERE (([Estado_PROD] = 1) AND ([Stock_PROD] &gt; [PuntoPedido_PROD]))
ORDER BY [Id_PROD] ASC">
            </asp:SqlDataSource>
        </div>
    </form>
<footer>
    <div class="FDiv">
        <img src="../Imagenes/Fowondo.png"/>
    </div>
 </footer>
</body>
</html>
