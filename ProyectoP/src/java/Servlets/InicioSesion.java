
package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InicioSesion  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
       
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();

       
        int txtUsuario=Integer.parseInt(request.getParameter("usuario"));
        String txtContrasena=request.getParameter("contrasena");
      
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
        boolean usuarioRepetido = metodo.buscarUsuarioRepetido(txtUsuario);
        boolean contrasenaRepetido = metodo.buscarContrasenaRepetido(txtContrasena,txtUsuario);
        boolean instructorRepetido = metodo.buscarInstructorRepetido(txtUsuario);
       
        if (usuarioRepetido == true ) {
            if (contrasenaRepetido == true) {
            sesion.setAttribute("txtUsuario", txtUsuario);
            out.println("location= 'index.jsp'");
            }else {
                out.println("alert('Error: Contrasena no valido')");
                out.println("location= 'login.jsp'");
        }
        }else if(instructorRepetido == true){
            sesion.setAttribute("txtUsuario", txtUsuario);
            sesion.setAttribute("Mantenimiento", 1);
            out.println("location= 'index.jsp'");
            
            
        }else {
                out.println("alert('Error: Usuario no valido')");
                out.println("location= 'login.jsp'");
        }
        
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}

