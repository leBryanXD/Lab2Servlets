<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.bryanlab.Venta" %>
<%@ page import="com.mycompany.bryanlab.Inventario" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalles de Venta</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h1>Detalles de la Venta</h1>
            <%
                int idVenta = Integer.parseInt(request.getParameter("idVenta"));
                HttpSession sessionV = request.getSession();
                List<Venta> ventas = (List<Venta>) sessionV.getAttribute("ventas");
                Venta ventaSeleccionada = null;

                if (ventas != null) {
                    for (Venta venta : ventas) {
                        if (venta.getIdVenta() == idVenta) {
                            ventaSeleccionada = venta;
                            break;
                        }
                    }
                }
            %>
            <h2>ID Venta: <%= ventaSeleccionada.getIdVenta()%></h2>
            <p>Fecha Venta: <%= ventaSeleccionada.getFechaVenta()%></p>
            <p>Nombre Cliente: <%= ventaSeleccionada.getNombreCliente()%></p>

            <h3>Inventarios Asociados</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID Inventario</th>
                        <th>Fecha Inventario</th>
                        <th>Nombre Producto</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Inventario> inventarios = ventaSeleccionada.getInventarios();
                        if (inventarios != null && !inventarios.isEmpty()) {
                            for (Inventario inventario : inventarios) {
                    %>
                    <tr>
                        <td><%= inventario.getIdInventario()%></td>
                        <td><%= inventario.getFechaInventario()%></td>
                        <td><%= inventario.getProductoNombre()%></td>
                        <td>
                            <form action="EliminarInventario" method="post" style="display:inline;">
                                <input type="hidden" name="idInventario" value="<%= inventario.getIdInventario()%>">
                                <input type="hidden" name="idVenta" value="<%= ventaSeleccionada.getIdVenta()%>">
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                            </form>
                        </td>
                        <td>
                            <a href="formularioEditarInventario.jsp?idInventario=<%= inventario.getIdInventario()%>&idVenta=<%= ventaSeleccionada.getIdVenta()%>" class="btn btn-warning">Editar</a>
                        </td
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="3" class="text-center">No hay inventarios asociados a esta venta.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <a href="index.jsp" class="btn btn-secondary">Volver a la lista de ventas</a>
        </div>
    </body>
</html>
