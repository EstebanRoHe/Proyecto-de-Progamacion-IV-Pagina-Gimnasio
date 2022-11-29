create database GIMNASIO;
/*-----------------------------------------------&-------------------------------------*/;
DROP TABLE  GIMNASIO.`cliente`;
select * from GIMNASIO.cliente;
DELETE FROM GIMNASIO.cliente WHERE cedula=1;
CREATE TABLE GIMNASIO.`cliente` (
 `cedula` int NOT NULL, 
 `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
   `direccion` varchar(50) DEFAULT NULL,
    `e_mail` varchar(30) DEFAULT NULL,
    `celular` int NOT NULL,
    `tel_habitacion` int NOT NULL,
   `contraseña` varchar(30) NOT NULL,
   `edad` int NOT NULL,
     `fecha` date NOT NULL,
      `pago`  varchar(30) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into GIMNASIO.cliente values (200,'maria','ruiz','ruiz','barva','maria@hotmail.com',11111111,22222222,'1',1,'1998/06/20','si');
insert into GIMNASIO.cliente values (201,'juan','paz','arias','alajuela','juan@hotmail.com','01011995',22222222,'11111111',22,'1998/06/20','si');
insert into GIMNASIO.cliente values (202,'pedro','perez','perez','alajuela','pedro@hotmail.com',20041998,33333333,'33333335',26,'1996/06/20','si');
insert into GIMNASIO.cliente values (203,'jose','castro','ruiz','santo domingo','jruiz@gmail.com',20061998,44444444,'55555555',30,'1996/06/20','si');
insert into GIMNASIO.cliente values (204,'martha','diaz','ruiz','pavas','mdiaz@yahoo.es',02012000,22222229,'33333333',31,'1990/06/20','si');
insert into GIMNASIO.cliente values (205,'xiomara','diaz','diaz','san jose','xdiaz@hotmail.com',03022000,55555555,'11111119',40,'1990/06/20','si');
insert into GIMNASIO.cliente values (206,'pablo','arias','arias','san jose','pabloz@hotmail.com',20042001,55555556,'1111112',21,'1992/06/20','si');
insert into GIMNASIO.cliente values (207,'ana','arias','arias','san pedro','arias@gmail.com',25042001,55555556,'11111115',50,'2000/06/20','si');
insert into GIMNASIO.cliente values (208,'carmen','paz','arias','san jose','carmen@gmail.com',20042002,55555556,'11111115',31,'2010/06/20','si');
insert into GIMNASIO.cliente values (209,'miguel','orias','arias','cartago','miguel@gmail.com',20082002,55555557,'11111114',28,'2015/03/02','si');
insert into GIMNASIO.cliente values (210,'julia','arias','cruz','san rafael','julian@gmail.com',20042003,55555559,'11111119',34,'2019/02/10','si');
insert into GIMNASIO.cliente values (211,'paula','castillo','reyes','belen','paula@gmail.com',15052003,66666666,77777777,21,'2020/02/10','si');
insert into GIMNASIO.cliente values (212,'david','arias','arias','san jose','darias@gmail.com',20102005,88888888,'99999999',27,'2020/02/10','si');
insert into GIMNASIO.cliente values (213,'andres','aguilar','rios','guadalupe','aaguilar@yahoo.com',10122007,99999999,'88888888',22,'2012/12/12','si');
insert into GIMNASIO.cliente values (214,'maria jose','villalta','paz','heredia','mjvillalta@gmail.com',20042011,77777777,'66666666',17,'2021/12/12','si');
insert into GIMNASIO.cliente values (215,'pablo jose','castillo','arias','san jose','pablo__josea@gmail.com',20042011,33333333,'66666666',22,'2022/01/01','si');
LOCK TABLES `cliente` WRITE;
UNLOCK TABLES;



/*-----------------------------------------------&-------------------------------------*/;
DROP TABLE  GIMNASIO.`instructores`;
select * from GIMNASIO.instructores;
CREATE TABLE GIMNASIO.`instructores` (
  `cod_instructor` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido1` varchar(30) NOT NULL,
  `apellido2` varchar(30) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `e_mail` varchar(30) DEFAULT NULL,
  `tel_cel` int NOT NULL,
  `tel_habitacion` int NOT NULL,
  `fecha_contratacion` date NOT NULL,
    `imagen` varchar(50),
  PRIMARY KEY (`cod_instructor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into GIMNASIO.instructores values(100, 'matio','jhoson','ruiz','san jose','matio@hotmail.com',11111111,22222222,'1995/01/01','img/matio.jpg');
insert into GIMNASIO.instructores values(101, 'juliana','blackz','arias','alajuela','jul@hotmail.com',22222222,11111111,'1995/01/01','img/juliana.jpg');
insert into GIMNASIO.instructores values(102, 'maria','perez','perez','alajuela','jul@hotmail.com',33333333,33333335,'1998/04/20','img/maria.jpg');
insert into GIMNASIO.instructores values(103, 'cristian','castro','ruiz','alajuela','cruiz@gmail.com',44444444,55555555,'1998/06/20','img/cristian.jpg');
insert into GIMNASIO.instructores values(104, 'margarita','mata','ruiz','pavas','mmata@yahoo.es',11111112,22222228,'2000/01/20','img/margarita.png');
insert into GIMNASIO.instructores values(105, 'shirley','ruiz','diaz','limon','sruiz@hotmail.com',22222229,33333333,'2000/03/02','img/shirley.png');
insert into GIMNASIO.instructores values(106, 'cameron','rojas','rojas','heredia','cameronk@hotmail.com',88888889,77777777,'2010/07/20','img/cameron.jpg');
insert into GIMNASIO.instructores values(107, 'patrick','ruiz','diaz','heredia','pactrick@hotmail.com',10101010,98989898,'2011/12/15','img/patrick.jpg');
insert into GIMNASIO.instructores values(110, 'sharlotte','castillo','paz','cartago','sharlotte@hotmail.com',99999999,22222233,'2010/03/05','img/sharlotte.jpg');
insert into GIMNASIO.instructores (cod_instructor,nombre,apellido1,apellido2,direccion,e_mail,tel_cel,tel_habitacion,fecha_contratacion,imagen)values();
LOCK TABLES `instructores` WRITE;
UNLOCK TABLES;

/*-----------------------------------------------&-------------------------------------*/;
DROP TABLE  GIMNASIO.`cursos`;
select * from GIMNASIO.`cursos`;
CREATE TABLE GIMNASIO.`cursos` (
  `id_curso` int NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `dias` varchar(50) NOT NULL,
  `horas` varchar(50) NOT NULL,
  `disponibilidad` varchar(50) NOT NULL,
  `imagen`  varchar(50),
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into GIMNASIO.cursos values (1,'yoga','Lunes y Jueves','8am - 3pm','Disponible','img/yoga.jpg');
insert into GIMNASIO.cursos values (2,'defensa personal','Lunes y Viernes','10am - 6pm','Disponible','img/defensa personal.jpg');
insert into GIMNASIO.cursos values (3,'kickboxing','Martes y Miercoles','6pm - 8pm','Disponible','img/king boxing.jpg');
insert into GIMNASIO.cursos values (4,'spinnig','Todos os dias','8am - 6pm','Disponible','img/spinning.jpg');
insert into GIMNASIO.cursos values (5,'taebo','Viernes y Sabado','10am - 4pm','Disponible','img/taebo.jpg');
insert into GIMNASIO.cursos values (6,'zumba','Lunes y Jueves','8am - 10am','Ocupado','img/zumba.jpg');
LOCK TABLES `cursos` WRITE;
UNLOCK TABLES;


/*-----------------------------------------------&-------------------------------------*/;
DROP TABLE  GIMNASIO.`historial_curso`;
select * from GIMNASIO.`historial_curso`;
CREATE TABLE GIMNASIO.`historial_curso` (
  `id_historial` int NOT NULL,
  `cliente` int NOT NULL,
  `instructor` int NOT NULL,
  `curso` int NOT NULL,
  `fecha` date NOT NULL,
  `horas` int NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `fk1historial_curso` (`cliente`),
  KEY `fk2historial_curso` (`instructor`),
  KEY `fk3historial_curso` (`curso`),
  CONSTRAINT `fk1historial_curso` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk2historial_curso` FOREIGN KEY (`instructor`) REFERENCES `instructores` (`cod_instructor`),
  CONSTRAINT `fk3historial_curso` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id_curso`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
DELETE FROM GIMNASIO.historial_curso WHERE  id_historial = 1 ;
UPDATE GIMNASIO.historial_curso SET cliente = 203, instructor = 101 ,curso = 2 ,fecha = "2000/02/20" , horas = 2 where id_historial = 10;
/*-----------------------------------------------&-------------------------------------*/;


DROP TABLE  GIMNASIO.`maquinas`;
select * from GIMNASIO.`maquinas`;
CREATE TABLE GIMNASIO.`maquinas` (
  `id_maquina` int NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `imagen` varchar(50) ,
  PRIMARY KEY (`id_maquina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT GIMNASIO.`maquinas`(id_maquina,descripcion,estado) values (10,'caminadora','O');
LOCK TABLES `maquinas` WRITE;
UNLOCK TABLES;
insert into GIMNASIO.maquinas values (50,'pesas','bueno','img/pesas.jpg');
insert into GIMNASIO.maquinas values (51,'mancuernas','excelente','img/mancuernas.jpg');
insert into GIMNASIO.maquinas values (52,'caminadora','regular','img/caminadora.png');
insert into GIMNASIO.maquinas values (53,'bicicleta estacionaria','excelente','img/bicicleta estacionaria.jpg');
insert into GIMNASIO.maquinas values (54,'bicicleta spinning','bueno','img/bicicleta spinning.jpg');
insert into GIMNASIO.maquinas values (55,'press de banca','regular','img/press de banca.jpg');
insert into GIMNASIO.maquinas values (56,'press de pecho','bueno','img/press de pecho.jpeg');



/*-----------------------------------------------&-------------------------------------*/;
DROP TABLE GIMNASIO.`rutinas`;
select * from GIMNASIO.`rutinas`;
CREATE TABLE GIMNASIO.`rutinas` (
  `id_rutina` int NOT NULL,
  `cliente` int NOT NULL,
  `instructor` int NOT NULL,
  `maquina` int NOT NULL,
  `fecha` date NOT NULL,
  `horas` int NOT NULL,
  PRIMARY KEY (`id_rutina`),
  KEY `fk1rutinas` (`cliente`),
  KEY `fk2rutinas` (`instructor`),
  KEY `fk3rutinas` (`maquina`),
  CONSTRAINT `fk1rutinas` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk2rutinas` FOREIGN KEY (`instructor`) REFERENCES `instructores` (`cod_instructor`),
  CONSTRAINT `fk3rutinas` FOREIGN KEY (`maquina`) REFERENCES `maquinas` (`id_maquina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into GIMNASIO.rutinas values(1,209,110,50,'2000/02/20',2);
insert into GIMNASIO.rutinas values(3,209,101,50,'2000/02/20',2);
insert into GIMNASIO.rutinas values(5,205,105,55,'2000/02/20',3);
insert into GIMNASIO.rutinas values(7,215,102,53,'2000/03/05',2);
insert into GIMNASIO.rutinas values(9,215,101,55,'2000/07/20',4);
insert into GIMNASIO.rutinas values(11,208,110,56,'2000/08/18',3);
insert into GIMNASIO.rutinas values(13,208,110,52,'2000/08/18',2);
insert into GIMNASIO.rutinas values(15,201,110,53,'2000/08/18',1);
insert into GIMNASIO.rutinas values(17,210,102,55,'2007/04/15',1);
insert into GIMNASIO.rutinas values(19,210,101,50,'2007/04/15',2);
insert into GIMNASIO.rutinas values(21,210,107,50,'2007/04/15',1);
insert into GIMNASIO.rutinas values(23,212,107,51,'2008/05/10',2);
insert into GIMNASIO.rutinas values(25,213,107,52,'2008/02/10',2);
insert into GIMNASIO.rutinas values(27,210,107,53,'2008/05/10',2);
insert into GIMNASIO.rutinas values(29,201,107,54,'2008/05/10',2);
insert into GIMNASIO.rutinas values(31,202,105,55,'2008/05/10',2);
insert into GIMNASIO.rutinas values(32,200,105,55,'2008/05/10',2);
LOCK TABLES `rutinas` WRITE;
UNLOCK TABLES;

/*-----------------------------------------------&-------------------------------------*/;







