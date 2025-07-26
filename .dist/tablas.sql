CREATE TABLE Comercio (
    id INT PRIMARY KEY,
    password VARCHAR(15) NOT NULL,
    telefono VARCHAR(13) NOT NULL,
    fecha_registro DATE NOT NULL,
    correo VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ubicacion_fisica VARCHAR(255) NOT NULL,
    hora_apertura INT CHECK (hora_apertura BETWEEN 0 AND 23),
    hora_cierre INT CHECK (hora_cierre BETWEEN 0 AND 23),
    estaActivo BIT NOT NULL
);

CREATE TABLE Cocina (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL
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
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    idComercio INT NOT NULL,
    FOREIGN KEY(idComercio) REFERENCES Comercio(id)
);

CREATE TABLE Seccion (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    idMenu INT NOT NULL,
    FOREIGN KEY(idMenu) REFERENCES Menu(id)
);

CREATE TABLE Plato (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    orden INT NOT NULL,
    cantidadDisponible INT CHECK (cantidadDisponible >= 0),
    precio DECIMAL(10,2) CHECK (precio >= 0),
    descripcion VARCHAR(255) NOT NULL,
    idSeccion INT NOT NULL,
    disponibilidad BIT NOT NULL

    FOREIGN KEY(idSeccion) REFERENCES Seccion(id)
);

CREATE TABLE Opcion (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE OpcionValor (
    id INT PRIMARY KEY,
    idOpcion INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
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

CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    password VARCHAR(15) NOT NULL,
    telefono VARCHAR(13) NOT NULL,
    fecha_registro DATE NOT NULL,
    correo VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL,
    nro_documento VARCHAR(30) NOT NULL
);

CREATE TABLE ClienteConClienteReferido (
    idCliente INT,
    idClienteReferido INT,
    fecha_referido DATE NOT NULL,
    PRIMARY KEY(idCliente, idClienteReferido),
    FOREIGN KEY(idCliente) REFERENCES Cliente(id),
    FOREIGN KEY(idClienteReferido) REFERENCES Cliente(id)
);

CREATE TABLE Direccion (
    id INT PRIMARY KEY,
    codigo_postal VARCHAR(10) NOT NULL,
    calle VARCHAR(100) NOT NULL,
    municipio VARCHAR(100) NOT NULL,
    alias VARCHAR(50) NOT NULL,
    nombre_edif VARCHAR(100) NOT NULL
);

CREATE TABLE DireccionCliente (
    idCliente INT,
    idDireccion INT,
    PRIMARY KEY(idCliente, idDireccion),
    FOREIGN KEY(idCliente) REFERENCES Cliente(id),
    FOREIGN KEY(idDireccion) REFERENCES Direccion(id)
);

CREATE TABLE Repartidor (
    id INT PRIMARY KEY,
    password VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL,
    correo VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL,
    nro_documento VARCHAR(30) NOT NULL,
    detalle_vehiculo VARCHAR(100) NOT NULL,
    estado VARCHAR(10) CHECK (estado IN ('Activo', 'Inactivo'))
);

CREATE TABLE ClienteRepartidor (
    idCliente INT,
    idRepartidor INT,
    fecha DATE NOT NULL,
    puntaje INT CHECK (puntaje BETWEEN 1 AND 5),
    comentario VARCHAR(255),
    PRIMARY KEY(idCliente, idRepartidor, fecha),
    FOREIGN KEY(idCliente) REFERENCES Cliente(id),
    FOREIGN KEY(idRepartidor) REFERENCES Repartidor(id)
);

CREATE TABLE Pedido (
    id INT PRIMARY KEY,
    cantidad_items INT CHECK (cantidad_items >= 0),
    costo_envio DECIMAL(10,2) CHECK (costo_envio >= 0),
    nota VARCHAR(255),
    tiempo_entrega INT,
    total DECIMAL(10,2) CHECK (total >= 0)
);

CREATE TABLE Factura (
    numero INT PRIMARY KEY,
    fecha_emision DATE NOT NULL,
    sub_total DECIMAL(10,2),
    porcentajeIva DECIMAL(5,2),
    montoIva DECIMAL(10,2),
    monto_total DECIMAL(10,2),
    idPedido INT UNIQUE,
    FOREIGN KEY(idPedido) REFERENCES Pedido(id),
    CONSTRAINT CK_Factura_FechaNoFutura CHECK (fecha_emision <= CAST(GETDATE() AS DATE))
);

CREATE TABLE ClientePedido (
    idCliente INT,
    idPedido INT,
    fecha DATE NOT NULL,
    PRIMARY KEY(idCliente, idPedido),
    FOREIGN KEY(idCliente) REFERENCES Cliente(id),
    FOREIGN KEY(idPedido) REFERENCES Pedido(id)
);

CREATE TABLE RepartidorPedido (
    idRepartidor INT,
    idPedido INT,
    tiempo_entrega INT,
    PRIMARY KEY(idRepartidor, idPedido),
    FOREIGN KEY(idRepartidor) REFERENCES Repartidor(id),
    FOREIGN KEY(idPedido) REFERENCES Pedido(id)
);

CREATE TABLE PedidoDetalle (
    id INT PRIMARY KEY,
    cantidad INT CHECK (cantidad > 0),
    nota VARCHAR(255),
    total DECIMAL(10,2) CHECK (total >= 0),
    idPedido INT NOT NULL,
    idPlato INT NOT NULL,
    FOREIGN KEY(idPedido) REFERENCES Pedido(id),
    FOREIGN KEY(idPlato) REFERENCES Plato(id)
);

CREATE TABLE PedidoDetalleOpcionValor (
    idPedidoDetalle INT,
    idOpcionValor INT,
    idOpcion INT,
    PRIMARY KEY(idPedidoDetalle, idOpcionValor, idOpcion),
    FOREIGN KEY(idPedidoDetalle) REFERENCES PedidoDetalle(id),
    FOREIGN KEY(idOpcionValor) REFERENCES OpcionValor(id),
    FOREIGN KEY(idOpcion) REFERENCES Opcion(id)
);

CREATE TABLE EstadoPedido (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tiempo_promedio INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE PedidoEstadoPedido (
    idPedido INT,
    idEstadoPedido INT,
    fecha_inicio DATETIME NOT NULL,
    PRIMARY KEY(idPedido, idEstadoPedido, fecha_inicio),
    FOREIGN KEY(idPedido) REFERENCES Pedido(id),
    FOREIGN KEY(idEstadoPedido) REFERENCES EstadoPedido(id)
);