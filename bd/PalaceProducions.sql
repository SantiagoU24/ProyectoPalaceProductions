CREATE DATABASE PalaceProductions;
USE PalaceProductions;

CREATE TABLE Roles (
    id_rol INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     nombre_rol VARCHAR(10) NOT NULL,
    descripcion_rol CHAR(255)
   
);

-- aca esta combinado(ADMINISTRADOR Y CLIENTE)=	uSUARIOS 

CREATE TABLE Usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(255),
    apellidos VARCHAR(255),
    tipo_documento VARCHAR(50),
    numero_documento INT,
    fecha_de_nacimiento DATE,
    correo VARCHAR(255),
    contrasena VARCHAR(50),
    celular INT,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES Roles(id_rol)
);

CREATE TABLE Servicios (
    id_servicio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion_servicio VARCHAR(255) NOT NULL,
    precio FLOAT,
    categoria VARCHAR(50)
);

CREATE TABLE Solicitudes (
    id_solicitud INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT,
    id_usuario INT,
    presupuesto FLOAT,
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Fases (
    id_fase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion_fase VARCHAR(255)
);

CREATE TABLE Subfases (
    id_subfase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion_subfase VARCHAR(255),
    id_fase INT,
    FOREIGN KEY (id_fase) REFERENCES Fases(id_fase)
);

CREATE TABLE Detalles_Solicitud (
    id_detalle_solicitud INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_solicitud INT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    descripcion VARCHAR(255),
    observaciones VARCHAR(255),
    subtotal FLOAT,
    iva FLOAT,
    total FLOAT,
    id_subfase INT,
    FOREIGN KEY (id_solicitud) REFERENCES Solicitudes(id_solicitud),
    FOREIGN KEY (id_subfase) REFERENCES Subfases(id_subfase)
);

CREATE TABLE Citas (
    id_cita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_cita DATETIME,
    hora_cita DATETIME,
    estado_cita VARCHAR(255),
    id_empleado INT,
    id_cliente INT,
    id_servicio INT,
    id_solicitud INT,
    FOREIGN KEY (id_solicitud) REFERENCES Solicitudes(id_solicitud)
);

CREATE TABLE Cotizaciones (
id_Cotizaciones INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Fecha_Cotizacion DATE,
TipoEntidad ENUM('Cliente', 'Empresa'),
nombres VARCHAR(255),
apellidos VARCHAR(255),
numero_documento INT,
fecha_de_nacimiento DATE,
Ocupacion VARCHAR(255),
celular INT,
correo VARCHAR(255),
Servicios VARCHAR(255),
Presupuesto DECIMAL(10, 2),
Detalles_Proyecto TEXT
);

INSERT INTO Roles (id_rol,nombre_rol, descripcion_rol)
VALUES
    (1, 'Admi', 'Administrador'),
    (2, 'Clie', 'Cliente ');
    
    select*from roles;
INSERT INTO Usuarios (nombres, apellidos, tipo_documento, numero_documento, fecha_de_nacimiento, correo, contrasena, celular, id_rol)
VALUES
    ('Sofia', 'Sierra', 'Cedula', 12345678, '2005-05-08', 'Sofiasierra@gmail.com', 'Sofia.123#', 320548796, 2),
    ('Catalina', 'Barrera', 'Cedula', 98765432, '2002-05-09', 'Catabarrera@gmail.com', 'Cata_154', 3245874659, 2),
    ('Santiago', 'Urrea', 'Cedula', 54321678, '2004-02-17', 'SantiagoU@gmail.com', 'Saniago.237', 320456987, 1),
	('Paula', 'Ortegon', 'Cedula', 1034400408, '2006-08-24', 'PaulaO@gmail.com', 'Paula.1034', 3213446195, 1);
	select*from usuarios;
INSERT INTO Servicios (descripcion_servicio, precio, categoria)
VALUES
    ('Servicio de Marketing Digital Integral que incluye estrategias de SEO, publicidad en redes sociales y email marketing. Diseñado para aumentar la visibilidad en línea y atraer a una audiencia más amplia.', 150.000, 'Marketing Digital'),
    ('Servicio de Fotografía Profesional que captura momentos especiales en eventos, sesiones de retratos, bodas y más. Nuestro equipo de fotógrafos expertos utiliza equipos de alta calidad para crear recuerdos duraderos y hermosas imágenes que contarán tu historia.', 100.000, 'Fotografía'),
    ('Servicio de Creación de Videoclips Profesionales que transforma tu visión en videos impactantes. Nuestro equipo de producción experto trabaja en estrecha colaboración contigo para llevar a cabo tus ideas creativas y contar historias atractivas a través de la combinación de música y video. Desde la planificación y la filmación hasta la edición y la postproducción, estamos comprometidos con la entrega de videoclips excepcionales que resalten tu mensaje y tu música.
    ', 120.000, 'Videoclips');
    select*from servicios; 
        

