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

@WebServlet("/EditarInventario")
public class EditarInventarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idInventario = Integer.parseInt(request.getParameter("idInventario"));
        int idVenta = Integer.parseInt(request.getParameter("idVenta"));
        String nuevaFechaInventario = request.getParameter("fechaInventario");
        String nuevoProductoNombre = request.getParameter("productoNombre");

        HttpSession session = request.getSession();
        List<Venta> ventas = (List<Venta>) session.getAttribute("ventas");

        if (ventas != null) {
            for (Venta venta : ventas) {
                if (venta.getIdVenta() == idVenta) {
                    for (Inventario inventario : venta.getInventarios()) {
                        if (inventario.getIdInventario() == idInventario) {
                            inventario.setFechaInventario(nuevaFechaInventario);
                            inventario.setProductoNombre(nuevoProductoNombre);
                            break;
                        }
                    }
                    break;
                }
            }
        }

        response.sendRedirect("verVenta.jsp?idVenta=" + idVenta);
    }
}
