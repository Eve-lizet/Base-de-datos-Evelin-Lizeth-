CREATE DATABASE TINEDAS;

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock INT,
    id_proveedor INT
    
);

CREATE TABLE CATEGORIA (
ID_CATEGORIA INT

);
