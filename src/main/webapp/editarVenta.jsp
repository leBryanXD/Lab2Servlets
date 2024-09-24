<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.bryanlab.Venta" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Venta</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Editar Venta</h1>
        <%
            int idVenta = Integer.parseInt(request.getParameter("idVenta"));
            HttpSession httpSession = request.getSession(); // Cambié el nombre a httpSession
            List<Venta> ventas = (List<Venta>) httpSession.getAttribute("ventas");
            Venta ventaAEditar = null;

            if (ventas != null) {
                for (Venta venta : ventas) {
                    if (venta.getIdVenta() == idVenta) {
                        ventaAEditar = venta;
                        break;
                    }
                }
            }
        %>
        <form action="EditarVenta" method="post">
            <input type="hidden" name="idVenta" value="<%= ventaAEditar.getIdVenta() %>">
            <div class="form-group">
                <label for="fechaVenta">Fecha Venta</label>
                <input type="date" class="form-control" id="fechaVenta" name="fechaVenta" 
                       value="<%= ventaAEditar.getFechaVenta() %>" required>
            </div>
            <div class="form-group">
                <label for="nombreCliente">Nombre Cliente</label>
                <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" 
                       value="<%= ventaAEditar.getNombreCliente() %>" required>
            </div>
            <button type="submit" class="btn btn-success">Actualizar Venta</button>
            <a href="index.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>
