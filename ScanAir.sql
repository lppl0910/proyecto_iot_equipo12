-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-11-2024 a las 15:13:35
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
-- Base de datos: `ScanAir`
--
CREATE DATABASE IF NOT EXISTS ScanAir;
USE ScanAir;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Alcohol`
--

CREATE TABLE `Alcohol` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `ppm` float(4,2) NOT NULL,
  `idSensor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CO`
--

CREATE TABLE `CO` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `ppm` float(4,2) NOT NULL,
  `idSensor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CO2`
--

CREATE TABLE `CO2` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `ppm` float(4,2) NOT NULL,
  `idSensor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dispositivo`
--

CREATE TABLE `Dispositivo` (
  `idDispositivo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `ubicacion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Humedad`
--

CREATE TABLE `Humedad` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `porcentaje` float(3,2) NOT NULL,
  `idSensor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sensor`
--

CREATE TABLE `Sensor` (
  `idSensor` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `idDispositivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Temperatura`
--

CREATE TABLE `Temperatura` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP),
  `grados` float(4,2) NOT NULL,
  `idSensor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Alcohol`
--
ALTER TABLE `Alcohol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idSensor` (`idSensor`);

--
-- Indices de la tabla `CO`
--
ALTER TABLE `CO`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idSensor` (`idSensor`);

--
-- Indices de la tabla `CO2`
--
ALTER TABLE `CO2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idSensor` (`idSensor`);

--
-- Indices de la tabla `Dispositivo`
--
ALTER TABLE `Dispositivo`
  ADD PRIMARY KEY (`idDispositivo`);

--
-- Indices de la tabla `Humedad`
--
ALTER TABLE `Humedad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idSensor` (`idSensor`);

--
-- Indices de la tabla `Sensor`
--
ALTER TABLE `Sensor`
  ADD PRIMARY KEY (`idSensor`),
  ADD KEY `idDispositivo` (`idDispositivo`);

--
-- Indices de la tabla `Temperatura`
--
ALTER TABLE `Temperatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idSensor` (`idSensor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Alcohol`
--
ALTER TABLE `Alcohol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CO`
--
ALTER TABLE `CO`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `CO2`
--
ALTER TABLE `CO2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Dispositivo`
--
ALTER TABLE `Dispositivo`
  MODIFY `idDispositivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Humedad`
--
ALTER TABLE `Humedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Sensor`
--
ALTER TABLE `Sensor`
  MODIFY `idSensor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Temperatura`
--
ALTER TABLE `Temperatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Alcohol`
--
ALTER TABLE `Alcohol`
  ADD CONSTRAINT `alcohol_ibfk_1` FOREIGN KEY (`idSensor`) REFERENCES `Sensor` (`idSensor`);

--
-- Filtros para la tabla `CO`
--
ALTER TABLE `CO`
  ADD CONSTRAINT `co_ibfk_1` FOREIGN KEY (`idSensor`) REFERENCES `Sensor` (`idSensor`);

--
-- Filtros para la tabla `CO2`
--
ALTER TABLE `CO2`
  ADD CONSTRAINT `co2_ibfk_1` FOREIGN KEY (`idSensor`) REFERENCES `Sensor` (`idSensor`);

--
-- Filtros para la tabla `Humedad`
--
ALTER TABLE `Humedad`
  ADD CONSTRAINT `humedad_ibfk_1` FOREIGN KEY (`idSensor`) REFERENCES `Sensor` (`idSensor`);

--
-- Filtros para la tabla `Sensor`
--
ALTER TABLE `Sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`idDispositivo`) REFERENCES `Dispositivo` (`idDispositivo`);

--
-- Filtros para la tabla `Temperatura`
--
ALTER TABLE `Temperatura`
  ADD CONSTRAINT `temperatura_ibfk_1` FOREIGN KEY (`idSensor`) REFERENCES `Sensor` (`idSensor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
