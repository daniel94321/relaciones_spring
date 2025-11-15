-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2025 a las 16:24:28
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
-- Base de datos: `spring_relaciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociaciones`
--

CREATE TABLE `asociaciones` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `presidente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asociaciones`
--

INSERT INTO `asociaciones` (`id`, `nombre`, `pais`, `presidente`) VALUES
(1, 'Asociación Colombiana de Fútbol', 'Colombia', 'Presidente Ejemplo'),
(2, 'Federación Colombiana de Fútbol', 'Colombia', 'Presidente A'),
(3, 'Federación Colombiana de Fútbol', 'Colombia', 'Presidente A'),
(4, 'Federación Colombiana de Fútbol', 'Colombia', 'Presidente A'),
(5, 'Federación Colombiana de Fútbol', 'Colombia', 'Presidente A'),
(6, 'Federación Colombiana de Fútbol', 'Colombia', 'Presidente A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clubes`
--

CREATE TABLE `clubes` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `entrenador_id` bigint(20) DEFAULT NULL,
  `asociacion_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clubes`
--

INSERT INTO `clubes` (`id`, `nombre`, `entrenador_id`, `asociacion_id`) VALUES
(1, 'Club Deportivo Los Andes', 1, 1),
(2, 'Millonarios', 2, 2),
(3, 'Santa Fe', 3, 2),
(4, 'Millonarios', 4, 3),
(5, 'Santa Fe', 5, 3),
(6, 'Millonarios', 6, 4),
(7, 'Santa Fe', 7, 4),
(8, 'Millonarios', 8, 5),
(9, 'Santa Fe', 9, 5),
(10, 'Millonarios', 10, 6),
(11, 'Santa Fe', 11, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `club_competicion`
--

CREATE TABLE `club_competicion` (
  `club_id` bigint(20) NOT NULL,
  `competicion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `club_competicion`
--

INSERT INTO `club_competicion` (`club_id`, `competicion_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 3),
(3, 4),
(4, 5),
(5, 5),
(5, 6),
(6, 7),
(7, 7),
(7, 8),
(8, 9),
(9, 9),
(9, 10),
(10, 11),
(11, 11),
(11, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competiciones`
--

CREATE TABLE `competiciones` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `monto_premio` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `competiciones`
--

INSERT INTO `competiciones` (`id`, `nombre`, `monto_premio`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Liga Nacional', 5000000, '2025-01-10', '2025-05-15'),
(2, 'Copa Colombia', 3000000, '2025-07-01', '2025-11-01'),
(3, 'Copa Libertadores', 500000, '2025-01-10', '2025-06-10'),
(4, 'Liga Nacional', 200000, '2025-02-01', '2025-11-01'),
(5, 'Copa Libertadores', 500000, '2025-01-10', '2025-06-10'),
(6, 'Liga Nacional', 200000, '2025-02-01', '2025-11-01'),
(7, 'Copa Libertadores', 500000, '2025-01-10', '2025-06-10'),
(8, 'Liga Nacional', 200000, '2025-02-01', '2025-11-01'),
(9, 'Copa Libertadores', 500000, '2025-01-10', '2025-06-10'),
(10, 'Liga Nacional', 200000, '2025-02-01', '2025-11-01'),
(11, 'Copa Libertadores', 500000, '2025-01-10', '2025-06-10'),
(12, 'Liga Nacional', 200000, '2025-02-01', '2025-11-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenadores`
--

CREATE TABLE `entrenadores` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrenadores`
--

INSERT INTO `entrenadores` (`id`, `nombre`, `apellido`, `edad`, `nacionalidad`) VALUES
(1, 'Carlos', 'Gómez', 45, 'Colombiano'),
(2, 'Carlos', 'Pérez', 50, 'Colombiano'),
(3, 'Juan', 'Gómez', 45, 'Argentino'),
(4, 'Carlos', 'Pérez', 50, 'Colombiano'),
(5, 'Juan', 'Gómez', 45, 'Argentino'),
(6, 'Carlos', 'Pérez', 50, 'Colombiano'),
(7, 'Juan', 'Gómez', 45, 'Argentino'),
(8, 'Carlos', 'Pérez', 50, 'Colombiano'),
(9, 'Juan', 'Gómez', 45, 'Argentino'),
(10, 'Carlos', 'Pérez', 50, 'Colombiano'),
(11, 'Juan', 'Gómez', 45, 'Argentino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `posicion` varchar(255) DEFAULT NULL,
  `id_club` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `apellido`, `numero`, `posicion`, `id_club`) VALUES
(1, 'Juan', 'Pérez', 9, 'Delantero', 1),
(2, 'Andrés', 'Ramírez', 10, 'Mediocampista', 1),
(3, 'Luis', 'Díaz', 1, 'Arquero', 1),
(4, 'Andrés', 'López', 10, 'Delantero', 2),
(5, 'Felipe', 'Martínez', 5, 'Defensa', 2),
(6, 'Luis', 'García', 7, 'Mediocampo', 3),
(7, 'Andrés', 'López', 10, 'Delantero', 4),
(8, 'Felipe', 'Martínez', 5, 'Defensa', 4),
(9, 'Luis', 'García', 7, 'Mediocampo', 5),
(10, 'Andrés', 'López', 10, 'Delantero', 6),
(11, 'Felipe', 'Martínez', 5, 'Defensa', 6),
(12, 'Luis', 'García', 7, 'Mediocampo', 7),
(13, 'Andrés', 'López', 10, 'Delantero', 8),
(14, 'Felipe', 'Martínez', 5, 'Defensa', 8),
(15, 'Luis', 'García', 7, 'Mediocampo', 9),
(16, 'Andrés', 'López', 10, 'Delantero', 10),
(17, 'Felipe', 'Martínez', 5, 'Defensa', 10),
(18, 'Luis', 'García', 7, 'Mediocampo', 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asociaciones`
--
ALTER TABLE `asociaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clubes`
--
ALTER TABLE `clubes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrenador_id` (`entrenador_id`),
  ADD KEY `asociacion_id` (`asociacion_id`);

--
-- Indices de la tabla `club_competicion`
--
ALTER TABLE `club_competicion`
  ADD PRIMARY KEY (`club_id`,`competicion_id`),
  ADD KEY `competicion_id` (`competicion_id`);

--
-- Indices de la tabla `competiciones`
--
ALTER TABLE `competiciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_club` (`id_club`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asociaciones`
--
ALTER TABLE `asociaciones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clubes`
--
ALTER TABLE `clubes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `competiciones`
--
ALTER TABLE `competiciones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clubes`
--
ALTER TABLE `clubes`
  ADD CONSTRAINT `clubes_ibfk_1` FOREIGN KEY (`entrenador_id`) REFERENCES `entrenadores` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `clubes_ibfk_2` FOREIGN KEY (`asociacion_id`) REFERENCES `asociaciones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `club_competicion`
--
ALTER TABLE `club_competicion`
  ADD CONSTRAINT `club_competicion_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `club_competicion_ibfk_2` FOREIGN KEY (`competicion_id`) REFERENCES `competiciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_club`) REFERENCES `clubes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
