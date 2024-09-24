package servlets;

import com.mycompany.bryanlab.Venta;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AgregarVenta")
public class AgregarVentaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fechaVenta = request.getParameter("fechaVenta");
        String nombreCliente = request.getParameter("nombreCliente");

        // Crear nueva venta
        Venta nuevaVenta = new Venta( fechaVenta, nombreCliente);

        // Almacenar en la sesión
        HttpSession session = request.getSession();
        List<Venta> ventas = (List<Venta>) session.getAttribute("ventas");
        if (ventas == null) {
            ventas = new ArrayList<>();
        }
        ventas.add(nuevaVenta);
        session.setAttribute("ventas", ventas);

        response.sendRedirect("index.jsp");
    }
}
