CREATE DATABASE Obligatorio_BD;
USE Obligatorio_BD;

CREATE TABLE Bus (
	ID_Bus INT NOT NULL,
	Marca_Bus VARCHAR(30) NOT NULL,
	Tipo_Bus VARCHAR(30) NOT NULL,
	Capacidad_Bus INT NOT NULL,
	primary key (ID_Bus)
);

CREATE TABLE Asiento (
	ID_Bus INT NOT NULL,
	Numero_Fila_Asiento INT NOT NULL,
	Letra_Columna_Asiento CHAR(2),
	primary key (ID_Bus, Numero_Fila_Asiento, Letra_Columna_Asiento),
	foreign key (ID_Bus) references Bus(ID_Bus)
);

CREATE TABLE Departamento (
	ID_Departamento INT NOT NULL,
	Nombre_departamento VARCHAR(30),
	primary key (ID_Departamento),
);

CREATE TABLE Turista (
	ID_Turista INT NOT NULL,
	ID_Departamento INT NOT NULL,
	Primer_Nombre_turista VARCHAR(20) NOT NULL,
	Apellido_Paterno_turista VARCHAR(20) NOT NULL,
	Apellido_Materno_turista VARCHAR(20) NOT NULL,
	Contrasenia_turista VARCHAR(20) NOT NULL,
	Tipo_Documento_turista VARCHAR(20) NOT NULL,
	Numero_Documento_turista VARCHAR(20) NOT NULL,
	Fecha_Nacimiento_turista Date NOT NULL,
	Correo_Electronico_turista VARCHAR(30) NOT NULL,
	Telefono_turista VARCHAR(15),
	primary key (ID_Turista),
	foreign key (ID_Departamento) references Departamento(ID_Departamento)
);

CREATE TABLE Turista_Beneficio (
	ID_Turista INT NOT NULL,
	Descripcion_beneficio VARCHAR(200) NOT NULL,
	foreign key (ID_Turista) references Turista(ID_Turista)
);

CREATE TABLE Turista_Mercosur (
	ID_Turista INT NOT NULL,
	Porcentaje_Turista_Mercosur float,
	primary key (ID_Turista),
	foreign key (ID_Turista) references Turista(ID_Turista)
);

CREATE TABLE Turista_Telefono (
	ID_Turista INT NOT NULL,
	Telefono_Turista varchar(20),
	primary key (ID_Turista, Telefono_Turista),
	foreign key (ID_Turista) references Turista(ID_Turista)
)

CREATE TABLE Terminal (
	ID_Terminal INT NOT NULL,
	ID_Departamento INT NOT NULL,
	Nombre_terminal VARCHAR(30) NOT NULL,
	primary key (ID_Terminal),
	foreign key (ID_Departamento) references Departamento(ID_Departamento)
);

CREATE TABLE Viaje (
	ID_Viaje INT NOT NULL,
	ID_Terminal_Origen_Viaje INT NOT NULL,
	ID_Terminal_Destino_Viaje INT NOT NULL,
	ID_Bus INT NOT NULL,
	Duracion_Aproximada_Viaje TIME NOT NULL,
	Informacion_General_Viaje TEXT NOT NULL,
	Importe_Viaje INT NOT NULL,
	primary key (ID_Viaje),
	foreign key (ID_Terminal_Origen_Viaje) references Terminal(ID_Terminal),
	foreign key (ID_Terminal_Destino_Viaje) references Terminal(ID_Terminal),
	foreign key (ID_Bus) references Bus(ID_Bus),
	CONSTRAINT chk_origen_destino CHECK (ID_Terminal_Origen_Viaje <> ID_Terminal_Destino_Viaje) -- Restricci�n que chequea que el origen y destino sean distintos
);

CREATE TABLE Pasaje (
	ID_Pasaje INT NOT NULL,
	ID_Turista INT NOT NULL,
	ID_Bus INT NOT NULL,
	ID_Viaje INT NOT NULL,
	Numero_Fila_Asiento INT NOT NULL,
	Letra_Columna_Asiento CHAR(2),
	Fue_Utilizado_Pasaje BIT NOT NULL, -- 0: no utilizado, 1: utilizado
	Fecha_Compra_Pasaje DATETIME NOT NULL,
	primary key (ID_Pasaje),
	foreign key (ID_Turista) references Turista(ID_Turista),
	foreign key (ID_Bus) references Bus(ID_Bus),
	foreign key (ID_Viaje) references Viaje(ID_Viaje),
	foreign key (ID_Bus, Numero_Fila_Asiento, Letra_Columna_Asiento) references Asiento(ID_Bus, Numero_Fila_Asiento, Letra_Columna_Asiento)
);


drop table Pasaje;
drop table Viaje;
drop table Terminal;
drop table Turista_Telefono
drop table Turista_Beneficio;
drop table Turista_Mercosur;
drop table Turista;
drop table Departamento;
drop table Asiento;
drop table Bus;
