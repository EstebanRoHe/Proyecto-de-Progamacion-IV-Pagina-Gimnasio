<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <jsp:useBean id="Metodos" class="SQL.MetodosSQL" scope="page"></jsp:useBean>
    <title>Inscribirse</title>
    <link href="css/estiloInscribirse.css" rel="stylesheet">
    <style>
        body{
           background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url("img/i4.jpg");
           
        }
      </style>
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

        </div>


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
            
        <div class="segundo">
            <h1>Inscribirse</h1>
        </div>

        <div class="tercero">
            <div class="agregarRS">
                <div class="formularioRS">
                    <form action="RegistrarRutinas" method=POST>
                        <h2> Inscribirse en Rutina</h2>
                        <table>
                          

                            <tr>
                                <td><label for="id_cliente">Id cliente</label></td>
                                <td><input type="number" id="id_cliente" name="id_cliente" required></td>
                            </tr>

                           
                            <tr>

                                    <%
                                        ResultSet Iinstructor = Metodos.mostrar_Instructores_Id();
                                    %>
                                    <td><label for="instructor">Seleccione el Id del Instructor a Inscribir</label></td>
                                    <td><select name="instructor" id="instructor" required>
                                            <option value=""></option>
                                            <%
                                                while (Iinstructor.next()) {
                                            %>
                                            <option value="<%=Iinstructor.getInt("cod_instructor")%>"><%=Iinstructor.getInt("cod_instructor")%></option>
                                            <%
                                                }
                                            %>


                                        </select></td>
                                </tr>

                          
                             <tr>

                                    <%
                                        ResultSet Imaquina = Metodos.mostrar_Maquina_Id();
                                    %>
                                    <td><label for="maquina">Seleccione el Id de la Maquina a Inscribir</label></td>
                                    <td><select name="maquina" id="maquina" required>
                                            <option value=""></option>
                                            <%
                                                while (Imaquina.next()) {
                                            %>
                                            <option value="<%=Imaquina.getInt("id_maquina")%>"><%=Imaquina.getInt("id_maquina")%></option>
                                            <%
                                                }
                                            %>


                                        </select></td>
                                </tr>

                            <tr>
                                <td><label for="fecha">Fecha de Inicio:</label></td>
                                <td><input type="date" name="fecha" value="2022-07-01" min="2022-06-01" max="2090-01-01" required>
                                </td>
                            </tr>

                            <tr>
                                <td><label for="hora">Horas que dura la rutina: </label></td>
                                <td><input type="number" name="horas" id="horas" min="0" max="4" placeholder="1" required></td>
                            </tr>



                        </table>

                        <button type="submit">Inscribirse</button>
                    </form>

                </div>

            </div>


            <div class="agregarCT">
                <div class="formularioCT">
                    <form action="registrarHistorial" method="post">
                        <h2>Inscribirse en Curso</h2>
                        <table>

                               <tr>
 
                                    <%
                                        ResultSet Icurso = Metodos.mostrar_Cursos_Id();
                                    %>
                                    <td><label for="curso">Seleccione el Id del Curso a Inscribir</label></td>
                                    <td><select name="curso" id="curso" required>
                                             <option value=""></option>
                                            <%
                                                while (Icurso.next()) {
                                            %>
                                            <option value="<%=Icurso.getInt("id_curso")%>"><%=Icurso.getInt("id_curso")%></option>
                                            <%
                                                }
                                            %>


                                        </select></td>
                                </tr>
                                
                                 <tr>
                                <td><label for="cliente">Id cliente</label></td>
                                <td><input type="number" id="cliente" name="cliente" required></td>
                            </tr>
                            
                                 <tr>
                                    <%
                                        ResultSet Icurso2 = Metodos.mostrar_Instructores_Id();
                                    %>
                                   
                                    <td><label for="instructor">Seleccione el Id del Instructor a Inscribir</label></td>
                                    <td><select name="instructor" id="instructor" required>
                                            <option value=""></option>
                                            <%
                                                while (Icurso2.next()) {
                                            %>
                                            <option value="<%=Icurso2.getInt("cod_instructor")%>"><%=Icurso2.getInt("cod_instructor")%></option>
                                            <%
                                                }
                                            %>


                                        </select></td>
                                </tr>
                                
                                <tr>
                                <td><label for="fecha">Fecha de Inicio:</label></td>
                                <td><input type="date" name="fecha" id="fecha" value="2022-07-01" min="2022-06-01" max="2090-01-01" required>
                                </td>
                            </tr>
                                
                            <tr>
                                <td><label for="hora">Horas a Inscribirse: </label></td>
                                <td><input type="number" name="hora" id="hora" min="0" max="4" placeholder="1" required></td>
                            </tr>




                        </table>

                        <button type="submit">Inscribirse</button>
                    </form>

                </div>

            </div>

        </div>
    </div>

</body>


</html>