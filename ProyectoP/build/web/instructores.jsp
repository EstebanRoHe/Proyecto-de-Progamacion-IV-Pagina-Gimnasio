<%-- 
    Document   : instructores
    Created on : 13 jun. 2022, 00:13:43
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

        <link href="css/estiloInstructores.css" rel="stylesheet">
        <style>
            body{
                background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/ff1.jpg");
                    background-repeat: no-repeat;
                    background-attachment: fixed;
             

            }
        </style>
        <title>Instructores</title>
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
                <h1>INSTRUCTORES</h1>
            </div>
            <div class="divInstructor">

            <%
                ResultSet instN = Metodos.mostrar_Instructores_Id();
            %>

            
            <%while (instN.next()) {%>
            <div class="instructores">
                <h1>Instructor</h1>
                    <img class="ima" src="<%=instN.getString("imagen")%>">
                <table>
                    <tr>
                        <td><label for="codigo">Codigo : </label></td>
                        <td><label for="codigo"><%=instN.getInt("cod_instructor")%> </label></td>
                    </tr>

                    <tr>
                        <td><label for="nombre"> Nombre : </label></td>
                        <td><label for="nombre"> <%=instN.getString("nombre")%> </td>
                    </tr>

                    <tr>
                        <td><label for="apellido1"> Apellido 1 : </label></td>
                        <td><label for="apellido1"><%=instN.getString("apellido1")%> </label></td>
                    </tr>

                    <tr>

                        <td><label for="apellido2"> Apellido 2 : </label></td>
                        <td><label for="apellido2"> <%=instN.getString("apellido2")%> </td>
                    </tr>

                    <tr>
                        <td><label for="direccion"> Direccion : </label></td>
                        <td><label for="direccion"><%=instN.getString("direccion")%> </label></td>
                    </tr>

                    <tr>
                        <td><label for="e_mail"> E_mail : </label></td>
                        <td><label for="e_mail"> <%=instN.getString("e_mail")%> </td>   
                    </tr>

                    <tr>
                        <td><label for="tel_cel"> Celular : </label></td>
                        <td><label for="tel_cel"><%=instN.getInt("tel_cel")%> </label></td>
                    </tr>

                    <tr>

                        <td><label for="tel_habitacion"> Telefono : </label></td>
                        <td><label for="tel_habitacion"><%=instN.getInt("tel_habitacion")%> </label></td>
                    </tr>

                    <tr>
                        <td><label for="fecha_contratacion"> Fecha: </label></td>
                        <td><label for="fecha_contratacion"> <%=instN.getString("fecha_contratacion")%> </td> 
                    </tr>


                </table>
            </div>

            <%
                }
            %>
        </div>
    </body>
</html>
