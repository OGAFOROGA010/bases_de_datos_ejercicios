--vamos a eliminar el esquema base o por defecto
DROP SCHEMA PUBLIC;
--creamos el esquema para nuestra base de datos
CREATE SCHEMA IF NOT EXISTS gimnasio;

--creamos las tablas para las entidades independientes 
CREATE TABLE IF NOT EXISTS gimnasio.entrenadores (
Id_entrenador INT UNIQUE NOT NULL primary key,
Nombre_entrenador VARCHAR (20) NOT NULL,
Apellido_entrenador VARCHAR (20) NOT NULL,
Telefono VARCHAR (20) NOT NULL,
Documento VARCHAR (25) NOT NULL,
Especialidad VARCHAR (50) NOT NULL
);

--creamos la segunda tabla indenpendiente 
CREATE TABLE IF NOT EXISTS gimnasio.planes (
Id_plan INT UNIQUE NOT NULL primary key,
Nombre VARCHAR (50) NOT NULL,
Duracion_meses INT NOT NULL,
Precio DECIMAL (10,2) NOT NULL
);

--creamos la tabla para la entidad dependiente socio 
CREATE TABLE IF NOT EXISTS gimnasio.socios (
Documento VARCHAR (25) NOT NULL,
Nombre_socio VARCHAR (20) NOT NULL,
Apellido_socio VARCHAR (20) NOT NULL,
Telefono VARCHAR (10) NOT NULL,
Fecha_ingreso DATE NOT NULL,
Id_plan INT NOT NULL,
CONSTRAINT fk_socio_plan FOREIGN KEY (Id_plan) REFERENCES gimnasio.planes (Id_plan)
);

--creamos la tabla para la entidad dependiente tarjeta
CREATE TABLE IF NOT EXISTS gimnasio.tarjetas (
Codigo VARCHAR (30) UNIQUE NOT NULL primary key,
Fecha_vencimiento DATE NOT NULL,
Documento_socio VARCHAR (20) UNIQUE NOT NULL,
CONSTRAINT fk_tarjeta_socio FOREIGN KEY (Documento_socio) REFERENCES gimnasio.socios (Documento)
);

--creamos la tabla para la entidad dependiente clases
CREATE TABLE IF NOT EXISTS gimnasio.clases(
Id_clase INT UNIQUE NOT NULL primary key,
Id_entrenador INT,
Nombre VARCHAR (50) NOT NULL,
Documento_entrenador VARCHAR (25) NOT NULL,
Fecha_clase DATE, 
Hora_clase TIME,
CONSTRAINT fk_clase_entrenador FOREIGN KEY (Id_entrenador) REFERENCES gimnasio.entrenadores (Id_entrenador)
);

--creamos la tabla para la entidad con dependencia multiple
CREATE TABLE IF NOT EXISTS gimnasio.asistencias (
Id_asistencia INT UNIQUE NOT NULL primary key,
Documento_socio VARCHAR (20) NOT NULL,
Id_clase INT NOT NULL,
Fecha_asistencia DATE NOT NULL,
CONSTRAINT fk_asistencia_socio FOREIGN KEY (Documento_socio) REFERENCES gimnasio.socios (Documento),
CONSTRAINT fk_asistencia_clase FOREIGN KEY (Id_clase) REFERENCES gimnasio.clases (Id_clase)
);






