<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.bryanlab.Venta" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Inventario</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Agregar Inventario a la Venta</h1>
        <%
            int idVenta = Integer.parseInt(request.getParameter("idVenta"));
            HttpSession session2 = request.getSession();
            List<Venta> ventas = (List<Venta>) session2.getAttribute("ventas");
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
        <form action="AgregarInventario" method="post">
            <input type="hidden" name="idVenta" value="<%= ventaSeleccionada.getIdVenta() %>">
            <div class="form-group">
                <label for="fechaInventario">Fecha Inventario</label>
                <input type="date" class="form-control" id="fechaInventario" name="fechaInventario" required>
            </div>
            <div class="form-group">
                <label for="productoNombre">Nombre del Producto</label>
                <input type="text" class="form-control" id="productoNombre" name="productoNombre" required>
            </div>
            <button type="submit" class="btn btn-success">Agregar Inventario</button>
            <a href="index.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>
