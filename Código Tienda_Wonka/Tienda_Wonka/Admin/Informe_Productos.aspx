<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informe_Productos.aspx.cs" Inherits="Tienda_Wonka.Admin.Informe_Productos" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
            font-style: italic;
            font-weight: bold;
            font-size: large;
            color: #FFFFF0;
        }
        .auto-style2 {
            width: 100%;
            align-content: center;
            align-items: center;
            text-align: center;
        }
        .auto-style3 {
            width: 523px;
            align-content: center;
            align-items: center;
            text-align: center;
        }
        .auto-style5 {
            width: 526px;
            align-content: center;
            align-items: center;
            text-align: center;
        }
        .auto-style7 {
            width: 526px;
            height: 342px;
            align-content: center;
            align-items: center;
            text-align: center;
        }
        .auto-style8 {
            height: 342px;
            align-content: center;
            align-items: center;
            text-align: center;
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
                <h1>Willy Wonka</h1>
            </div>
        </div>
    </header>
    <form id="form1" runat="server">
        <div>
            <h2>Informes</h2>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style5"><span class="auto-style1">Productos vendidos</span></td>
                    <td class="auto-style1">Top 10 - Los más vendidos</td>
                </tr>
                <tr>
                    <td class="auto-style7">
            <asp:Chart ID="ch_prodVend" runat="server" DataSourceID="Wonka_Party" Palette="Berry">
                <series>
                    <asp:Series Name="Series1" XValueMember="nombre_prod" YValueMembers="Totales">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
                    </td>
                    <td class="auto-style8">
                        <asp:Chart ID="ch_top10" runat="server" DataSourceID="Wonka_Party5" Palette="Berry">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="nombre_prod" YValueMembers="Totales">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
            <asp:SqlDataSource ID="Wonka_Party" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT SUM(Detalle_Ventas.Cantidad_DV) AS Totales, Productos.Nombre_PROD FROM Detalle_Ventas
	INNER JOIN Productos ON Detalle_Ventas.IdProd_DV = Productos.Id_PROD
	INNER JOIN Ventas ON Detalle_Ventas.NroVent_DV = Ventas.Nro_VENT
WHERE (DATEPART(month, Ventas.Fecha_VENT) = DATEPART(month, GETDATE())) GROUP BY Productos.Nombre_PROD"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="Wonka_Party5" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT TOP (10) SUM(Detalle_Ventas.Cantidad_DV) AS Totales, Productos.nombre_prod FROM Detalle_Ventas
	INNER JOIN Productos ON Detalle_Ventas.IdProd_DV = Productos.id_prod
	INNER JOIN Ventas ON Detalle_Ventas.NroVent_DV = Ventas.nro_vent
WHERE (DATEPART(month, Ventas.fecha_vent) = DATEPART(month, GETDATE()))
GROUP BY Productos.nombre_prod ORDER BY Totales DESC"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <span class="auto-style1">Ventas del Producto:&nbsp;
                        <asp:DropDownList ID="ddl_prodX" runat="server" DataSourceID="Wonka_Party" DataTextField="Nombre_PROD" DataValueField="Nombre_PROD">
                        </asp:DropDownList>
&nbsp;<asp:Button ID="btn_buscar" runat="server" OnClick="btn_buscar_Click" Text="Buscar" />
                        </span>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Chart ID="ch_prodX" runat="server" DataSourceID="Wonka_Party6" Palette="Berry" OnLoad="btn_buscar_Click">
                            <Series>
                                <asp:Series Name="Series1" XValueMember="Mes" YValueMembers="Cantidad">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:SqlDataSource ID="Wonka_Party6" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT SUM(Detalle_Ventas.Cantidad_DV) AS Cantidad, DATEPART(mm, Ventas.Fecha_VENT) AS Mes, Productos.Nombre_PROD FROM Detalle_Ventas INNER JOIN Productos ON Detalle_Ventas.IdProd_DV = Productos.Id_PROD INNER JOIN Ventas ON Detalle_Ventas.NroVent_DV = Ventas.Nro_VENT WHERE (Productos.Nombre_PROD = @ProdX) AND (DATEPART(year, Ventas.Fecha_VENT) = DATEPART(year, GETDATE())) GROUP BY Ventas.Fecha_VENT, Productos.Nombre_PROD">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_prodX" DefaultValue="1" Name="ProdX" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            &nbsp;&nbsp;<br />
            <table class="auto-style2">
                <tr>
                    <td class="auto-style3">
            <span class="auto-style1">Ingresos mensuales
            </span></td>
                    <td>
            <span class="auto-style1">Ingresos anuales</span></td>
                </tr>
                <tr>
                    <td class="auto-style3">
            <span class="auto-style1">
            <asp:Chart ID="ch_ingresosMes" runat="server" Palette="Berry" DataSourceID="WonkaParty3">
                <series>
                    <asp:Series ChartType="Line" Name="Series1" XValueMember="Mes" YValueMembers="TotMes" YValuesPerPoint="4">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1" BorderColor="Transparent">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            </span>
                    </td>
                    <td>
            <span class="auto-style1">
            <asp:Chart ID="ch_ingresosAgno" runat="server" Palette="Berry" DataSourceID="WonkaParty4">
                <series>
                    <asp:Series ChartType="Line" Name="Series1" XValueMember="Año" YValueMembers="TotAño">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            </span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
            <span class="auto-style1">
                        <asp:SqlDataSource ID="WonkaParty3" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT SUM(Monto_VENT) AS TotMes, DATEPART(month, fecha_vent) AS Mes FROM Ventas
WHERE (DATEPART(month, fecha_vent) = DATEPART(month, fecha_vent)) GROUP BY fecha_vent"></asp:SqlDataSource>
            </span>
                    </td>
                    <td>
            <span class="auto-style1">
                        <asp:SqlDataSource ID="WonkaParty4" runat="server" ConnectionString="<%$ ConnectionStrings:WonkaConnectionString %>" SelectCommand="SELECT SUM(monto_vent) AS TotAño, DATEPART(year, fecha_vent) AS Año FROM Ventas WHERE (DATEPART(year, fecha_vent) = DATEPART(year, fecha_vent)) GROUP BY fecha_vent"></asp:SqlDataSource>
            </span>
                    </td>
                </tr>
            </table>
            <span class="auto-style1"><br />
            &nbsp;
            <br />
            <br />
            <br />
            </span>
        </div>
    </form>
<footer>
    <div class="FDiv">
        <img src="../Imagenes/Fowondo.png"/>
    </div>
</footer>
</body>
</html>
