package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModificarHistoriales extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();
  
        int txtCodigo = Integer.parseInt(request.getParameter("codigo"));
        int txtcliente = Integer.parseInt(request.getParameter("cliente")); 
        int txtInstructor = Integer.parseInt(request.getParameter("intructoresh")); 
        int txtCurso = Integer.parseInt(request.getParameter("cursoh")); 
        String txtFecha = request.getParameter("fechah");
        int txtHoras = Integer.parseInt(request.getParameter("horash"));
      

        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
        //boolean registro = metodo.modificarRutinas(c,i,m,h);
        boolean registro = metodo.modificarHistorial(txtCodigo, txtcliente, txtInstructor, txtCurso, txtFecha, txtHoras);
        if (registro == true) {
            out.println("alert('Rutina Modificada en forma exitosa')");
            out.println("location= 'Mantenimiento.jsp'");
        } else {
            out.println("alert('Error: Rutina no Modificada')");
            out.println("location= 'Mantenimiento.jsp'");
        }

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}


    