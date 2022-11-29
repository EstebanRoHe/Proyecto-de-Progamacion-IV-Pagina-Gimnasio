package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EliminarMaquinas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();

        int txtCodigo = Integer.parseInt(request.getParameter("codigo"));
      
       
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
              boolean registro = metodo.eliminarMaquinas(txtCodigo);
            if (registro == true) {
                out.println("alert('Maquina Eliminada')");
                out.println("location= 'Mantenimiento.jsp'");
            } else {
                out.println("alert('Error: Maquina no Encotrada')");
                out.println("location= 'Mantenimiento.jsp'");
            }

        

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}