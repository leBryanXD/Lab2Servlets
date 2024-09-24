package servlets;

import com.mycompany.bryanlab.Venta;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/EliminarVenta")
public class EliminarVentaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idVenta = Integer.parseInt(request.getParameter("idVenta"));

        HttpSession session = request.getSession();
        List<Venta> ventas = (List<Venta>) session.getAttribute("ventas");

        if (ventas != null) {
            ventas.removeIf(venta -> venta.getIdVenta() == idVenta);
        }

        response.sendRedirect("index.jsp");
    }
}
