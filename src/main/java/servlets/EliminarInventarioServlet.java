package servlets;

import com.mycompany.bryanlab.Inventario;
import com.mycompany.bryanlab.Venta;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/EliminarInventario")
public class EliminarInventarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idInventario = Integer.parseInt(request.getParameter("idInventario"));
        int idVenta = Integer.parseInt(request.getParameter("idVenta"));

        HttpSession session = request.getSession();
        List<Venta> ventas = (List<Venta>) session.getAttribute("ventas");

        if (ventas != null) {
            for (Venta venta : ventas) {
                if (venta.getIdVenta() == idVenta) {
                    // Eliminar el inventario de la venta
                    venta.getInventarios().removeIf(inventario -> inventario.getIdInventario() == idInventario);
                    break;
                }
            }
        }

        response.sendRedirect("verVenta.jsp?idVenta=" + idVenta);
    }
}
