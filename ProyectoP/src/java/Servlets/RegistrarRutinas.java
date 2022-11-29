package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarRutinas  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();
         int numero = (int)(Math.random()*100+6);
        int txtCodigo = numero;
        int txtId_cliente = Integer.parseInt (request.getParameter("id_cliente"));
        int txtInstructor = Integer.parseInt (request.getParameter("instructor"));
        int txtMaquina = Integer.parseInt (request.getParameter("maquina"));
        String txtFecha = request.getParameter("fecha");
        int txtHoras= Integer.parseInt (request.getParameter("horas"));
         
       
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
        boolean usuarioRepetido = metodo.buscarRutinasRepetido(txtCodigo);
        if (usuarioRepetido == true) {
            out.println("alert('Usuario " + txtCodigo + "  registrado  anteriormente')");
            out.println("location= 'index.jsp'");

        } else {

              boolean registro = metodo.registrarRutinas(txtCodigo,txtId_cliente,txtInstructor,txtMaquina,txtFecha,txtHoras);
            if (registro == true) {
                out.println("alert('Rutina registrada en forma exitosa')");
                out.println("location= 'index.jsp'");
            } else {
                out.println("alert('Error: Rutina no registrada')");
                out.println("location= 'index.jsp'");
            }

        }

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}