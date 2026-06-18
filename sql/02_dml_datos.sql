START TRANSACTION;

INSERT INTO genero (nombre, descripcion) VALUES
('Novela Histórica', 'Relatos basados en hechos o periodos históricos reales.'),
('Ciencia Ficción', 'Historias sobre futuro, tecnología avanzada y viajes espaciales.'),
('Fantasía', 'Mundos imaginarios con magia, criaturas míticas y aventuras épicas.'),
('Policial / Thriller', 'Historias de crímenes, misterios y suspenso psicológico.'),
('Realismo Mágico', 'Narrativas donde lo irreal o extraño se muestra como algo cotidiano.');

INSERT INTO autor (nombre, apellido, nacionalidad) VALUES
('Gabriel', 'García Márquez', 'Colombiana'),
('Isabel', 'Allende', 'Chilena'),
('Jorge Luis', 'Borges', 'Argentina'),
('Julio', 'Cortázar', 'Argentina'),
('Stephen', 'King', 'Estadounidense'),
('J.K.', 'Rowling', 'Británica'),
('George R.R.', 'Martin', 'Estadounidense'),
('Isaac', 'Asimov', 'Rusa'),
('Agatha', 'Christie', 'Británica'),
('Arturo', 'Pérez-Reverte', 'Española');

INSERT INTO libro (isbn, anio_publicacion, stock_total, stock_disponible, titulo) VALUES
('9780307474728', 1967, 5, 3, 'Cien años de soledad'),
('9780060934347', 1982, 4, 4, 'La casa de los espíritus'),
('9788420633114', 1944, 3, 2, 'Ficciones'),
('9788439734475', 1963, 3, 1, 'Rayuela'),
('9781501143519', 1977, 6, 5, 'El resplandor'),
('9780747532699', 1997, 10, 8, 'Harry Potter 1'),
('9780553103540', 1996, 5, 2, 'Juego de Tronos'),
('9780553293357', 1951, 4, 4, 'Fundación'),
('9780007119318', 1934, 4, 3, 'Asesinato en el Orient Express'),
('9788420412146', 1996, 3, 3, 'El capitán Alatriste'),
('9780307389732', 1985, 3, 2, 'El amor en los tiempos del cólera'),
('9781501144264', 1986, 5, 4, 'It'),
('9780747538486', 1998, 8, 7, 'Harry Potter 2'),
('9780553108033', 1998, 4, 1, 'Choque de Reyes'),
('9780553294385', 1952, 3, 3, 'Fundación e Imperio'),
('9780007122035', 1926, 4, 2, 'El asesinato de Roger Ackroyd'),
('9788499928500', 2018, 2, 2, 'Sabotaje'),
('9788466338141', 2002, 3, 1, 'La reina del sur'),
('9788408045076', 1953, 4, 4, 'El Aleph (Borges, reedición)'),
('9788420442389', 1951, 3, 2, 'Bestiario (Cortázar)');

INSERT INTO libro_genero (id_genero, id_libro) VALUES
(5, '9780307474728'), (1, '9780060934347'), (5, '9780060934347'),
(5, '9788420633114'), (5, '9788439734475'), (4, '9781501143519'),
(3, '9780747532699'), (3, '9780553103540'), (2, '9780553293357'),
(4, '9780007119318'), (1, '9788420412146'), (5, '9780307389732'),
(4, '9781501144264'), (3, '9780747538486'), (3, '9780553108033'),
(2, '9780553294385'), (4, '9780007122035'), (1, '9788499928500'),
(4, '9788466338141'), (5, '9788408045076'), (5, '9788420442389');

INSERT INTO libro_autor (id_autor, id_libro) VALUES
(1, '9780307474728'), (2, '9780060934347'), (3, '9788420633114'),
(4, '9788439734475'), (5, '9781501143519'), (6, '9780747532699'),
(7, '9780553103540'), (8, '9780553293357'), (9, '9780007119318'),
(10, '9788420412146'), (1, '9780307389732'), (5, '9781501144264'),
(6, '9780747538486'), (7, '9780553108033'), (8, '9780553294385'),
(9, '9780007122035'), (10, '9788499928500'), (10, '9788466338141'),
(3, '9788408045076'), (4, '9788420442389');

INSERT INTO socio (dni, nombre, apellido, email, fecha_alta, estado) VALUES
('35123456', 'Juan', 'Pérez', 'juan.perez@email.com', '2025-01-15', 'ACTIVO'),
('36234567', 'María', 'González', 'maria.gonzalez@email.com', '2025-01-20', 'ACTIVO'),
('37345678', 'Carlos', 'Rodríguez', 'carlos.rod@email.com', '2025-02-02', 'SUSPENDIDO'),
('38456789', 'Ana', 'Martínez', 'ana.mtz@email.com', '2025-02-10', 'ACTIVO'),
('39567890', 'Luis', 'Gómez', 'luis.gomez@email.com', '2025-02-18', 'ACTIVO'),
('40678901', 'Laura', 'Sánchez', 'laura.sanz@email.com', '2025-03-01', 'ACTIVO'),
('41789012', 'Diego', 'Díaz', 'diego.diaz@email.com', '2025-03-05', 'ACTIVO'),
('42890123', 'Florencia', 'Fernández', 'flor.fer@email.com', '2025-03-12', 'BAJA'),
('43901234', 'Andrés', 'López', 'andres.lopez@email.com', '2025-03-20', 'ACTIVO'),
('34012345', 'Sofia', 'Álvarez', 'sofia.alvarez@email.com', '2025-04-02', 'ACTIVO'),
('33123456', 'Martín', 'Romero', 'martin.r@email.com', '2025-04-10', 'ACTIVO'),
('32234567', 'Lucía', 'Torres', 'lucia.torres@email.com', '2025-04-15', 'ACTIVO'),
('31345678', 'Facundo', 'Suárez', 'facu.suarez@email.com', '2025-04-22', 'SUSPENDIDO'),
('30456789', 'Elena', 'Herrera', 'elena.h@email.com', '2025-05-02', 'ACTIVO'),
('29567890', 'Santiago', 'Medina', 'santi.medina@email.com', '2025-05-09', 'ACTIVO'),
('28678901', 'Valentina', 'Castro', 'valen.castro@email.com', '2025-05-14', 'ACTIVO'),
('27789012', 'Matías', 'Vargas', 'matias.vargas@email.com', '2025-05-20', 'ACTIVO'),
('26890123', 'Camila', 'Benítez', 'cami.b@email.com', '2025-05-25', 'ACTIVO'),
('25901234', 'Nicolás', 'Ramírez', 'nico.ramirez@email.com', '2025-06-01', 'ACTIVO'),
('44012345', 'Agustina', 'Flores', 'agus.flores@email.com', '2025-06-04', 'ACTIVO'),
('45123456', 'Bruno', 'Acosta', 'bruno.acosta@email.com', '2025-06-11', 'ACTIVO'),
('46234567', 'Martina', 'Silva', 'marti.silva@email.com', '2025-06-18', 'ACTIVO'),
('47345678', 'Joaquín', 'Pereyra', 'joaco.p@email.com', '2025-06-22', 'ACTIVO'),
('48456789', 'Micaela', 'Rojas', 'mica.rojas@email.com', '2025-07-01', 'ACTIVO'),
('49567890', 'Tomás', 'Molina', 'tomi.molina@email.com', '2025-07-05', 'ACTIVO'),
('50678901', 'Paula', 'Ortiz', 'paula.ortiz@email.com', '2025-07-12', 'ACTIVO'),
('51789012', 'Lucas', 'Ríos', 'lucas.rios@email.com', '2025-07-19', 'ACTIVO'),
('52890123', 'Daniela', 'Morales', 'daniela.m@email.com', '2025-07-26', 'ACTIVO'),
('53901234', 'Mateo', 'Carrizo', 'mateo.c@email.com', '2025-08-01', 'ACTIVO'),
('54012345', 'Julieta', 'Guzmán', 'juli.guzman@email.com', '2025-08-05', 'ACTIVO');

INSERT INTO ejemplar (isbn, nro_ejemplar, estado_fisico) VALUES
('9780307474728', 1, 'DISPONIBLE'), ('9780307474728', 2, 'DISPONIBLE'), ('9780307474728', 3, 'DISPONIBLE'),
('9780060934347', 1, 'DISPONIBLE'), ('9780060934347', 2, 'DISPONIBLE'),
('9788420633114', 1, 'DISPONIBLE'), ('9788420633114', 2, 'DISPONIBLE'),
('9788439734475', 1, 'DISPONIBLE'),
('9781501143519', 1, 'DISPONIBLE'), ('9781501143519', 2, 'DISPONIBLE'),
('9780747532699', 1, 'DISPONIBLE'), ('9780747532699', 2, 'DISPONIBLE'), ('9780747532699', 3, 'DISPONIBLE'),
('9780553103540', 1, 'DISPONIBLE'), ('9780553103540', 2, 'DISPONIBLE'),
('9780553293357', 1, 'DISPONIBLE'), ('9780553293357', 2, 'DISPONIBLE'),
('9780007119318', 1, 'DISPONIBLE'), ('9780007119318', 2, 'DISPONIBLE'),
('9788420412146', 1, 'DISPONIBLE'), ('9788420412146', 2, 'DISPONIBLE'),
('9780307389732', 1, 'DISPONIBLE'), ('9780307389732', 2, 'DISPONIBLE'),
('9781501144264', 1, 'DISPONIBLE'), ('9781501144264', 2, 'DISPONIBLE'),
('9780747538486', 1, 'DISPONIBLE'), ('9780747538486', 2, 'DISPONIBLE'),
('9780553108033', 1, 'DISPONIBLE'),
('9780553294385', 1, 'DISPONIBLE'), ('9780553294385', 2, 'DISPONIBLE'),
('9780007122035', 1, 'DISPONIBLE'), ('9780007122035', 2, 'DISPONIBLE'),
('9788499928500', 1, 'DISPONIBLE'), ('9788499928500', 2, 'DISPONIBLE'),
('9788466338141', 1, 'DISPONIBLE'),
('9788408045076', 1, 'DISPONIBLE'), ('9788408045076', 2, 'DISPONIBLE'),
('9788420442389', 1, 'DISPONIBLE'), ('9788420442389', 2, 'DISPONIBLE'), ('9788420442389', 3, 'DISPONIBLE');

INSERT INTO prestamo (fecha_prestamo, fecha_vencimiento, fecha_devolucion, estado, id_socio, id_ejemplar) VALUES
('2026-01-05', '2026-01-20', '2026-01-18', 'DEVUELTO', 1, 5),
('2026-01-06', '2026-01-21', '2026-01-21', 'DEVUELTO', 2, 12),
('2026-01-10', '2026-01-25', '2026-01-24', 'DEVUELTO', 3, 18),
('2026-01-12', '2026-01-27', '2026-01-30', 'DEVUELTO', 4, 22),
('2026-01-15', '2026-01-30', '2026-01-28', 'DEVUELTO', 5, 1),
('2026-01-20', '2026-02-04', '2026-02-02', 'DEVUELTO', 6, 9),
('2026-01-22', '2026-02-06', '2026-02-06', 'DEVUELTO', 7, 30),
('2026-02-01', '2026-02-16', '2026-02-14', 'DEVUELTO', 9, 14),
('2026-02-03', '2026-02-18', '2026-02-18', 'DEVUELTO', 10, 25),
('2026-02-05', '2026-02-20', '2026-02-19', 'DEVUELTO', 11, 33),
('2026-02-10', '2026-02-25', '2026-02-22', 'DEVUELTO', 12, 40),
('2026-02-12', '2026-02-27', '2026-03-05', 'DEVUELTO', 13, 11),
('2026-02-15', '2026-03-02', '2026-02-28', 'DEVUELTO', 14, 3),
('2026-02-20', '2026-03-07', '2026-03-06', 'DEVUELTO', 15, 7),
('2026-02-25', '2026-03-12', '2026-03-12', 'DEVUELTO', 16, 16),
('2026-03-01', '2026-03-16', '2026-03-15', 'DEVUELTO', 17, 21),
('2026-03-05', '2026-03-20', '2026-03-20', 'DEVUELTO', 18, 29),
('2026-03-10', '2026-03-25', '2026-03-22', 'DEVUELTO', 19, 35),
('2026-03-15', '2026-03-30', '2026-03-29', 'DEVUELTO', 20, 2),
('2026-03-20', '2026-04-04', '2026-04-02', 'DEVUELTO', 21, 13),
('2026-03-22', '2026-04-06', '2026-04-06', 'DEVUELTO', 22, 26),
('2026-03-25', '2026-04-09', '2026-04-08', 'DEVUELTO', 23, 31),
('2026-04-01', '2026-04-16', '2026-04-15', 'DEVUELTO', 24, 6),
('2026-04-05', '2026-04-20', '2026-04-20', 'DEVUELTO', 25, 19),
('2026-04-10', '2026-04-25', '2026-04-24', 'DEVUELTO', 26, 37);

INSERT INTO prestamo (fecha_prestamo, fecha_vencimiento, fecha_devolucion, estado, id_socio, id_ejemplar) VALUES
('2026-04-15', '2026-04-30', NULL, 'VENCIDO', 3, 10),
('2026-04-18', '2026-05-03', NULL, 'VENCIDO', 13, 24),
('2026-04-20', '2026-05-05', NULL, 'VENCIDO', 5, 39),
('2026-04-22', '2026-05-07', NULL, 'VENCIDO', 6, 4),
('2026-04-25', '2026-05-10', NULL, 'VENCIDO', 11, 15),
('2026-04-28', '2026-05-13', NULL, 'VENCIDO', 14, 28),
('2026-05-02', '2026-05-17', NULL, 'VENCIDO', 17, 34),
('2026-05-04', '2026-05-19', NULL, 'VENCIDO', 20, 8),
('2026-05-06', '2026-05-21', NULL, 'VENCIDO', 23, 17),
('2026-05-08', '2026-05-23', NULL, 'VENCIDO', 25, 23),
('2026-05-10', '2026-05-25', NULL, 'VENCIDO', 27, 32),
('2026-05-12', '2026-05-27', NULL, 'VENCIDO', 28, 36),
('2026-05-14', '2026-05-29', NULL, 'VENCIDO', 29, 20);

INSERT INTO prestamo (fecha_prestamo, fecha_vencimiento, fecha_devolucion, estado, id_socio, id_ejemplar) VALUES
('2026-05-28', '2026-06-12', NULL, 'ACTIVO', 1, 27),
('2026-05-30', '2026-06-14', NULL, 'ACTIVO', 2, 38),
('2026-06-01', '2026-06-16', NULL, 'ACTIVO', 4, 11),
('2026-06-02', '2026-06-17', NULL, 'ACTIVO', 7, 22),
('2026-06-03', '2026-06-18', NULL, 'ACTIVO', 9, 14),
('2026-06-04', '2026-06-19', NULL, 'ACTIVO', 10, 1),
('2026-06-05', '2026-06-20', NULL, 'ACTIVO', 12, 5),
('2026-06-06', '2026-06-21', NULL, 'ACTIVO', 15, 18),
('2026-06-07', '2026-06-22', NULL, 'ACTIVO', 16, 25),
('2026-06-08', '2026-06-23', NULL, 'ACTIVO', 18, 30),
('2026-06-08', '2026-06-23', NULL, 'ACTIVO', 21, 9),
('2026-06-09', '2026-06-24', NULL, 'ACTIVO', 30, 12);

INSERT INTO tipo_sancion (id_tipo, periodo) VALUES
(1, 10), 
(2, 15), 
(3, 30);

INSERT INTO sancion (id_socio, id_tipo, fecha_inicio, motivo) VALUES
(3,  1, '2026-05-01', 'Devolución tardía del ejemplar de It.'),
(5,  1, '2026-05-06', 'Retraso de 3 días en la entrega de la novela.'),
(11, 1, '2026-05-11', 'Devolución fuera de término.'),
(20, 1, '2026-05-20', 'Ejemplar devuelto una semana tarde.'),
(13, 2, '2026-05-04', 'Retraso reiterado en las fechas de vencimiento.'),
(14, 2, '2026-05-14', 'Superó los 10 días de retraso sin aviso.'),
(17, 2, '2026-05-18', 'Segunda advertencia por devolución tardía.'),
(23, 3, '2026-05-22', 'Maltrato físico evidente al ejemplar entregado.'),
(25, 3, '2026-05-24', 'El socio reportó la pérdida del ejemplar prestado.'),
(29, 3, '2026-05-30', 'Falta total de respuesta a los avisos de vencimiento.');

COMMIT;
