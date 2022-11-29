<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
        <link href="css/estiloindex.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Abhaya+Libre:wght@700&display=swap" rel="stylesheet">
        <style>
            .primero{
                background-image: linear-gradient(rgba(0, 2, 0, 0.5), rgba(0, 2, 0, 0.5)),url("img/f1.jpg");
            }
            .sexta{
                background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url("img/f5.jpg");

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
                            <a href="#formulario">Contactos</a>
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
                    <img src= "img/logo.png" alt="logo">

                    <div class="dentro_segundo">
                        <h1>UNIDOS</h1>
                        <h2>En tu vida y salud. Sumate a la familia GYM'RZ</h2>
                        <a class="primerLink" href="registrar.jsp">Registrar</a>

                    </div>
                </div>

                <div class="tercero">
                    <img class="ima1" src="img/instalacioness.jpg" alt="instalacioness"><!-- imagen del logo 2 -->
                    <img class="ima2" src="img/instalaciones2.jpg" alt="instalaciones2"><!-- imagen del logo 3 -->
                    <img class="ima3" src="img/instalaciones3.jpg" alt="instalaciones3"><!-- imagen del logo 4 -->

                </div>
            </div>
            <div class="cuarto">
                <h2>HAZLO AHORA, PORQUE A VECES <br> MAÃ‘ANA SE CONVIERTE EN NUNCA</h2>
            </div>

            <div class="quinto">
                <img src="img/img5.png" alt="img5"><!-- imagen del logo 5 -->
                <div>
                    <h1>SERVICIOS</h1>
                    <p>En cada una de nuestras sedes encontramos:</p>
                    <ul>
                        <li>Clases Grupales: yoga, defensa personal ,kickboxing <br>
                           spinnig, taebo, zumba.
                           
                        </li>
                        <li>jacuzzi y cuarto de vapor.</li>
                        <li>Entrenadores profesionales graduados</li>
                        <li>Planes personalizados</li>
                    </ul>
                    <p>A su disposición no incluido en la mensualidad:</p>
                    <ul>
                        <li>Nutricionista in-house</li>
                        <li>Personal Trainer</li>
                    </ul>


                </div>
            </div>

            <div class="sexta">
                <div class="div_de_arriba">
                    <h1>ELIGE TU <br> ENTRENAMIENTO</h1>
                    <p>Ofrecemos más de 5 clases diferentes en nuestros gimnasios con variados horarios. En GYM'RZ <br>
                        Gym'RZ sabemos que todos disfrutamos de cosas diferentes, por eso queremos que mejores tu vida <br>
                        haciendo lo que te gusta.
                    </p>
                </div>
                <div class="div_abajo">
                    <p>Nuestras clases más populares son</p>
                    <table >
                        <tr>

                            <td>1<br>Yoga</td>
                            <td>2<br>Defensa personal</td>
                            <td>3<br>Kinboxing</td>
                        </tr>
                        <tr>
                            <td>4<br>Spinnig</td>
                            <td>5<br>Taebo</td>
                            <td>6<br>Zumba</td>
                        </tr>
                    </table>
                </div>

            </div>

            <div class="Ultimo_folmulario">
                <div class="primero_folmulario">
                    <h3>!Te esperamos en GYM'RZ!</h3>
                    <P>Queremos ayudarte a cumplir tus metas.</P>
                    <ul class="redes">

                        <li>

                            <a href="https://www.facebook.com/athleanx"> <img src="img/face.png" alt="facebook logo"></a>

                        </li>

                        <li>

                            <a href="https://www.instagram.com/athleanx/?hl=es"><img src="img/insta.png" alt="instagram logo"> </a>

                        </li>

                    </ul>
                    <P>Call center: +506 2400-2090 / Click para hablar por: WhatsApp <br>
                        Sabana . Escazú . Tibás . Cipreses . Heredia . Alajuela
                    </P>
                </div>

                <div class="segundo_folmulario" id="formulario">
                    <form>
                        <p>No dudes en contactarnos:</p>
                        <input type="text" id="name" name="nombre" placeholder="Nombre" required="">

                        <input type="email" id="name" name="correo" placeholder="Correo" required="">

                        <input type="tel" id="name" name="telefono" placeholder="Telefono" required="">

                        <select id="abtype"" name=" sede" required>
                            <option selected="" value="">Sedes</option>
                            <option>Alajuela</option>
                            <option >Cipreses</option>
                            <option >Escazu</option>
                            <option >Heredia</option>
                            <option >Tibas</option>
                            <option >Sabana</option>
                        </select>
 
                        <textarea name="texto" placeholder="Mensaje" required=""></textarea>
                        <br>
                        <button type="submit" class="btnenviar">Enviar</button>
                    </form>

                </div>

            </div>

            <footer>
                <p>© All rights reserved - GYM RZ Internacional 2022</p>
            </footer>




        </div>




    </body>

</html>