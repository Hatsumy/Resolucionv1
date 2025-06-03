-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2025 a las 07:45:33
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
-- Base de datos: `matriculados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnoweb`
--

CREATE TABLE `alumnoweb` (
  `codiEstdWeb` int(11) NOT NULL,
  `ndniEstdWeb` varchar(50) NOT NULL,
  `appaEstdWeb` varchar(50) NOT NULL,
  `apmaEstdWeb` varchar(50) NOT NULL,
  `nombEstdWeb` varchar(50) NOT NULL,
  `fechNaciEstdWeb` date NOT NULL,
  `logiEstd` varchar(100) NOT NULL,
  `passEstd` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnoweb`
--

INSERT INTO `alumnoweb` (`codiEstdWeb`, `ndniEstdWeb`, `appaEstdWeb`, `apmaEstdWeb`, `nombEstdWeb`, `fechNaciEstdWeb`, `logiEstd`, `passEstd`) VALUES
(1, '75689638', 'Valverde', 'Valverde', 'Hatsumy', '2004-07-10', 'katumi', '$2a$12$XC1Lb6GTAg26i8entXD7heem/AYLWXsembUFBZ2Qe2OqiHVjnJt12'),
(3, '75165901', 'Aquiño', 'Valdez', 'Rodrigo', '2003-02-21', 'rod', '$2a$12$hRZU0cpS7ejUVbLXgLUqq.yfbhBRaJCXjcEo1QcHbieN1FZcKQyO6'),
(4, '70346149', 'Ponte', 'Eustaquio', 'Jesus', '2000-04-22', 'yisus', '$2a$12$GwZ6ubPnJLyKNnwgxPpbzeGxOD5TfpnRqBrOFL.5489EDwgeCKUoK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `codiClie` int(11) NOT NULL,
  `ndniClie` varchar(8) NOT NULL,
  `appaClie` varchar(50) NOT NULL,
  `apmaClie` varchar(50) NOT NULL,
  `nombClie` varchar(50) NOT NULL,
  `FechNaciClie` date NOT NULL,
  `logiClie` varchar(100) NOT NULL,
  `passClie` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`codiClie`, `ndniClie`, `appaClie`, `apmaClie`, `nombClie`, `FechNaciClie`, `logiClie`, `passClie`) VALUES
(3, '75689638', 'Valverde', 'Briceño', 'Hatsumy', '2004-07-10', 'kat', 'tvu72tEYjhboMRILKi4Y3jzl3w/5xzf96u4L1hP22lU='),
(4, '75165901', 'Aquiño', 'Valdez', 'Rodrigo', '2003-02-25', 'rod', 'liDHupFMUo9dFkx8w5PJy6huBrzguZuStZpoAcKdRAw=');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnoweb`
--
ALTER TABLE `alumnoweb`
  ADD PRIMARY KEY (`codiEstdWeb`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codiClie`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnoweb`
--
ALTER TABLE `alumnoweb`
  MODIFY `codiEstdWeb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codiClie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
