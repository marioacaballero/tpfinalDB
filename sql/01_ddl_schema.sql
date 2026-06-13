DROP TABLE IF EXISTS autor;
CREATE TABLE autor (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	nacionalidad VARCHAR(50)
);

DROP TABLE IF EXISTS genero;
CREATE TABLE genero (
	id_genero INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200)
);

DROP TABLE IF EXISTS libro;
CREATE TABLE libro (
	isbn VARCHAR(13) PRIMARY KEY,
	anio_publicacion INT NOT NULL,
	stock_total INT DEFAULT 0,
	stock_disponible INT DEFAULT 0 CHECK (stock_disponible >= 0 AND stock_disponible <= stock_total)	
);

DROP TABLE IF EXISTS libro_genero;
CREATE TABLE libro_genero (
	id_genero INT NOT NULL,
	id_libro VARCHAR(13) NOT NULL,
	PRIMARY KEY (id_genero, id_libro),
	FOREIGN KEY (id_genero) REFERENCES genero (id_genero) ON DELETE CASCADE,
	FOREIGN KEY (id_libro) REFERENCES libro (isbn) ON DELETE CASCADE
);

DROP TABLE IF EXISTS libro_autor;
CREATE TABLE libro_autor (
	id_autor INT NOT NULL,
	id_libro VARCHAR(13) NOT NULL,
	PRIMARY KEY (id_autor, id_libro),
	FOREIGN KEY (id_autor) REFERENCES autor (id_autor) ON DELETE CASCADE,
	FOREIGN KEY (id_libro) REFERENCES libro (isbn) ON DELETE CASCADE
);

DROP TABLE IF EXISTS socio;
CREATE TABLE socio (
	id_socio INT PRIMARY KEY AUTO_INCREMENT,
	dni VARCHAR(8) NOT NULL UNIQUE,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE CHECK (email LIKE '%@%'),
	fecha_alta DATE DEFAULT (CURDATE()),
	estado VARCHAR(50) DEFAULT 'ACTIVO' CHECK (estado IN ('ACTIVO', 'SUSPENDIDO', 'BAJA'))
);

DROP TABLE IF EXISTS ejemplar;
CREATE TABLE ejemplar (
	id_ejemplar INT PRIMARY KEY AUTO_INCREMENT,
	isbn VARCHAR(13) NOT NULL,
	nro_ejemplar INT NOT NULL,
	estado_fisico VARCHAR(50) CHECK (estado_fisico IN ('DISPONIBLE', 'PRESTADO', 'RESERVADO', 'BAJA')),
	FOREIGN KEY (isbn) REFERENCES libro (isbn) ON DELETE CASCADE
);

DROP TABLE IF EXISTS prestamo;
CREATE TABLE prestamo (
	id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
	fecha_prestamo DATETIME DEFAULT (CURDATE()),
	fecha_vencimiento DATETIME NOT NULL,
	fecha_devolucion DATETIME,
	estado VARCHAR(50) DEFAULT 'ACTIVO' CHECK (estado IN ('ACTIVO', 'DEVUELTO', 'VENCIDO')),
	id_socio INT NOT NULL,
	id_ejemplar INT NOT NULL,
	FOREIGN KEY (id_socio) REFERENCES socio (id_socio) ON DELETE CASCADE,
	FOREIGN KEY (id_ejemplar) REFERENCES ejemplar (id_ejemplar) ON DELETE CASCADE
);

DROP TABLE IF EXISTS tipo_sancion;
CREATE TABLE tipo_sancion (
	id_tipo INT PRIMARY KEY AUTO_INCREMENT,
	periodo INT NOT NULL
);

DROP TABLE IF EXISTS sancion;
CREATE TABLE sancion (
	id_sancion INT PRIMARY KEY AUTO_INCREMENT,
	id_socio INT NOT NULL,
	id_tipo INT,
	fecha_inicio DATE NOT NULL,
	motivo VARCHAR(100),
	activa boolean default true,
	FOREIGN KEY (id_socio) REFERENCES socio (id_socio) ON DELETE CASCADE,
	FOREIGN KEY (id_tipo) REFERENCES tipo_sancion (id_tipo) ON DELETE SET NULL
);
