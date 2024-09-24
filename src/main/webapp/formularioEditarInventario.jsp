<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.bryanlab.Inventario" %>
<%@ page import="com.mycompany.bryanlab.Venta" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Inventario</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Editar Inventario</h2>
        <%
            int idInventario = Integer.parseInt(request.getParameter("idInventario"));
            int idVenta = Integer.parseInt(request.getParameter("idVenta"));

            HttpSession sessionI = request.getSession();
            List<Venta> ventas = (List<Venta>) sessionI.getAttribute("ventas");
            Inventario inventarioSeleccionado = null;

            if (ventas != null) {
                for (Venta venta : ventas) {
                    if (venta.getIdVenta() == idVenta) {
                        for (Inventario inventario : venta.getInventarios()) {
                            if (inventario.getIdInventario() == idInventario) {
                                inventarioSeleccionado = inventario;
                                break;
                            }
                        }
                        break;
                    }
                }
            }
        %>
        <form action="EditarInventario" method="post">
            <input type="hidden" name="idInventario" value="<%= inventarioSeleccionado.getIdInventario() %>">
            <input type="hidden" name="idVenta" value="<%= idVenta %>">
            <div class="form-group">
                <label>Fecha de Inventario:</label>
                <input type="date" name="fechaInventario" class="form-control" value="<%= inventarioSeleccionado.getFechaInventario() %>" required>
            </div>
            <div class="form-group">
                <label>Nombre del Producto:</label>
                <input type="text" name="productoNombre" class="form-control" value="<%= inventarioSeleccionado.getProductoNombre() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        </form>
    </div>
</body>
</html>
