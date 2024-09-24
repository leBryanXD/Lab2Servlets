<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.bryanlab.Venta" %>
<%@ page import="java.util.List" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Sistema de Ventas</h1>
        <div class="text-center">
            <a href="agregarVenta.jsp" class="btn btn-primary">Agregar Venta</a>
            
        </div>
    </div>
     <div class="container mt-5">
        <h2>Lista de Ventas</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID Venta</th>
                    <th>Fecha Venta</th>
                    <th>Nombre Cliente</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Venta> ventas = (List<Venta>) session.getAttribute("ventas");
                    if (ventas != null) {
                        for (Venta venta : ventas) {
                %>
                <tr>
                    <td><%= venta.getIdVenta() %></td>
                    <td><%= venta.getFechaVenta() %></td>
                    <td><%= venta.getNombreCliente() %></td>
                    <td>
                        <a href="editarVenta.jsp?idVenta=<%= venta.getIdVenta() %>" class="btn btn-info">Editar</a>
                        
                        <a href="EliminarVenta?idVenta=<%= venta.getIdVenta() %>" class="btn btn-danger">Eliminar</a>
                        <a href="agregarInventario.jsp?idVenta=<%= venta.getIdVenta() %>" class="btn btn-warning">Agregar Inventario</a>
                        <a href="verVenta.jsp?idVenta=<%= venta.getIdVenta() %>" class="btn btn-primary">Ver Inventario</a>

                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" class="text-center">No hay ventas registradas.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
