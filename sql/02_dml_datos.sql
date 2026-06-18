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

-- Tabla libro con stock_total original y stock_disponible sincronizado con préstamos/reservas
INSERT INTO libro (isbn, anio_publicacion, stock_total, stock_disponible, titulo) VALUES
('9780307474728', 1967, 5, 3, 'Cien años de soledad'),             -- 5 ejemplares (3 Disp, 1 Prestado, 1 Reservado)
('9780060934347', 1982, 4, 2, 'La casa de los espíritus'),          -- 4 ejemplares (2 Disp, 2 Prestados)
('9788420633114', 1944, 3, 2, 'Ficciones'),                         -- 3 ejemplares (2 Disp, 1 Reservado)
('9788439734475', 1963, 3, 1, 'Rayuela'),                           -- 3 ejemplares (1 Disp, 1 Prestado, 1 Reservado)
('9781501143519', 1977, 6, 4, 'El resplandor'),                     -- 6 ejemplares (4 Disp, 2 Prestados)
('9780747532699', 1997, 10, 8, 'Harry Potter 1'),                    -- 10 ejemplares (8 Disp, 2 Prestados)
('9780553103540', 1996, 5, 2, 'Juego de Tronos'),                   -- 5 ejemplares (2 Disp, 2 Prestados, 1 Reservado)
('9780553293357', 1951, 4, 3, 'Fundación'),                         -- 4 ejemplares (3 Disp, 1 Prestado)
('9780007119318', 1934, 4, 3, 'Asesinato en el Orient Express'),    -- 4 ejemplares (3 Disp, 1 Prestado)
('9788420412146', 1996, 3, 2, 'El capitán Alatriste'),              -- 3 ejemplares (2 Disp, 1 Prestado)
('9780307389732', 1985, 3, 1, 'El amor en los tiempos del cólera'), -- 3 ejemplares (1 Disp, 2 Prestados)
('9781501144264', 1986, 5, 3, 'It'),                                -- 5 ejemplares (3 Disp, 2 Prestados)
('9780747538486', 1998, 8, 7, 'Harry Potter 2'),                    -- 8 ejemplares (7 Disp, 1 Prestado)
('9780553108033', 1998, 4, 1, 'Choque de Reyes'),                   -- 4 ejemplares (1 Disp, 1 Prestado, 2 Reservados)
('9780553294385', 1952, 3, 2, 'Fundación e Imperio'),               -- 3 ejemplares (2 Disp, 1 Prestado)
('9780007122035', 1926, 4, 2, 'El asesinato de Roger Ackroyd'),     -- 4 ejemplares (2 Disp, 1 Prestado, 1 Reservado)
('9788499928500', 2018, 2, 1, 'Sabotaje'),                          -- 2 ejemplares (1 Disp, 1 Prestado)
('9788466338141', 2002, 3, 1, 'La reina del sur'),                  -- 3 ejemplares (1 Disp, 2 Reservados)
('9788408045076', 1953, 4, 3, 'El Aleph (Borges, reedición)'),      -- 4 ejemplares (3 Disp, 1 Prestado)
('9788420442389', 1951, 3, 1, 'Bestiario (Cortázar)');              -- 3 ejemplares (1 Disp, 2 Prestados)

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

-- Socios con estados corregidos según sus sanciones vigentes
INSERT INTO socio (dni, nombre, apellido, email, fecha_alta, estado) VALUES
('35123456', 'Juan', 'Pérez', 'juan.perez@email.com', '2025-01-15', 'ACTIVO'),
('36234567', 'María', 'González', 'maria.gonzalez@email.com', '2025-01-20', 'ACTIVO'),
('37345678', 'Carlos', 'Rodríguez', 'carlos.rod@email.com', '2025-02-02', 'SUSPENDIDO'), -- Sancionado
('38456789', 'Ana', 'Martínez', 'ana.mtz@email.com', '2025-02-10', 'ACTIVO'),
('39567890', 'Luis', 'Gómez', 'luis.gomez@email.com', '2025-02-18', 'SUSPENDIDO'), -- Sancionado
('40678901', 'Laura', 'Sánchez', 'laura.sanz@email.com', '2025-03-01', 'ACTIVO'),
('41789012', 'Diego', 'Díaz', 'diego.diaz@email.com', '2025-03-05', 'ACTIVO'),
('42890123', 'Florencia', 'Fernández', 'flor.fer@email.com', '2025-03-12', 'BAJA'),
('43901234', 'Andrés', 'López', 'andres.lopez@email.com', '2025-03-20', 'ACTIVO'),
('34012345', 'Sofia', 'Álvarez', 'sofia.alvarez@email.com', '2025-04-02', 'ACTIVO'),
('33123456', 'Martín', 'Romero', 'martin.r@email.com', '2025-04-10', 'SUSPENDIDO'), -- Sancionado
('32234567', 'Lucía', 'Torres', 'lucia.torres@email.com', '2025-04-15', 'ACTIVO'),
('31345678', 'Facundo', 'Suárez', 'facu.suarez@email.com', '2025-04-22', 'SUSPENDIDO'), -- Sancionado
('30456789', 'Elena', 'Herrera', 'elena.h@email.com', '2025-05-02', 'SUSPENDIDO'), -- Sancionado
('29567890', 'Santiago', 'Medina', 'santi.medina@email.com', '2025-05-09', 'ACTIVO'),
('28678901', 'Valentina', 'Castro', 'valen.castro@email.com', '2025-05-14', 'ACTIVO'),
('27789012', 'Matías', 'Vargas', 'matias.vargas@email.com', '2025-05-20', 'SUSPENDIDO'), -- Sancionado
('26890123', 'Camila', 'Benítez', 'cami.b@email.com', '2025-05-25', 'ACTIVO'),
('25901234', 'Nicolás', 'Ramírez', 'nico.ramirez@email.com', '2025-06-01', 'ACTIVO'),
('44012345', 'Agustina', 'Flores', 'agus.flores@email.com', '2025-06-04', 'SUSPENDIDO'), -- Sancionado
('45123456', 'Bruno', 'Acosta', 'bruno.acosta@email.com', '2025-06-11', 'ACTIVO'),
('46234567', 'Martina', 'Silva', 'marti.silva@email.com', '2025-06-18', 'ACTIVO'),
('47345678', 'Joaquín', 'Pereyra', 'joaco.p@email.com', '2025-06-22', 'SUSPENDIDO'), -- Sancionado
('48456789', 'Micaela', 'Rojas', 'mica.rojas@email.com', '2025-07-01', 'ACTIVO'),
('49567890', 'Tomás', 'Molina', 'tomi.molina@email.com', '2025-07-05', 'SUSPENDIDO'), -- Sancionado
('50678901', 'Paula', 'Ortiz', 'paula.ortiz@email.com', '2025-07-12', 'ACTIVO'),
('51789012', 'Lucas', 'Ríos', 'lucas.rios@email.com', '2025-07-19', 'ACTIVO'),
('52890123', 'Daniela', 'Morales', 'daniela.m@email.com', '2025-07-26', 'ACTIVO'),
('53901234', 'Mateo', 'Carrizo', 'mateo.c@email.com', '2025-08-01', 'ACTIVO'),
('54012345', 'Julieta', 'Guzmán', 'juli.guzman@email.com', '2025-08-05', 'SUSPENDIDO'); -- Sancionado

-- Inserción explícita de los 86 ejemplares vinculados al stock total exacto
INSERT INTO ejemplar (id_ejemplar, isbn, nro_ejemplar, estado_fisico) VALUES
-- Cien años de soledad (5)
(1, '9780307474728', 1, 'PRESTADO'), (2, '9780307474728', 2, 'RESERVADO'), (3, '9780307474728', 3, 'DISPONIBLE'), (4, '9780307474728', 4, 'DISPONIBLE'), (5, '9780307474728', 5, 'DISPONIBLE'),
-- La casa de los espíritus (4)
(6, '9780060934347', 1, 'PRESTADO'), (7, '9780060934347', 2, 'PRESTADO'), (8, '9780060934347', 3, 'DISPONIBLE'), (9, '9780060934347', 4, 'DISPONIBLE'),
-- Ficciones (3)
(10, '9788420633114', 1, 'RESERVADO'), (11, '9788420633114', 2, 'DISPONIBLE'), (12, '9788420633114', 3, 'DISPONIBLE'),
-- Rayuela (3)
(13, '9788439734475', 1, 'PRESTADO'), (14, '9788439734475', 2, 'RESERVADO'), (15, '9788439734475', 3, 'DISPONIBLE'),
-- El resplandor (6)
(16, '9781501143519', 1, 'PRESTADO'), (17, '9781501143519', 2, 'PRESTADO'), (18, '9781501143519', 3, 'DISPONIBLE'), (19, '9781501143519', 4, 'DISPONIBLE'), (20, '9781501143519', 5, 'DISPONIBLE'), (21, '9781501143519', 6, 'DISPONIBLE'),
-- Harry Potter 1 (10)
(22, '9780747532699', 1, 'PRESTADO'), (23, '9780747532699', 2, 'PRESTADO'), (24, '9780747532699', 3, 'DISPONIBLE'), (25, '9780747532699', 4, 'DISPONIBLE'), (26, '9780747532699', 5, 'DISPONIBLE'), (27, '9780747532699', 6, 'DISPONIBLE'), (28, '9780747532699', 7, 'DISPONIBLE'), (29, '9780747532699', 8, 'DISPONIBLE'), (30, '9780747532699', 9, 'DISPONIBLE'), (31, '9780747532699', 10, 'DISPONIBLE'),
-- Juego de Tronos (5)
(32, '9780553103540', 1, 'PRESTADO'), (33, '9780553103540', 2, 'PRESTADO'), (34, '9780553103540', 3, 'RESERVADO'), (35, '9780553103540', 4, 'DISPONIBLE'), (36, '9780553103540', 5, 'DISPONIBLE'),
-- Fundación (4)
(37, '9780553293357', 1, 'PRESTADO'), (38, '9780553293357', 2, 'DISPONIBLE'), (39, '9780553293357', 3, 'DISPONIBLE'), (40, '9780553293357', 4, 'DISPONIBLE'),
-- Asesinato en el Orient Express (4)
(41, '9780007119318', 1, 'PRESTADO'), (42, '9780007119318', 2, 'DISPONIBLE'), (43, '9780007119318', 3, 'DISPONIBLE'), (44, '9780007119318', 4, 'DISPONIBLE'),
-- El capitán Alatriste (3)
(45, '9788420412146', 1, 'PRESTADO'), (46, '9788420412146', 2, 'DISPONIBLE'), (47, '9788420412146', 3, 'DISPONIBLE'),
-- El amor en los tiempos del cólera (3)
(48, '9780307389732', 1, 'PRESTADO'), (49, '9780307389732', 2, 'PRESTADO'), (50, '9780307389732', 3, 'DISPONIBLE'),
-- It (5)
(51, '9781501144264', 1, 'PRESTADO'), (52, '9781501144264', 2, 'PRESTADO'), (53, '9781501144264', 3, 'DISPONIBLE'), (54, '9781501144264', 4, 'DISPONIBLE'), (55, '9781501144264', 5, 'DISPONIBLE'),
-- Harry Potter 2 (8)
(56, '9780747538486', 1, 'PRESTADO'), (57, '9780747538486', 2, 'DISPONIBLE'), (58, '9780747538486', 3, 'DISPONIBLE'), (59, '9780747538486', 4, 'DISPONIBLE'), (60, '9780747538486', 5, 'DISPONIBLE'), (61, '9780747538486', 6, 'DISPONIBLE'), (62, '9780747538486', 7, 'DISPONIBLE'), (63, '9780747538486', 8, 'DISPONIBLE'),
-- Choque de Reyes (4)
(64, '9780553108033', 1, 'PRESTADO'), (65, '9780553108033', 2, 'RESERVADO'), (66, '9780553108033', 3, 'RESERVADO'), (67, '9780553108033', 4, 'DISPONIBLE'),
-- Fundación e Imperio (3)
(68, '9780553294385', 1, 'PRESTADO'), (69, '9780553294385', 2, 'DISPONIBLE'), (70, '9780553294385', 3, 'DISPONIBLE'),
-- El asesinato de Roger Ackroyd (4)
(71, '9780007122035', 1, 'PRESTADO'), (72, '9780007122035', 2, 'RESERVADO'), (73, '9780007122035', 3, 'DISPONIBLE'), (74, '9780007122035', 4, 'DISPONIBLE'),
-- Sabotaje (2)
(75, '9788499928500', 1, 'PRESTADO'), (76, '9788499928500', 2, 'DISPONIBLE'),
-- La reina del sur (3)
(77, '9788466338141', 1, 'RESERVADO'), (78, '9788466338141', 2, 'RESERVADO'), (79, '9788466338141', 3, 'DISPONIBLE'),
-- El Aleph (Borges, reedición) (4)
(80, '9788408045076', 1, 'PRESTADO'), (81, '9788408045076', 2, 'DISPONIBLE'), (82, '9788408045076', 3, 'DISPONIBLE'), (83, '9788408045076', 4, 'DISPONIBLE'),
-- Bestiario (Cortázar) (3)
(84, '9788420442389', 1, 'PRESTADO'), (85, '9788420442389', 2, 'PRESTADO'), (86, '9788420442389', 3, 'DISPONIBLE');

-- Préstamos históricos devueltos (mapeados a ejemplares disponibles/reservados de su respectivo libro)
INSERT INTO prestamo (fecha_prestamo, fecha_vencimiento, fecha_devolucion, estado, id_socio, id_ejemplar) VALUES
('2026-01-05', '2026-01-20', '2026-01-18', 'DEVUELTO', 1, 8),
('2026-01-06', '2026-01-21', '2026-01-21', 'DEVUELTO', 2, 24),
('2026-01-10', '2026-01-25', '2026-01-24', 'DEVUELTO', 3, 42),
('2026-01-12', '2026-01-27', '2026-01-30', 'DEVUELTO', 4, 50),
('2026-01-15', '2026-01-30', '2026-01-28', 'DEVUELTO', 5, 1),
('2026-01-20', '2026-02-04', '2026-02-02', 'DEVUELTO', 6, 18),
('2026-01-22', '2026-02-06', '2026-02-06', 'DEVUELTO', 7, 69),
('2026-02-01', '2026-02-16', '2026-02-14', 'DEVUELTO', 9, 35),
('2026-02-03', '2026-02-18', '2026-02-18', 'DEVUELTO', 10, 53),
('2026-02-05', '2026-02-20', '2026-02-19', 'DEVUELTO', 11, 76),
('2026-02-10', '2026-02-25', '2026-02-22', 'DEVUELTO', 12, 86),
('2026-02-12', '2026-02-27', '2026-03-05', 'DEVUELTO', 13, 25),
('2026-02-15', '2026-03-02', '2026-02-28', 'DEVUELTO', 14, 3),
('2026-02-20', '2026-03-07', '2026-03-06', 'DEVUELTO', 15, 11),
('2026-02-25', '2026-03-12', '2026-03-12', 'DEVUELTO', 16, 38),
('2026-03-01', '2026-03-16', '2026-03-15', 'DEVUELTO', 17, 46),
('2026-03-05', '2026-03-20', '2026-03-20', 'DEVUELTO', 18, 70),
('2026-03-10', '2026-03-25', '2026-03-22', 'DEVUELTO', 19, 79),
('2026-03-15', '2026-03-30', '2026-03-29', 'DEVUELTO', 20, 2),
('2026-03-20', '2026-04-04', '2026-04-02', 'DEVUELTO', 21, 26),
('2026-03-22', '2026-04-06', '2026-04-06', 'DEVUELTO', 22, 57),
('2026-03-25', '2026-04-09', '2026-04-08', 'DEVUELTO', 23, 73),
('2026-04-01', '2026-04-16', '2026-04-15', 'DEVUELTO', 24, 12),
('2026-04-05', '2026-04-20', '2026-04-20', 'DEVUELTO', 25, 43),
('2026-04-10', '2026-04-25', '2026-04-24', 'DEVUELTO', 26, 81);

-- Préstamos en estado VENCIDO (Mapeados unívocamente a ejemplares con estado_fisico = 'PRESTADO')
INSERT INTO prestamo (fecha_prestamo, fecha_vencimiento, fecha_devolucion, estado, id_socio, id_ejemplar) VALUES
('2026-04-15', '2026-04-30', NULL, 'VENCIDO', 3, 16),
('2026-04-18', '2026-05-03', NULL, 'VENCIDO', 13, 51),
('2026-04-20', '2026-05-05', NULL, 'VENCIDO', 5, 84),
('2026-04-22', '2026-05-07', NULL, 'VENCIDO', 6, 6),
('2026-04-25', '2026-05-10', NULL, 'VENCIDO', 11, 32),
('2026-04-28', '2026-05-13', NULL, 'VENCIDO', 14, 64),
('2026-05-02', '2026-05-17', NULL, 'VENCIDO', 17, 75),
('2026-05-04', '2026-05-19', NULL, 'VENCIDO', 20, 13),
('2026-05-06', '2026-05-21', NULL, 'VENCIDO', 23, 37),
('2026-05-08', '2026-05-23', NULL, 'VENCIDO', 25, 48),
('2026-05-10', '2026-05-25', NULL, 'VENCIDO', 27, 71),
('2026-05-12', '2026-05-27', NULL, 'VENCIDO', 28, 80),
('2026-05-14', '2026-05-29', NULL, 'VENCIDO', 29, 45);

-- Préstamos en estado ACTIVO (Mapeados unívocamente a ejemplares con estado_fisico = 'PRESTADO')
INSERT INTO prestamo (fecha_prestamo, fecha_vencimiento, fecha_devolucion, estado, id_socio, id_ejemplar) VALUES
('2026-05-28', '2026-06-12', NULL, 'ACTIVO', 1, 56),
('2026-05-30', '2026-06-14', NULL, 'ACTIVO', 2, 85),
('2026-06-01', '2026-06-16', NULL, 'ACTIVO', 4, 22),
('2026-06-02', '2026-06-17', NULL, 'ACTIVO', 7, 49),
('2026-06-03', '2026-06-18', NULL, 'ACTIVO', 9, 33),
('2026-06-04', '2026-06-19', NULL, 'ACTIVO', 10, 1),
('2026-06-05', '2026-06-20', NULL, 'ACTIVO', 12, 7),
('2026-06-06', '2026-06-21', NULL, 'ACTIVO', 15, 41),
('2026-06-07', '2026-06-22', NULL, 'ACTIVO', 16, 52),
('2026-06-08', '2026-06-23', NULL, 'ACTIVO', 18, 68),
('2026-06-08', '2026-06-23', NULL, 'ACTIVO', 21, 17),
('2026-06-09', '2026-06-24', NULL, 'ACTIVO', 30, 23);

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