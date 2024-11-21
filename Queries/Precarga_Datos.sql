USE Obligatorio_BD;
SET DATEFORMAT YMD;

-- Insertar datos en la tabla Bus
INSERT INTO Bus (ID_Bus, Marca_Bus, Tipo_Bus, Capacidad_Bus) VALUES
(1, 'Mercedes', 'Autobús turístico', 40),
(2, 'Volvo', 'Autobús de lujo', 50),
(3, 'Scania', 'Autobús económico', 35);

-- Insertar datos en la tabla Asiento
INSERT INTO Asiento(ID_Bus, Numero_Fila_Asiento, Letra_Columna_Asiento) VALUES
(1, 24, 'AA'),
(2, 12, 'AB'),
(3, 28, 'AC'),	
(2, 5, 'A'),
(2, 12, 'B'),
(3, 28, 'A'),
(3, 15, 'C'),
(1, 18, 'D'),
(2, 8, 'E'),
(3, 30, 'F'),
(1, 37, 'AN'),
(1, 47, 'GH'),
(3, 7, 'U'),
(2, 21,'QE'),
(3, 32,'LP'),
(3, 11, 'AF'); --

-- Insertar datos en la tabla Departamento
INSERT INTO Departamento (ID_Departamento, Nombre_departamento) VALUES
(1, 'Montevideo'),
(2, 'Canelones'),
(3, 'Durazno');

-- Insertar datos en la tabla Turista
INSERT INTO Turista (ID_Turista, ID_Departamento, Primer_Nombre_turista, Apellido_Paterno_turista, Apellido_Materno_turista, Contrasenia_turista, Tipo_Documento_turista, Numero_Documento_turista, Fecha_Nacimiento_turista, Correo_Electronico_turista, Telefono_turista) VALUES
(1, 1, 'Juan', 'Pérez', 'García', 'contraseña123', 'DNI', '12345678', '1990-05-15', 'juan.perez@example.com', '987654321'),
(2, 2,  'Ana', 'Lopez', 'Martínez', 'contraseña456', 'Pasaporte', 'A98765432', '1985-02-20', 'ana.lopez@example.com', '123456789'),
(3, 3, 'Carlos', 'Mendoza', 'Fernández', 'contraseña789', 'Cédula', '98765432', '1995-08-30', 'carlos.mendoza@example.com', '555123456'),
(4, 1, 'Esteban', 'Carlos', 'Jose', 'pass1234', 'DNI', '33444556', '1990-05-20', 'soyturista@gmail.com', '123455555');

-- Insertar datos en la tabla Turista_Mercosur
INSERT INTO Turista_Mercosur (ID_Turista, Porcentaje_Turista_Mercosur) VALUES
(1, 4.0),
(2, 6.5),
(3, 8.0);

-- Insertar datos en la tabla Turista_Beneficio
INSERT INTO Turista_Beneficio (ID_Turista, Descripcion_beneficio) VALUES
(1, 'Descuento en hotel'),
(2, 'Acceso a tour guiado'),
(3, 'Seguro de viaje');

-- Insertar datos en la tabla Turista_Telefono
INSERT INTO Turista_Telefono (ID_Turista, Telefono_Turista) VALUES
(1, '09488999019'),
(2, '096876432'),
(3, '349589685'),
(4, '123455555');


-- Insertar datos en la tabla Terminal
INSERT INTO Terminal (ID_Terminal, ID_Departamento, Nombre_terminal) VALUES
(1, 1, 'Terminal A'),
(2, 1, 'Terminal B'),
(3, 2, 'Terminal C');

-- Insertar datos en la tabla Viaje
INSERT INTO Viaje (ID_Viaje, ID_Terminal_Origen_Viaje, ID_Terminal_Destino_Viaje, ID_Bus, Fecha_Salida_Viaje, Duracion_Aproximada_Viaje, Informacion_General_Viaje, Importe_Viaje) VALUES
(1, 1, 2, 1, '2024-11-20 08:00:00', '02:30:00', 'Tour desde Terminal A a Terminal B', 100),
(2, 1, 3, 2, '2024-11-21 15:30:00', '03:00:00', 'Tour desde Terminal A a Terminal C', 150),
(3, 2, 3, 3, '2024-11-19 09:00:00', '01:45:00', 'Tour desde Terminal B a Terminal C', 120),
(4, 1, 3, 1, '2024-11-22 07:30:00', '02:15:00', 'Tour desde Terminal A a Terminal C', 120),
(5, 3, 1, 2, '2024-11-23 11:00:00', '03:00:00', 'Tour desde Terminal C a Terminal A', 130),
(6, 2, 1, 3, '2024-11-24 14:00:00', '01:50:00', 'Tour desde Terminal B a Terminal A', 110),
(7, 1, 2, 1, '2024-11-25 10:30:00', '02:45:00', 'Tour desde Terminal A a Terminal B', 100),
(8, 3, 2, 2, '2024-11-26 16:00:00', '03:15:00', 'Tour desde Terminal C a Terminal B', 140),
(9, 2, 3, 3, '2024-11-27 08:45:00', '01:40:00', 'Tour desde Terminal B a Terminal C', 120),
(10, 1, 3, 1, '2024-11-28 09:30:00', '02:00:00', 'Tour desde Terminal A a Terminal C', 125),
(11, 1, 2, 1, '2017-09-10 08:00:00', '02:30:00', 'Viaje de A a B', 100),
(12, 1, 3, 2, '2017-09-15 15:30:00', '03:00:00', 'Viaje de A a C', 150),
(13, 2, 3, 3, '2017-09-20 09:00:00', '01:45:00', 'Viaje de B a C', 120),
(14, 2, 3, 3, '2017-09-14 05:00:00', '07:45:00', 'Viaje de B a C', 620); --

-- Insertar datos en la tabla Pasaje
INSERT INTO Pasaje (ID_Turista, ID_Bus, ID_Viaje, Numero_Fila_Asiento, Letra_Columna_Asiento, Fue_Utilizado_Pasaje, Fecha_Compra_Pasaje) VALUES
(1, 1, 1, 24, 'AA', 0, '2024-11-15'), 
(2, 2, 2, 12, 'AB', 1, '2024-11-16'), 
(3, 3, 3, 28, 'AC', 0, '2024-11-17'), 
(1, 3, 3, 28, 'A', 0, '2024-11-20'),  
(1, 2, 5, 8, 'E', 1, '2024-11-21'),   
(1, 1, 6, 18, 'D', 0, '2024-11-22'),  
(1, 2, 7, 8, 'E', 0, '2024-11-23'),   
(1, 3, 8, 30, 'F', 1, '2024-11-24'),  
(1, 1, 10, 37, 'AN', 0, '2017-09-01'),
(1, 1, 11, 47, 'GH', 1, '2017-09-02'),
(1, 3, 13, 7, 'U', 0, '2017-09-05'),  
(1, 2, 12, 21, 'QE', 1, '2017-09-15'),
(1, 3, 13, 32, 'LP', 0, '2017-09-25'),
(4, 3, 14, 11, 'AF', 0, '2017-09-13');
