package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModificarInstructores extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();

        int txtCodigo = Integer.parseInt(request.getParameter("codigo"));
        String txtEmail = request.getParameter("email");
        String txtDireccion = request.getParameter("direccion");
        int txtCelular = Integer.parseInt(request.getParameter("celular"));
        int txtTelefono = Integer.parseInt(request.getParameter("telefono"));
         String txtImageni = request.getParameter("imageni");
  
       
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
        

              boolean registro = metodo.modificarInstructores(txtCodigo,txtEmail,txtDireccion,txtCelular,txtTelefono,txtImageni);
            if (registro == true) {
                out.println("alert('Instructor Modificado en forma exitosa')");
                out.println("location= 'Mantenimiento.jsp'");
            } else {
                out.println("alert('Error: Instructor no Modificado')");
                out.println("location= 'Mantenimiento.jsp'");
            }

        

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}
