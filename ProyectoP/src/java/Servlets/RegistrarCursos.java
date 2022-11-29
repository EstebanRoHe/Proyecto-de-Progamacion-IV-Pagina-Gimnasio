package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarCursos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();

        int txtCodigo = Integer.parseInt(request.getParameter("codigo"));
        String txtDescripcion = request.getParameter("descripcion");
        String txtDias = request.getParameter("dias");
        String txtHora = request.getParameter("hora");
        String txtDisponibilidad = "Disponible";
        String txtImageni = request.getParameter("imageni");

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");

        boolean usuarioRepetido = metodo.buscarCursoRepetido(txtCodigo);
        if (usuarioRepetido == true) {
            out.println("alert('Usuario " + txtCodigo + "  registrado  anteriormente')");
            out.println("location= 'index.jsp'");

        } else {

            boolean registro = metodo.registrarCurso(txtCodigo, txtDescripcion,txtDias,txtHora,txtDisponibilidad, txtImageni);
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
