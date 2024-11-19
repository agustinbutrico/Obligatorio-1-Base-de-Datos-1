USE Obligatorio_BD;

-- Insertar datos en la tabla Beneficio
INSERT INTO Beneficio (ID_Beneficio, Descripcion) VALUES
(1, 'Descuento en hotel'),
(2, 'Acceso a tour guiado'),
(3, 'Seguro de viaje');

-- Insertar datos en la tabla Categoria_Turista
INSERT INTO Categoria_Turista (ID_Categoria, Nombre_Categoria) VALUES
(1, 'Estándar'),
(2, 'VIP'),
(3, 'Estudiante');

-- Insertar datos en la tabla SE_BENEFICIA_DE
INSERT INTO SE_BENEFICIA_DE (ID_Categoria, ID_Beneficio) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insertar datos en la tabla Turista
INSERT INTO Turista (ID_Turista, ID_Categoria, Primer_Nombre, Apellido_Paterno, Apellido_Materno, Contrasenia, Tipo_Documento, Numero_Documento, Fecha_Nacimiento, Correo_Electronico, Telefono) VALUES
(1, 1, 'Juan', 'Pérez', 'García', 'contraseña123', 'DNI', '12345678', '1990-05-15', 'juan.perez@example.com', '987654321'),
(2, 2, 'Ana', 'Lopez', 'Martínez', 'contraseña456', 'Pasaporte', 'A98765432', '1985-02-20', 'ana.lopez@example.com', '123456789'),
(3, 3, 'Carlos', 'Mendoza', 'Fernández', 'contraseña789', 'Cédula', '98765432', '1995-08-30', 'carlos.mendoza@example.com', '555123456');

-- Insertar datos en la tabla Departamento
INSERT INTO Departamento (ID_Departamento, Nombre) VALUES
(1, 'Turismo'),
(2, 'Logística'),
(3, 'Finanzas');

-- Insertar datos en la tabla Terminal
INSERT INTO Terminal (ID_Terminal, ID_Departamento, Nombre) VALUES
(1, 1, 'Terminal A'),
(2, 1, 'Terminal B'),
(3, 2, 'Terminal C');

-- Insertar datos en la tabla Destino_Turistico
INSERT INTO Destino_Turistico (ID_Destino_Turistico, ID_Terminal_Origen, ID_Terminal_Destino, Duracion_Aproximada, Informacion_General, Importe) VALUES
(1, 1, 2, '02:30:00', 'Tour desde Terminal A a Terminal B', 100),
(2, 1, 3, '03:00:00', 'Tour desde Terminal A a Terminal C', 150),
(3, 2, 3, '01:45:00', 'Tour desde Terminal B a Terminal C', 120);

-- Insertar datos en la tabla TIENE
INSERT INTO TIENE (ID_Destino_Turistico, ID_Terminal) VALUES
(1, 1),
(2, 1),
(3, 2);

-- Insertar datos en la tabla Bus
INSERT INTO Bus (ID_Bus, Marca, Tipo, Capacidad) VALUES
(1, 'Mercedes', 'Autobús turístico', 40),
(2, 'Volvo', 'Autobús de lujo', 50),
(3, 'Scania', 'Autobús económico', 35);

-- Insertar datos en la tabla VIAJE
INSERT INTO VIAJE (ID_Viaje, ID_Destino_Turistico, Fecha_Salida, Hora_Salida) VALUES
(1, 1, '2024-11-20', '08:00:00'),
(2, 2, '2024-11-21', '09:00:00'),
(3, 3, '2024-11-22', '10:00:00');

-- Insertar datos en la tabla Asiento
INSERT INTO Asiento (ID_Asiento, ID_Bus, ID_Viaje, Numero_Fila, Letra_Columna) VALUES
(1, 1, 1, 1, 'A'),
(2, 1, 2, 2, 'B'),
(3, 2, 3, 1, 'C');

-- Insertar datos en la tabla Pasaje
INSERT INTO Pasaje (ID_Pasaje, ID_Turista, ID_Asiento, Fue_Utilizado, Fecha_Compra) VALUES
(1, 1, 1, 1, '2024-11-01 15:30:00'),
(2, 2, 2, 0, '2024-11-02 16:00:00'),
(3, 3, 3, 1, '2024-11-03 17:00:00');
