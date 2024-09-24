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

@WebServlet("/AgregarInventario")
public class AgregarInventarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idVenta = Integer.parseInt(request.getParameter("idVenta"));
        String fechaInventario = request.getParameter("fechaInventario");
        String productoNombre = request.getParameter("productoNombre");

        // Crear nuevo inventario
        Inventario nuevoInventario = new Inventario( fechaInventario, productoNombre, idVenta);

        // Almacenar inventario en la venta correspondiente (en sesión)
        HttpSession session = request.getSession();
        List<Venta> ventas = (List<Venta>) session.getAttribute("ventas");
        for (Venta venta : ventas) {
            if (venta.getIdVenta() == idVenta) {
                venta.agregarInventario(nuevoInventario);
                break;
            }
        }

        response.sendRedirect("index.jsp");
    }
}
