<%-- 
    Document   : historial
    Created on : 16 jun. 2022, 18:28:11
    Author     : Esteban
--%>

<%-- 
    Document   : maquinas
    Created on : 13 jun. 2022, 01:38:04
    Author     : Esteban
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="css/estiloHistorial.css" rel="stylesheet">
        <style>
            body{
                background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/i3.jpg");
                background-repeat: no-repeat;
                background-attachment: fixed;


            }
        </style>
        <title>Historial</title>
        <jsp:useBean id="Metodos" class="SQL.MetodosSQL" scope="page"></jsp:useBean>
        </head>
        <body>
            <div class="principal"> 
                <div class="primero">
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
                            
                            <li><a href="historial.jsp">Historial rutinas</a></li>
                            
                                <%}%>
                            <li><form action="CerrarSesion">
                                    <button type="submit" class="btnCerrar">Cerrar Sesion</button>
                                   
                                </form></li>
                        </ul>
                        <%}%>
                    </li>
                    </ul>

                  
                    <div class="segundo">

                    </div>


                </div>
            </div>

            <div class="segundo">
                <h1>HISTORIAL DE RUTINAS</h1>
            </div>
            <div class="divHistorial">
              
            <%
                HttpSession sesion=request.getSession();
                int x =(Integer)sesion.getAttribute("txtUsuario");
                ResultSet rutinasid = Metodos.mostrar_Rutinas_Id_Historial(x);

            %>




            <div class="historial">
                <h1>Historial del Cliente</h1>

                <table>
                    <tr>
                        <td><label for="id_historial">ID Rutina </label></td>
                        <td><label for="id_instructor">ID Instructor </label></td>
                        <td><label for="id_curso">ID Maquina</label></td>
                        <td><label for="fecha">Fecha </label></td>
                        <td><label for="horas">Horas </label></td>

                    </tr>
                    <%while (rutinasid.next()) {%>
                    <tr>
                        <td><label for="id_historial"><%=rutinasid.getInt("id_rutina")%> </label></td>
                        <td><label for="id_instructor"><%=rutinasid.getInt("instructor")%> </label></td>
                        <td><label for="id_surso"><%=rutinasid.getInt("maquina")%> </label></td>
                        <td><label for="fecha"><%=rutinasid.getString("fecha")%> </label></td>
                        <td><label for="horas`"><%=rutinasid.getInt("horas")%> </label></td>
                    </tr>
                    <%
                        }
                    %>



                </table>
            </div>


        </div>
    </body>
</html>