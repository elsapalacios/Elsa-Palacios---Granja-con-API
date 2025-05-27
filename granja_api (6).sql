-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2025 a las 04:17:21
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
-- Base de datos: `granja_api`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentacion`
--

CREATE TABLE `alimentacion` (
  `id_alimentacion` char(36) NOT NULL DEFAULT uuid(),
  `id_especie` char(36) NOT NULL,
  `tipo_alimento` varchar(100) NOT NULL,
  `cantidad_gramos` decimal(10,2) NOT NULL,
  `fecha_alimentacion` date NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alimentacion`
--

INSERT INTO `alimentacion` (`id_alimentacion`, `id_especie`, `tipo_alimento`, `cantidad_gramos`, `fecha_alimentacion`, `fecha_creacion`) VALUES
('1', '1', 'Alimento balanceado para vacas', 5000.00, '2024-06-01', '2025-05-23 00:35:29'),
('10', '10', 'Heno de pasto', 3500.00, '2024-06-05', '2025-05-23 00:35:29'),
('2', '2', 'Maíz molido', 2000.00, '2024-06-01', '2025-05-23 00:35:29'),
('3', '3', 'Heno de alfalfa', 3000.00, '2024-06-02', '2025-05-23 00:35:29'),
('4', '4', 'Alimento concentrado para cabras', 2500.00, '2024-06-02', '2025-05-23 00:35:29'),
('5', '5', 'Alimento para cerdos', 4000.00, '2024-06-03', '2025-05-23 00:35:29'),
('6', '6', 'Avena y heno', 3000.00, '2024-06-03', '2025-05-23 00:35:29'),
('7', '7', 'Alimento para patos', 1500.00, '2024-06-04', '2025-05-23 00:35:29'),
('8', '8', 'Alimento para pavos', 1800.00, '2024-06-04', '2025-05-23 00:35:29'),
('9', '9', 'Jarabe de azúcar', 500.00, '2024-06-05', '2025-05-23 00:35:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animales`
--

CREATE TABLE `animales` (
  `id_animal` char(36) NOT NULL DEFAULT uuid(),
  `nombre_cientifico` varchar(100) NOT NULL,
  `nombre_comun` varchar(100) DEFAULT NULL,
  `id_especie` char(36) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` enum('Sano','Enfermo','Recuperación') DEFAULT 'Sano',
  `descripcion` text DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `animales`
--

INSERT INTO `animales` (`id_animal`, `nombre_cientifico`, `nombre_comun`, `id_especie`, `edad`, `ubicacion`, `estado`, `descripcion`, `fecha_registro`, `fecha_creacion`) VALUES
('1', 'Bos taurus', 'Vaca Holstein', '1', 4, 'Corral Norte', 'Sano', 'Vaca lechera de alta producción', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('10', 'Lama glama', 'Llama', '10', 4, 'Pastizal Oeste', 'Sano', 'Llama para producción de fibra', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('2', 'Gallus gallus domesticus', 'Gallina Rhode Island', '2', 2, 'Gallinero 1', 'Sano', 'Ponedora de huevos marrones', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('3', 'Ovis aries', 'Oveja Merino', '3', 3, 'Pastizal Este', 'Sano', 'Producción de lana fina', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('4', 'Capra hircus', 'Cabra Saanen', '4', 2, 'Corral de Cabras', 'Sano', 'Cabra lechera blanca', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('5', 'Sus scrofa domesticus', 'Cerdo Duroc', '5', 1, 'Chiquero 2', 'Sano', 'Cerdo para engorde', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('6', 'Equus ferus caballus', 'Caballo Criollo', '6', 5, 'Establo Principal', 'Sano', 'Caballo para paseos', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('7', 'Anas platyrhynchos domesticus', 'Pato Pekín', '7', 1, 'Estanque 1', 'Sano', 'Pato para producción de carne', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('8', 'Meleagris gallopavo', 'Pavo Bronceado', '8', 2, 'Corral de Aves', 'Sano', 'Pavo para festividades', '2025-05-23 00:30:50', '2025-05-23 00:30:50'),
('9', 'Apis mellifera', 'Abeja Europea', '9', 1, 'Colmenar 1', 'Sano', 'Colmena productora de miel', '2025-05-23 00:30:50', '2025-05-23 00:30:50');

--
-- Disparadores `animales`
--
DELIMITER $$
CREATE TRIGGER `auditoria_animales_delete` AFTER DELETE ON `animales` FOR EACH ROW BEGIN
    INSERT INTO Auditoria (
        tabla_afectada, 
        id_registro_afectado, 
        tipo_operacion, 
        valores_anteriores, 
        direccion_ip
    )
    VALUES (
        'animales', 
        OLD.id_animal, 
        'DELETE', 
        JSON_OBJECT(
            'nombre_cientifico', OLD.nombre_cientifico,
            'nombre_comun', OLD.nombre_comun,
            'id_especie', OLD.id_especie,
            'edad', OLD.edad,
            'ubicacion', OLD.ubicacion,
            'estado', OLD.estado,
            'descripcion', OLD.descripcion
        ),
        COALESCE(@user_ip, '127.0.0.1')
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria_animales_insert` AFTER INSERT ON `animales` FOR EACH ROW BEGIN
    INSERT INTO Auditoria (
        tabla_afectada, 
        id_registro_afectado, 
        tipo_operacion, 
        valores_nuevos, 
        direccion_ip
    )
    VALUES (
        'animales', 
        NEW.id_animal, 
        'INSERT', 
        JSON_OBJECT(
            'nombre_cientifico', NEW.nombre_cientifico,
            'nombre_comun', NEW.nombre_comun,
            'id_especie', NEW.id_especie,
            'edad', NEW.edad,
            'ubicacion', NEW.ubicacion,
            'estado', NEW.estado,
            'descripcion', NEW.descripcion
        ),
        -- Esto debería ser reemplazado por la IP real en tu aplicación
        COALESCE(@user_ip, '127.0.0.1')
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria_animales_update` AFTER UPDATE ON `animales` FOR EACH ROW BEGIN
    INSERT INTO Auditoria (
        tabla_afectada, 
        id_registro_afectado, 
        tipo_operacion, 
        valores_anteriores, 
        valores_nuevos, 
        direccion_ip
    )
    VALUES (
        'animales', 
        NEW.id_animal, 
        'UPDATE', 
        JSON_OBJECT(
            'nombre_cientifico', OLD.nombre_cientifico,
            'nombre_comun', OLD.nombre_comun,
            'id_especie', OLD.id_especie,
            'edad', OLD.edad,
            'ubicacion', OLD.ubicacion,
            'estado', OLD.estado,
            'descripcion', OLD.descripcion
        ),
        JSON_OBJECT(
            'nombre_cientifico', NEW.nombre_cientifico,
            'nombre_comun', NEW.nombre_comun,
            'id_especie', NEW.id_especie,
            'edad', NEW.edad,
            'ubicacion', NEW.ubicacion,
            'estado', NEW.estado,
            'descripcion', NEW.descripcion
        ),
        COALESCE(@user_ip, '127.0.0.1')
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_animales_after_delete` AFTER DELETE ON `animales` FOR EACH ROW BEGIN
  UPDATE especies
    SET cantidad_actual = cantidad_actual - 1
  WHERE id_especie = OLD.id_especie;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_animales_after_insert` AFTER INSERT ON `animales` FOR EACH ROW BEGIN
  UPDATE especies
    SET cantidad_actual = cantidad_actual + 1
  WHERE id_especie = NEW.id_especie;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_animales_after_update` AFTER UPDATE ON `animales` FOR EACH ROW BEGIN
  IF OLD.id_especie <> NEW.id_especie THEN
    -- restar de la antigua
    UPDATE especies
      SET cantidad_actual = cantidad_actual - 1
    WHERE id_especie = OLD.id_especie;
    -- sumar a la nueva
    UPDATE especies
      SET cantidad_actual = cantidad_actual + 1
    WHERE id_especie = NEW.id_especie;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` char(36) NOT NULL DEFAULT uuid(),
  `tabla_afectada` varchar(50) NOT NULL,
  `id_registro_afectado` char(36) NOT NULL,
  `tipo_operacion` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `valores_anteriores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`valores_anteriores`)),
  `valores_nuevos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`valores_nuevos`)),
  `id_usuario` char(36) DEFAULT NULL,
  `direccion_ip` varchar(45) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id_auditoria`, `tabla_afectada`, `id_registro_afectado`, `tipo_operacion`, `valores_anteriores`, `valores_nuevos`, `id_usuario`, `direccion_ip`, `fecha_hora`) VALUES
('1b1214a8-376d-11f0-bf9a-088fc37b4c7c', 'especies', '1', 'INSERT', NULL, '{\"nombre_especie\": \"Bos taurus\", \"descripcion\": \"Ganado vacuno para producción de leche y carne\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b12162a-376d-11f0-bf9a-088fc37b4c7c', 'especies', '2', 'INSERT', NULL, '{\"nombre_especie\": \"Gallus gallus domesticus\", \"descripcion\": \"Gallinas ponedoras de huevos\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b1216d0-376d-11f0-bf9a-088fc37b4c7c', 'especies', '3', 'INSERT', NULL, '{\"nombre_especie\": \"Ovis aries\", \"descripcion\": \"Ovejas para producción de lana y carne\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b121762-376d-11f0-bf9a-088fc37b4c7c', 'especies', '4', 'INSERT', NULL, '{\"nombre_especie\": \"Capra hircus\", \"descripcion\": \"Cabras para producción de leche\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b1217fc-376d-11f0-bf9a-088fc37b4c7c', 'especies', '5', 'INSERT', NULL, '{\"nombre_especie\": \"Sus scrofa domesticus\", \"descripcion\": \"Cerdos para producción de carne\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b121889-376d-11f0-bf9a-088fc37b4c7c', 'especies', '6', 'INSERT', NULL, '{\"nombre_especie\": \"Equus ferus caballus\", \"descripcion\": \"Caballos para trabajo y recreación\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b121918-376d-11f0-bf9a-088fc37b4c7c', 'especies', '7', 'INSERT', NULL, '{\"nombre_especie\": \"Anas platyrhynchos domesticus\", \"descripcion\": \"Patos para producción de huevos y carne\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b121a64-376d-11f0-bf9a-088fc37b4c7c', 'especies', '8', 'INSERT', NULL, '{\"nombre_especie\": \"Meleagris gallopavo\", \"descripcion\": \"Pavos para producción de carne\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b121afc-376d-11f0-bf9a-088fc37b4c7c', 'especies', '9', 'INSERT', NULL, '{\"nombre_especie\": \"Apis mellifera\", \"descripcion\": \"Abejas para producción de miel\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('1b121b8b-376d-11f0-bf9a-088fc37b4c7c', 'especies', '10', 'INSERT', NULL, '{\"nombre_especie\": \"Lama glama\", \"descripcion\": \"Llamas para producción de lana\"}', NULL, '127.0.0.1', '2025-05-23 00:30:19'),
('2dc1d5b0-376d-11f0-bf9a-088fc37b4c7c', 'animales', '1', 'INSERT', NULL, '{\"nombre_cientifico\": \"Bos taurus\", \"nombre_comun\": \"Vaca Holstein\", \"id_especie\": \"1\", \"edad\": 4, \"ubicacion\": \"Corral Norte\", \"estado\": \"Sano\", \"descripcion\": \"Vaca lechera de alta producción\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc1d7aa-376d-11f0-bf9a-088fc37b4c7c', 'animales', '2', 'INSERT', NULL, '{\"nombre_cientifico\": \"Gallus gallus domesticus\", \"nombre_comun\": \"Gallina Rhode Island\", \"id_especie\": \"2\", \"edad\": 2, \"ubicacion\": \"Gallinero 1\", \"estado\": \"Sano\", \"descripcion\": \"Ponedora de huevos marrones\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc1d8c9-376d-11f0-bf9a-088fc37b4c7c', 'animales', '3', 'INSERT', NULL, '{\"nombre_cientifico\": \"Ovis aries\", \"nombre_comun\": \"Oveja Merino\", \"id_especie\": \"3\", \"edad\": 3, \"ubicacion\": \"Pastizal Este\", \"estado\": \"Sano\", \"descripcion\": \"Producción de lana fina\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc1faa1-376d-11f0-bf9a-088fc37b4c7c', 'animales', '4', 'INSERT', NULL, '{\"nombre_cientifico\": \"Capra hircus\", \"nombre_comun\": \"Cabra Saanen\", \"id_especie\": \"4\", \"edad\": 2, \"ubicacion\": \"Corral de Cabras\", \"estado\": \"Sano\", \"descripcion\": \"Cabra lechera blanca\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc1fe03-376d-11f0-bf9a-088fc37b4c7c', 'animales', '5', 'INSERT', NULL, '{\"nombre_cientifico\": \"Sus scrofa domesticus\", \"nombre_comun\": \"Cerdo Duroc\", \"id_especie\": \"5\", \"edad\": 1, \"ubicacion\": \"Chiquero 2\", \"estado\": \"Sano\", \"descripcion\": \"Cerdo para engorde\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc219fd-376d-11f0-bf9a-088fc37b4c7c', 'animales', '6', 'INSERT', NULL, '{\"nombre_cientifico\": \"Equus ferus caballus\", \"nombre_comun\": \"Caballo Criollo\", \"id_especie\": \"6\", \"edad\": 5, \"ubicacion\": \"Establo Principal\", \"estado\": \"Sano\", \"descripcion\": \"Caballo para paseos\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc21bad-376d-11f0-bf9a-088fc37b4c7c', 'animales', '7', 'INSERT', NULL, '{\"nombre_cientifico\": \"Anas platyrhynchos domesticus\", \"nombre_comun\": \"Pato Pekín\", \"id_especie\": \"7\", \"edad\": 1, \"ubicacion\": \"Estanque 1\", \"estado\": \"Sano\", \"descripcion\": \"Pato para producción de carne\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc21cee-376d-11f0-bf9a-088fc37b4c7c', 'animales', '8', 'INSERT', NULL, '{\"nombre_cientifico\": \"Meleagris gallopavo\", \"nombre_comun\": \"Pavo Bronceado\", \"id_especie\": \"8\", \"edad\": 2, \"ubicacion\": \"Corral de Aves\", \"estado\": \"Sano\", \"descripcion\": \"Pavo para festividades\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc21dfd-376d-11f0-bf9a-088fc37b4c7c', 'animales', '9', 'INSERT', NULL, '{\"nombre_cientifico\": \"Apis mellifera\", \"nombre_comun\": \"Abeja Europea\", \"id_especie\": \"9\", \"edad\": 1, \"ubicacion\": \"Colmenar 1\", \"estado\": \"Sano\", \"descripcion\": \"Colmena productora de miel\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('2dc21f27-376d-11f0-bf9a-088fc37b4c7c', 'animales', '10', 'INSERT', NULL, '{\"nombre_cientifico\": \"Lama glama\", \"nombre_comun\": \"Llama\", \"id_especie\": \"10\", \"edad\": 4, \"ubicacion\": \"Pastizal Oeste\", \"estado\": \"Sano\", \"descripcion\": \"Llama para producción de fibra\"}', NULL, '127.0.0.1', '2025-05-23 00:30:50'),
('3730aabb-380c-11f0-ab6f-088fc37b4c7c', 'especies', 'd462f5fe-380b-11f0-ab6f-088fc37b4c7c', 'DELETE', '{\"nombre_especie\": \"Deiner\", \"descripcion\": \"Muy inteligente\"}', NULL, NULL, '127.0.0.1', '2025-05-23 19:29:16'),
('5ec0682c-380b-11f0-ab6f-088fc37b4c7c', 'especies', '1', 'UPDATE', '{\"nombre_especie\": \"Bos taurus\", \"descripcion\": \"Ganado vacuno para producción de leche y carne\"}', '{\"nombre_especie\": \"Bos taurus\", \"descripcion\": \"Ganado vacuno para producción de leche y carne\"}', NULL, '127.0.0.1', '2025-05-23 19:23:13'),
('73af4304-380b-11f0-ab6f-088fc37b4c7c', 'especies', '73af3507-380b-11f0-ab6f-088fc37b4c7c', 'INSERT', NULL, '{\"nombre_especie\": \"Laura\", \"descripcion\": \"Se enoja por todo.\"}', NULL, '127.0.0.1', '2025-05-23 19:23:48'),
('8025ee35-380b-11f0-ab6f-088fc37b4c7c', 'especies', '73af3507-380b-11f0-ab6f-088fc37b4c7c', 'DELETE', '{\"nombre_especie\": \"Laura\", \"descripcion\": \"Se enoja por todo.\"}', NULL, NULL, '127.0.0.1', '2025-05-23 19:24:09'),
('c8b771b2-380b-11f0-ab6f-088fc37b4c7c', 'especies', '1', 'UPDATE', '{\"nombre_especie\": \"Bos taurus\", \"descripcion\": \"Ganado vacuno para producción de leche y carne\"}', '{\"nombre_especie\": \"Bos taurus\", \"descripcion\": \"Ganado vacuno para producción de leche y carne\"}', NULL, '127.0.0.1', '2025-05-23 19:26:11'),
('cac63738-380b-11f0-ab6f-088fc37b4c7c', 'especies', '1', 'UPDATE', '{\"nombre_especie\": \"Bos taurus\", \"descripcion\": \"Ganado vacuno para producción de leche y carne\"}', '{\"nombre_especie\": \"Bos taurus\", \"descripcion\": \"Ganado vacuno para producción de leche y carne\"}', NULL, '127.0.0.1', '2025-05-23 19:26:14'),
('d46309e9-380b-11f0-ab6f-088fc37b4c7c', 'especies', 'd462f5fe-380b-11f0-ab6f-088fc37b4c7c', 'INSERT', NULL, '{\"nombre_especie\": \"Deiner\", \"descripcion\": \"Muy inteligente\"}', NULL, '127.0.0.1', '2025-05-23 19:26:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costos`
--

CREATE TABLE `costos` (
  `id_costo` char(36) NOT NULL DEFAULT uuid(),
  `tipo_costo` enum('Alimentación','Salud','Mantenimiento','Salarios','Otro') NOT NULL,
  `descripcion` text NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `id_empleado` char(36) DEFAULT NULL,
  `id_animal` char(36) DEFAULT NULL,
  `id_especie` char(36) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `costos`
--

INSERT INTO `costos` (`id_costo`, `tipo_costo`, `descripcion`, `monto`, `fecha`, `id_empleado`, `id_animal`, `id_especie`, `fecha_creacion`) VALUES
('1', 'Alimentación', 'Compra de alimento para vacas', 2500.00, '2024-01-05', '9', NULL, '1', '2025-05-23 00:38:01'),
('10', 'Alimentación', 'Compra de heno para caballos', 1800.00, '2024-06-03', '9', NULL, '6', '2025-05-23 00:38:01'),
('2', 'Salud', 'Vacunas para el ganado', 1800.00, '2024-01-10', NULL, NULL, '1', '2025-05-23 00:38:01'),
('3', 'Mantenimiento', 'Reparación de cercas', 3200.00, '2024-02-15', '5', NULL, NULL, '2025-05-23 00:38:01'),
('4', 'Salarios', 'Pago de nómina enero', 45000.00, '2024-02-01', NULL, NULL, NULL, '2025-05-23 00:38:01'),
('5', 'Alimentación', 'Compra de maíz para aves', 1500.00, '2024-03-08', '9', NULL, '2', '2025-05-23 00:38:01'),
('6', 'Salud', 'Tratamiento para oveja enferma', 650.00, '2024-03-20', NULL, '3', NULL, '2025-05-23 00:38:01'),
('7', 'Otro', 'Compra de herramientas', 1200.00, '2024-04-10', NULL, NULL, NULL, '2025-05-23 00:38:01'),
('8', 'Salarios', 'Pago de nómina abril', 45000.00, '2024-05-01', NULL, NULL, NULL, '2025-05-23 00:38:01'),
('9', 'Mantenimiento', 'Reparación de equipo de ordeño', 2800.00, '2024-05-15', '5', NULL, NULL, '2025-05-23 00:38:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` char(36) NOT NULL DEFAULT uuid(),
  `nombre` varchar(100) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_contratacion` date NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `rol`, `telefono`, `fecha_contratacion`, `salario`, `fecha_creacion`) VALUES
('1', 'Catalina López', 'Veterinario', '5551234567', '2023-01-15', 25000.00, '2025-05-23 00:34:15'),
('10', 'Elena Castro', 'Administradora', '5550123456', '2023-10-25', 22000.00, '2025-05-23 00:34:15'),
('2', 'María González', 'Granjero', '5552345678', '2023-02-20', 18000.00, '2025-05-23 00:34:15'),
('3', 'Carlos López', 'Ordeñador', '5553456789', '2023-03-10', 15000.00, '2025-05-23 00:34:15'),
('4', 'Ana Martínez', 'Cuidado de Aves', '5554567890', '2023-04-05', 16000.00, '2025-05-23 00:34:15'),
('5', 'Pedro Sánchez', 'Mantenimiento', '5555678901', '2023-05-12', 17000.00, '2025-05-23 00:34:15'),
('6', 'Laura Ramírez', 'Apicultor', '5556789012', '2023-06-18', 19000.00, '2025-05-23 00:34:15'),
('7', 'José Hernández', 'Pastor', '5557890123', '2023-07-22', 16500.00, '2025-05-23 00:34:15'),
('8', 'Sofía Díaz', 'Asistente Veterinario', '5558901234', '2023-08-30', 20000.00, '2025-05-23 00:34:15'),
('9', 'Miguel Torres', 'Encargado de Alimentación', '5559012345', '2023-09-14', 17500.00, '2025-05-23 00:34:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especies`
--

CREATE TABLE `especies` (
  `id_especie` char(36) NOT NULL DEFAULT uuid(),
  `nombre_especie` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad_actual` int(11) NOT NULL DEFAULT 0,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especies`
--

INSERT INTO `especies` (`id_especie`, `nombre_especie`, `descripcion`, `cantidad_actual`, `fecha_creacion`) VALUES
('1', 'Bos taurus', 'Ganado vacuno para producción de leche y carne', 35, '2025-05-23 00:30:19'),
('10', 'Lama glama', 'Llamas para producción de lana', 0, '2025-05-23 00:30:19'),
('2', 'Gallus gallus domesticus', 'Gallinas ponedoras de huevos', 0, '2025-05-23 00:30:19'),
('3', 'Ovis aries', 'Ovejas para producción de lana y carne', 0, '2025-05-23 00:30:19'),
('4', 'Capra hircus', 'Cabras para producción de leche', 0, '2025-05-23 00:30:19'),
('5', 'Sus scrofa domesticus', 'Cerdos para producción de carne', 0, '2025-05-23 00:30:19'),
('6', 'Equus ferus caballus', 'Caballos para trabajo y recreación', 0, '2025-05-23 00:30:19'),
('7', 'Anas platyrhynchos domesticus', 'Patos para producción de huevos y carne', 0, '2025-05-23 00:30:19'),
('8', 'Meleagris gallopavo', 'Pavos para producción de carne', 0, '2025-05-23 00:30:19'),
('9', 'Apis mellifera', 'Abejas para producción de miel', 0, '2025-05-23 00:30:19');

--
-- Disparadores `especies`
--
DELIMITER $$
CREATE TRIGGER `auditoria_especies_delete` AFTER DELETE ON `especies` FOR EACH ROW BEGIN
    INSERT INTO Auditoria (
        tabla_afectada, id_registro_afectado, tipo_operacion, 
        valores_anteriores, direccion_ip
    ) VALUES (
        'especies', OLD.id_especie, 'DELETE',
        JSON_OBJECT(
            'nombre_especie', OLD.nombre_especie,
            'descripcion', OLD.descripcion
        ),
        COALESCE(@user_ip, '127.0.0.1')
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria_especies_insert` AFTER INSERT ON `especies` FOR EACH ROW BEGIN
    INSERT INTO Auditoria (
        tabla_afectada, id_registro_afectado, tipo_operacion, 
        valores_nuevos, direccion_ip
    ) VALUES (
        'especies', NEW.id_especie, 'INSERT',
        JSON_OBJECT(
            'nombre_especie', NEW.nombre_especie,
            'descripcion', NEW.descripcion
        ),
        COALESCE(@user_ip, '127.0.0.1')
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria_especies_update` AFTER UPDATE ON `especies` FOR EACH ROW BEGIN
    INSERT INTO Auditoria (
        tabla_afectada, id_registro_afectado, tipo_operacion, 
        valores_anteriores, valores_nuevos, direccion_ip
    ) VALUES (
        'especies', NEW.id_especie, 'UPDATE',
        JSON_OBJECT(
            'nombre_especie', OLD.nombre_especie,
            'descripcion', OLD.descripcion
        ),
        JSON_OBJECT(
            'nombre_especie', NEW.nombre_especie,
            'descripcion', NEW.descripcion
        ),
        COALESCE(@user_ip, '127.0.0.1')
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instalaciones`
--

CREATE TABLE `instalaciones` (
  `id_instalacion` char(36) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_producto` char(36) NOT NULL DEFAULT uuid(),
  `nombre_producto` varchar(100) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `id_proveedor` char(36) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_producto`, `nombre_producto`, `cantidad`, `unidad_medida`, `fecha_ingreso`, `id_proveedor`, `fecha_creacion`) VALUES
('1', 'Alimento para vacas', 1000.00, 'kg', '2024-01-10', '1', '2025-05-23 00:35:10'),
('10', 'Equipo de ordeño', 2.00, 'unidades', '2024-05-20', '4', '2025-05-23 00:35:10'),
('2', 'Alimento para gallinas', 500.00, 'kg', '2024-01-15', '1', '2025-05-23 00:35:10'),
('3', 'Vacuna contra aftosa', 50.00, 'dosis', '2024-02-05', '2', '2025-05-23 00:35:10'),
('4', 'Semillas de alfalfa', 100.00, 'kg', '2024-02-20', '3', '2025-05-23 00:35:10'),
('5', 'Antibiótico veterinario', 30.00, 'unidades', '2024-03-01', '2', '2025-05-23 00:35:10'),
('6', 'Comedero automático', 10.00, 'unidades', '2024-03-15', '4', '2025-05-23 00:35:10'),
('7', 'Bebedero para aves', 15.00, 'unidades', '2024-04-02', '4', '2025-05-23 00:35:10'),
('8', 'Malla para corral', 200.00, 'metros', '2024-04-18', '4', '2025-05-23 00:35:10'),
('9', 'Suplemento vitamínico', 20.00, 'kg', '2024-05-05', '2', '2025-05-23 00:35:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinaria`
--

CREATE TABLE `maquinaria` (
  `id_maquinaria` char(36) NOT NULL DEFAULT uuid(),
  `id_instalacion` char(36) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `estado` enum('Operativa','Mantenimiento','Fuera de Servicio') NOT NULL DEFAULT 'Operativa',
  `ultima_revision` date DEFAULT NULL,
  `id_responsable` char(36) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `maquinaria`
--

INSERT INTO `maquinaria` (`id_maquinaria`, `id_instalacion`, `nombre`, `tipo`, `modelo`, `fabricante`, `fecha_adquisicion`, `estado`, `ultima_revision`, `id_responsable`, `descripcion`, `fecha_creacion`) VALUES
('806e896e-3811-11f0-ab6f-088fc37b4c7c', 'a1b2c3d4-e5f6-7890-1234-56789abcdef0', 'Tractor John Deere 5075E', 'Tractor', '5075E', 'John Deere', '2023-03-15', 'Operativa', '2025-04-10', '11111111-2222-3333-4444-555555555555', 'Tractor de 75 CV usado para labores de arado y traslado de carga.', '2025-05-23 20:07:06'),
('806e9585-3811-11f0-ab6f-088fc37b4c7c', 'a1b2c3d4-e5f6-7890-1234-56789abcdef0', 'Sembradora Monosem NG Plus', 'Sembradora', 'NG Plus 6', 'Monosem', '2024-02-20', 'Operativa', '2025-03-12', '66666666-7777-8888-9999-000000000000', 'Equipo de siembra de precisión para líneas simples, 6 surcos.', '2025-05-23 20:07:06'),
('806e9655-3811-11f0-ab6f-088fc37b4c7c', 'f0e1d2c3-b4a5-6789-0123-456789abcdef', 'Bomba de Riego Honda WX15', 'Bomba de agua', 'WX15', 'Honda', '2022-07-05', 'Mantenimiento', '2025-01-18', '11111111-2222-3333-4444-555555555555', 'Bomba portátil para riego por aspersión, caudal máximo 360 L/min.', '2025-05-23 20:07:06'),
('806e96a6-3811-11f0-ab6f-088fc37b4c7c', 'f0e1d2c3-b4a5-6789-0123-456789abcdef', 'Cosechadora New Holland CX8080', 'Cosechadora', 'CX8080', 'New Holland', '2021-09-10', 'Operativa', '2025-02-25', '22222222-3333-4444-5555-666666666666', 'Cosechadora de granos con tolva de gran capacidad y sistema de limpieza avanzado.', '2025-05-23 20:07:06'),
('806e96f6-3811-11f0-ab6f-088fc37b4c7c', 'a1b2c3d4-e5f6-7890-1234-56789abcdef0', 'Pulverizador Kuhn Vari-Met', 'Pulverizador', 'Vari-Met 2500', 'Kuhn', '2024-05-30', 'Operativa', '2025-05-01', '33333333-4444-5555-6666-777777777777', 'Pulverizador de arrastre, tanque de 2500 L, boquillas hidráulicas ajustables.', '2025-05-23 20:07:06'),
('d9eba37f-3811-11f0-ab6f-088fc37b4c7c', NULL, 'Exprimidor de Leche', 'Espectacular', '251541613', 'Toshiba', '2025-05-24', 'Mantenimiento', '2025-05-28', NULL, '', '2025-05-23 20:09:37'),
('ddfb65bb-3811-11f0-ab6f-088fc37b4c7c', NULL, 'Exprimidor de Leche', 'Espectacular', '251541613', 'Toshiba', '2025-05-24', 'Mantenimiento', '2025-05-28', NULL, '', '2025-05-23 20:09:43'),
('ee27ba3d-3811-11f0-ab6f-088fc37b4c7c', NULL, 'Exprimidor de Leche', 'Espectacular', '251541613', 'Toshiba', '2025-05-24', 'Mantenimiento', '2025-05-28', NULL, '', '2025-05-23 20:10:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantas`
--

CREATE TABLE `plantas` (
  `id_planta` char(36) NOT NULL DEFAULT uuid(),
  `nombre_cientifico` varchar(100) NOT NULL,
  `nombre_comun` varchar(100) DEFAULT NULL,
  `variedad` varchar(100) DEFAULT NULL,
  `fecha_siembra` date DEFAULT NULL,
  `fecha_cosecha_estimada` date DEFAULT NULL,
  `cantidad_plantas` int(11) DEFAULT NULL,
  `area_m2` decimal(8,2) DEFAULT NULL,
  `etapa` enum('Germinación','Crecimiento','Floración','Maduración') DEFAULT 'Germinación',
  `tipo_suelo` varchar(50) DEFAULT NULL,
  `ph_suelo` decimal(4,2) DEFAULT NULL,
  `id_usuario_responsable` char(36) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` enum('Sano','Enfermo','Recuperación') DEFAULT 'Sano',
  `descripcion` text DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plantas`
--

INSERT INTO `plantas` (`id_planta`, `nombre_cientifico`, `nombre_comun`, `variedad`, `fecha_siembra`, `fecha_cosecha_estimada`, `cantidad_plantas`, `area_m2`, `etapa`, `tipo_suelo`, `ph_suelo`, `id_usuario_responsable`, `ubicacion`, `estado`, `descripcion`, `notas`, `fecha_registro`, `fecha_creacion`) VALUES
('04b10999-380e-11f0-ab6f-088fc37b4c7c', 'Matarraton', 'Menta', 'no tiene', '2025-05-23', '2025-05-27', 3, 0.15, 'Crecimiento', NULL, NULL, NULL, 'Casa de elsa', 'Sano', '', NULL, '2025-05-23 19:42:10', '2025-05-23 19:42:10'),
('1', 'Zea mays', 'Maíz', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Campo Norte', 'Sano', 'Cultivo de maíz para alimentación', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('10', 'Coffea arabica', 'Cafeto', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Invernadero 2', 'Sano', 'Planta de café', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('2', 'Medicago sativa', 'Alfalfa', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Campo Sur', 'Sano', 'Forraje para animales', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('3', 'Triticum aestivum', 'Trigo', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Campo Este', 'Sano', 'Cultivo de trigo', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('4', 'Solanum lycopersicum', 'Tomate', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Invernadero 1', 'Sano', 'Tomates para consumo', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('5', 'Cucurbita pepo', 'Calabaza', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Huerto 1', 'Sano', 'Cultivo de calabazas', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('6', 'Phaseolus vulgaris', 'Frijol', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Huerto 2', 'Sano', 'Frijoles para consumo', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('7', 'Malus domestica', 'Manzano', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Huerto Frutal', 'Sano', 'Árbol de manzanas', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('8', 'Citrus sinensis', 'Naranjo', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Huerto Frutal', 'Sano', 'Árbol de naranjas', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('9', 'Vitis vinifera', 'Vid', NULL, NULL, NULL, NULL, NULL, 'Germinación', NULL, NULL, NULL, 'Viñedo', 'Sano', 'Uvas para consumo', NULL, '2025-05-23 00:36:35', '2025-05-23 00:36:35'),
('edcd839c-380d-11f0-ab6f-088fc37b4c7c', 'Matarraton', 'Menta', 'no tiene', '2025-05-23', '2025-05-27', 3, 0.15, 'Crecimiento', NULL, NULL, NULL, 'Casa de elsa', 'Sano', '', NULL, '2025-05-23 19:41:32', '2025-05-23 19:41:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id_produccion` char(36) NOT NULL DEFAULT uuid(),
  `id_animal` char(36) DEFAULT NULL,
  `tipo_produccion` enum('Leche','Huevos','Carne','Otro') NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `fecha_recoleccion` date NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id_produccion`, `id_animal`, `tipo_produccion`, `cantidad`, `fecha_recoleccion`, `fecha_creacion`) VALUES
('1', '1', 'Leche', 20.50, '2024-06-01', '2025-05-23 00:37:30'),
('10', '4', 'Leche', 6.00, '2024-06-05', '2025-05-23 00:37:30'),
('2', '2', 'Huevos', 8.00, '2024-06-01', '2025-05-23 00:37:30'),
('3', '1', 'Leche', 22.00, '2024-06-02', '2025-05-23 00:37:30'),
('4', '4', 'Leche', 5.50, '2024-06-02', '2025-05-23 00:37:30'),
('5', '2', 'Huevos', 9.00, '2024-06-03', '2025-05-23 00:37:30'),
('6', '9', 'Otro', 3.20, '2024-06-03', '2025-05-23 00:37:30'),
('7', '1', 'Leche', 21.00, '2024-06-04', '2025-05-23 00:37:30'),
('8', '7', 'Carne', 1.80, '2024-06-04', '2025-05-23 00:37:30'),
('9', '2', 'Huevos', 7.50, '2024-06-05', '2025-05-23 00:37:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` char(36) NOT NULL DEFAULT uuid(),
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo_producto` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `telefono`, `direccion`, `tipo_producto`, `fecha_creacion`) VALUES
('1', 'Alimentos Balanceados S.A.', '5551112222', 'Av. Industrial 123', 'Alimento para animales', '2025-05-23 00:34:57'),
('10', 'Insumos Agrícolas Total', '5550001111', 'Av. Agrícola 90', 'Insumos para cultivos', '2025-05-23 00:34:57'),
('2', 'Farmacia Veterinaria Integral', '5552223333', 'Calle Veterinarios 45', 'Medicamentos y vacunas', '2025-05-23 00:34:57'),
('3', 'Semillas y Plantas del Valle', '5553334444', 'Carretera Agrícola Km 12', 'Semillas y plantas', '2025-05-23 00:34:57'),
('4', 'Equipos Ganaderos Modernos', '5554445555', 'Blvd. Ganadero 67', 'Equipo para granja', '2025-05-23 00:34:57'),
('5', 'Distribuidora de Carnes Selectas', '5555556666', 'Av. Carnicerías 89', 'Productos cárnicos', '2025-05-23 00:34:57'),
('6', 'Lácteos Premium', '5556667777', 'Calle Lechera 34', 'Productos lácteos', '2025-05-23 00:34:57'),
('7', 'Avícola del Norte', '5557778888', 'Carretera Avícola Km 8', 'Productos avícolas', '2025-05-23 00:34:57'),
('8', 'Mieles Naturales', '5558889999', 'Camino Apícola 56', 'Productos apícolas', '2025-05-23 00:34:57'),
('9', 'Lanas y Fibras Selectas', '5559990000', 'Ruta Textil 78', 'Productos de lana', '2025-05-23 00:34:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` char(36) NOT NULL DEFAULT uuid(),
  `id_usuario` char(36) DEFAULT NULL,
  `id_planta` char(36) DEFAULT NULL,
  `id_animal` char(36) DEFAULT NULL,
  `tipo` enum('Planta','Animal') NOT NULL,
  `diagnostico` text NOT NULL,
  `fecha_reporte` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id_reporte`, `id_usuario`, `id_planta`, `id_animal`, `tipo`, `diagnostico`, `fecha_reporte`, `fecha_creacion`) VALUES
('1', '1', NULL, '1', 'Animal', 'Revisión rutinaria - Estado saludable', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('10', '10', '3', NULL, 'Planta', 'Ataque de hongos en tallos', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('2', '2', '1', NULL, 'Planta', 'Plaga detectada en hojas inferiores', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('3', '3', NULL, '3', 'Animal', 'Posible infección respiratoria', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('4', '4', '4', NULL, 'Planta', 'Hojas amarillas - posible deficiencia nutricional', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('5', '5', NULL, '5', 'Animal', 'Control de peso - crecimiento adecuado', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('6', '6', '7', NULL, 'Planta', 'Frutificación normal', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('7', '7', NULL, '7', 'Animal', 'Lesión en pata izquierda', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('8', '8', '10', NULL, 'Planta', 'Necesita poda de formación', '2025-05-23 00:36:58', '2025-05-23 00:36:58'),
('9', '9', NULL, '9', 'Animal', 'Colmena productiva - revisión de abejas', '2025-05-23 00:36:58', '2025-05-23 00:36:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamientos`
--

CREATE TABLE `tratamientos` (
  `id_tratamiento` char(36) NOT NULL DEFAULT uuid(),
  `id_reporte` char(36) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `resultado` enum('Exitoso','En Proceso','Fallido') DEFAULT 'En Proceso',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamientos`
--

INSERT INTO `tratamientos` (`id_tratamiento`, `id_reporte`, `descripcion`, `fecha_inicio`, `fecha_fin`, `resultado`, `fecha_creacion`) VALUES
('1', '3', 'Antibiótico para infección respiratoria', '2024-02-12', '2024-02-19', 'Exitoso', '2025-05-23 00:37:11'),
('10', '5', 'Suplemento alimenticio', '2024-03-08', '2024-04-08', 'Exitoso', '2025-05-23 00:37:11'),
('2', '2', 'Aplicación de insecticida orgánico', '2024-01-22', '2024-01-29', 'Exitoso', '2025-05-23 00:37:11'),
('3', '4', 'Fertilización balanceada', '2024-02-18', '2024-03-18', 'Exitoso', '2025-05-23 00:37:11'),
('4', '7', 'Curación de herida y antibiótico', '2024-04-03', '2024-04-10', 'Exitoso', '2025-05-23 00:37:11'),
('5', '10', 'Aplicación de fungicida', '2024-05-12', '2024-05-19', 'En Proceso', '2025-05-23 00:37:11'),
('6', '8', 'Poda de formación realizada', '2024-04-20', '2024-04-20', 'Exitoso', '2025-05-23 00:37:11'),
('7', '6', 'Fertilización foliar', '2024-03-25', '2024-04-25', 'Exitoso', '2025-05-23 00:37:11'),
('8', '9', 'Revisión y limpieza de colmena', '2024-05-15', '2024-05-15', 'Exitoso', '2025-05-23 00:37:11'),
('9', '1', 'Desparasitación rutinaria', '2024-01-16', '2024-01-16', 'Exitoso', '2025-05-23 00:37:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` char(36) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `tipo_usuario` enum('Investigador','Veterinario','Botánico','Administrador') NOT NULL,
  `clave` varchar(255) NOT NULL,
  `ultima_ip` varchar(45) DEFAULT NULL,
  `intentos_fallidos` int(11) NOT NULL DEFAULT 0,
  `bloqueado_hasta` datetime DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `correo`, `telefono`, `tipo_usuario`, `clave`, `ultima_ip`, `intentos_fallidos`, `bloqueado_hasta`, `fecha_creacion`) VALUES
('', 'Elsa Palacios', 'elsa@gmail.com', '32087652', 'Investigador', '$2y$10$FsTfLeVwxR6WGZbVhZkKcuqhcAhB4bYh2M0ctUNd/RYHHwizTChJu', NULL, 0, NULL, '2025-05-23 22:22:52'),
('1', 'Dr. Roberto Jiménez', 'roberto.j@email.com', '5551122334', 'Administrador', '$2y$10$oR9tro71xlLVf8r6UrRuNeJeC5NP./TZjBT.qVcFfJx5UbQ6uhAty', NULL, 0, NULL, '2025-05-23 00:34:42'),
('10', 'Biólogo Diego Castro', 'diego.c@email.com', '5550011223', 'Investigador', '4e2baf653385b4ee6c75099548b1f7683c6ca49389eaaa57586bf8f5d4ffb30f', NULL, 0, NULL, '2025-05-23 00:34:42'),
('2', 'Bióloga Luisa Fernández', 'luisa.f@email.com', '5552233445', 'Investigador', 'ae1c49d9079717617d732cc7a42392e9fdff2c1a90eebee95054625b44e287f7', NULL, 0, NULL, '2025-05-23 00:34:42'),
('3', 'Ing. Agrónomo Jorge Ruiz', 'jorge.r@email.com', '5553344556', 'Botánico', '5e6e518531d6f15ebfd04aaee74fd123171f9717d2ca04fee6c0906732bfa2d5', NULL, 0, NULL, '2025-05-23 00:34:42'),
('4', 'Admin María López', 'maria.l@email.com', '5554455667', 'Administrador', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', NULL, 0, NULL, '2025-05-23 00:34:42'),
('5', 'Dr. Carlos Mendoza', 'carlos.m@email.com', '5555566778', 'Veterinario', 'ae60b5547eeaffc09a847a9c527272ff1dd9acd682b318f4b6bdc3f75eb379ef', NULL, 0, NULL, '2025-05-23 00:34:42'),
('6', 'Bióloga Ana Vargas', 'ana.v@email.com', '5556677889', 'Investigador', 'c0239dd1d7648109a2332b57ea05d93372af869e2f6e2d68088fe71768f06a63', NULL, 0, NULL, '2025-05-23 00:34:42'),
('7', 'Ing. Agrónomo Pablo Soto', 'pablo.s@email.com', '5557788990', 'Botánico', '1d73a48e4b7289ed82247e75afa1966a04eea918c582c1625b7709988c8f73a5', NULL, 0, NULL, '2025-05-23 00:34:42'),
('8', 'Admin Javier Ríos', 'javier.r@email.com', '5558899001', 'Administrador', 'becf77f3ec82a43422b7712134d1860e3205c6ce778b08417a7389b43f2b4661', NULL, 0, NULL, '2025-05-23 00:34:42'),
('9', 'Dr. Patricia Núñez', 'patricia.n@email.com', '5559900112', 'Veterinario', '4a7b5f3e5cd7e0bf1a00be57afe2a61e7a583b19b5a5e3e1200f368083657005', NULL, 0, NULL, '2025-05-23 00:34:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunacion`
--

CREATE TABLE `vacunacion` (
  `id_vacunacion` char(36) NOT NULL DEFAULT uuid(),
  `id_animal` char(36) NOT NULL,
  `id_vacuna` char(36) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `proxima_dosis` date DEFAULT NULL,
  `dosis` varchar(50) NOT NULL,
  `id_empleado` char(36) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacunacion`
--

INSERT INTO `vacunacion` (`id_vacunacion`, `id_animal`, `id_vacuna`, `fecha_aplicacion`, `proxima_dosis`, `dosis`, `id_empleado`, `observaciones`, `fecha_creacion`) VALUES
('1', '1', '1', '2024-01-15', '2024-07-15', '1ra dosis', '1', 'Aplicada en el cuello', '2025-05-23 00:36:19'),
('10', '10', '10', '2024-05-25', '2024-11-25', '1ra dosis', '8', 'Sin reacciones adversas', '2025-05-23 00:36:19'),
('2', '2', '2', '2024-01-20', '2024-07-20', 'Única dosis', '1', 'Aplicada en el ala', '2025-05-23 00:36:19'),
('3', '3', '3', '2024-02-10', '2025-02-10', 'Refuerzo anual', '8', 'Sin reacciones', '2025-05-23 00:36:19'),
('4', '4', '4', '2024-02-15', '2025-02-15', '1ra dosis', '8', 'Animal tranquilo', '2025-05-23 00:36:19'),
('5', '5', '5', '2024-03-05', '2024-09-05', '2da dosis', '1', 'Requiere refuerzo', '2025-05-23 00:36:19'),
('6', '6', '6', '2024-03-12', NULL, 'Única dosis', '8', 'Aplicada en muslo', '2025-05-23 00:36:19'),
('7', '7', '7', '2024-04-01', '2024-10-01', '1ra dosis', '1', 'Sin complicaciones', '2025-05-23 00:36:19'),
('8', '8', '8', '2024-04-18', '2024-10-18', 'Refuerzo semestral', '8', 'Animal nervioso', '2025-05-23 00:36:19'),
('9', '9', '9', '2024-05-10', NULL, 'Única dosis', '1', 'Aplicada en colmena', '2025-05-23 00:36:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `id_vacuna` char(36) NOT NULL DEFAULT uuid(),
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `fabricante` varchar(100) NOT NULL,
  `temperatura_almacenamiento` varchar(50) NOT NULL,
  `vida_util` varchar(50) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacunas`
--

INSERT INTO `vacunas` (`id_vacuna`, `nombre`, `descripcion`, `fabricante`, `temperatura_almacenamiento`, `vida_util`, `fecha_creacion`) VALUES
('1', 'Vacuna contra aftosa', 'Protege contra la fiebre aftosa', 'Laboratorios Zoetis', '2-8°C', '1 año', '2025-05-23 00:36:05'),
('10', 'Vacuna contra Mastitis', 'Previene la mastitis en vacas lecheras', 'Laboratorios Vetoquinol', '2-8°C', '1 año', '2025-05-23 00:36:05'),
('2', 'Vacuna contra Newcastle', 'Protege a las aves contra Newcastle', 'Laboratorios Merial', '2-8°C', '18 meses', '2025-05-23 00:36:05'),
('3', 'Vacuna contra Brucelosis', 'Protege contra la brucelosis bovina', 'Laboratorios Pfizer', '2-8°C', '2 años', '2025-05-23 00:36:05'),
('4', 'Vacuna contra Rabia', 'Protege contra la rabia en animales', 'Laboratorios Virbac', '2-8°C', '1 año', '2025-05-23 00:36:05'),
('5', 'Vacuna contra Parvovirus', 'Protege contra el parvovirus canino', 'Laboratorios Boehringer', '2-8°C', '18 meses', '2025-05-23 00:36:05'),
('6', 'Vacuna contra Influenza Aviar', 'Protege contra la influenza aviar', 'Laboratorios Ceva', '2-8°C', '1 año', '2025-05-23 00:36:05'),
('7', 'Vacuna contra Clostridios', 'Protege contra enfermedades por clostridios', 'Laboratorios MSD', '2-8°C', '2 años', '2025-05-23 00:36:05'),
('8', 'Vacuna contra Leptospirosis', 'Protege contra la leptospirosis', 'Laboratorios Elanco', '2-8°C', '1 año', '2025-05-23 00:36:05'),
('9', 'Vacuna contra E. coli', 'Protege contra infecciones por E. coli', 'Laboratorios Hipra', '2-8°C', '18 meses', '2025-05-23 00:36:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` char(36) NOT NULL DEFAULT uuid(),
  `id_produccion` char(36) DEFAULT NULL,
  `id_animal` char(36) DEFAULT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `fecha_venta` date NOT NULL,
  `comprador` varchar(100) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_produccion`, `id_animal`, `cantidad`, `precio_total`, `fecha_venta`, `comprador`, `fecha_creacion`) VALUES
('1', '1', NULL, 20.00, 600.00, '2024-06-02', 'Lácteos del Valle', '2025-05-23 00:37:43'),
('10', '10', NULL, 5.00, 200.00, '2024-06-08', 'Quesería Artesanal', '2025-05-23 00:37:43'),
('2', '2', NULL, 8.00, 40.00, '2024-06-02', 'Tienda Orgánica', '2025-05-23 00:37:43'),
('3', NULL, '5', 1.00, 2500.00, '2024-06-03', 'Carnicería Premium', '2025-05-23 00:37:43'),
('4', '4', NULL, 5.00, 200.00, '2024-06-03', 'Quesería Artesanal', '2025-05-23 00:37:43'),
('5', '6', NULL, 3.00, 900.00, '2024-06-04', 'Mieles Naturales', '2025-05-23 00:37:43'),
('6', NULL, '8', 1.00, 1800.00, '2024-06-05', 'Restaurante Gourmet', '2025-05-23 00:37:43'),
('7', '7', NULL, 20.00, 600.00, '2024-06-05', 'Lácteos del Valle', '2025-05-23 00:37:43'),
('8', '9', NULL, 7.00, 35.00, '2024-06-06', 'Tienda Orgánica', '2025-05-23 00:37:43'),
('9', NULL, '3', 1.00, 3200.00, '2024-06-07', 'Fábrica de Lanas', '2025-05-23 00:37:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD PRIMARY KEY (`id_alimentacion`),
  ADD KEY `id_especie` (`id_especie`);

--
-- Indices de la tabla `animales`
--
ALTER TABLE `animales`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `id_especie` (`id_especie`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`);

--
-- Indices de la tabla `costos`
--
ALTER TABLE `costos`
  ADD PRIMARY KEY (`id_costo`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_especie` (`id_especie`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `especies`
--
ALTER TABLE `especies`
  ADD PRIMARY KEY (`id_especie`);

--
-- Indices de la tabla `instalaciones`
--
ALTER TABLE `instalaciones`
  ADD PRIMARY KEY (`id_instalacion`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  ADD PRIMARY KEY (`id_maquinaria`),
  ADD KEY `idx_maquinaria_responsable` (`id_responsable`),
  ADD KEY `idx_maquinaria_instalacion` (`id_instalacion`);

--
-- Indices de la tabla `plantas`
--
ALTER TABLE `plantas`
  ADD PRIMARY KEY (`id_planta`),
  ADD KEY `fk_plantas_usuario` (`id_usuario_responsable`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id_produccion`),
  ADD KEY `id_animal` (`id_animal`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_planta` (`id_planta`),
  ADD KEY `id_animal` (`id_animal`);

--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD PRIMARY KEY (`id_tratamiento`),
  ADD KEY `id_reporte` (`id_reporte`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD PRIMARY KEY (`id_vacunacion`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_vacuna` (`id_vacuna`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`id_vacuna`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_produccion` (`id_produccion`),
  ADD KEY `id_animal` (`id_animal`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD CONSTRAINT `alimentacion_ibfk_1` FOREIGN KEY (`id_especie`) REFERENCES `especies` (`id_especie`);

--
-- Filtros para la tabla `animales`
--
ALTER TABLE `animales`
  ADD CONSTRAINT `animales_ibfk_1` FOREIGN KEY (`id_especie`) REFERENCES `especies` (`id_especie`);

--
-- Filtros para la tabla `costos`
--
ALTER TABLE `costos`
  ADD CONSTRAINT `costos_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE SET NULL,
  ADD CONSTRAINT `costos_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE SET NULL,
  ADD CONSTRAINT `costos_ibfk_3` FOREIGN KEY (`id_especie`) REFERENCES `especies` (`id_especie`) ON DELETE SET NULL;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE SET NULL;

--
-- Filtros para la tabla `plantas`
--
ALTER TABLE `plantas`
  ADD CONSTRAINT `fk_plantas_usuario` FOREIGN KEY (`id_usuario_responsable`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `plantas_ibfk_usuario` FOREIGN KEY (`id_usuario_responsable`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE SET NULL;

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id_planta`) ON DELETE CASCADE,
  ADD CONSTRAINT `reportes_ibfk_3` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos`
  ADD CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`id_reporte`) REFERENCES `reportes` (`id_reporte`) ON DELETE CASCADE;

--
-- Filtros para la tabla `vacunacion`
--
ALTER TABLE `vacunacion`
  ADD CONSTRAINT `vacunacion_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE CASCADE,
  ADD CONSTRAINT `vacunacion_ibfk_2` FOREIGN KEY (`id_vacuna`) REFERENCES `vacunas` (`id_vacuna`) ON DELETE CASCADE,
  ADD CONSTRAINT `vacunacion_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`id_produccion`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
