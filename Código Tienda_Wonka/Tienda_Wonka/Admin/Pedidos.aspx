<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="Pedidos.Pedidos" %>

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
            width: 100%;
        }
        .auto-styleA{
            font-style: italic;
            font-weight: bold;
            font-size: large;
            color: #FFFFF0;
        }
        .auto-style2 {
            font-style: italic;
            font-weight: bold;
            font-size: large;
            color: #FFFFF0;
            width: 327px;
        }
        .auto-style4 {
            width: 383px;
        }
        .auto-style6 {
            font-style: italic;
            font-weight: bold;
            font-size: large;
            color: #FFFFF0;
            width: 273px;
        }
        .auto-style9 {
            height: 34px;
        }
        .auto-style12 {
            height: 49px;
        }
        .auto-style13 {
            width: 100%;
            margin-bottom: 0px;
            align-content: center;
            align-items: center;
            text-align: center;
        }
        .auto-style17 {
            left: 1%;
            bottom: -2147483648%;
            margin-left: 0px;
        }
        .auto-style20 {
            font-style: italic;
            font-weight: bold;
            font-size: large;
            color: #FFFFF0;
            width: 368px;
        }
        .auto-style21 {
            width: 368px;
            height: 49px;
        }
        .auto-style22 {
            width: 368px;
            height: 34px;
        }
        .auto-style23 {
            width: 383px;
            height: 49px;
        }
        .auto-style24 {
            width: 383px;
            height: 34px;
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
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6">Pedido
                        <asp:Label ID="lblIdPedido" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style2">Seleccione un producto a pedir:
                        <br />
                        <br />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table class="auto-style13">
                <tr>
                    <td class="auto-style23">
                        &nbsp;</td>
                    <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlProducto" runat="server" DataSourceID="SqlDataSource_dsProductos" DataTextField="Nombre_PROD" DataValueField="Id_PROD">
                        </asp:DropDownList>
                        <br />
                        <br />
                    </td>
                    <td class="auto-style12">
                        <asp:SqlDataSource ID="SqlDataSource_dsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT [Id_PROD], [Nombre_PROD] FROM [Productos] WHERE ([Estado_PROD] = @Estado_PROD)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="TRUE" Name="Estado_PROD" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style20">Especifique la cantidad:&nbsp;&nbsp; <asp:TextBox ID="txtCantidad" runat="server" CausesValidation="True" TextMode="Number" ValidationGroup="Gr1"></asp:TextBox>
                        <br />
                    &nbsp;</td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCantidad" ErrorMessage="Ingrese la cantidad." ForeColor="Ivory" ValidationGroup="Gr1"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCantidad" ErrorMessage="Ingrese una cantidad mayor a cero." ForeColor="Ivory" Operator="GreaterThan" ValidationGroup="Gr1" ValueToCompare="0"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style20">
                        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
                        </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style24">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnBorrarTodo" runat="server" OnClick="btnBorrarTodo_Click" Text="Reiniciar pedido" Width="252px" Height="26px" />
                    </td>
                    <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" Width="252px" Height="26px" ValidationGroup="Gr1" />
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar pedido" Width="252px" Height="26px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td class="auto-style20">
        <asp:GridView class="auto-styleA" ID="grdPxP" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="codigo Producto">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("IdProducto_PP") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cantidad">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cantidad_PP") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                no ay productos en este pedido
            </EmptyDataTemplate>
        </asp:GridView>
                        <br />
                    </td>
                    <td>
                        <asp:Label class="auto-styleA" ID="lblMensaje2" runat="server" ></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
<footer>
    <div class="FDiv2">
        <img src="../Imagenes/Fowondo.png"/>
    </div>
</footer>
</body>
</html>
