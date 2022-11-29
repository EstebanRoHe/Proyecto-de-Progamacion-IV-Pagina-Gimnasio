package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registrarHistorial extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();
        

       int numero = (int)(Math.random()*10+1);
       int txtId = numero;
        int txtcurso = Integer.parseInt(request.getParameter("curso"));
        int txcliente = Integer.parseInt(request.getParameter("cliente"));
        int txtinstructor = Integer.parseInt(request.getParameter("instructor"));
        String txtfecha = request.getParameter("fecha");
        int txthora = Integer.parseInt(request.getParameter("hora"));
        
        
     
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
        boolean usuarioRepetido = metodo.buscarHistorialRepetido(txtId);
        if (usuarioRepetido == true) {
            out.println("alert('Usuario " + txtId + "  registrado  anteriormente')");
            out.println("location= 'index.jsp'");

        } else {

              boolean registro = metodo.registrarHistorial(txtId,txcliente,txtinstructor,txtcurso ,txtfecha,txthora);
            if (registro == true) {
                out.println("alert('Curso registrado en forma exitosa')");
                out.println("location= 'index.jsp'");
            } else {
                out.println("alert('Error: Curso no registrado')");
                out.println("location= 'index.jsp'");
            }

        }

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}
