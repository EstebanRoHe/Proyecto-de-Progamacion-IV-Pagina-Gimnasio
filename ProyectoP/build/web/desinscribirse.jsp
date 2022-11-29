<%-- 
    Document   : desinscribirse
    Created on : 10 jun. 2022, 00:42:45
    Author     : Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/estilodesinscribirse.css" rel="stylesheet">
    <title>Desinscribirse</title>
    <style>
        body{
           background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url("img/i3.jpg");
           
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
                        <li><a href="desinscribirse.jsp">Desinscribirse</a></li>
                        <li><a href="cursos.jsp">Cursos</a></li>
                        <li><a href="maquinas.jsp">Maquinas</a></li>
                        <li><a href="instructores.jsp">Instructores</a></li>
                    </ul>
                </li> 
                <li>
                    <a href="blog.jsp">Blogs</a>
                </li>
               
            </ul>
        </nav>
        <a class="login" href="login.jsp">Login</a>
       </div>
       
        <div class="formulario">
            <form action="Resultado Form.jsp" method=POST>
            <table>
            <tr>
    
            <tr>
            <td><label for="cedula">Cedula: </label></td>
            <td><input type="text" id="cedula" name="cedula" required></td>
            </tr>

            <tr>
                <td><label for="fecha">Fecha:</label></td>
                <td><input type="date" name="fecha" value="2022-01-01" min="2022-01-02" max="2024-01-01"></td>
            </tr>

            <tr>
                <td><label for="descripcion">Motivo de Descripcion: </label></td>
                <td><textarea name="texto" placeholder="Mensaje" required=""></textarea></td>
                </tr>
            
            
            </table>
           
            <button type="submit">Desinscribirse</button>
            </form>
            
        </div>
        
    </body>

</html>
