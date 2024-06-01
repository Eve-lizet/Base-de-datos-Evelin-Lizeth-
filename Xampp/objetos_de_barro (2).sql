-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2024 a las 18:36:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `objetos_de_barro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Figuras Decorativas'),
(2, 'Platos y cuencos'),
(3, 'Tazas y jarras'),
(4, 'Macetas'),
(5, 'Figuras decorativas'),
(6, 'Azulejos y baldosas'),
(7, 'Cazuelas y ollas'),
(8, 'Lámparas y candelabros'),
(9, 'Juguetes'),
(10, 'Instrumentos musicales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `nombre`, `correo`, `telefono`) VALUES
(1, 'Juan Pérez', 'cliente1@example.com', '5551234567'),
(2, 'María García', 'cliente2@example.com', '5559876543'),
(3, 'Luis Rodríguez', 'cliente3@example.com', '5554567890'),
(4, 'Ana Martínez', 'cliente4@example.com', '5553210987'),
(5, 'Pedro López', 'cliente5@example.com', '5558765432'),
(6, 'Laura Hernández', 'cliente6@example.com', '5552345678'),
(7, 'Carlos Sánchez', 'cliente7@example.com', '5557890123'),
(8, 'Sofía Ramírez', 'cliente8@example.com', '5553456789'),
(9, 'Javier González', 'cliente9@example.com', '5559012345'),
(10, 'Carmen Ruiz', 'cliente10@example.com', '5556789012');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_venta`, `id_producto`, `cantidad`, `precio_unitario`, `nombre`) VALUES
(1, 1, 1, 2, 25.50, 'Vasija Decorativa'),
(2, 2, 2, 3, 12.00, 'Plato Rústico'),
(3, 3, 3, 1, 8.00, 'Taza de Café'),
(4, 4, 4, 4, 10.00, 'Maceta Pequeña'),
(5, 5, 5, 1, 20.00, 'Figura de Búho'),
(6, 6, 6, 5, 5.00, 'Azulejo Decorativo'),
(7, 7, 7, 2, 35.00, 'Cazuela Grande'),
(8, 8, 8, 3, 15.00, 'Candelabro de Barro'),
(9, 9, 9, 2, 10.00, 'Muñeco Tradicional'),
(10, 10, 10, 1, 18.00, 'Ocarina de Barro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `id_categoria`) VALUES
(1, 'Vasija Decorativa', 'Vasija de barro hecha a mano, ideal para decoración de interiores', 25.00, 15, 1),
(2, 'Plato Rústico', 'Plato de barro cocido, perfecto para servir comidas tradicionales', 12.00, 30, 2),
(3, 'Taza de Café', 'Taza de barro esmaltada, ideal para café o té', 8.00, 50, 3),
(4, 'Maceta Pequeña', 'Maceta de barro para plantas pequeñas, con diseño artesanal', 10.00, 40, 4),
(5, 'Figura de Búho', 'Figura decorativa de barro en forma de búho, pintada a mano', 20.00, 20, 5),
(6, 'Azulejo Decorativo', 'Azulejo de barro pintado a mano, ideal para paredes o suelos', 5.00, 100, 6),
(7, 'Cazuela Grande', 'Cazuela de barro para cocinar guisos y sopas, resistente al calor', 35.00, 10, 7),
(8, 'Candelabro de Barro', 'Candelabro artesanal de barro, ideal para velas de cera', 15.00, 25, 8),
(9, 'Muñeco Tradicional', 'Juguete de barro en forma de muñeco, pintado con colores vivos', 10.00, 35, 9),
(10, 'Ocarina de Barro', 'Instrumento musical de viento hecho de barro, afinado a mano', 18.00, 15, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedores` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contacto` varchar(15) DEFAULT NULL,
  `correo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedores`, `nombre`, `contacto`, `correo`) VALUES
(1, 'Artesanías Delicia', '+123456789', 'info@artesaniasdelicia.com'),
(2, 'Barro y Arte', '+987654321', 'ventas@barroyarte.com'),
(3, 'Cerámicas Sánchez', '+246813579', 'contacto@ceramicassanchez.com'),
(4, 'Arte en Barro', '+112233445', 'ventas@arteenbarro.com'),
(5, 'Alfarería García', '+554433221', 'alfareria@alfareriagarcia.com'),
(6, 'Creaciones Morales', '+778899001', 'info@creacionesmorales.com'),
(7, 'Arte y Cerámica', '+990011223', 'contacto@arteyceramica.com'),
(8, 'Talleres Artesanos', '+665544332', 'talleres@talleresartesanos.com'),
(9, 'Cerámicas del Sur', '+221133445', 'ventas@ceramicasdelsur.com'),
(10, 'Arte en Tus Manos', '+112233445', 'info@artentusmanos.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fecha`, `id_cliente`, `total`) VALUES
(1, '2024-05-31', 1, 50.00),
(2, '2024-05-30', 2, 75.00),
(3, '2024-05-29', 3, 100.00),
(4, '2024-05-28', 4, 120.00),
(5, '2024-05-27', 5, 90.00),
(6, '2024-05-26', 6, 60.00),
(7, '2024-05-25', 7, 80.00),
(8, '2024-05-24', 8, 110.00),
(9, '2024-05-23', 9, 95.00),
(10, '2024-05-22', 10, 70.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `telefono` (`telefono`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedores`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_clientes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
