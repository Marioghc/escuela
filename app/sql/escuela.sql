-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2023 a las 22:13:07
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `id` int(11) NOT NULL,
  `idClase` int(11) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `idClase` int(11) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `observacion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `catalogos`
--

CREATE TABLE `catalogos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `clave` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogos`
--

INSERT INTO `catalogos` (`id`, `tipo`, `clave`, `descripcion`) VALUES
(2, 'tipoUsuario', 2, 'Profesor'),
(3, 'tipoUsuario', 3, 'Estudiante'),
(4, 'tipoSangre', 1, 'A+'),
(5, 'tipoSangre', 2, 'A-'),
(6, 'tipoSangre', 3, 'B+'),
(7, 'tipoSangre', 4, 'B-'),
(8, 'tipoSangre', 5, 'AB+'),
(9, 'tipoSangre', 6, 'AB-'),
(10, 'tipoSangre', 7, 'O+'),
(11, 'tipoSangre', 8, 'O-'),
(12, 'genero', 1, 'Masculino'),
(13, 'genero', 2, 'Femenino'),
(14, 'genero', 3, 'Otros'),
(15, 'estado', 1, 'Activo'),
(16, 'estado', 2, 'Inactivo'),
(17, 'estado', 3, 'Baja temporal'),
(20, 'tipoUsuario', 1, 'Admon'),
(21, 'dia', 1, 'Lunes'),
(22, 'dia', 2, 'Martes'),
(23, 'dia', 3, 'Mi&eacute;rcoles'),
(24, 'dia', 4, 'Jueves'),
(25, 'dia', 5, 'Viernes'),
(26, 'dia', 6, 'S&aacute;bado'),
(27, 'tipoExamen', 1, 'Examen escrito'),
(28, 'tipoExamen', 2, 'Examen oral'),
(29, 'tipoExamen', 3, 'Trabajo'),
(30, 'tipoMaterial', 1, 'Libro'),
(31, 'tipoMaterial', 2, 'Libro electrónico'),
(32, 'tipoMaterial', 3, 'Video');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(200) NOT NULL,
  `tipoExamen` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
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
  `creado_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `idSalon` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `observacion` varchar(200) NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id` int(11) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `id` int(11) NOT NULL,
  `clave` int(11) NOT NULL,
  `tipoMaterial` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `clave` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `temario` varchar(100) NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `id` int(11) NOT NULL,
  `clave` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `nota` varchar(200) NOT NULL,
  `baja` int(11) NOT NULL,
  `baja_dt` datetime NOT NULL,
  `modificado_dt` datetime NOT NULL,
  `creado_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
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
  `calificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`id`, `tipo`, `correo`, `clave`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `genero`, `telefono`, `pais`, `ciudad`, `codpos`, `foto`, `fechaNacimiento`, `tipoSangre`, `estado`, `baja`, `login_dt`, `baja_dt`, `modificado_dt`, `creado_dt`, `calificacion`) VALUES
(1, 1, 'admon@escuela.com', 'b1dec831acb2df0c29dca095f8ae5a899df710b15edc938018979a03c2158cc2696af4023481d639590007216d99102703b99d68e638b57861137d1887a753cd', 'Francisco', 'Escuela', '', 1, '+559998223', 'M&eacute;xico', 'Ciudad de M&eacute;xico', '02710', 'avatar.png', '2004-02-10', 2, 1, 0, '2023-09-05 18:32:06', '2023-09-05 18:32:06', '2023-09-06 15:26:55', '2023-09-05 18:32:06', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `salones`
--
ALTER TABLE `salones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
