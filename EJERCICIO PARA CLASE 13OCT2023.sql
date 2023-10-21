-- Paso 1: Crear la Base de Datos y Conectarse. Si un dado caso la base aun no aparece en el explorador debe desconectar y luego volver a conectar la base.
CREATE DATABASE EjemploTienda;
GO

USE EjemploTienda;  --con esta instruccion le decimos al management que base de datos deseamos utilizar
GO

-- Paso 2: Crear la Tabla de Usuarios
CREATE TABLE Usuarios ( 
    UserID INT IDENTITY(1,1) PRIMARY KEY, --Con esta linea se declara el campo UserID se le asigna que sea una llave primaria la cual se incrementa de uno en uno
    Nombre VARCHAR(50), --tipo de variable y longitud (solo aplica para los valores que sean de tipo varchar)
    Email VARCHAR(100) 
);
select*from Usuarios

-- Paso 3: Crear la Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY, ---identifica a una tabla y es única e irrepetible en la tabla a la que pertenece.
    NombreProducto VARCHAR(100),
    Precio DECIMAL(10, 2)
);

-- Paso 4: Crear la Tabla de Pedidos
CREATE TABLE Pedidos (  --hijo/secundaria  porque depende de tabla productos y usuario
    PedidoID INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioID INT,
    ProductoID INT,
    Cantidad INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UserID), --llaves foraneas son aquellos campos que en esta tabla por ejemplo
	                                                      --pueden ser repetitivos pero en otra tabla es un dato que no se puede repetir.
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Paso 5: Insertar Datos en las Tablas
-- Insertar un usuario
INSERT INTO Usuarios (Nombre, Email) VALUES ('Juan Pérez', 'juan@example.com');
INSERT INTO Usuarios (Nombre, Email) VALUES ('Toño Lira', 'toño@example.com');
INSERT INTO Usuarios (Nombre, Email) VALUES ('Bruno Castellanos', 'bruno@example.com');
select *from Usuarios

-- Insertar un producto
INSERT INTO Productos (NombreProducto, Precio) VALUES ('Camiseta', 19.99);
INSERT INTO Productos (NombreProducto, Precio) VALUES ('Pantalon', 35.00);
select* from Productos
-- Realizar un pedido
INSERT INTO Pedidos (UsuarioID, ProductoID, Cantidad) VALUES (1, 1, 3);
INSERT INTO Pedidos (UsuarioID, ProductoID, Cantidad) VALUES (2, 2, 5);
INSERT INTO Pedidos (UsuarioID, ProductoID, Cantidad) VALUES (2, 1, 6);
select*from pedidos

delete from Pedidos where PedidoID=2--para borrar un registro

-- Paso 6: Modificar Datos en las Tablas
-- Modificar el nombre de un usuario
UPDATE Usuarios SET Nombre = 'Antonio Pérez' WHERE UserID = 2;


-- Modificar el precio de un producto
UPDATE Productos SET Precio = 24.99 WHERE ProductoID = 1;



-- Paso 7: Eliminar Datos de las Tablas
-- Eliminar un pedido
DELETE FROM Pedidos WHERE PedidoID = 1;

-- Eliminar un producto
DELETE FROM Productos WHERE ProductoID = 1; --se podra eliminar siempre y cuando no hayan pedido este producto.

-- Paso 8: Consultas de INNER JOIN
-- Obtener nombres de usuarios, nombres de productos de los pedidos y cantidad
SELECT Usuarios.Nombre as 'Nombre del cliente', Productos.NombreProducto,pedidos.Cantidad as 'Cantidad',Productos.Precio as 'Precio Unitario'
FROM Pedidos
INNER JOIN Usuarios ON Pedidos.UsuarioID = Usuarios.UserID --el campo existe en ambas tablas y contiene el mismo valor o identificador
INNER JOIN Productos ON Pedidos.ProductoID = Productos.ProductoID;




-- Consulta 1: Seleccionar todos los usuarios y sus pedidos
SELECT Usuarios.Nombre, Pedidos.PedidoID, Productos.NombreProducto, Pedidos.Cantidad
FROM Usuarios
LEFT JOIN Pedidos ON Usuarios.UserID = Pedidos.UsuarioID --a la izquierda, en este caso nuestra tabla seria usuario porque es la que se declaro primero
LEFT JOIN Productos ON Pedidos.ProductoID = Productos.ProductoID;

-- Consulta 2: Seleccionar el total gastado por cada usuario
SELECT Usuarios.Nombre, SUM(Productos.Precio * Pedidos.Cantidad) AS 'Total Gastado'
FROM Usuarios
LEFT JOIN Pedidos ON Usuarios.UserID = Pedidos.UsuarioID
LEFT JOIN Productos ON Pedidos.ProductoID = Productos.ProductoID
GROUP BY Usuarios.Nombre;--agrupa todos los montos asociados a el usuario

-- Consulta 3: Seleccionar los productos con un precio mayor a $20
SELECT NombreProducto, Precio
FROM Productos
WHERE Precio > 20.00;

-- Consulta 4: Seleccionar los usuarios que no han realizado pedidos
SELECT Usuarios.Nombre
FROM Usuarios
LEFT JOIN Pedidos ON Usuarios.UserID = Pedidos.UsuarioID
WHERE Pedidos.PedidoID IS NULL;

-- Consulta 5: Seleccionar el nombre del producto más vendido y su cantidad
SELECT top 1  Productos.NombreProducto, SUM(Pedidos.Cantidad) AS 'Cantidad Vendida'
FROM Productos
INNER JOIN Pedidos ON Productos.ProductoID = Pedidos.ProductoID
GROUP BY Productos.NombreProducto
ORDER BY SUM(Pedidos.Cantidad) DESC;
