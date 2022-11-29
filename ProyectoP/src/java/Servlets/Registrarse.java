package Servlets;

import SQL.MetodosSQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Registrarse extends HttpServlet {

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
        int txtCedula = Integer.parseInt(request.getParameter("cedula"));
        String txtEmail = request.getParameter("email");
        String txtContrasena = request.getParameter("contrasena");
        String txtDireccion = request.getParameter("direccion");
        int txtCelular = Integer.parseInt(request.getParameter("celular"));
        int txtTelefono = Integer.parseInt(request.getParameter("telefono"));
        int txtEdad = Integer.parseInt(request.getParameter("edad"));
        String txtFecha=request.getParameter("fecha");
        String txtPago="si";
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<body>");
        out.println("<script type=\"text/javascript\">");
       
        boolean usuarioRepetido = metodo.buscarUsuarioRepetido(txtCedula);
        if (usuarioRepetido == true) {
            out.println("alert('Usuario " + txtCedula + "  registrado  anteriormente')");
            out.println("location= 'index.jsp'");

        } else {

              boolean registro = metodo.registrarUsuario(txtCedula,txtNombre,txtApellido1,txtApellido2,txtDireccion,txtEmail,txtCelular,txtTelefono,txtContrasena,txtEdad,txtFecha,txtPago);
            if (registro == true) {
                out.println("alert('Usuario registrado en forma exitosa')");
                out.println("location= 'index.jsp'");
            } else {
                out.println("alert('Error: Usuario no registrado')");
                out.println("location= 'index.jsp'");
            }

        }

        out.println("</script>");
        out.println("</body>");
        out.println("</html>");

    }

}
