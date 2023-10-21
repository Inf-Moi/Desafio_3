--Desafio 3
--Creacion de base de datos, desarrollo de los puntos del desafio
--Recordar ir ejecutando por partes
--Drop Database [Rentavideo], "Por si ya la tienen, pa eliminar".
Drop Database [Rentavideo], --"Por si ya la tienen, pa eliminar".
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

Select *From categoria

CREATE TABLE peliculas (
    Codigo_Producto VARCHAR(4) PRIMARY KEY,
    Nombre VARCHAR(50),
    Codigo_Tipo VARCHAR(4),
    Codigo_Categoria VARCHAR(4),
    Fecha_de_Ingreso DATE,
	Disponible INT,
    FOREIGN KEY (Codigo_Tipo) REFERENCES tipos(Codigo),
    FOREIGN KEY (Codigo_Categoria) REFERENCES categoria(Codigo_Categoria)
);

CREATE TABLE rentas (
    Codigo_Renta VARCHAR(4) PRIMARY KEY,
	Codigo_Producto VARCHAR(4),
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
('00224432-3', 'Miguel Armando', 'Cardoza Sosa', '2008-04-21', 17),
('00278283-2', 'Maria Elena', 'Sanchez Campos', '2008-04-24', 24),
('00455594-0', 'Carlos', 'Alfaro', '2022-11-05', 30),
('00900082-9', 'Jorge Ernesto','Manzanero Vasquez', '2008-08-06',28),
('00901133-2', 'Jose Antonio', 'Juarez Blanco', '2008-04-08', 19),
('01433949-8', 'Herson', 'Serrano', '2007-06-14', 29),
('01503949-2', 'Raul Ernesto', 'Barraza Sorto', '2008-06-14', 29),
('01850173-9', 'Juan Jose', 'Recinos Ayala', '2008-03-14', 28),
('01900683-1', 'Pedro Arias', 'Rivas Ayala', '2008-05-22', 26),
('02829380-9', 'Ana Epifania', 'Lopez Durango', '2008-07-15', 24);

DROP TABLE clientes;
Delete from clientes
Select *from clientes

INSERT INTO tipos(Codigo, Nombre_Tipo)
VALUES
('T001', 'DVD'),
('T002', 'VHS'),
('T003', 'CASSETTE');

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

INSERT INTO peliculas (Codigo_Producto, Nombre, Codigo_Tipo, Codigo_Categoria, Fecha_de_Ingreso, Disponible)
VALUES
('P001', 'Ace Ventura', 'T001', 'C001', '2003-02-12', 3),
('P002' ,'El Mundo de los Quien' ,'T001' ,'C002' ,'2006-10-01' , 4),
('P003' ,'El Ultimo Guerrero' ,'T002' ,'C005' ,'2005-12-11' ,5),
('P004' ,'Aguas Turbias' ,'T001' ,'C003' ,'2005-11-21' ,6),
('P005' ,'Terminator III' ,'T003' ,'C006' ,'2003-12-26' ,5),
('P006' ,'La Sociedad de los Poetas' ,'T002' ,'C004' ,'2004-09-12' ,4),
('P007' ,'Final Fantasy III' ,'T003' ,'C006' ,'2006-08-23' ,5),
('P008' ,'Little Frog' ,'T001' ,'C002' ,'2007-01-18' ,6),
('P009' ,'Halo 2' ,'T001' ,'C006' ,'2007-07-07' ,7),
('P010' ,'Ace Ventura 2' ,'T001' ,'C001' ,'2006-06-14' ,4),
('P011' ,'Oraciones y alabanzas' ,'T003' ,'C007' ,'2006-12-12' ,3),
('P012' ,'Donde hay llanto hay risa' ,'T001' ,'C007' ,'2007-03-11' ,3),
('P013' ,'Rambo III' ,'T001' ,'C006' ,'2004-08-27' ,5),
('P014' ,'Terminator I' ,'T003' ,'C006' ,'2003-04-22' ,3),
('P015' ,'Como agua para chocolate' ,'T001' ,'C008' ,'2002-05-18' ,2),
('P016' ,'Black Adam' ,'T001' ,'C005' ,'2022-11-05' ,2);

Select *from peliculas

INSERT INTO rentas (Codigo_Renta, Codigo_Producto, DUI, Fecha_de_Prestamo, Fecha_de_Devolucion, Cobro, Mora)
VALUES
('R001' , 'P003' , '00900082-9' , '2003-02-12 00:00:00.000' , '2003-02-16 00:00:00.000', 1.50 ,0.50  ),
('R002' , 'P006' , '00224432-3' , '2006-10-01 00:00:00.000' , '2006-10-08 00:00:00.000', 1.50 ,0.00  ),
('R003' , 'P001' , '00901133-2' , '2005-12-11 00:00:00.000' , '2005-12-14 00:00:00.000', 1.50 ,0.00  ),
('R004' , 'P007' , '02829380-9' , '2005-11-21 00:00:00.000' , '2005-11-29 00:00:00.000', 1.50 ,0.50  ),
('R005' , 'P008' , '00278283-2' , '2003-12-26 00:00:00.000' , '2003-12-28 00:00:00.000', 1.50 ,0.00  ),
('R006' , 'P004' , '00224432-3' , '2004-09-12 00:00:00.000' , '2004-09-20 00:00:00.000', 1.50 ,0.50  ),
('R007' , 'P003' , '00900082-9' , '2006-08-23 00:00:00.000' , '2006-08-26 00:00:00.000', 1.50 ,0.00  ),
('R008' , 'P002' , '01503949-2' , '2007-01-18 00:00:00.000' , '2007-07-21 00:00:00.000', 1.50 ,0.00  ),
('R009' , 'P007' , '00901133-2' , '2007-07-07 00:00:00.000' , '2007-07-09 00:00:00.000', 1.50 ,0.00  ),
('R010' , 'P006' , '01900683-1' , '2006-06-14 00:00:00.000' , '2006-06-24 00:00:00.000', 1.50 ,0.50  ),
('R011' , 'P010' , '01850173-9' , '2006-12-12 00:00:00.000' , '2006-12-21 00:00:00.000', 1.50 ,0.50  ),
('R012' , 'P005' , '00900082-9' , '2007-03-11 00:00:00.000' , '2007-03-13 00:00:00.000', 1.50 ,0.00  ),
('R013' , 'P014' , '01900683-1' , '2004-08-27 00:00:00.000' , '2004-08-29 00:00:00.000', 1.50 ,0.00  ),
('R014' , 'P007' , '01850173-9' , '2003-04-22 00:00:00.000' , '2003-04-24 00:00:00.000', 1.50 ,0.00  ),
('R015' , 'P015' , '00224432-3' , '2002-05-18 00:00:00.000' , '2002-05-28 00:00:00.000', 1.50 ,0.50  );

Select *From clientes

--Consultas 
--Mostrar el nombre de los clientes que tengan más de 25 años, ordenar descendente según la edad. 
SELECT 
Nombres, Edad
FROM clientes 
WHERE Edad > 25
ORDER BY Edad DESC;

--Mostrar el nombre de los clientes que tengan entre 18 y 26 años
SELECT Nombres, Edad
FROM clientes
WHERE Edad BETWEEN 18 AND 26;

--Muestre todas las categorías de la tabla categoría, pero no debe mostrar Suspenso ni Drama
SELECT Categorias
FROM categoria
WHERE Categorias NOT IN ('Suspenso', 'Drama');

--Mostrar los clientes que tienen mora
SELECT 
clientes.Nombres,
rentas.mora 
FROM clientes INNER JOIN rentas ON clientes.DUI = rentas.DUI
WHERE rentas.mora > 0

--Mostrar los clientes y las fechas en que se han afiliado entre abril y junio del año 2008
SELECT Nombres, Fecha_de_Afiliacion
FROM clientes
WHERE Fecha_de_Afiliacion BETWEEN '2008-04-01' AND '2008-06-30';

--Mostrar el top 3 de películas que tienen mas existencias disponibles en el renta video
SELECT TOP 3 Nombre, Disponible AS Peliculas_disponibles
FROM peliculas
ORDER BY Disponible DESC;

--Siguientes Modificaciones (Ejecutar hasta video)
--Modifique la categoría Juegos por Games 
UPDATE categoria
SET Categorias = 'Games'
WHERE Categorias = 'Juegos';

--Modifique la fecha de ingreso a 13 de abril 2022 y la cantidad disponible a 10 de la película de 
--ACE Ventura(en una sola consulta) 
UPDATE peliculas
SET Fecha_Ingreso = '13-04-2022', Disponible = 10
WHERE Nombre = 'Ace Ventura';

--Muestre los nombres de las películas que comiencen con la letra A 
SELECT Nombre
FROM peliculas
WHERE Nombre LIKE 'A%';

--Elimine las rentas que realizó Pedro Arias Rivas Cisneros
DELETE r
FROM Rentas r
INNER JOIN Clientes c ON r.DUI = c.DUI
WHERE c.Nombres = 'Pedro Arias' AND c.Apellidos = 'Rivas Cisneros';

--Investigacion de lo Joins
--¿Que es ? : Devuelve los registros que tienen valores coincidentes en ambas tablas.
--Muestre la categoría y el nombre de la película 
--Con Join
SELECT categoria.Categorias, peliculas.Nombre
FROM peliculas
JOIN categoria ON peliculas.Codigo_Categoria = categoria.Codigo_Categoria;

--Muestre la categoría, el tipo y el nombre de la película 

--Con Join
SELECT categoria.Categorias, tipos.Nombre_Tipo, peliculas.Nombre
FROM peliculas
JOIN categoria ON peliculas.Codigo_Categoria = categoria.Codigo_Categoria
JOIN tipos ON peliculas.Codigo_Tipo = tipos.Codigo;
