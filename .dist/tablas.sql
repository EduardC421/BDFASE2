CREATE TABLE Comercio (
    id INT PRIMARY KEY,
    password NVARCHAR(50) NOT NULL,
    telefono NVARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL,
    correo NVARCHAR(100) NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    ubicacion_fisica NVARCHAR(255) NOT NULL,
    hora_apertura INT CHECK (hora_apertura BETWEEN 0 AND 23),
    hora_cierre INT CHECK (hora_cierre BETWEEN 0 AND 23),
    estaActivo BIT NOT NULL
);

CREATE TABLE Cocina (
    id INT PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL
);

CREATE TABLE ComercioCocina (
    idComercio INT,
    idCocina INT,
    PRIMARY KEY(idComercio, idCocina),
    FOREIGN KEY(idComercio) REFERENCES Comercio(id),
    FOREIGN KEY(idCocina) REFERENCES Cocina(id)
);

CREATE TABLE Menu (
    id INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    idComercio INT NOT NULL,
    FOREIGN KEY(idComercio) REFERENCES Comercio(id)
);

CREATE TABLE Seccion (
    id INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL,
    idMenu INT NOT NULL,
    FOREIGN KEY(idMenu) REFERENCES Menu(id)
);

CREATE TABLE Plato (
    id INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    orden INT NOT NULL,
    cantidadDisponible INT CHECK (cantidadDisponible >= 0),
    precio DECIMAL(10,2) CHECK (precio >= 0),
    descripcion NVARCHAR(255) NOT NULL,
    idSeccion INT NOT NULL,
    FOREIGN KEY(idSeccion) REFERENCES Seccion(id)
);

CREATE TABLE Opcion (
    id INT PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL
);

CREATE TABLE OpcionValor (
    id INT PRIMARY KEY,
    idOpcion INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    precio_extra DECIMAL(10,2) CHECK (precio_extra >= 0),
    FOREIGN KEY(idOpcion) REFERENCES Opcion(id)
);

CREATE TABLE PlatoOpcion (
    idPlato INT NOT NULL,
    idOpcion INT NOT NULL,
    PRIMARY KEY(idPlato, idOpcion),
    FOREIGN KEY(idPlato) REFERENCES Plato(id),
    FOREIGN KEY(idOpcion) REFERENCES Opcion(id)
);

CREATE TABLE PlatoOpcionValor (
    idPlato INT NOT NULL,
    idOpcionValor INT NOT NULL,
    idOpcion INT NOT NULL,
    PRIMARY KEY(idPlato, idOpcionValor, idOpcion),
    FOREIGN KEY(idPlato) REFERENCES Plato(id),
    FOREIGN KEY(idOpcionValor) REFERENCES OpcionValor(id),
    FOREIGN KEY(idOpcion) REFERENCES Opcion(id)
);
