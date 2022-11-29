package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarInstructores extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MetodosSQL metodo;
        metodo = new MetodosSQL();

        String txtNombre = request.getParameter("nombre");
        String txtApellido1 = request.getParameter("apellido1");
        String txtApellido2 = request.getParameter("apellido2");
        int txtCodigo = Integer.parseInt(request.getParameter("codigo"));
        String txtEmail = request.getParameter("email");
        String txtDireccion = request.getParameter("direccion");
        int txtCelular = Integer.parseInt(request.getParameter("celular"));
        int txtTelefono = Integer.parseInt(request.getParameter("telefono"));
        String txtFecha=request.getParameter("fecha");
        String txtImageni = request.getParameter("imageni");
       
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
        boolean usuarioRepetido = metodo.buscarInstructorRepetido(txtCodigo);
        if (usuarioRepetido == true) {
            out.println("alert('Usuario " +txtCodigo + "  registrado  anteriormente')");
            out.println("location= 'Mantenimiento.jsp'");

        } else {
//cod_instructor,nombre,apellido1,apellido2,direccion,e_mail,tel_cel,tel_habitacion,fecha_contratacion
              boolean registro = metodo.registrarInstructor(txtCodigo,txtNombre,txtApellido1,txtApellido2,txtDireccion,txtEmail,txtCelular,txtTelefono,txtFecha,txtImageni);
            if (registro == true) {
                out.println("alert('Instructor registrado en forma exitosa')");
                out.println("location= 'Mantenimiento.jsp'");
            } else {
                out.println("alert('Error: Instructor no registrado')");
                out.println("location= 'Mantenimiento.jsp'");
            }

        }

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}