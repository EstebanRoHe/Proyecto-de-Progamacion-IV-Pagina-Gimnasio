package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModificarCursos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();

        int txtCodigo = Integer.parseInt(request.getParameter("codigo"));
        String txtDescripcion = request.getParameter("descripcion");
        String txtImageni = request.getParameter("imageni");
        String txtDisponibilidad = request.getParameter("disponibilidad");
      
  
       
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
        

              boolean registro = metodo.modificarCursos(txtCodigo,txtDescripcion,txtDisponibilidad,txtImageni);
            if (registro == true) {
                out.println("alert('Curso Modificado en forma exitosa')");
                out.println("location= 'Mantenimiento.jsp'");
            } else {
                out.println("alert('Error: Curso no Modificado')");
                out.println("location= 'Mantenimiento.jsp'");
            }

        

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}
