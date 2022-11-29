package Servlets;
 
import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EliminarCliente extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();

        //int txtCodigo = Integer.parseInt(request.getParameter("codigo"));
        int txtCodigo = Integer.parseInt(request.getParameter("codigo"));
       
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
              boolean registro = metodo.eliminarCliente(txtCodigo);
            if (registro == true) {
                out.println("alert('Cliente Eliminado')");
                out.println("location= 'Mantenimiento.jsp'");
            } else {
                out.println("alert('Error: Cliente no Encotrado, no a pagado , o esta ligado a un curso o a una rutina')");
                out.println("location= 'Mantenimiento.jsp'");
            }

        

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}