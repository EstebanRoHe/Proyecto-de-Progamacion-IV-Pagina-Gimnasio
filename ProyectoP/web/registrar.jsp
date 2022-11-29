<%-- 
    Document   : registrar
    Created on : 10 jun. 2022, 00:44:17
    Author     : Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/estiloregistro.css" rel="stylesheet">

        <title>registrar</title>
        <style>
            body{
                background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url("img/i2.jpg");

            }

        </style>
    </head>
    <body>
        <div class="principal">
            <nav class="barra_de_navegacion">
                <ul class="m">
                    <li>
                        <a href="index.jsp">Inicio</a>
                    </li>
                    <li>
                        <a href="index.jsp#formulario">Contactos</a>
                    </li>
                    <li class="servicios">
                        <a href="#">Servicios</a>
                        <ul> 
                            <li><a href="inscribirse.jsp">Inscripcion</a></li>
                            <li><a href="cursos.jsp">Cursos</a></li>
                            <li><a href="maquinas.jsp">Maquinas</a></li>
                            <li><a href="instructores.jsp">Instructores</a></li>
                            <%if (request.getSession().getAttribute("Mantenimiento") != null) {%>
                                <li><a href="Mantenimiento.jsp">Mantenimiento</a></li>
                                    <%}%>
                        </ul>
                    </li>
                    <li>
                        <a href="blog.jsp">Blogs</a>
                    </li>

                </ul>
            </nav>



            <ul class="login">
                <li class="login2">
                    <%if (request.getSession().getAttribute("txtUsuario") == null) {%>
                    <a href="login.jsp" class="btnlogin">LOGIN</a>
                    <%} else {%>
                    <a href="#" class="btnlogin"><%=request.getSession().getAttribute("txtUsuario")%></a>
                    <ul>
                        <%if (request.getSession().getAttribute("Mantenimiento") == null) {%>

                        <li><a href="historial.jsp">Historial <br> rutinas</a></li>

                        <%}%>
                        <li><form action="CerrarSesion">
                                <button type="submit" class="btnCerrar">Cerrar Sesion</button>

                            </form></li>
                    </ul>
                    <%}%>
                </li>
            </ul>




        </div>


        <div class="formulario">
            <form  method="post" action="Registrarse" class="formul">
                <table >
                    <tr>
                        <td><label for="nombre">Nombre: </label></td>
                        <td><input type="text " id="nombre" name="nombre" required> </td>
                    </tr>

                    <tr>
                        <td><label for="apellido1">Apellido1: </label></td>
                        <td><input type="text" id="apellido1" name="apellido1" required></td>
                    </tr>

                    <tr>
                        <td><label for="apellido2">Apellido2: </label></td>
                        <td><input type="text" id="apellido2" name="apellido2" required></td>
                    </tr>

                    <tr>
                        <td><label for="cedula">Cedula: </label></td>
                        <td><input type="text" id="cedula" name="cedula" required></td>
                    </tr>


                    <tr>
                        <td><label for="email">Email: </label></td>
                        <td><input type="email" id="email" name="email" required></td>
                    </tr>

                    <tr>
                        <td><label for="contrasena">Contraseña: </label></td>
                        <td><input type="password" id="contrasena" name="contrasena" required></td>
                    </tr>

                    <td><label for="rep_contraseña">Repetir Contraseña: </label></td>
                    <td><input type="password" id="rep_contraseña" name="rep_contraseña " required onkeyup="verificarPass()"></td>
                    </tr>

                    <tr>
                        <td><label for="direccion">Direccion: </label></td>
                        <td><input type="text"  id="direccion" name="direccion" required></td>
                    </tr>

                    <tr>
                        <td><label for="celular">Celular: </label></td>
                        <td><input type="celular"  id="celular" name="celular" required></td>
                    </tr>


                    <tr>
                        <td><label for="telefono">Telefono de Habitacion: </label></td>
                        <td><input type="tel"  id="telefono" name="telefono" required></td>
                    </tr>

                    <tr>
                        <td><label for="edad">Edad: </label></td>
                        <td><input type="number"  id="edad" name="edad" min="15" max="99" placeholder="26" required></td>
                    </tr>

                    <tr>
                        <td><label for="fecha">Fecha:</label></td>
                        <td><input type="date" name="fecha" value="2022-06-25" min="2022-06-25" max="2024-01-01" required></td>
                    </tr>





                </table>
                <p id="verificarcontra"></p>
                <button type="submit" id="suscribirse">Suscribirse</button>
                <%-- <input type="submit" value="Enviar Datos" class="btn" id="btnEnviarDatos" >--%>
            </form>

        </div>

    </body>

    <script src="JAVAS/registrar.js"></script>

</html>
<%-- 
   
--%>