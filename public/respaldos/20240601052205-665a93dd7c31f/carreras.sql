SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `escuela`
--



CREATE TABLE `carreras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO carreras VALUES
("1","Ingenier&iacute;a","Ingenier&iacute;a en Sistemas Computacionales","0","0000-00-00 00:00:00","2024-05-16 21:19:52","2024-05-16 21:18:45"),
("2","ING2","Ingenier&iacute;a Industrial","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-16 21:37:24"),
("3","ADMIN","Administraci&oacute;n de Negocios","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-17 22:02:38"),
("4","IGN1","Ingenier&iacute;a Qu&iacute;mica","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-17 22:26:29"),
("5","IGNQ","Ingenier&iacute;a Qu&iacute;mica","1","2024-05-31 21:10:04","0000-00-00 00:00:00","2024-05-31 21:09:55"),
("6","MED","MEDICINA","0","0000-00-00 00:00:00","0000-00-00 00:00:00","2024-05-31 21:10:13");

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;