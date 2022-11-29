<%-- 
    Document   : login
    Created on : 10 jun. 2022, 00:43:40
    Author     : Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/estilologin.css" rel="stylesheet">
    <title>Login</title>
    <style>
        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("img/i1.jpg");

        }
    </style>
</head>

<body>

    <div class="formulario">
        <img src="img/3.png" alt="login">
        <div class="tabla">
            <form action="InicioSesion" method=POST>
                <table>
                    <tr>
                    <tr>
                        <td><label for="usuario">Usuario: </label></td>
                        <td><input type="number" id="usuario" name="usuario" required></td>
                    </tr>

                    <tr>
                        <td><label for="contrasena">Contraseña: </label></td>
                        <td><input type="password" id="contrasena" name="contrasena"></td>
                    </tr>


                </table>

                <button type="submit" class="btn">Ingresar</button>
            </form>
            <a href="registrar.jsp">Registrarse</a>
        <a href="index.jsp">Inicio</a>
        </div>
        

    </div>

</body>

</html>