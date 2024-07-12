SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `escuela`
--



CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `temario` varchar(100) NOT NULL,
  `idSalon` int(11) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO cursos VALUES
("1","ALGB2","Algebra II","1 Ejemplo para el desarrollo del reporte de RSL.pdf","1","2","1","2024-06-01","2024-07-31","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-16 21:22:17"),
("2","ADMIN","Bases de administraci&oacute;n","1 Ejemplo de reporte de RSL_Introducción, Método y Resultado.pdf","2","2","2","2024-06-20","2024-12-20","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-16 21:40:01"),
("3","Negocios","Fundamentos de administraci&oacute;n","1 Ejemplo de reporte de RSL_Introducción, Método y Resultado.pdf","1","2","3","2024-05-20","2024-06-20","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-17 22:06:02"),
("4","ANAT","Anatom&iacute;a I","1 Ejemplo para el desarrollo del reporte de RSL.pdf","3","4","6","2024-06-01","2024-09-15","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-31 21:12:33");

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;