--Desafio 3
--Creacion de base de datos, desarrollo de los puntos del desafio
--Recordar ir ejecutando por partes
--Drop Database [Rentavideo], "Por si ya la tienen, pa eliminar".
CREATE DATABASE [RentaVideo]
ON PRIMARY 
( 
    NAME = N'RentaVideo', 
    FILENAME = 'C:\SQLData\Rentavideo.mdf', --Verificar el directorio de ruta
    SIZE = 10MB,
    MAXSIZE = 20MB,
    FILEGROWTH = 10%
)
LOG ON 
(
    NAME = N'RentaVideo_log',
    FILENAME = 'C:\SQLData\Rentavideo_log.ldf', --Verificar el directorio de ruta 
    SIZE = 9MB,
    MAXSIZE = 15MB,
    FILEGROWTH = 5MB
);

--Siguiente ejecucion 2
--Nos pasamos a base de datos de Rentavideo
--Creacion de Tablas

CREATE TABLE clientes (
    DUI VARCHAR(10) PRIMARY KEY,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Fecha_de_Afiliacion DATE,
    Edad INT
);

CREATE TABLE tipos (
    Codigo VARCHAR(4) PRIMARY KEY,
    Nombre_Tipo VARCHAR(25) CHECK (Nombre_Tipo IN ('DVD', 'VHS', 'CASSETTE'))
);

CREATE TABLE categoria (
    Codigo_Categoria VARCHAR(4) PRIMARY KEY,
    Categorias VARCHAR(50)
);

CREATE TABLE peliculas (
    Codigo VARCHAR(4) PRIMARY KEY,
    Nombre VARCHAR(50),
    Codigo_Tipo VARCHAR(4),
    Codigo_Categoria VARCHAR(4),
    Fecha_de_Ingreso DATE,
    FOREIGN KEY (Codigo_Tipo) REFERENCES tipos(Codigo),
    FOREIGN KEY (Codigo_Categoria) REFERENCES categoria(Codigo_Categoria)
);

CREATE TABLE rentas (
    Codigo VARCHAR(4) PRIMARY KEY,
    DUI VARCHAR(10),
    Fecha_de_Prestamo DATE,
    Fecha_de_Devolucion DATE,
    Cobro DECIMAL(10, 2),
    Mora DECIMAL(10, 2),
    FOREIGN KEY (DUI) REFERENCES clientes(DUI)
);

-- Incertar datos en las tablas

INSERT INTO clientes (DUI, Nombres, Apellidos, Fecha_de_Afiliacion, Edad)
VALUES 
(00224432-3, 'Miguel Armando', 'Cardoza Sosa', '2008-04-21', 17),
(00278283-2, 'Maria Elena', 'Sanchez Campos', '2008-04-24', 24),
(00455594-0, 'Carlos', 'Alfaro', '2022-11-05', 30),
(00900082-9, 'Jorge Ernesto','Manzanero Vasquez', '2008-08-06',28),
(00901133-2, 'Jose Antonio', 'Juarez Blanco', '2008-04-08', 19),
(01433949-8, 'Herson', 'Serrano', '2007-06-14', 29),
(01503949-2, 'Raul Ernesto', 'Barraza Sorto', '2008-06-14', 29),
(01850173-9, 'Juan Jose', 'Recinos Ayala', '2008-03-14', 28),
(01900683-1, 'Pedro Arias', 'Rivas Ayala', '2008-05-22', 26),
(02829380-9, 'Ana Epifania', 'Lopez Durango', '2008-07-15', 24);

INSERT INTO tipos(Codigo, Nombre_Tipo)
VALUES
('T001', 'DVD'),
('T002', 'VHS'),
('T003', 'CASSETE');

INSERT INTO categoria (Codigo_Categoria, Categorias)
VALUES
('C001', 'Comedia'),
('C002', 'Infantiles'),
('C003', 'Suspenso'),
('C004', 'Drama'),
('C005', 'Accion'),
('C006', 'Juegos'),
('C007', 'Sonidos'),
('C008', 'Romance'),
('C009', 'Terror'),
('C010' , 'Anime');
