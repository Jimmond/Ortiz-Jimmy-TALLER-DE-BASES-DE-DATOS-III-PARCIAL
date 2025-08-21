-- Crea la base de datos (incluye espacio y acento)
DROP DATABASE IF EXISTS `Dealer Automóviles`;
CREATE DATABASE `Dealer Automóviles` 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;

USE `Dealer Automóviles`;

-- Tabla: clientes
CREATE TABLE clientes (
  id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre              VARCHAR(100)  NOT NULL,
  apellido            VARCHAR(100)  NOT NULL,
  telefono            VARCHAR(25)   NOT NULL,
  correo_electronico  VARCHAR(255)  NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Tabla: automoviles
CREATE TABLE automoviles (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  marca    VARCHAR(100)  NOT NULL,
  modelo   VARCHAR(100)  NOT NULL,
  anio     SMALLINT      NOT NULL,
  precio   DECIMAL(12,2) NOT NULL
) ENGINE=InnoDB;

-- Tabla: ventas
CREATE TABLE ventas (
  id            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  id_cliente    INT UNSIGNED NOT NULL,
  id_automovil  INT UNSIGNED NOT NULL,
  fecha_venta   DATE         NOT NULL,
  precio_venta  DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (id_cliente)   REFERENCES clientes(id),
  FOREIGN KEY (id_automovil) REFERENCES automoviles(id)
) ENGINE=InnoDB;


-- INSERTS DE CLIENTES
INSERT INTO clientes (nombre, apellido, telefono, correo_electronico)
VALUES
('Juan', 'Pérez', '555-1111', 'juan.perez@example.com'),
('María', 'Gómez', '555-2222', 'maria.gomez@example.com'),
('Carlos', 'López', '555-3333', 'carlos.lopez@example.com');

-- INSERTS DE AUTOMOVILES
INSERT INTO automoviles (marca, modelo, anio, precio)
VALUES
('Toyota', 'Corolla', 2022, 25000.00),
('Honda', 'Civic', 2021, 23000.00),
('Ford', 'Mustang', 2023, 45000.00);

-- INSERTS DE VENTAS
INSERT INTO ventas (id_cliente, id_automovil, fecha_venta, precio_venta)
VALUES
(1, 1, '2023-07-15', 24500.00),
(2, 2, '2023-08-01', 22500.00),
(3, 3, '2023-09-20', 44000.00);


-- REPORTE DE VENTAS
SELECT 
    v.id            AS id_venta,
    v.fecha_venta,
    v.precio_venta,
    c.nombre        AS nombre_cliente,
    c.apellido      AS apellido_cliente,
    c.telefono,
    c.correo_electronico,
    a.marca,
    a.modelo,
    a.anio
FROM ventas v
JOIN clientes c   ON v.id_cliente = c.id
JOIN automoviles a ON v.id_automovil = a.id;
