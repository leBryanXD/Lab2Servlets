<%@page import="com.mycompany.bryanlab.Inventario"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.bryanlab.Venta" %>
<%@ page import="java.util.List" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar Venta</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Detalles de la Venta</h2>
        <%
            Venta venta = (Venta) request.getAttribute("venta");
            if (venta != null) {
        %>
        <p>ID Venta: <%= venta.getIdVenta() %></p>
        <p>Fecha Venta: <%= venta.getFechaVenta() %></p>
        <p>Nombre Cliente: <%= venta.getNombreCliente() %></p>
        <h4>Inventarios:</h4>
        <ul>
            <%
                for (Inventario inventario : venta.getInventarios()) {
            %>
            <li><%= inventario.getProductoNombre() %> - Fecha: <%= inventario.getFechaInventario() %></li>
            <%
                }
            %>
        </ul>
        <form action="AgregarInventario" method="post">
            <input type="hidden" name="idVenta" value="<%= venta.getIdVenta() %>">
            <div class="form-group">
                <label for="fechaInventario">Fecha de Inventario</label>
                <input type="date" class="form-control" id="fechaInventario" name="fechaInventario" required>
            </div>
            <div class="form-group">
                <label for="productoNombre">Nombre del Producto</label>
                <input type="text" class="form-control" id="productoNombre" name="productoNombre" required>
            </div>
            <button type="submit" class="btn btn-primary">Agregar Inventario</button>
        </form>
        <a href="listarVentas.jsp" class="btn btn-secondary">Regresar</a>
        <%
            } else {
        %>
        <p>No se encontró la venta.</p>
        <a href="listarVentas.jsp" class="btn btn-secondary">Regresar</a>
        <%
            }
        %>
    </div>
</body>
</html>
