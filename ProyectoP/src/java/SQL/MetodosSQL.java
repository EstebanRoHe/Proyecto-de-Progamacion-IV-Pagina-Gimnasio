package SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MetodosSQL {

    private Connection conexion;
    private PreparedStatement sentencia;
    private ResultSet resultado;

    public boolean registrarUsuario(int cedula, String nombre, String apellido1, String apellido2, String direccion, String e_mail, int celular, int tel_habitacion, String contraseña, int edad, String fecha, String pago) {
        boolean registro = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "INSERT INTO cliente(cedula,nombre,apellido1,apellido2,direccion,e_mail,celular,tel_habitacion,contraseña,edad,fecha,pago)" + "values(?,?,?,?,?,?,?,?,?,?,?,?)";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, cedula);
            sentencia.setString(2, nombre);
            sentencia.setString(3, apellido1);
            sentencia.setString(4, apellido2);
            sentencia.setString(5, direccion);
            sentencia.setString(6, e_mail);
            sentencia.setInt(7, celular);
            sentencia.setInt(8, tel_habitacion);
            sentencia.setString(9, contraseña);
            sentencia.setInt(10, edad);
            sentencia.setString(11, fecha);
            sentencia.setString(12, pago);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                registro = true;
                System.out.println("Se guadaron los datos");

            } else {
                registro = false;
                System.out.println("Información no guardada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + registro);

        return registro;

    }

    public boolean buscarUsuarioRepetido(int cedula) {
        boolean usuarioRepetido = false;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select cedula from GIMNASIO.cliente where cedula = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, cedula);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {
                usuarioRepetido = true; //usuario registrado en la DB

            } else {

                usuarioRepetido = false; //usuario no registrado en la DB
            }
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error:" + e);
            }

        }
        System.out.println("El valor del usuario repetido es:" + usuarioRepetido);
        return usuarioRepetido;
    }

    public boolean buscarContrasenaRepetido(String contraseña, int cedula) {
        boolean usuarioRepetido = false;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select contraseña  from GIMNASIO.cliente where contraseña = ? and cedula = ?;";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setString(1, contraseña);
            sentencia.setInt(2, cedula);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {
                usuarioRepetido = true; //usuario registrado en la DB

            } else {

                usuarioRepetido = false; //usuario no registrado en la DB
            }
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error:" + e);
            }

        }
        System.out.println("El valor del usuario repetido es:" + usuarioRepetido);
        return usuarioRepetido;
    }

    public boolean buscarUsuarioInicio(String e_mail, String contraseña) {
        boolean iniciarSesion = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select e_mail,contraseña from GIMNASIO.cliente where  e_mail= ? and contraseña = ? ";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setString(1, e_mail);
            sentencia.setString(2, contraseña);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {
                iniciarSesion = true; // usuario encontrado, puede iniciar sesion

            } else {
                iniciarSesion = false;// usuario no encontrado, no puede iniciar sesion
            }
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error:" + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error:" + e);
            }

        }
        System.out.println("El valor de inicio de sesión repetido es:" + iniciarSesion);
        return iniciarSesion;
    }

    public String buscarNombre(String e_mail) {
        String nombre = null;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select nombre from cliente where e_mail= ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setString(1, e_mail);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {//Se encuentra el usuario y se obtiene el nombre
                nombre = resultado.getString("nombre");
            } else {
                nombre = null; // el usuario no se encontró
            }
            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }
        System.out.println("El nombre es : " + nombre);
        return nombre;
    }

//}
    /*-----------------------------------------------&-------------------------------------------------*/
    public boolean registrarInstructor(int cod_instructor, String nombre, String apellido1, String apellido2, String direccion,
            String e_mail, int tel_cel, int tel_habitacion, String fecha_contratacion, String imagen) {
        boolean registro = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "INSERT INTO instructores(cod_instructor,nombre,apellido1,apellido2,direccion,e_mail,tel_cel,tel_habitacion,fecha_contratacion,imagen)" + "values(?,?,?,?,?,?,?,?,?,?)";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, cod_instructor);
            sentencia.setString(2, nombre);
            sentencia.setString(3, apellido1);
            sentencia.setString(4, apellido2);
            sentencia.setString(5, direccion);
            sentencia.setString(6, e_mail);
            sentencia.setInt(7, tel_cel);
            sentencia.setInt(8, tel_habitacion);
            sentencia.setString(9, fecha_contratacion);
            sentencia.setString(10, imagen);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                registro = true;
                System.out.println("Se guadaron los datos");

            } else {
                registro = false;
                System.out.println("Información no guardada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + registro);

        return registro;

    }

    public boolean buscarInstructorRepetido(int cod_instructor) {
        boolean usuarioRepetido = false;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select cod_instructor from GIMNASIO.instructores where cod_instructor = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, cod_instructor);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {
                usuarioRepetido = true; //usuario registrado en la DB

            } else {

                usuarioRepetido = false; //usuario no registrado en la DB
            }
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error:" + e);
            }

        }
        System.out.println("El valor del usuario repetido es:" + usuarioRepetido);
        return usuarioRepetido;
    }

    public int buscarInstructor(int cod_instructor) {
        int codigo = 0;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select cod_instructor from instructores where cod_instructor= ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, cod_instructor);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {//Se encuentra el usuario y se obtiene el nombre
                codigo = resultado.getInt("codigo");
            } else {
                codigo = 0; // el usuario no se encontró
            }
            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }
        System.out.println("El nombre es : " + codigo);
        return codigo;
    }

    /*-----------------------------------------------&-------------------------------------------------*/
    public boolean registrarMaquina(int id_maquina, String descripcion, String estado, String imagen) {
        boolean registro = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "INSERT INTO maquinas(id_maquina, descripcion, estado, imagen)" + "values(?,?,?,?)";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_maquina);
            sentencia.setString(2, descripcion);
            sentencia.setString(3, estado);
            sentencia.setString(4, imagen);
            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                registro = true;
                System.out.println("Se guadaron los datos");

            } else {
                registro = false;
                System.out.println("Información no guardada");
            }
            conexion.close();// cierra la conexión con la base de datos

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + registro);

        return registro;

    }

    public boolean buscarMaquinaRepetida(int id_maquina) {
        boolean maquinaRepetida = false;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select id_maquina from maquinas where id_maquina = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_maquina);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {
                maquinaRepetida = true; //usuario registrado en la DB

            } else {

                maquinaRepetida = false; //usuario no registrado en la DB
            }
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error:" + e);
            }

        }
        System.out.println("El valor del usuario repetido es:" + maquinaRepetida);
        return maquinaRepetida;
    }

    /*-----------------------------------------------&-------------------------------------------------*/
    public boolean registrarCurso(int id_curso, String descripcion, String dias, String horas, String disponibilidad, String imagen) {
        boolean registro = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "INSERT INTO cursos(id_curso,descripcion,dias,horas,disponibilidad,imagen)" + "values(?,?,?,?,?,?)";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_curso);
            sentencia.setString(2, descripcion);
            sentencia.setString(3, dias);
            sentencia.setString(4, horas);
            sentencia.setString(5, disponibilidad);
            sentencia.setString(6, imagen);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                registro = true;
                System.out.println("Se guadaron los datos");

            } else {
                registro = false;
                System.out.println("Información no guardada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + registro);

        return registro;

    }

    public boolean buscarCursoRepetido(int id_curso) {
        boolean usuarioRepetido = false;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select id_curso from GIMNASIO.cursos where id_curso = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_curso);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {
                usuarioRepetido = true; //usuario registrado en la DB

            } else {

                usuarioRepetido = false; //usuario no registrado en la DB
            }
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error:" + e);
            }

        }
        System.out.println("El valor del usuario repetido es:" + usuarioRepetido);
        return usuarioRepetido;
    }

    public int buscarCurso(int id_curso) {
        int codigo = 0;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select id_curso from cursos where id_curso= ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_curso);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {//Se encuentra el usuario y se obtiene el nombre
                codigo = resultado.getInt("codigo");
            } else {
                codigo = 0; // el usuario no se encontró
            }
            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }
        System.out.println("El codigo es : " + codigo);
        return codigo;
    }


    /*-----------------------------------------------&-------------------------------------------------*/
    public boolean registrarHistorial(int id_historial, int cliente, int instructor, int curso, String fecha, int horas) {
        boolean registro = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "INSERT INTO historial_curso(id_historial,cliente,instructor,curso,fecha,horas)" + "values(?,?,?,?,?,?)";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_historial);
            sentencia.setInt(2, cliente);
            sentencia.setInt(3, instructor);
            sentencia.setInt(4, curso);
            sentencia.setString(5, fecha);
            sentencia.setInt(6, horas);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                registro = true;
                System.out.println("Se guadaron los datos");

            } else {
                registro = false;
                System.out.println("Información no guardada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + registro);

        return registro;

    }

    public boolean buscarHistorialRepetido(int id_historial) {
        boolean usuarioRepetido = false;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select id_historial from GIMNASIO.historial_curso where id_historial = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_historial);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {
                usuarioRepetido = true; //usuario registrado en la DB

            } else {

                usuarioRepetido = false; //usuario no registrado en la DB
            }
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error:" + e);
            }

        }
        System.out.println("El valor del usuario repetido es:" + usuarioRepetido);
        return usuarioRepetido;
    }

    public int buscarHistorial(int id_historial) {
        int codigo = 0;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select id_historial from historial_curso where id_historial= ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_historial);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {//Se encuentra el usuario y se obtiene el nombre
                codigo = resultado.getInt("id_historial");
            } else {
                codigo = 0; // el usuario no se encontró
            }
            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }
        System.out.println("El codigo es : " + codigo);
        return codigo;
    }

    /*-----------------------------------------------&-------------------------------------------------*/
    public boolean registrarRutinas(int id_rutina, int cliente, int instructor, int maquina, String fecha, int horas) {
        boolean registro = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "INSERT INTO rutinas(id_rutina,cliente,instructor,maquina,fecha,horas)" + "values(?,?,?,?,?,?)";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_rutina);
            sentencia.setInt(2, cliente);
            sentencia.setInt(3, instructor);
            sentencia.setInt(4, maquina);
            sentencia.setString(5, fecha);
            sentencia.setInt(6, horas);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                registro = true;
                System.out.println("Se guadaron los datos");

            } else {
                registro = false;
                System.out.println("Información no guardada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + registro);

        return registro;

    }

    public boolean buscarRutinasRepetido(int id_rutina) {
        boolean usuarioRepetido = false;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select id_rutina from GIMNASIO.rutinas where id_rutina = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_rutina);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {
                usuarioRepetido = true; //usuario registrado en la DB

            } else {

                usuarioRepetido = false; //usuario no registrado en la DB
            }
            conexion.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error:" + e);
            }

        }
        System.out.println("El valor del usuario repetido es:" + usuarioRepetido);
        return usuarioRepetido;
    }

    public int buscarRutinas(int id_rutina) {
        int codigo = 0;
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select id_historial from historial_curso where id_historial= ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_rutina);
            resultado = sentencia.executeQuery();
            if (resultado.next()) {//Se encuentra el usuario y se obtiene el nombre
                codigo = resultado.getInt("codigo");
            } else {
                codigo = 0; // el usuario no se encontró
            }
            conexion.close();

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }
        System.out.println("El nombre es : " + codigo);
        return codigo;
    }


    /*-----------------------------------------------&-------------------------------------------------*/
 /*------------Metodos de Eliminar Cliente--------------------*/
    public boolean eliminarCliente(int cedula) {
        boolean eliminarC = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "DELETE FROM GIMNASIO.cliente WHERE cedula = ? and pago = 'si'";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, cedula);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarC = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarC = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarC);

        return eliminarC;
    }

    /*-----------------------------------------------&-------------------------------------------------*/
 /*------------Metodos de Eliminar instructores--------------------*/
    public boolean eliminarInstructores(int cod_instructor) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "DELETE FROM GIMNASIO.instructores WHERE cod_instructor = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, cod_instructor);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*-----------------------------------------------&-------------------------------------------------*/
 /*------------Metodos de Eliminar Cursos--------------------*/
    public boolean eliminarCursos(int id_curso) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "DELETE FROM GIMNASIO.cursos WHERE id_curso = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_curso);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Eliminar rutinas--------------------*/
    public boolean eliminarRutinas(int id_rutina) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "DELETE FROM GIMNASIO.rutinas WHERE id_rutina = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_rutina);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Eliminar Maquinas--------------------*/
    public boolean eliminarMaquinas(int id_maquina) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "DELETE FROM GIMNASIO.maquinas WHERE id_maquina = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_maquina);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Eliminar Historial--------------------*/
    public boolean eliminarHistorial(int id_historial) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "DELETE FROM GIMNASIO.historial_curso WHERE id_historial = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, id_historial);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Modificar Cliente--------------------*/
    public boolean modificarCliente(int cedula, String e_mail, String direccion, int celular, int tel_habitacion, String pago) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "UPDATE GIMNASIO.cliente SET e_mail = ? , direccion = ? , celular = ?, tel_habitacion = ?, pago = ?  where cedula = ?";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setString(1, e_mail);
            sentencia.setString(2, direccion);
            sentencia.setInt(3, celular);
            sentencia.setInt(4, tel_habitacion);
            sentencia.setString(5, pago);
            sentencia.setInt(6, cedula);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se Modificaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no se Modificaron");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Modificar Instructor--------------------*/
    public boolean modificarInstructores(int cod_instructor, String e_mail, String direccion, int tel_cel, int tel_habitacion, String imagen) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "UPDATE GIMNASIO.instructores SET e_mail = ? , direccion = ? , tel_cel = ?, tel_habitacion = ?,imagen = ? where cod_instructor = ?";
            sentencia = conexion.prepareStatement(consulta);

            sentencia.setString(1, e_mail);
            sentencia.setString(2, direccion);
            sentencia.setInt(3, tel_cel);
            sentencia.setInt(4, tel_habitacion);
            sentencia.setString(5, imagen);
            sentencia.setInt(6, cod_instructor);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se Modifiacron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no se Modificaron");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Modificar Cursos--------------------*/
    public boolean modificarCursos(int id_curso, String descripcion, String disponibilidad, String imagen) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "UPDATE GIMNASIO.cursos SET descripcion = ? ,disponibilidad = ?, imagen = ? where id_curso = ?";
            sentencia = conexion.prepareStatement(consulta);

            sentencia.setString(1, descripcion);
            sentencia.setString(2, disponibilidad);
            sentencia.setString(3, imagen);
            sentencia.setInt(4, id_curso);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Modificar Rutinas--------------------*/
    public boolean modificarRutinas(int id_rutina, int instructor, int maquina, int horas) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "UPDATE GIMNASIO.rutinas SET instructor = ?, maquina = ?,horas = ? where id_rutina = ?";
            sentencia = conexion.prepareStatement(consulta);

            sentencia.setInt(1, instructor);
            sentencia.setInt(2, maquina);
            sentencia.setInt(3, horas);
            sentencia.setInt(4, id_rutina);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Modificar maquinas--------------------*/
    public boolean modificarMaquinas(int id_maquina, String descripcion, String estado, String imagen) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "UPDATE GIMNASIO.maquinas SET descripcion = ?, estado = ? ,imagen = ? where id_maquina = ?";
            sentencia = conexion.prepareStatement(consulta);

            sentencia.setString(1, descripcion);
            sentencia.setString(2, estado);
            sentencia.setString(3, imagen);
            sentencia.setInt(4, id_maquina);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se eliminaron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no eliminada");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Modificar Historial--------------------*/
    
    
    public boolean modificarHistorial(int id_historial, int cliente, int instructor, int curso, String fecha, int horas) {
        boolean eliminarI = false;

        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "UPDATE GIMNASIO.historial_curso SET cliente = ? , instructor = ? , curso = ? , fecha = ?, horas = ? where id_historial = ?";
            sentencia = conexion.prepareStatement(consulta);

            sentencia.setInt(1, cliente);
            sentencia.setInt(2, instructor);
            sentencia.setInt(3, curso);
            sentencia.setString(4, fecha);
            sentencia.setInt(5, horas);
            sentencia.setInt(6, id_historial);

            int inserta = sentencia.executeUpdate();

            if (inserta > 0) {
                eliminarI = true;
                System.out.println("Se Modifiacron los datos");

            } else {
                eliminarI = false;
                System.out.println("Información no se Modificaron");
            }
            conexion.close();

        } catch (SQLException e) {

            System.out.println("Error: " + e);
        } finally {
            try {
                conexion.close();
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            }
        }

        System.out.println("Valor del registro " + eliminarI);

        return eliminarI;
    }

    /*------------Metodos de Select Id Instructores--------------------*/
    public ResultSet mostrar_Instructores_Id() {
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select * from GIMNASIO.instructores;";
            sentencia = conexion.prepareStatement(consulta);
            resultado = sentencia.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return resultado;
    }

    /*------------Metodos de Select Id cursos--------------------*/
    public ResultSet mostrar_Cursos_Id() {
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select * from GIMNASIO.cursos where disponibilidad = 'Disponible' ;";
            sentencia = conexion.prepareStatement(consulta);
            resultado = sentencia.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return resultado;
    }

    /*------------Metodos de Select Id cursos--------------------*/
    public ResultSet mostrar_Cursosll_Id() {
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select * from GIMNASIO.cursos ;";
            sentencia = conexion.prepareStatement(consulta);
            resultado = sentencia.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return resultado;
    }

    /*------------Metodos de Select Id Rutinas--------------------*/
    public ResultSet mostrar_Rutinas_Id() {
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select * from GIMNASIO.rutinas;";
            sentencia = conexion.prepareStatement(consulta);
            resultado = sentencia.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return resultado;
    }

    /*------------Metodos de Select Id maquina--------------------*/
    public ResultSet mostrar_Maquina_Id() {
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select * from GIMNASIO.maquinas;";
            sentencia = conexion.prepareStatement(consulta);
            resultado = sentencia.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return resultado;
    }

    /*------------Metodos de Select Id Cliente--------------------*/
    public ResultSet mostrar_Cliente_Id() {
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select * from GIMNASIO.cliente;";
            sentencia = conexion.prepareStatement(consulta);
            resultado = sentencia.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return resultado;
    }

    /*------------Metodos de Select Id Historial--------------------*/
    public ResultSet mostrar_Historial_Id() {
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select * from GIMNASIO.historial_curso;";
            sentencia = conexion.prepareStatement(consulta);

            resultado = sentencia.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return resultado;
    }

    /*------------Metodos de Select Id Rutinas--------------------*/
    public ResultSet mostrar_Rutinas_Id_Historial(int cliente) {
        try {
            conexion = ConexionBD.obtenerInstancia().conectar();
            String consulta = "select * from GIMNASIO.rutinas where cliente = ?;";
            sentencia = conexion.prepareStatement(consulta);
            sentencia.setInt(1, cliente);

            resultado = sentencia.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return resultado;
    }

}
