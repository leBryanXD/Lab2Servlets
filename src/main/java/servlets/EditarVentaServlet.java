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

@WebServlet("/EditarVenta")
public class EditarVentaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idVenta = Integer.parseInt(request.getParameter("idVenta"));
        String nuevaFechaVenta = request.getParameter("fechaVenta");
        String nuevoNombreCliente = request.getParameter("nombreCliente");

        HttpSession session = request.getSession();
        List<Venta> ventas = (List<Venta>) session.getAttribute("ventas");

        if (ventas != null) {
            for (Venta venta : ventas) {
                if (venta.getIdVenta() == idVenta) {
                    venta.setFechaVenta(nuevaFechaVenta);
                    venta.setNombreCliente(nuevoNombreCliente);
                    break;
                }
            }
        }

        response.sendRedirect("index.jsp");
    }
}
