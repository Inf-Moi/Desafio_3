--Desafio 3
--Creacion de base de datos, desarrollo de los puntos del desafio
--Recordar ir ejecutando por partes
--Drop Database [Rentavideo], "Por si ya la tienen, pa eliminar".
Create Database [RentaVideo]
ON PRIMARY 
( 
    NAME = 'RentaVideo', 
    FILENAME = N'C:\Users\Steve\Desktop\desafio 3\RentaVideo.mdf', --Compañeros la ruta debe ser de su carpeta de destino 
    SIZE = 10MB,
    MAXSIZE = 20MB,
    FILEGROWTH = 10%
)
LOG ON 
(
    NAME = 'RentaVideo_log',
    FILENAME = N'C:\Users\Steve\Desktop\desafio 3\RentaVideo_log.ldf', --Lo mmismo aqui se debe poner una ruta de directorio valido
    SIZE = 9MB,
    MAXSIZE = 15MB,
    FILEGROWTH = 5MB
);

