SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `escuela`
--



CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `clave` varchar(500) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidoPaterno` varchar(100) NOT NULL,
  `apellidoMaterno` varchar(100) NOT NULL,
  `genero` int(11) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codpos` varchar(10) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `tipoSangre` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `baja` int(11) NOT NULL,
  `login_dt` datetime NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL,
  `calificacion` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO usuarios VALUES
("1","1","admon@escuela.com","8d6cdb0dd514b183176804fef24da83ea8c5062f182faadedf53a23297c4584fd31aa7b649335da05f62bbccc43051ed93c591e50873c3161bfe18a6f6de5c73","Francisco","Escuela","","1","+559998223","M&eacute;xico","Ciudad de M&eacute;xico","02710","avatar.png","2004-02-10","2","1","0","2023-09-05 18:32:06","2023-09-05 18:32:06","2023-09-06 15:26:55","2023-09-05 18:32:06","0"),
("2","2","n00106251@upn.pe","f050e53af1cda60b0f82706d2157726a4307006e35df76dd86468d8878ab8edd4f53cb0d2bf405befa97322260b22a79e741d9b434fc417b60b625654445a7fc","Manuel","Villarroel","Martinez","1","969489002","Per&uacute;","Lima","1234567891","","1998-09-16","8","1","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-25 11:25:48","2024-05-16 21:17:19","0"),
("3","3","hola@upn.pe","7da118ea754b274ef5e1f90f77928e123cda747dac0a5cee4ff9b9a1e392291a10e48a92a8bfde8edcbbad9871f22a98f5bebabfbf5082eb9408812478fd984b","Jos&eacute;","Ramirez","Salazar","1","969489002","Per&uacute;","Lima","10465","","1954-09-15","4","1","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-17 22:14:17","2024-05-16 21:34:37","0"),
("4","2","gustavo@upn.pe","6cd4e4e6d0d276ae1a900495dadd976186b15c1c6657c8af9c1cbcc6cffb98510e88847080b244c6ebe2c0af811f1fc5505916492861739ab2019a4faf2ff2d6","Gustavo","Mamani","Quispe","1","789456123","Per&uacute;","Lima","10485","Diagrama en blanco.jpeg","2001-12-02","1","1","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-17 22:10:10","0"),
("5","2","n00106251@upn.pe","","dab","Zenozain","osdjncvsodvjn","1","969489002","Per&uacute;","Lima","10485","Diagrama en blanco.jpeg","2001-05-10","5","1","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-18 18:32:35","0"),
("6","3","gustavo@upn.pe","","dab","Zenozain","osdjncvsodvjn","1","969489002","hola-1!!","Adi&oacute;s__!","10485","","2002-05-23","5","1","1","0000-00-00 00:00:00","2024-05-25 11:26:16","2024-05-25 11:22:13","2024-05-25 11:18:11","0"),
("7","3","n00106251@upn.pe","","Gustavo","ejnjvn","Quispe","2","969489002","hola-1!!","aloha","1234!!","","2002-05-02","0","1","1","0000-00-00 00:00:00","2024-05-31 04:00:03","2024-05-25 11:28:35","2024-05-25 11:26:50","0"),
("8","2","a@gmail.com","",".",".",".","1",".",".",".",".","Diagrama en blanco.jpeg","2024-05-25","5","1","1","0000-00-00 00:00:00","2024-05-31 04:01:13","0000-00-00 00:00:00","2024-05-25 18:53:04","0"),
("9","1","hola123@upn.pe","","ioun","ibihnb","ohboh","1","+51969489002","kjboj","ojnbo","98162","","2004-01-07","6","1","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-31 05:24:08","2024-05-31 04:36:15","0"),
("10","1","anothervilla@gmail.com","f050e53af1cda60b0f82706d2157726a4307006e35df76dd86468d8878ab8edd4f53cb0d2bf405befa97322260b22a79e741d9b434fc417b60b625654445a7fc","Manuel","Villarroel","Martinez","1","969489002","Venezuela","Caracas","15089","wordcloud (1).png","1998-09-16","7","1","0","0000-00-00 00:00:00","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-31 21:08:54","0");

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;