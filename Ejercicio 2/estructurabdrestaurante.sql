--crear el esquema para nuestra base de datos
CREATE SCHEMA IF NOT EXISTS restaurante;

--creamos las tablas para las entidades independientes
CREATE TABLE IF NOT EXISTS restaurante.clientes (
Id_cedula INT UNIQUE NOT NULL primary key, 
Nombre VARCHAR (50) NOT NULL, 
Celular VARCHAR (10) NOT NULL, 
Direccion VARCHAR (50) NOT NULL, 
Barrio VARCHAR (50) NOT NULL 
);

--Segunda tabla independiente
CREATE TABLE IF NOT EXISTS restaurante.categorias (
Id_categoria INT UNIQUE NOT NULL primary key,
precio_actual DECIMAL (10,0) NOT NULL,
Entradas VARCHAR (50) NOT NULL, 
Platos_fuerte VARCHAR (80) NOT NULL,
Bebidas VARCHAR (30) NOT NULL
);

--creamos las tablas para las entidades independientes
CREATE TABLE IF NOT EXISTS restaurante.moto (
Id_moto INT UNIQUE NOT NULL PRIMARY KEY,
Placa VARCHAR (10) NOT NULL,
Modelo VARCHAR (20) NOT NULL,
SOAT VARCHAR (50) NOT NULL,
);

CREATE TABLE IF NOT EXISTS restaurante.domiciliario(
Id_domiciliario INT UNIQUE NOT NULL PRIMARY KEY
Id_moto INT NOT NULL


)
CREATE TABLE IF NOT EXISTS restaurante.pedido (
Id_pedido INT UNIQUE NOT NULL PRIMARY KEY
Id_plato INT NOT NULL,
Cantidad INT NOT NULL,
Precio_UNITARIO DECIMAL (10,0) NOT NULL,
);








