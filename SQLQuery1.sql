--Desafio 3
--Creacion de base de datos, desarrollo de los puntos del desafio
--Recordar ir ejecutando por partes
--Drop Database [Rentavideo], "Por si ya la tienen, pa eliminar".
REATE DATABASE [RentaVideo]
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
    DUI INT PRIMARY KEY,
    Nombres VARCHAR(255),
    Apellidos VARCHAR(255),
    Fecha_de_Afiliacion DATE,
    Edad INT
);

CREATE TABLE tipos (
    Codigo INT PRIMARY KEY,
    Nombre_Tipo VARCHAR(255) CHECK (Nombre_Tipo IN ('DVD', 'VHS', 'CASSETTE'))
);

CREATE TABLE categoria (
    Codigo_Categoria INT PRIMARY KEY,
    Categorias VARCHAR(255)
);

CREATE TABLE peliculas (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Codigo_Tipo INT,
    Codigo_Categoria INT,
    Fecha_de_Ingreso DATE,
    FOREIGN KEY (Codigo_Tipo) REFERENCES tipos(Codigo),
    FOREIGN KEY (Codigo_Categoria) REFERENCES categoria(Codigo_Categoria)
);

CREATE TABLE rentas (
    Codigo INT PRIMARY KEY,
    DUI INT,
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
(00455594-0, 'Carlos', 'Alfaro', '2022-11-05', 30);

INSERT INTO clientes (DUI, Nombres, Apellidos, Fecha_de_Afiliacion, Edad)
VALUES

INSERT INTO tipo (DUI, Nombre_Tipo)
VALUES

INSERT INTO categoria (Codigo_Categoria, categoria)
VALUES

INSERT INTO peliculas (Codigo, Nombre, Codigo_Tipo, Codigo_Categoria, Fecha_de_Ingreso)
VALUES

INSERT INTO rentas (Codigo, DUI, Fecha_de_Prestamo, Fecha_de_Devolucion, Cobro, Mora)
VALUES
