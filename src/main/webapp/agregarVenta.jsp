<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Venta</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Agregar Nueva Venta</h2>
        <form action="AgregarVenta" method="post">
            <div class="form-group">
                <label for="fechaVenta">Fecha de Venta</label>
                <input type="date" class="form-control" id="fechaVenta" name="fechaVenta" required>
            </div>
            <div class="form-group">
                <label for="nombreCliente">Nombre del Cliente</label>
                <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" required>
            </div>
            <button type="submit" class="btn btn-primary">Agregar Venta</button>
            <a href="index.jsp" class="btn btn-secondary">Regresar</a>
        </form>
    </div>
</body>
</html>
