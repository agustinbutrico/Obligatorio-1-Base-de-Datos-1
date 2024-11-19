CREATE DATABASE Obligatorio_BD;
USE Obligatorio_BD;

CREATE TABLE Beneficio (
	ID_Beneficio INT NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	primary key (ID_Beneficio)
);

CREATE TABLE Categoria_Turista (
	ID_Categoria INT NOT NULL,
	Nombre_Categoria VARCHAR(30) NOT NULL,
	primary key (ID_Categoria),
);

CREATE TABLE SE_BENEFICIA_DE (
	ID_Categoria INT NOT NULL,
	ID_Beneficio INT NOT NULL,
	primary key (ID_Categoria, ID_Beneficio),
	foreign key (ID_Categoria) references Categoria_Turista(ID_Categoria),
	foreign key (ID_Beneficio) references Beneficio(ID_Beneficio)
);

CREATE TABLE Turista (
	ID_Turista INT NOT NULL,
	ID_Categoria INT NOT NULL,
	Primer_Nombre VARCHAR(20) NOT NULL,
	Apellido_Paterno VARCHAR(20) NOT NULL,
	Apellido_Materno VARCHAR(20) NOT NULL,
	Contrasenia VARCHAR(20) NOT NULL,
	Tipo_Documento VARCHAR(20) NOT NULL,
	Numero_Documento VARCHAR(20) NOT NULL,
	Fecha_Nacimiento Date NOT NULL,
	Correo_Electronico VARCHAR(30) NOT NULL,
	Telefono VARCHAR(15),
	primary key (ID_Turista),
	foreign key (ID_Categoria) references Categoria_Turista(ID_Categoria)
);

CREATE TABLE Departamento (
	ID_Departamento INT NOT NULL,
	Nombre VARCHAR(30),
	primary key (ID_Departamento),
);

CREATE TABLE Terminal (
	ID_Terminal INT NOT NULL,
	ID_Departamento INT NOT NULL,
	Nombre VARCHAR(30) NOT NULL,
	primary key (ID_Terminal),
	foreign key (ID_Departamento) references Departamento(ID_Departamento)
);

CREATE TABLE Destino_Turistico (
	ID_Destino_Turistico INT NOT NULL,
	ID_Terminal_Origen INT NOT NULL,
	ID_Terminal_Destino INT NOT NULL,
	Duracion_Aproximada TIME NOT NULL,
	Informacion_General TEXT NOT NULL,
	Importe INT NOT NULL,
	primary key (ID_Destino_Turistico),
	foreign key (ID_Terminal_Origen) references Terminal(ID_Terminal),
	foreign key (ID_Terminal_Destino) references Terminal(ID_Terminal),
	CONSTRAINT chk_origen_destino CHECK (ID_Terminal_Origen <> ID_Terminal_Destino) -- Restricción que chequea que el origen y destino sean distintos
);

CREATE TABLE TIENE (
	ID_Destino_Turistico INT NOT NULL,
	ID_Terminal INT NOT NULL,
	primary key (ID_Destino_Turistico, ID_Terminal),
	foreign key (ID_Destino_Turistico) references Destino_Turistico(ID_Destino_Turistico),
	foreign key (ID_Terminal) references Terminal(ID_Terminal)
);

CREATE TABLE Bus (
	ID_Bus INT NOT NULL,
	Marca VARCHAR(30) NOT NULL,
	Tipo VARCHAR(30) NOT NULL,
	Capacidad INT NOT NULL,
	primary key (ID_Bus)
);

CREATE TABLE VIAJE (
	ID_Viaje INT NOT NULL,
	ID_Destino_Turistico INT NOT NULL,
	Fecha_Salida DATE NOT NULL,
	Hora_Salida TIME NOT NULL,
	primary key (ID_Viaje),
	foreign key (ID_Destino_Turistico) references Destino_Turistico(ID_Destino_Turistico)
);

CREATE TABLE Asiento (
	ID_Asiento INT NOT NULL,
	ID_Bus INT NOT NULL,
	ID_Viaje INT NOT NULL,
	Numero_Fila INT NOT NULL,
	Letra_Columna CHAR(1),
	primary key (ID_Asiento),
	foreign key (ID_Bus) references Bus(ID_Bus),
	foreign key (ID_Viaje) references VIAJE(ID_Viaje)
);

CREATE TABLE Pasaje (
	ID_Pasaje INT NOT NULL,
	ID_Turista INT NOT NULL,
	ID_Asiento INT NOT NULL,
	Fue_Utilizado BIT NOT NULL, -- 0: no utilizado, 1: utilizado
	Fecha_Compra DATETIME NOT NULL,
	primary key (ID_Pasaje),
	foreign key (ID_Turista) references Turista(ID_Turista),
	foreign key (ID_Asiento) references Asiento(ID_Asiento)
);
