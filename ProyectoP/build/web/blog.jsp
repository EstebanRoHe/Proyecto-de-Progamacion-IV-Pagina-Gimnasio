<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog</title>
    <link href="css/estiloBlog.css" rel="stylesheet">
   <style>
     body{
        background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),url("img/f6.jpg");
        
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
                        <a href="blog.jsp#formulario">Contactos</a>
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
        <div class="tercero">
            <img src="img/2.jpg" alt="img5">
            <p>
                Comer una dieta bien balanceada puede ayudarle a disminuir el riesgo de contraer varias enfermedades así­ como a mantener un peso saludable.
                Hay ciertas ocasiones en las que es particularmente importante asegurarse de seguir una dieta saludable, por ejemplo, si desea bajar de peso o si esta cuidando lo que come porque esta embarazada.
                Sin embargo, es importante comer una dieta balanceada toda su vida, sin importar que edad tenga; nunca es mal momento para hacer cambios y mejorar sus habitos alimentarios.
                <a href="https://www.bupasalud.com/salud/alimentacionsaludable#:~:text=Hacer%20cambios-,%C2%BFPor%20qu%C3%A9%20es%20importante%20una%20alimentaci%C3%B3n%20saludable%3F,y%20algunos%20tipos%20de%20c%C3%A1ncer.">Link</a>
            </p>

        </div>
        <div class="cuarto">
            <img src="img/3.jpg" alt="img5">
            <p>
                El escenario se repite cada maÃ±ana y el dilema vuelve a aparecer justo antes de someter al cuerpo a la rutina diaria de ejercicios: ¿es mejor desayunar antes o despues?

                Teniendo en cuenta que hay consenso en que la alimentacion es vital para la actividad fi­sica y que el desayuno se sigue considerando como la comida más importante del dí­a, 
                es difi­cil de entender que existan tantas opiniones contradictorias sobre una pregunta que hemos escuchado durante años.
                <a href="https://www.bbc.com/mundo/deportes-39578414">Link</a>
                
            </p>

        </div>

        <div class="quinto">
            <img src="img/4.jpg" alt="img5">
            <p>
                El rucking es una actividad que se va abriendo paso mundialmente en el ambito del fitness, a pesar de realizarse desde la antiguedad. 
                Podemos decir que su origen proviene de las famosas marchas forzadas de las legiones romanasas (magnis itineribus) y que muchos años despuess, en el siglo XIX, volvió a recuperar Napoleón.
            <a href="https://www.rs7.es/blog/si-no-te-gusta-el-cardio-prueba-el-rucking/">Link</a>
            </p>

            
        </div>

        <div class="sexta">
            <img src="img/1.jpg" alt="img5">
         <p>
            ¿Sabi­as que existe una relacion directa entre el descanso y la recuperacion y para ganar masa muscular?

            Todos los días te esfuerzas al maximo en el gimnasio preocupandote de levantar cada vez más peso, llevas la dieta al pie de la letra, 
            no comes grasas en exceso, tomas proteí­nas y varios tipos de suplementos nutricionales.
            <a href="https://www.hsnstore.com/blog/salud-y-belleza/buenos-habitos/la-importancia-del-sueno-para-ganar-masa-muscular/">Link</a>
         </p>


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
                    
                    <select id="abtype"" name=" sede" required="">
                        <option selected="" value="" disabled="" >Sedes</option>
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