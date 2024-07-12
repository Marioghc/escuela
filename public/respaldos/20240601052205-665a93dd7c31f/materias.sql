SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `escuela`
--



CREATE TABLE `materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `temario` varchar(100) NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO materias VALUES
("1","0","Algebra II","1","1 Ejemplo para el desarrollo del reporte de RSL.pdf","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-16 21:20:30"),
("2","0","Introducci&oacute;n a la administraci&oacute;n","2","1 Ejemplo para el desarrollo del reporte de RSL.pdf","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-16 21:38:23"),
("3","0","Administraci&oacute;n","3","1 Ejemplo para el desarrollo del reporte de RSL.pdf","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-17 22:03:47"),
("4","0","Matem&aacute;tica","1","1 Ejemplo para el desarrollo del reporte de RSL.pdf","1","2024-05-18 10:33:49","0000-00-00 00:00:00","2024-05-18 10:32:43"),
("5","0","Matem&aacute;tica","1","1 Ejemplo para el desarrollo del reporte de RSL.pdf","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-18 10:34:07"),
("6","0","Anatomia","6","UPN_CPS_Semana 2 - Calidad Producto.pdf","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-31 21:10:40");

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;