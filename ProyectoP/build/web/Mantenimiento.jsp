<%-- 
    Document   : Mantenimiento
    Created on : 10 jun. 2022, 00:40:35
    Author     : Esteban
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:useBean id="Metodos" class="SQL.MetodosSQL" scope="page"></jsp:useBean>
        <head>

            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="css/estiloMantenimiento.css" rel="stylesheet">
            <title>Mantenimeinto</title>
            <style>
                body {
                    background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/i5.jpg");
                    background-repeat: no-repeat;
                    background-attachment: fixed;
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
                                <a href="index.jsp#formulario2">Contactos</a>
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
                </div>

                <ul class="login">
                    <li class="login2">
                    <%if (request.getSession().getAttribute("txtUsuario") == null) {%>
                    <a href="login.jsp" class="btnlogin">LOGIN</a>
                    <%} else {%>
                    <a href="#" class="btnlogin"><%=request.getSession().getAttribute("txtUsuario")%></a>
                    <ul>
                        <%if (request.getSession().getAttribute("Mantenimiento") == null) {%>

                        <li><a href="historial.jsp">Historial<br> rutinas</a></li>

                        <%}%>
                        <li><form action="CerrarSesion">
                                <button type="submit" class="btnCerrar">Cerrar Sesion</button>

                            </form></li>
                    </ul>
                    <%}%>
                </li>
            </ul>



            <div class="segundo">

                <div class="agregarS">
                    <div class="formularioAS">

                        <form method="post" action="RegistrarInstructores">
                            <h2>Agregar Instructores</h2>
                            <table>

                                <tr>
                                    <td><label for="codigo">Codigo de Instructor </label></td>
                                    <td><input type="number" id="codigo" name="codigo" required></td>
                                </tr>


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
                                    <td><label for="email">Email: </label></td>
                                    <td><input type="email" id="email" name="email" required></td>
                                </tr>



                                <tr>
                                    <td><label for="direccion">Direccion: </label></td>
                                    <td><input type="text" name="direccion" id="direccion" required></td>
                                </tr>



                                <tr>
                                    <td><label for="celular">Celular: </label></td>
                                    <td><input type="celular" name="celular" id="celular" required></td>
                                </tr>


                                <tr>
                                    <td><label for="telefono">Telefono de Habitacion: </label></td>
                                    <td><input type="tel" name="telefono" id="telefono" required></td>
                                </tr>


                                <tr>
                                    <td><label for="fecha">Fecha de Contratacion:</label></td>
                                    <td><input type="date" name="fecha" value="2022-07-01" min="2022-06-01" max="2099-01-01"
                                               required>
                                    </td>
                                </tr>

                                <td><label for="imageni">URL Imagen: </label></td>
                                <td><input type="text " id="imageni" name="imageni" > </td>
                                </tr>


                            </table>
                            <button type="submit">Agregar</button>    

                            <%--<input type="submit" value="Agregar" class="btn" id="btnAgregarI" >--%>
                        </form>

                    </div>

                </div>

                <div class="eliminarS">
                    <h1>Instructores</h1>
                    <div class="formularioES">
                        <form  method="post" action="EliminarInstructores">
                            <h2>Eliminar Instructores</h2>
                            <table>

                                <tr>

                                    <%
                                        ResultSet instructorE = Metodos.mostrar_Instructores_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id del instructor a Eliminar</label></td>
                                    <td><select name="codigo" id="instructor" required>
                                            <option value=""></option>
                                            <%
                                                while (instructorE.next()) {
                                            %>
                                            <option value="<%=instructorE.getInt("cod_instructor")%>"><%=instructorE.getInt("cod_instructor")%></option>
                                            <%
                                                }
                                            %>

                                        </select></td>
                                </tr>



                            </table>
                            <button type="submit">Eliminar</button>   

                            <%--<input type="submit" value="Elimar" class="btnElimarI" id="ElimarI" > --%>

                        </form>

                    </div>


                </div>

                <div class="modificarS">
                    <div class="formularioMS">
                        <form action="ModificarInstructores" method="post">
                            <h2>Modificar Instructores</h2>
                            <table>

                                <tr>
                                    <%
                                        ResultSet InstructorM = Metodos.mostrar_Instructores_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id del Instructor a Modificar</label></td>
                                    <td><select name="codigo" id="codigo" required>
                                            <option value=""></option>
                                            <%
                                                while (InstructorM.next()) {
                                            %>
                                            <option value="<%=InstructorM.getInt("cod_instructor")%>"><%=InstructorM.getInt("cod_instructor")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>

                                <tr>
                                    <td><label for="email">Email: </label></td>
                                    <td><input type="email" id="email" name="email" required></td>
                                </tr>

                                <tr>
                                    <td><label for="direccion">Direccion: </label></td>
                                    <td><input type="text" name="direccion" id="direccion" required></td>
                                </tr>

                                <tr>
                                    <td><label for="celular">Celular: </label></td>
                                    <td><input type="celular" name="celular" id="celular" required></td>
                                </tr>


                                <tr>
                                    <td><label for="telefono">Telefono de Habitacion: </label></td>
                                    <td><input type="tel" name="telefono" id="telefono" required></td>
                                </tr>

                                <td><label for="imageni">URL Imagen: </label></td>
                                <td><input type="text " id="imageni" name="imageni" > </td>
                                </tr>


                                </div>
                            </table>

                            <button type="submit">Modificar</button>
                        </form>

                    </div>

                </div>
            </div>

            <div class="tercero">
                <h1>Cursos</h1>
            </div>
            <div class="cuarto">

                <div class="agregarCT">
                    <div class="formularioCT">

                        <form method="post" action="RegistrarCursos">
                            <h2>Agregar Curso</h2>
                            <table>


                                <tr>
                                    <td><label for="codigo">Codigo de curso </label></td>
                                    <td><input type="number" id="codigo" name="codigo" required></td>
                                </tr>

                                <tr>
                                    <td><label for="descripcion">Descripcion </label></td>
                                    <td><input type="text" id="descripcion" name="descripcion" required></td>
                                </tr>

                                <tr>
                                    <td><label for="dias">Dias que se imparten </label></td>
                                    <td><input type="text" id="dias" name="dias" required></td>
                                </tr>

                                <tr>
                                    <td><label for="hora">Horario </label></td>
                                    <td><input type="text" id="hora" name="hora" required></td>
                                </tr>

                                </tr>

                                <td><label for="imageni">URL Imagen: </label></td>
                                <td><input type="text " id="imageni" name="imageni" required> </td>
                                </tr>


                            </table>

                            <button type="submit">Agregar</button>   
                            <%--<input type="submit" value="Agregar" class="btnAgregarC" id="btnAgregarC" >--%>

                        </form>

                    </div>

                </div>

                <div class="eliminarCT">
                    <div class="formularioCT">
                        <form action="EliminarCursos" method="post">
                            <h2>Eliminar Curso</h2>
                            <table>

                                <tr>
                                    <%
                                        ResultSet cursoE = Metodos.mostrar_Cursosll_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id del curso a Eliminar</label></td>
                                    <td><select name="codigo" id="instructor" required>
                                            <option value=""></option>
                                            <%
                                                while (cursoE.next()) {
                                            %>
                                            <option value="<%=cursoE.getInt("id_curso")%>"><%=cursoE.getInt("id_curso")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>


                            </table>

                            <button type="submit">Eliminar</button>
                        </form>

                    </div>

                </div>

                <div class="modificarCT">
                    <div class="formularioCT">
                        <form action="ModificarCursos" method="post">
                            <h2>Modificar Curso</h2>
                            <table>

                                <tr>
                                    <%
                                        ResultSet cursoM = Metodos.mostrar_Cursosll_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id del Curso a Modificar</label></td>
                                    <td><select name="codigo" id="codigo" required>
                                            <option value=""></option>
                                            <%
                                                while (cursoM.next()) {
                                            %>
                                            <option value="<%=cursoM.getInt("id_curso")%>"><%=cursoM.getInt("id_curso")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>


                                <tr>
                                    <td><label for="descripcion">Descripcion </label></td>
                                    <td><input type="text" id="descripcion" name="descripcion" required></td>
                                </tr>

                                <tr>
                                    <td><label for="dias">Dias que se imparten </label></td>
                                    <td><input type="text" id="dias" name="dias" required></td>
                                </tr>

                                <tr>
                                    <td><label for="hora">Horario </label></td>
                                    <td><input type="text" id="hora" name="hora" required></td>
                                </tr>

                                <td><label for="imageni">URL Imagen: </label></td>
                                <td><input type="text " id="imageni" name="imageni" required> </td>
                                </tr>

                                <tr>
                                    <td><label for="disponibilidad">Seleccione la Disponibilidad</label></td>
                                    <td><select name="disponibilidad" id="disponibilidad" required>
                                            <option value=""></option>
                                            <option value="Disponible">Disponible</option>
                                            <option value="Ocupado">Ocupado</option>

                                        </select></td>
                                </tr>



                            </table>

                            <button type="submit">Modificar</button>
                        </form>

                    </div>

                </div>




            </div>

            <div class="quinto">
                <h1>Rutinas</h1>
            </div>

            <div class="sexto">

                <div class="agregarRS">
                    <div class="formularioRS">
                        <form method="post" action="RegistrarRutinas">

                            <h2>Agregar Rutina</h2>
                            <table>






                                <tr>

                                    <%
                                        ResultSet cliente = Metodos.mostrar_Cliente_Id();
                                    %>
                                    <td><label for="id_cliente">Seleccione el ID Cliente </label></td>
                                    <td><select name="id_cliente" id="id_cliente" required>
                                            <option value=""></option>
                                            <%
                                                while (cliente.next()) {
                                            %>
                                            <option value="<%=cliente.getInt("cedula")%>"><%=cliente.getInt("cedula")%></option>
                                            <%
                                                }
                                            %>


                                        </select></td>
                                </tr>

                                <tr>

                                    <%
                                        ResultSet instructor = Metodos.mostrar_Instructores_Id();
                                    %>
                                    <td><label for="instructor">Seleccione el instructor </label></td>
                                    <td><select name="instructor" id="instructor" required>
                                            <option value=""></option>
                                            <%
                                                while (instructor.next()) {
                                            %>
                                            <option value="<%=instructor.getInt("cod_instructor")%>"><%=instructor.getInt("cod_instructor")%></option>
                                            <%
                                                }
                                            %>


                                        </select></td>
                                </tr>

                                <%
                                    ResultSet maquina = Metodos.mostrar_Maquina_Id();
                                %>
                                <tr>
                                    <td><label for="maquina">Seleccione la maquina </label></td>
                                    <td><select name="maquina" id="maquina" required>
                                            <option value=""></option>
                                            <%
                                                while (maquina.next()) {
                                            %>
                                            <option value="<%=maquina.getInt("id_maquina")%>"><%=maquina.getInt("id_maquina")%></option>
                                            <%
                                                }
                                            %>

                                        </select></td>
                                </tr>

                                <tr>
                                    <td><label for="fecha">Fecha:</label></td>
                                    <td><input type="date" name="fecha" value="2022-07-01" min="2022-06-01" max="2090-01-01" required>
                                    </td>
                                </tr>

                                <tr>
                                    <td><label for="hora">Horas que dura la rutina: </label></td>
                                    <td><input type="number" name="horas" id="horas" min="0" max="4" placeholder="1" required></td>
                                </tr>



                            </table>

                            <button type="submit">Agregar</button>
                        </form>

                    </div>

                </div>

                <div class="eliminarRS">
                    <div class="formularioRS">
                        <form action="EliminarRutinas" method=POST>
                            <h2>Eliminar Rutina</h2>
                            <table>

                                <tr>
                                    <%
                                        ResultSet rutinasE = Metodos.mostrar_Rutinas_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id de la Rutina a Eliminar</label></td>
                                    <td><select name="codigo" id="instructor" required>
                                            <option value=""></option>
                                            <%
                                                while (rutinasE.next()) {
                                            %>
                                            <option value="<%=rutinasE.getInt("id_rutina")%>"><%=rutinasE.getInt("id_rutina")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>


                            </table>

                            <button type="submit">Eliminar</button>
                        </form>

                    </div>

                </div>

                <div class="modificarRS">
                    <div class="formularioRS">
                        <form action="ModificarRutinas" method="post">
                            <h2>Modificar Rutina</h2>
                            <table>


                                <tr>
                                    <%
                                        ResultSet rutinaM = Metodos.mostrar_Rutinas_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id de la Rutina a Modificar</label></td>
                                    <td><select name="codigo" id="codigo" required>
                                            <option value=""></option>
                                            <%
                                                while (rutinaM.next()) {
                                            %>
                                            <option value="<%=rutinaM.getInt("id_rutina")%>"><%=rutinaM.getInt("id_rutina")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>



                                <tr>
                                    <%
                                        ResultSet instructorMM = Metodos.mostrar_Instructores_Id();
                                    %>
                                    <td><label for="codigoi">Seleccione el Id del Instructor a Modificar</label></td>
                                    <td><select name="codigoi" id="codigoi" required>
                                            <option value=""></option>
                                            <%
                                                while (instructorMM.next()) {
                                            %>
                                            <option value="<%=instructorMM.getInt("cod_instructor")%>"><%=instructorMM.getInt("cod_instructor")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>

                                <tr>
                                    <%
                                        ResultSet maquinaMM = Metodos.mostrar_Maquina_Id();
                                    %>
                                    <td><label for="codigom">Seleccione el Id de la Maquina Modificar</label></td>
                                    <td><select name="codigom" id="codigom" required>
                                            <option value=""></option>
                                            <%
                                                while (maquinaMM.next()) {
                                            %>
                                            <option value="<%=maquinaMM.getInt("id_maquina")%>"><%=maquinaMM.getInt("id_maquina")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>

                                <tr>
                                    <td><label for="hora">Horas que dura la rutina: </label></td>
                                    <td><input type="number" name="horas" id="horas" min="0" max="4" placeholder="1" required></td>
                                </tr>


                            </table>

                            <button type="submit">Modificar</button>
                        </form>

                    </div>

                </div>


            </div>


            <div class="setimo">
                <h1>Maquinas</h1>
            </div>

            <div class="octavo">
                <div class="agregarMO">
                    <div class="formularioMO">
                        <form action="RegistrarMaquinas" method="post">
                            <h2>Agregar Maquina</h2>
                            <table>


                                <tr>
                                    <td><label for="codigo">Codigo de la maquina </label></td>
                                    <td><input type="number" id="codigo" name="codigo" required></td>
                                </tr>

                                <tr>
                                    <td><label for="descripcion">Descripcion </label></td>
                                    <td><input type="text" id="descripcion" name="descripcion" required></td>
                                </tr>

                                <tr>
                                    <td><label for="estado">Estado de la maquina </label></td>
                                    <td><input type="text" id="estado" name="estado" required></td>
                                </tr>


                                </tr>

                                <td><label for="imageni">URN Imagen: </label></td>
                                <td><input type="text " id="imageni" name="imageni" required> </td>
                                </tr>


                            </table>

                            <button type="submit">Agregar</button>
                        </form>

                    </div>

                </div>

                <div class="eliminarMO">
                    <div class="formularioMO">
                        <form action="EliminarMaquinas" method="post">
                            <h2>Eliminar Maquina</h2>
                            <table>

                                <tr>
                                    <%
                                        ResultSet maquinaE = Metodos.mostrar_Maquina_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id de la Rutina a Eliminar</label></td>
                                    <td><select name="codigo" id="instructor" required>
                                            <option value=""></option>
                                            <%
                                                while (maquinaE.next()) {
                                            %>
                                            <option value="<%=maquinaE.getInt("id_maquina")%>"><%=maquinaE.getInt("id_maquina")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>

                            </table>

                            <button type="submit">Eliminar</button>
                        </form>

                    </div>

                </div>


                <div class="modificarMO">
                    <div class="formularioMO">
                        <form action="ModificarMaquinas" method="post">
                            <h2>Modificar Maquina</h2>
                            <table>

                                <tr>
                                    <%
                                        ResultSet maquinaM = Metodos.mostrar_Maquina_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id de la Maquina a Modificar</label></td>
                                    <td><select name="codigo" id="codigo" required>
                                            <option value=""></option>
                                            <%
                                                while (maquinaM.next()) {
                                            %>
                                            <option value="<%=maquinaM.getInt("id_maquina")%>"><%=maquinaM.getInt("id_maquina")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>

                                <tr>
                                    <td><label for="descripcion">Descripcion </label></td>
                                    <td><input type="text" id="descripcion" name="descripcion" required></td>
                                </tr>

                                <tr>
                                    <td><label for="estado">Estado de la maquina </label></td>
                                    <td><input type="text" id="estado" name="estado" required></td>
                                </tr>

                                <td><label for="imageni">URL Imagen: </label></td>
                                <td><input type="text " id="imageni" name="imageni" required> </td>
                                </tr>


                            </table>

                            <button type="submit">Modificar</button>
                        </form>

                    </div>

                </div>


            </div>

            <div class="noveno">
                <h1>Clientes</h1>
            </div>


            <div class="decima">

                <div class="formulario">
                    <form  method="post" action="Registrarse" class="formul">
                        <h2>Agregar Cliente</h2>
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
                        <button type="submit" id="suscribirse">Agregar</button>
                        <%-- <input type="submit" value="Enviar Datos" class="btn" id="btnEnviarDatos" >--%>
                    </form>

                </div>



                <div class="eliminarCD">
                    <div class="formularioCD">
                        <form action="EliminarCliente"  method="post">
                            <h2>Eliminar Cliente</h2>
                            <table>


                                <tr>
                                    <%
                                        ResultSet clienteE = Metodos.mostrar_Cliente_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id del Cliente a Eliminar</label></td>
                                    <td><select name="codigo" id="codigo" required>
                                            <option value=""></option>
                                            <%
                                                while (clienteE.next()) {
                                            %>
                                            <option value="<%=clienteE.getInt("cedula")%>"><%=clienteE.getInt("cedula")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr> 


                            </table>

                            <button type="submit">Eliminar</button>
                        </form>

                    </div>

                </div>

                <div class="modificarCD">
                    <div class="formularioCD">
                        <form action="ModificarCliente" method="post">
                            <h2>Modificar Cliente</h2>
                            <table>

                                <tr>
                                    <%
                                        ResultSet clienteM = Metodos.mostrar_Cliente_Id();
                                    %>
                                    <td><label for="codigo">Seleccione el Id del Clienet a Modificar</label></td>
                                    <td><select name="codigo" id="codigo" required>
                                            <option value=""></option>
                                            <%
                                                while (clienteM.next()) {
                                            %>
                                            <option value="<%=clienteM.getInt("cedula")%>"><%=clienteM.getInt("cedula")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>

                                <tr>
                                    <td><label for="email">Email: </label></td>
                                    <td><input type="email" id="email" name="email" required required></td>
                                </tr>



                                <tr>
                                    <td><label for="direccion">Direccion: </label></td>
                                    <td><input type="text" name="direccion" id="direccion" required></td>
                                </tr>



                                <tr>
                                    <td><label for="celular">Celular: </label></td>
                                    <td><input type="celular" name="celular" id="celular" required></td>
                                </tr>


                                <tr>
                                    <td><label for="telefono">Telefono de Habitacion: </label></td>
                                    <td><input type="tel" name="telefono" id="telefono" required></td>
                                </tr>

                                <tr>

                                    <td><label for="pagos">Seleccione Si esta al dia con los pagos</label></td>
                                    <td><select name="pagos" id="pagos" required>
                                            <option value="si">si</option>
                                            <option value="no">no</option>

                                        </select></td>
                                </tr>




                            </table>

                            <button type="submit">Modificar</button>
                        </form>

                    </div>

                </div>




            </div>

            <div class="undecima">
                <h1>Historial</h1>
            </div>


            <div class="duodecima">

                <div class="verhistorial">
                    <div class="formularioHIS">

                        <form method="post" action="registrarHistorial">
                            <h2>Agregar Historial</h2>
                            <table>

                                <tr>

                                    <%
                                        ResultSet Icurso = Metodos.mostrar_Cursos_Id();
                                    %>
                                    <td><label for="curso">Seleccione el Id del Curso a agregar</label></td>
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
                                    <%
                                        ResultSet Icliente2 = Metodos.mostrar_Cliente_Id();
                                    %>

                                    <td><label for="cliente">Seleccione el Id cliente a registrar</label></td>
                                    <td><select name="cliente" id="cliente" required>
                                            <option value=""></option>
                                            <%
                                                while (Icliente2.next()) {
                                            %>
                                            <option value="<%=Icliente2.getInt("cedula")%>"><%=Icliente2.getInt("cedula")%></option>
                                            <%
                                                }
                                            %>


                                        </select></td>
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
                                    <td><input type="date" name="fecha" id="fecha" value="2022-07-01" min="2022-06-01" max="2030-01-01" required>
                                    </td>
                                </tr>

                                <tr>
                                    <td><label for="hora">Horas a Inscribirse: </label></td>
                                    <td><input type="number" name="hora" id="hora" min="0" max="4" placeholder="1" required></td>
                                </tr>





                            </table>
                            <%--<input type="submit" value="Agregar" class="btnAgregarH" id="btnAgregarH" >--%> 
                            <button type="submit">Agregar</button>         
                        </form>

                    </div>

                </div>

                <div class="eliminarhis">
                    <div class="formularioEHS">
                        <form action="EliminarHistorial" method="post">
                            <h2>Eliminar Historial</h2>
                            <table>
                                <%
                                    ResultSet HistorialE = Metodos.mostrar_Historial_Id();

                                %>

                                <tr>

                                    <td><label for="codigo">Seleccione el Id del Historial a Eliminar</label></td>
                                    <td><select name="codigo" id="codigo" required>
                                            <option value=""></option>
                                            <%                                                while (HistorialE.next()) {
                                            %>
                                            <option value="<%=HistorialE.getInt("id_historial")%>"><%=HistorialE.getInt("id_historial")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>








                            </table>

                            <button type="submit">Eliminar</button>
                        </form>

                    </div>

                </div>

                <div class="modificarhis">
                    <div class="formularioMHS">
                        <form action="ModificarHistoriales" method="post">
                            <h2>Modificar Historial</h2>
                            <table>

                                <tr>
                                    <%
                                        ResultSet HistorialM = Metodos.mostrar_Historial_Id();

                                    %>
                                    <td><label for="codigo">Seleccione el Id del Historial a Modificar</label></td>
                                    <td><select name="codigo" id="codigo" required>
                                            <option value=""></option>
                                            <%                                                while (HistorialM.next()) {
                                            %>
                                            <option value="<%=HistorialM.getInt("id_historial")%>"><%=HistorialM.getInt("id_historial")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr> 

                                <tr>
                                    <%
                                        ResultSet clienteh = Metodos.mostrar_Cliente_Id();

                                    %>
                                    <td><label for="cliente">Seleccione el Id del cliente a Modificar </label></td>
                                    <td><select name="cliente" id="cliente" required>
                                            <option value=""></option>
                                            <%                                                while (clienteh.next()) {
                                            %>
                                            <option value="<%=clienteh.getInt("cedula")%>"><%=clienteh.getInt("cedula")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>


                                <tr>
                                    <%
                                        ResultSet cursoh = Metodos.mostrar_Cursos_Id();

                                    %>
                                    <td><label for="cursoh">Seleccione el Id del curso a Modificar </label></td>
                                    <td><select name="cursoh" id="cursoh" required>
                                            <option value=""></option>
                                            <%                                                while (cursoh.next()) {
                                            %>
                                            <option value="<%=cursoh.getInt("id_curso")%>"><%=cursoh.getInt("id_curso")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>


                                <tr>
                                    <%
                                        ResultSet intructoresh = Metodos.mostrar_Instructores_Id();

                                    %>
                                    <td><label for="intructoresh">Seleccione el Id del intructores a Modificar </label></td>
                                    <td><select name="intructoresh" id="intructoresh" required>
                                            <option value=""></option>
                                            <%                                                while (intructoresh.next()) {
                                            %>
                                            <option value="<%=intructoresh.getInt("cod_instructor")%>"><%=intructoresh.getInt("cod_instructor")%></option>
                                            <%
                                                }
                                            %>
                                        </select></td>
                                </tr>

                                <tr>
                                    <td><label for="fechah">Fecha:</label></td>
                                    <td><input type="date" name="fechah" value="2022-07-01" min="2022-06-01" max="2030-01-01" required>
                                    </td>
                                </tr>

                                <tr>
                                    <td><label for="horash">Horas que dura la rutina: </label></td>
                                    <td><input type="number" name="horash" id="horash" min="0" max="4" placeholder="1" required></td>
                                </tr>

                            </table>

                            <button type="submit">Modificar</button>
                        </form>

                    </div>

                </div>

            </div>

    </body>

</html>
