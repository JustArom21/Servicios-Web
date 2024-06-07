-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2024 a las 14:40:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `seguimiento_salud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicador_salud`
--

CREATE TABLE `indicador_salud` (
  `ID` int(11) NOT NULL,
  `Tipo_Indicador` varchar(100) NOT NULL,
  `Valor` decimal(5,2) NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `Notas_Adicionales` text DEFAULT NULL,
  `Usuario_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `indicador_salud`
--

INSERT INTO `indicador_salud` (`ID`, `Tipo_Indicador`, `Valor`, `Fecha_Hora`, `Notas_Adicionales`, `Usuario_ID`) VALUES
(1, 'Presión Arterial', 120.50, '2023-06-01 08:30:00', 'Normal', 1),
(2, 'Frecuencia Cardíaca', 75.00, '2023-06-02 09:00:00', 'Normal', 2),
(3, 'Glucosa', 90.00, '2023-06-03 10:00:00', 'Normal', 3),
(4, 'Colesterol', 180.00, '2023-06-04 11:00:00', 'Normal', 4),
(5, 'Temperatura Corporal', 36.60, '2023-06-05 12:00:00', 'Normal', 5),
(6, 'Presión Arterial', 120.00, '2023-06-07 10:00:00', 'Normal', 1),
(7, 'Peso', 70.50, '2023-06-07 10:00:00', 'Peso ideal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meta_salud`
--

CREATE TABLE `meta_salud` (
  `ID` int(11) NOT NULL,
  `Nombre_Meta` varchar(100) NOT NULL,
  `Valor_Objetivo` decimal(5,2) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  `Usuario_ID` int(11) DEFAULT NULL,
  `Descripcion_Meta` text DEFAULT NULL,
  `Objetivo_Meta` float DEFAULT NULL,
  `Fecha_Establecimiento` date DEFAULT NULL,
  `Fecha_Cumplimiento_Esperada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `meta_salud`
--

INSERT INTO `meta_salud` (`ID`, `Nombre_Meta`, `Valor_Objetivo`, `Fecha_Inicio`, `Fecha_Fin`, `Usuario_ID`, `Descripcion_Meta`, `Objetivo_Meta`, `Fecha_Establecimiento`, `Fecha_Cumplimiento_Esperada`) VALUES
(1, 'Bajar Presión Arterial', 115.00, '2023-06-01', '2023-12-31', 1, NULL, NULL, NULL, NULL),
(2, 'Reducir Frecuencia Cardíaca', 70.00, '2023-06-01', '2023-12-31', 2, NULL, NULL, NULL, NULL),
(3, 'Mantener Niveles de Glucosa', 85.00, '2023-06-01', '2023-12-31', 3, NULL, NULL, NULL, NULL),
(4, 'Reducir Colesterol', 170.00, '2023-06-01', '2023-12-31', 4, NULL, NULL, NULL, NULL),
(5, 'Mantener Temperatura Corporal', 36.50, '2023-06-01', '2023-12-31', 5, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Genero` enum('M','F') NOT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Contrasena` varchar(255) DEFAULT NULL,
  `Altura` float DEFAULT NULL,
  `Peso` float DEFAULT NULL,
  `Contacto_Emergencia_Nombre` varchar(100) DEFAULT NULL,
  `Contacto_Emergencia_Telefono` varchar(15) DEFAULT NULL,
  `Contacto_Emergencia_Relacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `Nombre`, `Edad`, `Genero`, `Apellido`, `Fecha_Nacimiento`, `Correo_Electronico`, `Contrasena`, `Altura`, `Peso`, `Contacto_Emergencia_Nombre`, `Contacto_Emergencia_Telefono`, `Contacto_Emergencia_Relacion`) VALUES
(1, 'Juan ', 25, 'M', 'Pérez', '0000-00-00', 'durfa47@gmail.com', 'ajdufh123', 1.7, 67, 'Carlos', '3155670987', 'Papa'),
(2, 'Ana Gómez', 30, 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Carlos Martínez', 28, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'María López', 35, 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Luis Fernández', 40, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Juan', 0, '', 'Perez', '1980-01-01', 'juan.perez@example.com', 'contraseña123', 1.75, 70, 'Maria Perez', '1234567890', 'Hermana'),
(7, 'Ana', 0, '', 'Gomez', '1990-02-02', 'ana.gomez@example.com', 'contraseña456', 1.6, 60, 'Carlos Gomez', '0987654321', 'Hermano'),
(8, 'Pedro', 0, '', 'Martinez', '1985-03-03', 'pedro.martinez@example.com', 'contraseña789', 1.8, 75, 'Laura Martinez', '1122334455', 'Hermana'),
(9, 'Maria', 0, '', 'Rodriguez', '1995-04-04', 'maria.rodriguez@example.com', 'contraseña012', 1.65, 65, 'Jose Rodriguez', '2233445566', 'Hermano'),
(10, 'Carlos', 0, '', 'Garcia', '1992-05-05', 'carlos.garcia@example.com', 'contraseña345', 1.7, 72, 'Isabel Garcia', '3344556677', 'Hermana');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `indicador_salud`
--
ALTER TABLE `indicador_salud`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Usuario_ID` (`Usuario_ID`);

--
-- Indices de la tabla `meta_salud`
--
ALTER TABLE `meta_salud`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Usuario_ID` (`Usuario_ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `indicador_salud`
--
ALTER TABLE `indicador_salud`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `meta_salud`
--
ALTER TABLE `meta_salud`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `indicador_salud`
--
ALTER TABLE `indicador_salud`
  ADD CONSTRAINT `indicador_salud_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuario` (`ID`);

--
-- Filtros para la tabla `meta_salud`
--
ALTER TABLE `meta_salud`
  ADD CONSTRAINT `meta_salud_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuario` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
