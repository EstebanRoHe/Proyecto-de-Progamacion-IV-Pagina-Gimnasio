package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarMaquinas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();

        int txtIdMaquina = Integer.parseInt(request.getParameter("codigo"));
        String txtDescripcion = request.getParameter("descripcion");
        String txtEstado = request.getParameter("estado");
        String txtImageni = request.getParameter("imageni");
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
        boolean maquinaRepetida = metodo.buscarMaquinaRepetida(txtIdMaquina);
        if (maquinaRepetida == true) {
            out.println("alert('Maquina " + txtIdMaquina + " registrada anteriormente')");
            out.println("location= 'Mantenimiento.jsp'");

        } else {

            boolean registro = metodo.registrarMaquina(txtIdMaquina, txtDescripcion, txtEstado, txtImageni); 

            if (registro == true) {
                out.println("alert('Maquina registrada en forma exitosa')");
                out.println("location= 'Mantenimiento.jsp'");
            } else {
                out.println("alert('Error: Maquina no registrada')");
                out.println("location= 'Mantenimiento.jsp'");
            }

        }

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}
