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

        <link href="css/estiloMaquinas.css" rel="stylesheet">
        <style>
            body{
                background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/ff2.jpg");
                    background-repeat: no-repeat;
                    background-attachment: fixed;
             

            }
        </style>
        <title>Maquinas</title>
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
                <h1>MAQUINAS</h1>
            </div>
            <div class="divMaquinas">

            <%
                ResultSet maquinaN = Metodos.mostrar_Maquina_Id();
            %>

            
            <%while (maquinaN.next()) {%>
            <div class="maquinas">
                <h1>Maquina</h1>
                
                       <img class="ima" src="<%=maquinaN.getString("imagen")%>">
                <table>
                    <tr>
                        <td><label for="codigo">Codigo : </label></td>
                        <td><label for="codigo"><%=maquinaN.getInt("id_maquina")%> </label></td>
                    </tr>

                    <tr>
                        <td><label for="nombre"> Descripcion: </label></td>
                        <td><label for="nombre"> <%=maquinaN.getString("descripcion")%> </td>
                    </tr>

                    <tr>
                        <td><label for="apellido1"> Estado: </label></td>
                        <td><label for="apellido1"><%=maquinaN.getString("estado")%> </label></td>
                    </tr>

               
                    


                </table>
            </div>

            <%
                }
            %>
        </div>
    </body>
</html>
