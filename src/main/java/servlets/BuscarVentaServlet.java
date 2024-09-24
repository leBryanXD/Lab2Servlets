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

@WebServlet("/BuscarVenta")
public class BuscarVentaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreCliente = request.getParameter("nombreCliente");

        HttpSession session = request.getSession();
        List<Venta> ventas = (List<Venta>) session.getAttribute("ventas");
        Venta ventaEncontrada = null;

        if (ventas != null) {
            for (Venta venta : ventas) {
                if (venta.getNombreCliente().equalsIgnoreCase(nombreCliente)) {
                    ventaEncontrada = venta;
                    break;
                }
            }
        }

        request.setAttribute("venta", ventaEncontrada);
        request.getRequestDispatcher("mostrarVenta.jsp").forward(request, response);
    }
}
