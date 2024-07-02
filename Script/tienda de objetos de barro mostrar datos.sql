CREATE DATABASE IF NOT EXISTS OBJETOS_DE_BARRO;
USE OBJETOS_DE_BARRO;

CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUCTOS (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE CLIENTES (
    id_clientes INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE PROVEEDORES (
    id_proveedores INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    contacto VARCHAR(15),
    correo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE VENTA (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_clientes)
);

CREATE TABLE FACTURA (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES VENTA(id_venta),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTOS(id_producto)
);

-- Insertar categorías
INSERT INTO CATEGORIA (nombre) VALUES 
('Figuras Decorativas'),
('Platos y cuencos'),
('Tazas y jarras'),
('Macetas'),
('Figuras decorativas'),
('Azulejos y baldosas'),
('Cazuelas y ollas'),
('Lámparas y candelabros'),
('Juguetes'),
('Instrumentos musicales');

-- Insertar productos
INSERT INTO PRODUCTOS (nombre, descripcion, precio, stock, id_categoria) VALUES
('Vasija Decorativa', 'Vasija de barro hecha a mano, ideal para decoración de interiores', 25.00, 15, 1),
('Plato Rústico', 'Plato de barro cocido, perfecto para servir comidas tradicionales', 12.00, 30, 2),
('Taza de Café', 'Taza de barro esmaltada, ideal para café o té', 8.00, 50, 3),
('Maceta Pequeña', 'Maceta de barro para plantas pequeñas, con diseño artesanal', 10.00, 40, 4),
('Figura de Búho', 'Figura decorativa de barro en forma de búho, pintada a mano', 20.00, 20, 5),
('Azulejo Decorativo', 'Azulejo de barro pintado a mano, ideal para paredes o suelos', 5.00, 100, 6),
('Cazuela Grande', 'Cazuela de barro para cocinar guisos y sopas, resistente al calor', 35.00, 10, 7),
('Candelabro de Barro', 'Candelabro artesanal de barro, ideal para velas de cera', 15.00, 25, 8),
('Muñeco Tradicional', 'Juguete de barro en forma de muñeco, pintado con colores vivos', 10.00, 35, 9),
('Ocarina de Barro', 'Instrumento musical de viento hecho de barro, afinado a mano', 18.00, 15, 10);

-- Insertar proveedores
INSERT INTO PROVEEDORES (nombre, contacto, correo) VALUES 
('Artesanías Delicia', '+123456789', 'info@artesaniasdelicia.com'),
('Barro y Arte', '+987654321', 'ventas@barroyarte.com'),
('Cerámicas Sánchez', '+246813579', 'contacto@ceramicassanchez.com'),
('Arte en Barro', '+112233445', 'ventas@arteenbarro.com'),
('Alfarería García', '+554433221', 'alfareria@alfareriagarcia.com'),
('Creaciones Morales', '+778899001', 'info@creacionesmorales.com'),
('Arte y Cerámica', '+990011223', 'contacto@arteyceramica.com'),
('Talleres Artesanos', '+665544332', 'talleres@talleresartesanos.com'),
('Cerámicas del Sur', '+221133445', 'ventas@ceramicasdelsur.com'),
('Arte en Tus Manos', '+112233445', 'info@artentusmanos.com');

-- Insertar clientes
INSERT INTO CLIENTES (correo, telefono, nombre) VALUES 
('cliente1@example.com', '5551234567', 'Juan Pérez'),
('cliente2@example.com', '5559876543', 'María García'),
('cliente3@example.com', '5554567890', 'Luis Rodríguez'),
('cliente4@example.com', '5553210987', 'Ana Martínez'),
('cliente5@example.com', '5558765432', 'Pedro López'),
('cliente6@example.com', '5552345678', 'Laura Hernández'),
('cliente7@example.com', '5557890123', 'Carlos Sánchez'),
('cliente8@example.com', '5553456789', 'Sofía Ramírez'),
('cliente9@example.com', '5559012345', 'Javier González'),
('cliente10@example.com', '5556789012', 'Carmen Ruiz');

-- Insertar ventas
INSERT INTO VENTA (fecha, id_cliente, total) VALUES
('2024-05-31', 1, 50.00),
('2024-05-30', 2, 75.00),
('2024-05-29', 3, 100.00),
('2024-05-28', 4, 120.00),
('2024-05-27', 5, 90.00),
('2024-05-26', 6, 60.00),
('2024-05-25', 7, 80.00),
('2024-05-24', 8, 110.00),
('2024-05-23', 9, 95.00),
('2024-05-22', 10, 70.00);

-- Insertar facturas
INSERT INTO FACTURA (id_venta, id_producto, cantidad, precio_unitario) VALUES 
(1, 1, 2, 25.50),
(2, 2, 3, 12.00),
(3, 3, 1, 8.00),
(4, 4, 4, 10.00),
(5, 5, 1, 20.00),
(6, 6, 5, 5.00),
(7, 7, 2, 35.00),
(8, 8, 3, 15.00),
(9, 9, 2, 10.00),
(10, 10, 1, 18.00);


-- Mostrar datos de la tabla PRODUCTOS
SELECT * FROM PRODUCTOS;
-- Mostrar datos de la tabla CLIENTES
SELECT * FROM CLIENTES;
-- Mostrar datos de la tabla VENTA
SELECT * FROM VENTA;
-- Mostrar datos de la tabla FACTURA
SELECT * FROM FACTURA;

SELECT nombre, precio FROM PRODUCTOS;
SELECT nombre, correo FROM CLIENTES;
SELECT fecha, total FROM VENTA;
SELECT cantidad, nombre FROM FACTURA;

SELECT * FROM PRODUCTOS ORDER BY precio ASC;
SELECT * FROM CLIENTES ORDER BY nombre DESC;
SELECT * FROM VENTA ORDER BY fecha ASC;
SELECT * FROM FACTURA ORDER BY cantidad DESC;


SELECT COUNT(*) FROM PRODUCTOS;
SELECT COUNT(*) FROM CLIENTES;
SELECT COUNT(*) FROM VENTA;
SELECT COUNT(*) FROM FACTURA;

SELECT SUM(precio) FROM PRODUCTOS;
SELECT SUM(stock) FROM PRODUCTOS;
SELECT SUM(total) FROM VENTA;
SELECT SUM(cantidad) FROM FACTURA;

SELECT MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo FROM PRODUCTOS;
SELECT MAX(stock) AS stock_maximo, MIN(stock) AS stock_minimo FROM PRODUCTOS;
SELECT MAX(total) AS total_maximo, MIN(total) AS total_minimo FROM VENTA;
SELECT MAX(cantidad) AS cantidad_maxima, MIN(cantidad) AS cantidad_minima FROM FACTURA;


SELECT PRODUCTOS.nombre AS producto_nombre, CATEGORIA.nombre AS categoria_nombre
FROM PRODUCTOS
INNER JOIN CATEGORIA ON PRODUCTOS.id_categoria = CATEGORIA.id_categoria;
SELECT VENTA.id_venta, VENTA.fecha, VENTA.total, CLIENTES.nombre AS cliente_nombre, CLIENTES.correo AS cliente_correo
FROM VENTA
INNER JOIN CLIENTES ON VENTA.id_cliente = CLIENTES.id_clientes;
SELECT FACTURA.id_factura, FACTURA.cantidad, FACTURA.precio_unitario, PRODUCTOS.nombre AS producto_nombre
FROM FACTURA
INNER JOIN PRODUCTOS ON FACTURA.id_producto = PRODUCTOS.id_producto;


SELECT PRODUCTOS.nombre AS producto, CATEGORIA.nombre AS categoria
FROM PRODUCTOS
JOIN CATEGORIA ON PRODUCTOS.id_categoria = CATEGORIA.id_categoria
WHERE PRODUCTOS.precio > 20.00;
SELECT VENTA.id_venta, CLIENTES.nombre AS cliente, VENTA.total
FROM VENTA
JOIN CLIENTES ON VENTA.id_cliente = CLIENTES.id_clientes
WHERE VENTA.total > 100.00;

SELECT p.nombre AS producto, p.precio
FROM PRODUCTOS p
WHERE p.precio > (
    SELECT AVG(precio) FROM PRODUCTOS WHERE id_categoria = p.id_categoria
);
SELECT p.nombre AS producto, p.precio
FROM PRODUCTOS p
WHERE p.precio > (
    SELECT AVG(precio) FROM PRODUCTOS WHERE id_categoria = p.id_categoria
);


SELECT id_categoria, AVG(precio) AS precio_promedio
FROM PRODUCTOS
GROUP BY id_categoria;

SELECT nombre, fecha
FROM PRODUCTOS
WHERE YEAR(fecha) = 2023;

SELECT nombre, 'Producto' AS tipo
FROM PRODUCTOS
UNION
SELECT nombre, 'Cliente' AS tipo
FROM CLIENTES;

SELECT nombre, descripcion
FROM PRODUCTOS
WHERE nombre LIKE '%Vasija%';

SELECT nombre
FROM PRODUCTOS
WHERE EXISTS (
    SELECT 1 FROM FACTURA WHERE id_producto = PRODUCTOS.id_producto
);

SELECT nombre, precio
FROM PRODUCTOS
ORDER BY precio DESC
LIMIT 10 OFFSET 10;

