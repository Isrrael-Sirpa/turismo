CREATE DATABASE turismo;
-- Crear la tabla 'roles'
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar algunos roles por defecto
INSERT INTO
    roles (nombre, descripcion)
VALUES (
        'ADMIN',
        'Tiene acceso completo al sistema'
    ),
    (
        'USUARIO',
        'Usuario estándar con permisos limitados'
    ),
    (
        'MODERADOR',
        'Puede moderar el contenido del sistema'
    );

-- Crear la tabla 'usuarios'
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    usuario VARCHAR(20) UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    telefono VARCHAR(15),
    direccion TEXT,
    id_rol INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_rol) REFERENCES roles (id_rol) ON DELETE CASCADE
);

CREATE TABLE destino (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del destino
    nombre VARCHAR(100) NOT NULL, -- Nombre del destino, ej. "Cusco"
    descripcion TEXT, -- Descripción del destino
    ubicacion VARCHAR(255), -- Dirección o ubicación específica del destino
    departamento VARCHAR(100), -- Ciudad donde se encuentra el destino
    coordenadas VARCHAR(100),
    popularidad INT DEFAULT 0, -- Nivel de popularidad del destino (ej. basado en reservas)
    imagenes JSON, -- Campo JSON que contiene múltiples URLs o rutas de imágenes
    clima VARCHAR(50), -- Información sobre el clima (ej. "Templado", "Frío")
    temporada_recomendada VARCHAR(50), -- Mejor temporada para visitar, ej. "Abril - Octubre"
    restricciones TEXT, -- Restricciones del destino, ej. "No se permiten mascotas"
    atracciones TEXT, -- Atracciones turísticas destacadas, ej. "Machu Picchu, Sacsayhuamán"
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación del registro
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Última actualización
);

CREATE TABLE transporte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM(
        'AUTOBUS',
        'AVION',
        'BARCO',
        'MINIBUS',
        'TAXI'
    ),
    codigo VARCHAR(20) UNIQUE,
    estado ENUM(
        'DISPONIBLE',
        'RESERVADO',
        'MANTENIMIENTO',
        'NUEVO'
    ) DEFAULT 'NUEVO',
    capacidad INT NOT NULL,
    imagenes JSON,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ejecutar solo esto para alojamiento
CREATE TABLE alojamiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL, -- Nombre del alojamiento
    tipo VARCHAR(50) NOT NULL, -- Hotel, cabaña, hostal, etc.
    departamento VARCHAR(100) NOT NULL,
    url_maps VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL, -- Dirección o descripción del lugar
    capacidad INT NOT NULL, -- Cantidad máxima de personas
    precio DECIMAL(10, 2) NOT NULL, -- Precio por noche o paquete
    calificacion DECIMAL(3, 2) DEFAULT 0.0, -- Calificación promedio
    servicios TEXT, -- Servicios ofrecidos (WiFi, piscina, desayuno, etc.)
    disponibilidad ENUM('DISPONIBLE', 'RESERVADO', 'MANTENIMIENTO', 'NUEVO') DEFAULT('NUEVO'), -- Si está disponible o no
    descripcion TEXT, -- Detalles adicionales del alojamiento
    imagenes JSON, -- Enlace(s) a imágenes del alojamiento
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Última actualización
);




-- crear esto   --------------------------------------------------
CREATE TABLE tipo_paquete (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del tipo de paquete
    nombre VARCHAR(100) NOT NULL UNIQUE, -- Nombre del tipo de paquete
    descripcion TEXT -- Breve descripción del tipo de paquete
);
INSERT INTO tipo_paquete (nombre, descripcion) VALUES
('Culturales e Historia', 'Explora sitios históricos y culturales destacados.'),
('Aventura Extrema', 'Tours para los amantes de la adrenalina y la aventura.'),
('Naturaleza y Relajación', 'Disfruta de paisajes naturales y momentos de relajación.'),
('Paquetes familiares', 'Experiencias diseñadas para toda la familia.'),
('Paquetes Duo (Parejas)', 'Paquetes románticos para disfrutar en pareja.'),
('Paquetes Personalizados', 'Diseña tours según tus intereses y preferencias.');


CREATE TABLE paquete (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del paquete
    nombre VARCHAR(100) NOT NULL, -- Nombre del paquete, ej. "Paquete Cusco Mágico"
    descripcion TEXT, -- Descripción del paquete
    departamento_origen VARCHAR(100), -- Ciudad donde se encuentra el origen
    lugar_salida VARCHAR(100), -- Ciudad donde el viaje
    destino_id INT NOT NULL, -- Relación con la tabla destino
    transporte_salida INT NOT NULL, -- Relación con la tabla transporte
    transporte_regreso INT NOT NULL, -- Relación con la tabla transporte
    alojamiento_id INT NOT NULL, -- Relación con la tabla alojamiento
    id_tipo_paquete INT NOT NULL, -- Relación con la tabla tipo_paquete
    precio_total DECIMAL(10, 2) NOT NULL, -- Precio total del paquete
    duracion TEXT NOT NULL, -- Duración en días
    estado ENUM('DISPONIBLE', 'RESERVADO', 'CANCELADO', 'PROMOCION') DEFAULT 'DISPONIBLE', -- Estado del paquete
    plaza_disponible INT NOT NULL, -- Cantidad de plazas disponibles
    informacion_adicional TEXT, -- Información adicional que pueda ser útil para el usuario (detalles de la habitación, políticas de cancelación, etc.)
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Última actualización
    FOREIGN KEY (destino_id) REFERENCES destino(id) ON DELETE CASCADE, -- Relación con destino
    FOREIGN KEY (alojamiento_id) REFERENCES alojamiento(id) ON DELETE CASCADE, -- Relación con alojamiento
    FOREIGN KEY (id_tipo_paquete) REFERENCES tipo_paquete(id) ON DELETE CASCADE,
    FOREIGN KEY (transporte_salida) REFERENCES transporte(id) ON DELETE CASCADE,
    FOREIGN KEY (transporte_regreso) REFERENCES transporte(id) ON DELETE CASCADE
);


/* procedimientos */

-- Active: 1731782349802@@127.0.0.1@3306@turismo

-- CONSULTAS
SELECT * FROM paquete;

SELECT * from tipo_paquete;

SELECT * FROM destino;

DELIMITER / /

CREATE PROCEDURE obtener_paquetes()
BEGIN
	SELECT P.id,D.nombre, D.coordenadas, D.departamento, TP.nombre as tipo_paquete, P.precio_total, P.descripcion, D.imagenes,

	FROM paquete P
	INNER JOIN destino D ON P.destino_id = D.id
	INNER JOIN tipo_paquete TP ON P.id_tipo_paquete = TP.id;
END //

DELIMITER;

CALL obtener_paquetes ();

DROP PROCEDURE obtener_paquetes

SELECT
    D.id,
    TP.nombre as tp_paquete,
    D.nombre as d_nombre,
    D.descripcion,
    D.departamento as d_departamento,
    D.ubicacion,
    D.coordenadas as d_coordenadas,
    D.imagenes as d_imagenes,
    D.clima,
    D.restricciones,
    D.atracciones,
    A.nombre as a_nombre,
    A.tipo as a_tipo,
    A.url_maps as a_tipo,
    A.ubicacion as a_ubicacion,
    A.servicios as a_servicios,
    A.descripcion as a_descripcion,
    A.imagenes,
    T.tipo as t_tipo,
    T.codigo as t_codigo
FROM
    paquete P
    INNER JOIN destino D ON P.destino_id = D.id
    INNER JOIN tipo_paquete TP ON P.id_tipo_paquete = TP.id
    INNER JOIN alojamiento A ON P.alojamiento_id = A.id
    INNER JOIN transporte T ON P.transporte_salida = T.id
WHERE
    P.id = 1;

DELIMITER //

CREATE PROCEDURE oi_paquete(IN paquete_id INT)
BEGIN
    SELECT     
        D.id,
		P.duracion as p_duracion,
		P.precio_total as p_precio_total,
        TP.nombre AS tp_paquete,
        D.nombre AS d_nombre,
        D.descripcion as d_descripcion,
        D.departamento AS d_departamento,
        D.ubicacion,
        D.coordenadas AS d_coordenadas,
        D.imagenes AS d_imagenes,
        D.clima,
        D.restricciones,
        D.atracciones,
        A.nombre AS a_nombre,
        A.tipo AS a_tipo,
        A.url_maps AS a_url_maps,
        A.ubicacion AS a_ubicacion,
        A.servicios AS a_servicios,
        A.descripcion AS a_descripcion,
        A.imagenes,
        T.tipo AS t_tipo,
        T.codigo AS t_codigo
    FROM paquete P
    INNER JOIN destino D ON P.destino_id = D.id
    INNER JOIN tipo_paquete TP ON P.id_tipo_paquete = TP.id
    INNER JOIN alojamiento A ON P.alojamiento_id = A.id
    INNER JOIN transporte T ON P.transporte_salida = T.id 
    WHERE P.id = paquete_id;
END //

DELIMITER ;

DROP PROCEDURE oi_paquete;

CALL oi_paquete (5);