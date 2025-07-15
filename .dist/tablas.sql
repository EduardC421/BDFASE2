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
    FOREIGN KEY(idPedido) REFERENCES Pedido(id)
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

--Estado del pedido
INSERT INTO EstadoPedido (id, nombre, tiempo_promedio, descripcion) VALUES
(1, 'Pendiente', 5, 'Pedido registrado, esperando confirmación.'),
(2, 'Confirmado', 10, 'Pedido confirmado por el comercio.'),
(3, 'En Preparación', 20, 'El pedido está siendo preparado.'),
(4, 'Listo para Entrega', 2, 'El pedido está listo para ser entregado.'),
(5, 'En Camino', 30, 'El repartidor está en camino.'),
(6, 'Entregado', 0, 'El pedido fue entregado al cliente.'),
(7, 'Cancelado', 0, 'El pedido fue cancelado.'),
(8, 'Retrasado', 15, 'El pedido tiene un retraso inesperado.'),
(9, 'Devolución en Proceso', 5, 'El pedido está en proceso de devolución.'),
(10, 'Reembolsado', 0, 'El monto del pedido fue reembolsado.'),
(11, 'Rechazado por Comercio', 0, 'El comercio rechazó el pedido por falta de disponibilidad.'),
(12, 'Esperando Repartidor', 10, 'Pedido listo pero sin repartidor asignado aún.'),
(13, 'Reintento de Entrega', 20, 'Se está realizando un segundo intento de entrega.'),
(14, 'Programado', 60, 'Pedido programado para entrega futura.'),
(15, 'Error en Pago', 0, 'El pago no se procesó correctamente, pedido en revisión.');

--Cocina
INSERT INTO Cocina (id, nombre, descripcion) VALUES
(1, 'China', 'Especialidades de comida china y oriental.'),
(2, 'Mexicana', 'Tacos, enchiladas y gastronomía mexicana tradicional.'),
(3, 'Italiana', 'Pizzas, pastas y cocina mediterránea italiana.'),
(4, 'Japonesa', 'Sushi, ramen y platos típicos de Japón.'),
(5, 'Hindú', 'Currys, especias y cocina de la India.'),
(6, 'Árabe', 'Comida del Medio Oriente: shawarma, falafel, kebabs.'),
(7, 'Parrilla', 'Carnes a la parrilla, asados y BBQ.'),
(8, 'Venezolana', 'Platos típicos venezolanos: arepas, pabellón, cachapas.'),
(9, 'Mediterránea', 'Gastronomía del Mediterráneo: tapas, ensaladas, mariscos.'),
(10, 'Francesa', 'Alta cocina francesa, quiches, crepes y repostería.'),
(11, 'Española', 'Paellas, tortillas y cocina tradicional de España.'),
(12, 'Peruana', 'Ceviche, causa limeña y gastronomía peruana.'),
(13, 'Brasileña', 'Churrasco, feijoada y platos típicos de Brasil.'),
(14, 'Argentina', 'Cortes de carne, empanadas y parrilladas argentinas.'),
(15, 'Coreana', 'Bibimbap, bulgogi y cocina coreana.'),
(16, 'Tailandesa', 'Curry tailandés, pad thai y sabores picantes.'),
(17, 'Vietnamita', 'Pho, rollitos primavera y cocina de Vietnam.'),
(18, 'Colombiana', 'Bandeja paisa, arepas y gastronomía colombiana.'),
(19, 'Sin Gluten', 'Platos aptos para celíacos.'),
(20, 'Salvadoreña', 'Pupusas, tamales y platos típicos de El Salvador.'),
(21, 'Griega', 'Ensaladas, gyros y gastronomía griega.'),
(22, 'Turca', 'Döner kebab, baklava y cocina turca.'),
(23, 'Alemana', 'Salchichas, schnitzel y cocina alemana.'),
(24, 'Internacional', 'Fusión de platos de diferentes países.'),
(25, 'Tradicional', 'Comida casera y tradicional de la región.'),
(26, 'Gourmet', 'Alta cocina, platos elaborados con técnicas sofisticadas.'),
(27, 'Experimental', 'Cocina creativa con técnicas innovadoras y sabores únicos.'),
(28, 'Fusión', 'Combinación de distintas tradiciones culinarias.'),
(29, 'Orgánica', 'Platos elaborados con ingredientes 100% orgánicos y sostenibles.'),
(30, 'Casera', 'Recetas tradicionales preparadas como en casa.'),
(31, 'Tex-Mex', 'Fusión de sabores mexicanos con cocina del sur de Estados Unidos.'),
(32, 'Street Food', 'Comida callejera internacional, práctica y variada.'),
(33, 'Healthy-Fit', 'Platos saludables, bajos en calorías y balanceados para dieta fitness.'),
(34, 'Comfort Food', 'Comidas reconfortantes y abundantes, típicas del hogar.'),
(35, 'Mar y Tierra', 'Combinación de mariscos y carnes a la parrilla.');

---Clientes
INSERT INTO Cliente (id, password, telefono, fecha_registro, correo, nombre, apellido, fecha_nac, nro_documento) VALUES
(1, 'clave001', '04128433977', '2025-07-13', 'manuel.herrera1@gmail.com', 'Manuel', 'Herrera', '1985-10-31', 'V17147694'),
(2, 'clave002', '04144064468', '2025-07-13', 'manuel.torres2@gmail.com', 'Manuel', 'Torres', '1989-05-30', 'V21060916'),
(3, 'clave003', '04243993464', '2025-07-13', 'miguel.mendoza3@gmail.com', 'Miguel', 'Mendoza', '1988-11-20', 'V13820454'),
(4, 'clave004', '04123001786', '2025-07-13', 'laura.mendoza4@gmail.com', 'Laura', 'Mendoza', '2001-07-05', 'V23802098'),
(5, 'clave005', '04246686214', '2025-07-13', 'ana.fernandez5@gmail.com', 'Ana', 'Fernandez', '1963-04-30', 'V11099308'),
(6, 'clave006', '04120001111', '2025-07-13', 'juan.garcia6@gmail.com', 'Juan', 'Garcia', '1975-12-12', 'V19325561'),
(7, 'clave007', '04220002222', '2025-07-13', 'maria.lopez7@gmail.com', 'Maria', 'Lopez', '1990-06-15', 'V26997002'),
(8, 'clave008', '04130003333', '2025-07-13', 'carlos.ramirez8@gmail.com', 'Carlos', 'Ramirez', '1982-03-10', 'V27234433'),
(9, 'clave009', '04240004444', '2025-07-13', 'sandra.gomez9@gmail.com', 'Sandra', 'Gomez', '1978-09-23', 'V18768944'),
(10, 'clave010', '04140005555', '2025-07-13', 'pedro.sanchez10@gmail.com', 'Pedro', 'Sanchez', '1987-11-01', 'V19555055'),
(11, 'clave011', '04160006666', '2025-07-13', 'laura.perez11@gmail.com', 'Laura', 'Perez', '1995-04-04', 'V20000066'),
(12, 'clave012', '04240007777', '2025-07-13', 'jose.martinez12@gmail.com', 'Jose', 'Martinez', '1980-01-19', 'V21000077'),
(13, 'clave013', '04160008888', '2025-07-13', 'marta.silva13@gmail.com', 'Marta', 'Silva', '1965-07-07', 'V22088'),
(14, 'clave014', '04260009999', '2025-07-13', 'luis.rodriguez14@gmail.com', 'Luis', 'Rodriguez', '1973-08-16', 'V23788099'),
(15, 'clave015', '04160001010', '2025-07-13', 'ana.moreno15@gmail.com', 'Ana', 'Moreno', '1992-12-30', 'V24510127'),
(16, 'clave016', '04240891511', '2025-07-13', 'francisco.diaz16@gmail.com', 'Francisco', 'Diaz', '1989-10-02', 'V25999111'),
(17, 'clave017', '04120002222', '2025-07-13', 'paula.torres17@gmail.com', 'Paula', 'Torres', '1997-03-21', 'V26999122'),
(18, 'clave018', '04240003333', '2025-07-13', 'javier.soto18@gmail.com', 'Javier', 'Soto', '1979-05-25', 'V27000133'),
(19, 'clave019', '04160004444', '2025-07-13', 'sofia.martin19@gmail.com', 'Sofia', 'Martin', '1984-11-11', 'V28000144'),
(20, 'clave020', '04240005555', '2025-07-13', 'david.rojas20@gmail.com', 'David', 'Rojas', '1991-01-09', 'V29090155'),
(21, 'clave021', '04127896504', '2025-07-13', 'maria.torres21@gmail.com', 'Maria', 'Torres', '1986-07-07', 'V30987066'),
(22, 'clave022', '04144467230', '2025-07-13', 'carlos.martin22@gmail.com', 'Carlos', 'Martin', '1994-02-14', 'V31999177'),
(23, 'clave023', '04123458888', '2025-07-13', 'luis.lopez23@gmail.com', 'Luis', 'Lopez', '1971-08-25', 'V32060188'),
(24, 'clave024', '04245569696', '2025-07-13', 'ana.gomez24@gmail.com', 'Ana', 'Gomez', '1983-09-03', 'V33890199'),
(25, 'clave025', '04163450330', '2025-07-13', 'miguel.perez25@gmail.com', 'Miguel', 'Perez', '1990-04-18', 'V34000200'),
(26, 'clave026', '04263751177', '2025-07-13', 'laura.ramirez26@gmail.com', 'Laura', 'Ramirez', '1987-06-06', 'V35000211'),
(27, 'clave027', '04143452222', '2025-07-13', 'juan.sanchez27@gmail.com', 'Juan', 'Sanchez', '1978-11-12', 'V36000222'),
(28, 'clave028', '04163453333', '2025-07-13', 'sofia.martinez28@gmail.com', 'Sofia', 'Martinez', '1968-03-20', 'V37000233'),
(29, 'clave029', '04167764744', '2025-07-13', 'pedro.diaz29@gmail.com', 'Pedro', 'Diaz', '1992-12-08', 'V35070244'),
(30, 'clave030', '04263457558', '2025-07-13', 'francisco.garcia30@gmail.com', 'Francisco', 'Garcia', '1981-10-30', 'V35030255'),
(31, 'clave031', '04163426690', '2025-07-13', 'marta.lopez31@gmail.com', 'Marta', 'Lopez', '1995-07-01', 'V30858266'),
(32, 'clave032', '04243457797', '2025-07-13', 'javier.mendoza32@gmail.com', 'Javier', 'Mendoza', '1970-01-15', 'V31054277'),
(33, 'clave033', '04141057898', '2025-07-13', 'ana.torres33@gmail.com', 'Ana', 'Torres', '1988-05-09', 'V32000288'),
(34, 'clave034', '04242559909', '2025-07-13', 'manuel.perez34@gmail.com', 'Manuel', 'Perez', '1999-03-28', 'V33040299'),
(35, 'clave035', '04167850770', '2025-07-13', 'laura.garcia35@gmail.com', 'Laura', 'Garcia', '1983-07-16', 'V31440300'),
(36, 'clave036', '04263451121', '2025-07-13', 'carlos.diaz36@gmail.com', 'Carlos', 'Diaz', '1976-06-23', 'V28500311'),
(37, 'clave037', '04144352572', '2025-07-13', 'paula.martinez37@gmail.com', 'Paula', 'Martinez', '1984-09-17', 'V46000322'),
(38, 'clave038', '04243453333', '2025-07-13', 'miguel.soto38@gmail.com', 'Miguel', 'Soto', '1991-12-29', 'V47000333'),
(39, 'clave039', '04123494444', '2025-07-13', 'sofia.lopez39@gmail.com', 'Sofia', 'Lopez', '1969-11-05', 'V48000344'),
(40, 'clave040', '04263455905', '2025-07-13', 'jose.perez40@gmail.com', 'Jose', 'Perez', '1985-04-13', 'V24900355'),
(41, 'clave041', '04123456767', '2025-07-13', 'maria.gomez41@gmail.com', 'Maria', 'Gomez', '1993-08-07', 'V25000366'),
(42, 'clave042', '04263457077', '2025-07-13', 'juan.ramirez42@gmail.com', 'Juan', 'Ramirez', '1987-09-19', 'V25133877'),
(43, 'clave043', '04163458888', '2025-07-13', 'luis.sanchez43@gmail.com', 'Luis', 'Sanchez', '1974-05-24', 'V22044388'),
(44, 'clave044', '04263459999', '2025-07-13', 'ana.torres44@gmail.com', 'Ana', 'Torres', '1989-07-02', 'V24500399'),
(45, 'clave045', '04164598000', '2025-07-13', 'carlos.martinez45@gmail.com', 'Carlos', 'Martinez', '1992-10-11', 'V12504400'),
(46, 'clave046', '04263453432', '2025-07-13', 'marta.rodriguez46@gmail.com', 'Marta', 'Rodriguez', '1980-02-28', 'V5000411'),
(47, 'clave047', '04141255672', '2025-07-13', 'pedro.soto47@gmail.com', 'Pedro', 'Soto', '1977-03-15', 'V56000422'),
(48, 'clave048', '04266378877', '2025-07-13', 'francisco.gomez48@gmail.com', 'Francisco', 'Gomez', '1983-06-27', 'V57000433'),
(49, 'clave049', '04123454444', '2025-07-13', 'paula.lopez49@gmail.com', 'Paula', 'Lopez', '1966-01-09', 'V5800444'),
(50, 'clave050', '04243455555', '2025-07-13', 'miguel.perez50@gmail.com', 'Miguel', 'Perez', '1994-12-21', 'V5950455'),
(51, 'clave051', '04123456666', '2025-07-13', 'sofia.ramirez51@gmail.com', 'Sofia', 'Ramirez', '1981-07-18', 'V6800466'),
(52, 'clave052', '04243457777', '2025-07-13', 'jose.garcia52@gmail.com', 'Jose', 'Garcia', '1970-08-30', 'V6109477'),
(53, 'clave053', '04143458888', '2025-07-13', 'laura.sanchez53@gmail.com', 'Laura', 'Sanchez', '1993-05-26', 'V6200908'),
(54, 'clave054', '04243459999', '2025-07-13', 'miguel.lopez54@gmail.com', 'Miguel', 'Lopez', '1988-04-14', 'V8380499'),
(55, 'clave055', '04123450000', '2025-07-13', 'ana.martinez55@gmail.com', 'Ana', 'Martinez', '1975-02-01', 'V9479500'),
(56, 'clave056', '04243451111', '2025-07-13', 'carlos.perez56@gmail.com', 'Carlos', 'Perez', '1986-11-22', 'V10154851'),
(57, 'clave057', '04163452222', '2025-07-13', 'maria.gomez57@gmail.com', 'Maria', 'Gomez', '1973-01-13', 'V6897522'),
(58, 'clave058', '04263548810', '2025-07-13', 'juan.soto58@gmail.com', 'Juan', 'Soto', '1980-09-19', 'V6750533'),
(59, 'clave059', '04163454444', '2025-07-13', 'paula.lopez59@gmail.com', 'Paula', 'Lopez', '1991-10-31', 'V68000544'),
(60, 'clave060', '04240112551', '2025-07-13', 'miguel.perez60@gmail.com', 'Miguel', 'Perez', '1984-06-07', 'V69000555'),
(61, 'clave061', '04126536271', '2025-07-13', 'sofia.ramirez61@gmail.com', 'Sofia', 'Ramirez', '1976-12-15', 'V70000566'),
(62, 'clave062', '04249000307', '2025-07-13', 'jose.garcia62@gmail.com', 'Jose', 'Garcia', '1989-03-25', 'V71000577'),
(63, 'clave063', '04165498685', '2025-07-13', 'laura.sanchez63@gmail.com', 'Laura', 'Sanchez', '1992-07-29', 'V72000588'),
(64, 'clave064', '04247778799', '2025-07-13', 'miguel.lopez64@gmail.com', 'Miguel', 'Lopez', '1978-01-17', 'V73000599'),
(65, 'clave065', '04163450000', '2025-07-13', 'ana.martinez65@gmail.com', 'Ana', 'Martinez', '1987-09-02', 'V74000600'),
(66, 'clave066', '04267755524', '2025-07-13', 'carlos.perez66@gmail.com', 'Carlos', 'Perez', '1990-11-22', 'V75000611'),
(67, 'clave067', '04149052622', '2025-07-13', 'maria.gomez67@gmail.com', 'Maria', 'Gomez', '1969-05-05', 'V76000622'),
(68, 'clave068', '04143323033', '2025-07-13', 'juan.soto68@gmail.com', 'Juan', 'Soto', '1974-08-16', 'V77000633'),
(69, 'clave069', '04143454444', '2025-07-13', 'paula.lopez69@gmail.com', 'Paula', 'Lopez', '1981-02-26', 'V20.555.555'),
(70, 'clave070', '04265599055', '2025-07-13', 'sofia.martinez70@gmail.com', 'Sofia', 'Martinez', '1985-04-11', 'V78000644'),
(71, 'clave071', '04163456666', '2025-07-13', 'jose.rodriguez71@gmail.com', 'Jose', 'Rodriguez', '1974-09-05', 'V79000655'),
(72, 'clave072', '04242305777', '2025-07-13', 'maria.diaz72@gmail.com', 'Maria', 'Diaz', '1988-01-17', 'V28678916'),
(73, 'clave073', '04120978819', '2025-07-13', 'carlos.soto73@gmail.com', 'Carlos', 'Soto', '1991-10-29', 'V28160677'),
(74, 'clave074', '04247479099', '2025-07-13', 'ana.lopez74@gmail.com', 'Ana', 'Lopez', '1982-12-23', 'V28234609'),
(75, 'clave075', '04144450070', '2025-07-13', 'miguel.gomez75@gmail.com', 'Miguel', 'Gomez', '1979-06-15', 'V29611485'),
(76, 'clave076', '04263451111', '2025-07-13', 'laura.perez76@gmail.com', 'Laura', 'Perez', '1990-08-03', 'V23157889'),
(77, 'clave077', '04123452222', '2025-07-13', 'juan.torres77@gmail.com', 'Juan', 'Torres', '1983-02-26', 'V2685340'),
(78, 'clave078', '04264258331', '2025-07-13', 'paula.sanchez78@gmail.com', 'Paula', 'Sanchez', '1975-07-19', 'V26500722'),
(79, 'clave079', '04149031124', '2025-07-13', 'javier.garcia79@gmail.com', 'Javier', 'Garcia', '1986-11-13', 'V27570733'),
(80, 'clave080', '04260435756', '2025-07-13', 'sofia.moreno80@gmail.com', 'Sofia', 'Moreno', '1994-09-07', 'V18040744'),
(81, 'clave081', '04162223756', '2025-07-13', 'jose.lopez81@gmail.com', 'Jose', 'Lopez', '1977-04-30', 'V29680755'),
(82, 'clave082', '04241235679', '2025-07-13', 'maria.rodriguez82@gmail.com', 'Maria', 'Rodriguez', '1981-08-21', 'V28002766'),
(83, 'clave083', '04122134509', '2025-07-13', 'carlos.torres83@gmail.com', 'Carlos', 'Torres', '1993-12-25', 'V15603777'),
(84, 'clave084', '04247272965', '2025-07-13', 'ana.soto84@gmail.com', 'Ana', 'Soto', '1987-06-10', 'V22010788'),
(85, 'clave085', '04149999999', '2025-07-13', 'miguel.martinez85@gmail.com', 'Miguel', 'Martinez', '1990-05-04', 'V33075729'),
(86, 'clave086', '04240348592', '2025-07-13', 'laura.gomez86@gmail.com', 'Laura', 'Gomez', '1983-09-14', 'V30456780'),
(87, 'clave087', '04128764343', '2025-07-13', 'juan.lopez87@gmail.com', 'Juan', 'Lopez', '1976-03-07', 'V31000811'),
(88, 'clave088', '04247555583', '2025-07-13', 'paula.sanchez88@gmail.com', 'Paula', 'Sanchez', '1989-11-30', 'V26680822'),
(89, 'clave089', '04123454234', '2025-07-13', 'javier.perez89@gmail.com', 'Javier', 'Perez', '1992-07-18', 'V27960833'),
(90, 'clave090', '04263455555', '2025-07-13', 'sofia.torres90@gmail.com', 'Sofia', 'Torres', '1985-01-27', 'V28506844'),
(91, 'clave091', '04143456666', '2025-07-13', 'jose.garcia91@gmail.com', 'Jose', 'Garcia', '1974-10-11', 'V29040855'),
(92, 'clave092', '04240304756', '2025-07-13', 'maria.martinez92@gmail.com', 'Maria', 'Martinez', '1988-03-03', 'V28799066'),
(93, 'clave093', '04123458688', '2025-07-13', 'carlos.soto93@gmail.com', 'Carlos', 'Soto', '1991-05-15', 'V29056977'),
(94, 'clave094', '04143459599', '2025-07-13', 'ana.lopez94@gmail.com', 'Ana', 'Lopez', '1982-08-21', 'V6201088'),
(95, 'clave095', '04122165030', '2025-07-13', 'miguel.gomez95@gmail.com', 'Miguel', 'Gomez', '1979-02-06', 'V273001199'),
(96, 'clave096', '04263352211', '2025-07-13', 'laura.perez96@gmail.com', 'Laura', 'Perez', '1990-09-29', 'V254001200'),
(97, 'clave097', '04163332532', '2025-07-13', 'juan.torres97@gmail.com', 'Juan', 'Torres', '1983-04-18', 'V22001311'),
(98, 'clave098', '04240053930', '2025-07-13', 'paula.sanchez98@gmail.com', 'Paula', 'Sanchez', '1975-07-27', 'V8764002'),
(99, 'clave099', '04149909999', '2025-07-13', 'laura.vargas99@gmail.com', 'Laura', 'Vargas', '1987-08-25', 'V29000999'),
(100, 'clave100', '04260010302', '2025-07-13', 'miguel.castro100@gmail.com', 'Miguel', 'Castro', '1993-12-10', 'V9768576');

--Direcciones Generales de la base de datos
INSERT INTO Direccion (id, codigo_postal, calle, municipio, alias, nombre_edif) VALUES
(1, '1010', 'Av. Principal', 'Caracas', 'Casa', 'Quinta Carmen'),
(2, '1020', 'Calle Sucre', 'Maracaibo', 'Apartamento', 'Res. Altamira'),
(3, '1030', 'Av. Bolívar', 'Valencia', 'Casa', 'Villa Margarita'),
(4, '1040', 'Calle 5', 'Barquisimeto', 'Oficina', 'Centro Empresarial Lara'),
(5, '1050', 'Av. Miranda', 'Maracay', 'Casa', 'Villa Amelia'),
(6, '1060', 'Calle Libertad', 'Barcelona', 'Casa', 'Quinta La Esperanza'),
(7, '1070', 'Av. Intercomunal', 'Puerto Ordaz', 'Apartamento', 'Res. La Victoria'),
(8, '1080', 'Calle El Sol', 'Ciudad Bolívar', 'Casa', 'Villa Aurora'),
(9, '1090', 'Av. Aragua', 'Cumaná', 'Apartamento', 'Residencias Mar Azul'),
(10, '1100', 'Calle 12', 'Mérida', 'Casa', 'Casa Rangel'),
(11, '1011', 'Av. Urdaneta', 'Caracas', 'Trabajo', 'Torre CANTV'),
(12, '1021', 'Calle Zamora', 'Barinas', 'Casa', 'Villa Laura'),
(13, '1031', 'Av. Las Industrias', 'Valera', 'Apartamento', 'Res. El Cielo'),
(14, '1041', 'Calle 8', 'El Tigre', 'Casa', 'Villa del Sol'),
(15, '1051', 'Av. Panteón', 'San Cristóbal', 'Casa', 'Quinta Bella Vista'),
(16, '1061', 'Calle 9', 'Guarenas', 'Apartamento', 'Res. Las Torres'),
(17, '1071', 'Av. Los Leones', 'Barquisimeto', 'Casa', 'Villa Real'),
(18, '1081', 'Calle El Carmen', 'La Guaira', 'Casa', 'Quinta Marina'),
(19, '1091', 'Av. La Limpia', 'Maracaibo', 'Apartamento', 'Res. Buenaventura'),
(20, '1101', 'Calle Comercio', 'Porlamar', 'Casa', 'Villa Caribe'),
(21, '1111', 'Av. Universidad', 'Maturín', 'Apartamento', 'Res. Altos del Este'),
(22, '1121', 'Calle 15', 'San Felipe', 'Casa', 'Quinta Rosalinda'),
(23, '1131', 'Av. Los Próceres', 'Acarigua', 'Casa', 'Villa Patriotas'),
(24, '1141', 'Calle Vargas', 'El Vigía', 'Apartamento', 'Res. San Mateo'),
(25, '1151', 'Av. Norte', 'Guacara', 'Casa', 'Villa Sara'),
(26, '1161', 'Calle Ayacucho', 'Coro', 'Casa', 'Villa Luz'),
(27, '1171', 'Av. Sur', 'Cabimas', 'Casa', 'Villa Merlyn'),
(28, '1181', 'Calle Zulia', 'San Fernando', 'Apartamento', 'Res. Orinoco'),
(29, '1191', 'Av. San Martín', 'Caracas', 'Casa', 'Casa San Martín'),
(30, '1201', 'Calle El Rosario', 'Guatire', 'Apartamento', 'Res. Estrella'),
(31, '1211', 'Av. Norte-Sur', 'Caracas', 'Casa', 'Villa Clara'),
(32, '1221', 'Calle 21', 'Barinas', 'Apartamento', 'Res. Los Llanos'),
(33, '1231', 'Av. 3 de Mayo', 'Maracay', 'Casa', 'Villa Palma'),
(34, '1241', 'Calle 23', 'Valencia', 'Casa', 'Villa Clara'),
(35, '1251', 'Av. La Paz', 'Barquisimeto', 'Apartamento', 'Res. Lara Norte'),
(36, '1261', 'Calle 25', 'Barcelona', 'Casa', 'Quinta El Milagro'),
(37, '1271', 'Av. Gran Mariscal', 'Caracas', 'Apartamento', 'Res. Libertador'),
(38, '1281', 'Calle 27', 'Maracaibo', 'Casa', 'Villa Cielo Azul'),
(39, '1291', 'Av. Principal', 'Valencia', 'Casa', 'Villa de Las Flores'),
(40, '1301', 'Calle 29', 'Guarenas', 'Apartamento', 'Res. Río Verde'),
(41, '1311', 'Av. Sucre', 'Mérida', 'Casa', 'Casa del Río'),
(42, '1321', 'Calle Real', 'Maracaibo', 'Apartamento', 'Res. Norte'),
(43, '1331', 'Av. Rómulo Gallegos', 'Caracas', 'Casa', 'Villa del Este'),
(44, '1341', 'Callejón 4', 'Valencia', 'Casa', 'Villa Lilia'),
(45, '1351', 'Av. Andrés Bello', 'Maturín', 'Apartamento', 'Res. Monagas'),
(46, '1361', 'Calle Principal', 'La Guaira', 'Casa', 'Villa Sol'),
(47, '1371', 'Av. Bolívar', 'San Cristóbal', 'Apartamento', 'Res. Andina'),
(48, '1381', 'Calle La Ceiba', 'Barinas', 'Casa', 'Villa Esperanza'),
(49, '1391', 'Av. Miranda', 'Caracas', 'Casa', 'Casa Blanca'),
(50, '1401', 'Calle Nueva', 'Valera', 'Apartamento', 'Res. Los Andes'),
(51, '1411', 'Calle 49', 'Mérida', 'Oficina', 'Villa Sol Naciente'),
(52, '1421', 'Calle 10', 'Valera', 'Apartamento', 'Villa Luz Marina'),
(53, '1431', 'Calle 36', 'Barcelona', 'Casa', 'Res. Colina Verde'),
(54, '1441', 'Calle 45', 'Maracay', 'Casa', 'Quinta El Mirador'),
(55, '1451', 'Calle 2', 'San Cristóbal', 'Oficina', 'Casa Miraflores'),
(56, '1461', 'Calle 47', 'Maracay', 'Oficina', 'Quinta El Mirador'),
(57, '1471', 'Calle 17', 'Barcelona', 'Casa', 'Villa Luz Marina'),
(58, '1481', 'Calle 20', 'La Guaira', 'Trabajo', 'Res. Las Mercedes'),
(59, '1491', 'Calle 17', 'Cabimas', 'Casa', 'Casa San Ignacio'),
(60, '1501', 'Calle 43', 'Porlamar', 'Apartamento', 'Res. Horizonte Azul'),
(61, '1511', 'Calle 30', 'Coro', 'Casa', 'Villa El Paraíso'),
(62, '1521', 'Calle 19', 'Maracay', 'Trabajo', 'Res. Monte Claro'),
(63, '1531', 'Calle 16', 'La Guaira', 'Trabajo', 'Res. Los Mangos'),
(64, '1541', 'Calle 7', 'Guacara', 'Apartamento', 'Res. Monte Bello'),
(65, '1551', 'Calle 38', 'Ciudad Bolívar', 'Casa', 'Villa Costa Azul'),
(66, '1561', 'Calle 13', 'Maracaibo', 'Casa', 'Quinta Bella Vista'),
(67, '1571', 'Calle 12', 'Valencia', 'Apartamento', 'Res. San Rafael'),
(68, '1581', 'Calle 14', 'Acarigua', 'Oficina', 'Res. Altos de Sucre'),
(69, '1591', 'Calle 29', 'San Fernando', 'Casa', 'Villa Río Claro'),
(70, '1601', 'Calle 3', 'Barinas', 'Casa', 'Villa Las Palmas'),
(71, '1611', 'Calle 40', 'Maturín', 'Casa', 'Casa Del Este'),
(72, '1621', 'Calle 18', 'Guarenas', 'Apartamento', 'Res. Costa Verde'),
(73, '1631', 'Calle 24', 'Barquisimeto', 'Casa', 'Villa Monte Claro'),
(74, '1641', 'Calle 35', 'Valera', 'Casa', 'Quinta Santa Ana'),
(75, '1651', 'Calle 5', 'El Vigía', 'Apartamento', 'Res. Don Pedro'),
(76, '1661', 'Calle 6', 'Caracas', 'Casa', 'Villa Monte Bello'),
(77, '1671', 'Calle 41', 'Maracaibo', 'Apartamento', 'Res. Los Jardines'),
(78, '1681', 'Calle 1', 'Guatire', 'Casa', 'Casa San Isidro'),
(79, '1691', 'Calle 15', 'Caracas', 'Apartamento', 'Res. El Encanto'),
(80, '1701', 'Calle 26', 'Maracaibo', 'Casa', 'Villa Los Cedros'),
(81, '1711', 'Calle 23', 'Caracas', 'Casa', 'Casa San Martín'),
(82, '1721', 'Calle 31', 'Maracay', 'Casa', 'Villa Clara'),
(83, '1731', 'Calle 32', 'San Felipe', 'Apartamento', 'Res. Altos del Este'),
(84, '1741', 'Calle 22', 'San Cristóbal', 'Casa', 'Quinta Rosalinda'),
(85, '1751', 'Calle 28', 'Puerto Ordaz', 'Casa', 'Villa Patriotas'),
(86, '1761', 'Calle 11', 'Cumaná', 'Apartamento', 'Res. San Mateo'),
(87, '1771', 'Calle 44', 'Barquisimeto', 'Casa', 'Villa Sara'),
(88, '1781', 'Calle 46', 'La Guaira', 'Casa', 'Villa Luz'),
(89, '1791', 'Calle 42', 'Caracas', 'Casa', 'Villa Merlyn'),
(90, '1801', 'Calle 34', 'San Fernando', 'Apartamento', 'Res. Orinoco'),
(91, '1811', 'Calle 39', 'Guatire', 'Apartamento', 'Res. Estrella'),
(92, '1821', 'Calle 33', 'Caracas', 'Casa', 'Villa Esperanza'),
(93, '1831', 'Calle 48', 'Coro', 'Apartamento', 'Res. Los Andes'),
(94, '1841', 'Calle 37', 'Barinas', 'Casa', 'Villa El Encanto'),
(95, '1851', 'Calle 50', 'Valencia', 'Casa', 'Villa Blanca'),
(96, '1861', 'Calle 4', 'El Tigre', 'Apartamento', 'Res. El Mirador'),
(97, '1871', 'Calle 8', 'Puerto Ordaz', 'Casa', 'Villa Cielo Azul'),
(98, '1881', 'Calle 6', 'Ciudad Bolívar', 'Casa', 'Villa de Las Flores'),
(99, '1891', 'Calle 21', 'Guarenas', 'Apartamento', 'Res. Río Verde'),
(100, '1901', 'Calle 9', 'Mérida', 'Casa', 'Casa del Río');

-- Clientes con 1 dirección (clientes 1 al 80)
INSERT INTO DireccionCliente (idCliente, idDireccion) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
(21, 21), (22, 22), (23, 23), (24, 24), (25, 25),
(26, 26), (27, 27), (28, 28), (29, 29), (30, 30),
(31, 31), (32, 32), (33, 33), (34, 34), (35, 35),
(36, 36), (37, 37), (38, 38), (39, 39), (40, 40),
(41, 41), (42, 42), (43, 43), (44, 44), (45, 45),
(46, 46), (47, 47), (48, 48), (49, 49), (50, 50),
(51, 51), (52, 52), (53, 53), (54, 54), (55, 55),
(56, 56), (57, 57), (58, 58), (59, 59), (60, 60),
(61, 61), (62, 62), (63, 63), (64, 64), (65, 65),
(66, 66), (67, 67), (68, 68), (69, 69), (70, 70),
(71, 71), (72, 72), (73, 73), (74, 74), (75, 75),
(76, 76), (77, 77), (78, 78), (79, 79), (80, 80);

-- Clientes con 2 o más direcciones (clientes 81 al 100)
INSERT INTO DireccionCliente (idCliente, idDireccion) VALUES
(81, 81), (81, 91),
(82, 82), (82, 92),
(83, 83), (83, 93),
(84, 84), (84, 94),
(85, 85), (85, 95),
(86, 86), (86, 96),
(87, 87), (87, 97),
(88, 88), (88, 98),
(89, 89), (89, 99),
(90, 90), (90, 100),
(91, 81), (91, 82), (91, 83),
(92, 84), (92, 85), (92, 86),
(93, 87), (93, 88), (93, 89),
(94, 90), (94, 91), (94, 92),
(95, 93), (95, 94), (95, 95),
(96, 96), (96, 97), (96, 98),
(97, 99), (97, 100), (97, 1),
(98, 2), (98, 3), (98, 4),
(99, 5), (99, 6), (99, 7),
(100, 8), (100, 9), (100, 10);


-- Insertar 35 comercios con datos aleatorios
INSERT INTO Comercio (id, password, telefono, fecha_registro, correo, nombre, ubicacion_fisica, hora_apertura, hora_cierre, estaActivo) VALUES
(1, 'pass123', '0412134567', '2024-01-15', 'parrillacriolla@gmail.com', 'Parrilla Criolla', 'Av. Libertador, Caracas', 11, 23, 1),
(2, 'pass456', '0414986543', '2024-02-10', 'sushiplace@hotmail.com', 'Sushi Place', 'Calle Colombia, Valencia', 12, 22, 1),
(3, 'pass789', '0424234567', '2024-03-05', 'pastaitalia@gmail.com', 'Pasta Italia', 'Av. 15, Maracaibo', 10, 21, 1),
(4, 'pass012', '0416124567', '2024-04-20', 'tacosmex@yahoo.com', 'Tacos Mexicanos', 'Calle 5, Barquisimeto', 13, 23, 1),
(5, 'pass345', '0426987654', '2024-05-18', 'wokfusion@gmail.com', 'Wok Fusion', 'Av. Principal, Maracay', 11, 22, 1),
(6, 'pass678', '0416899667', '2024-06-22', 'curryspice@outlook.com', 'Curry Spice', 'Calle Bolívar, Barcelona', 12, 21, 1),
(7, 'pass901', '04241239938', '2024-07-30', 'medgrill@gmail.com', 'Mediterranean Grill', 'Av. Sucre, Caracas', 9, 20, 1),
(8, 'pass234', '04160214567', '2024-08-15', 'arepera24@hotmail.com', 'Arepera 24 Horas', 'Calle Urdaneta, Valencia', 6, 23, 1),
(9, 'pass567', '0424987653', '2024-09-12', 'boulangerie@gmail.com', 'Boulangerie Française', 'Av. Belloso, Maracaibo', 7, 19, 1),
(10, 'pass890', '04169851255', '2024-10-05', 'paellaval@yahoo.com', 'Paella Valenciana', 'Calle Miranda, Barinas', 12, 22, 1),
(11, 'pass111', '04249876543', '2024-11-28', 'cevicheperu@gmail.com', 'Ceviche Peruano', 'Av. Guayana, Puerto Ordaz', 13, 23, 1),
(12, 'pass222', '0414567890', '2024-12-10', 'churrascobrasil@outlook.com', 'Churrasco Brasil', 'Calle Orinoco, Ciudad Bolívar', 11, 23, 1),
(13, 'pass333', '04249934567', '2025-01-05', 'bulgogi@gmail.com', 'Bulgogi House', 'Av. Perimetral, Cumaná', 10, 21, 1),
(14, 'pass444', '04128960044', '2025-02-15', 'thaifusion@hotmail.com', 'Thai Fusion', 'Calle 3, Mérida', 12, 22, 1),
(15, 'pass555', '04129509841', '2025-03-01', 'phoviet@gmail.com', 'Pho Vietnam', 'Av. Carabobo, San Cristóbal', 11, 20, 1),
(16, 'pass666', '04247821853', '2025-04-22', 'bandejapaisa@yahoo.com', 'Bandeja Paisa', 'Calle 10, Caracas', 8, 19, 1),
(17, 'pass777', '04242879728', '2025-05-18', 'glutenfree@gmail.com', 'Gluten Free Corner', 'Av. Lara, Maracay', 9, 18, 1),
(18, 'pass888', '04263050789', '2025-06-14', 'pupusas@outlook.com', 'Pupusería Salvadoreña', 'Calle Universidad, Valencia', 10, 22, 1),
(19, 'pass999', '04261604063', '2025-07-05', 'gyrosgreece@hotmail.com', 'Gyros Greece', 'Av. 20, Barquisimeto', 11, 23, 1),
(20, 'pass000', '04142938829', '2025-08-12', 'kebabking@gmail.com', 'Kebab King', 'Calle 72, Maracaibo', 12, 0, 1),
(21, 'passabc', '04242732937', '2025-09-30', 'bratwurst@yahoo.com', 'Bratwurst Haus', 'Av. Miranda, Barcelona', 13, 22, 1),
(22, 'passdef', '04241305252', '2025-10-15', 'fusiongourmet@gmail.com', 'Fusión Gourmet', 'Calle Marino, Porlamar', 18, 23, 1),
(23, 'passghi', '04149354643', '2025-11-10', 'organicbistro@outlook.com', 'Organic Bistro', 'Av. Bolívar, Maturín', 10, 20, 1),
(24, 'passjkl', '04129120103', '2025-12-05', 'caserakitchen@hotmail.com', 'Casera Kitchen', 'Calle Principal, La Guaira', 9, 18, 1),
(25, 'passmno', '04242294644', '2026-01-20', 'texmexgrill@gmail.com', 'Tex-Mex Grill', 'Av. Intercomunal, Cabimas', 11, 22, 1),
(26, 'passpqr', '04161208669', '2026-02-15', 'streetfood@yahoo.com', 'Street Food Market', 'Calle Zamora, Coro', 12, 23, 1),
(27, 'passtuv', '04120646803', '2026-03-10', 'healthyfit@gmail.com', 'Healthy & Fit', 'Av. Sucre, San Fernando', 7, 19, 1),
(28, 'passwxy', '04242109539', '2026-04-05', 'comfortfood@outlook.com', 'Comfort Food', 'Calle 5, Acarigua', 8, 20, 1),
(29, 'passz12', '04120108961', '2026-05-01', 'marytierra@hotmail.com', 'Mar y Tierra', 'Av. Principal, Guarenas', 12, 22, 1),
(30, 'pass345', '04248980302', '2026-06-15', 'pizzanapoli@gmail.com', 'Pizza Napoli', 'Calle Italia, El Tigre', 10, 23, 1),
(31, 'pass678', '04123700998', '2024-10-10', 'orientexpress@yahoo.com', 'Orient Express', 'Av. Este, Valencia', 11, 22, 0),
(32, 'pass901', '04249870123', '2024-09-05', 'argentinagrill@gmail.com', 'Argentina Grill', 'Calle Páez, Barinas', 12, 23, 0),
(33, 'pass234', '04127115643', '2024-08-12', 'frenchbakery@outlook.com', 'French Bakery', 'Av. 15, Maracaibo', 9, 18, 0),
(34, 'pass567', '04269020888', '2024-07-20', 'tapesbar@hotmail.com', 'Tapas Bar', 'Calle España, Caracas', 13, 22, 0),
(35, 'pass890', '04142137207', '2024-06-15', 'koreabbq@gmail.com', 'Korea BBQ', 'Av. Fuerzas Armadas, Puerto Ordaz', 11, 21, 0);

-- Asignación aleatoria de cocinas (30% con 2+ cocinas)
INSERT INTO ComercioCocina (idComercio, idCocina) VALUES
-- Comercios con múltiples cocinas (12 comercios)
(1, 7), (1, 25), (1, 35),
(2, 4), (2, 24), (2, 28),
(3, 3), (3, 9), (3, 26),
(4, 2), (4, 31),
(5, 1), (5, 24), (5, 33),
(6, 5), (6, 16),
(7, 9), (7, 26), (7, 11),
(8, 8), (8, 30),
(9, 10), (9, 26),
(10, 11), (10, 24),
(11, 12), (11, 35),
(12, 13), (12, 14),

-- Comercios con una sola cocina (23 comercios)
(13, 15),
(14, 16),
(15, 17),
(16, 18),
(17, 19),
(18, 20),
(19, 21),
(20, 22),
(21, 23),
(22, 24),
(23, 29),
(24, 30),
(25, 31),
(26, 32),
(27, 33),
(28, 34),
(29, 35),
(30, 3),
(31, 4),
(32, 14),
(33, 10),
(34, 11),
(35, 15);

-- Insertar menús para cada comercio (1 menú por comercio)
INSERT INTO Menu (id, nombre, descripcion, idComercio) VALUES
(1, 'Menú Parrillero', 'Especialidades de parrilla criolla venezolana', 1),
(2, 'Menú Sushi Experience', 'Variedad de sushi, sashimi y rolls japoneses', 2),
(3, 'Menú Pasta Artesanal', 'Pastas frescas con salsas tradicionales italianas', 3),
(4, 'Menú Mexicano', 'Auténticos tacos, burritos y platillos mexicanos', 4),
(5, 'Menú Wok Fusion', 'Cocina asiática de fusión preparada en wok', 5),
(6, 'Menú Curry Tradicional', 'Platos con curry de diferentes niveles de picante', 6),
(7, 'Menú Mediterráneo', 'Especialidades saludables de la cocina mediterránea', 7),
(8, 'Menú Arepera 24/7', 'Variedad de arepas venezolanas rellenas', 8),
(9, 'Menú Boulangerie', 'Panadería francesa y repostería fina', 9),
(10, 'Menú Paellero', 'Auténticas paellas valencianas y marineras', 10),
(11, 'Menú Cevichero', 'Ceviches peruanos y platos marinos', 11),
(12, 'Menú Churrasco', 'Cortes de carne a la brasa estilo brasileño', 12),
(13, 'Menú Coreano', 'Platos tradicionales de la cocina coreana', 13),
(14, 'Menú Thai', 'Especialidades tailandesas con sabores picantes', 14),
(15, 'Menú Vietnamita', 'Platos tradicionales de Vietnam', 15),
(16, 'Menú Colombiano', 'Especialidades de la cocina colombiana', 16),
(17, 'Menú Sin Gluten', 'Opciones libres de gluten para celíacos', 17),
(18, 'Menú Salvadoreño', 'Platos típicos de El Salvador', 18),
(19, 'Menú Griego', 'Especialidades de la cocina griega', 19),
(20, 'Menú Turco', 'Platos tradicionales de Turquía', 20),
(21, 'Menú Alemán', 'Especialidades de la cocina alemana', 21),
(22, 'Menú Fusión', 'Creaciones culinarias de fusión internacional', 22),
(23, 'Menú Orgánico', 'Platos elaborados con ingredientes orgánicos', 23),
(24, 'Menú Casero', 'Comida tradicional venezolana como en casa', 24),
(25, 'Menú Tex-Mex', 'Fusión de sabores mexicanos y texanos', 25),
(26, 'Menú Street Food', 'Comida callejera internacional', 26),
(27, 'Menú Saludable', 'Opciones balanceadas para dieta fitness', 27),
(28, 'Menú Comfort Food', 'Platos reconfortantes y abundantes', 28),
(29, 'Menú Mar y Tierra', 'Combinación de mariscos y carnes premium', 29),
(30, 'Menú Pizza Napolitana', 'Pizzas tradicionales estilo Nápoles', 30),
(31, 'Menú Oriental', 'Especialidades de la cocina oriental', 31),
(32, 'Menú Argentino', 'Cortes premium y parrillada argentina', 32),
(33, 'Menú Francés', 'Clásicos de la alta cocina francesa', 33),
(34, 'Menú Español', 'Tapas y platos tradicionales españoles', 34),
(35, 'Menú Coreano BBQ', 'Barbacoa coreana con cortes selectos', 35);

-- Por lo menos 5 secciones por menú
INSERT INTO Seccion (id, nombre, descripcion, idMenu) VALUES
-- Menú Parrillero (idMenu: 1)
(1, 'Carnes a la Brasa', 'Cortes premium y clásicos de la parrilla', 1),
(2, 'Contornos', 'Acompañamientos frescos y sabrosos', 1),
(3, 'Entradas Parrilleras', 'Picadas y aperitivos para empezar', 1),
(4, 'Postres Criollos', 'Dulces típicos para cerrar con broche de oro', 1),
(5, 'Bebidas Tradicionales', 'Jugos naturales y refrescos', 1),

-- Menú Sushi Experience (idMenu: 2)
(6, 'Nigiri y Sashimi', 'Selección de pescados frescos y mariscos', 2),
(7, 'Rolls Especiales', 'Variedad de makis y uramakis innovadores', 2),
(8, 'Temaki y Gunkan', 'Conos y barquitos de arroz y alga', 2),
(9, 'Platos Calientes Japoneses', 'Tempuras, yakitoris y otras delicias', 2),
(10, 'Ensaladas y Sopas', 'Opciones ligeras y tradicionales', 2),

-- Menú Pasta Artesanal (idMenu: 3)
(11, 'Pastas Largas', 'Spaghetti, Fettuccine y Linguine con diversas salsas', 3),
(12, 'Pastas Rellenas', 'Ravioles, Tortellinis y Gnocchis caseros', 3),
(13, 'Salsas Clásicas', 'Boloñesa, Pesto, Carbonara y más', 3),
(14, 'Antipastos', 'Entradas italianas para compartir', 3),
(15, 'Postres Italianos', 'Tiramisú, Panna Cotta y Cannoli', 3),

-- Menú Mexicano (idMenu: 4)
(16, 'Tacos y Burritos', 'Maíz y trigo con rellenos variados', 4),
(17, 'Enchiladas y Quesadillas', 'Platillos gratinados y rellenos', 4),
(18, 'Especialidades Regionales', 'Mole Poblano, Chiles Rellenos, etc.', 4),
(19, 'Bebidas Típicas', 'Aguas frescas, Horchata y Micheladas', 4),
(20, 'Sopas y Ensaladas Mexicanas', 'Pozole, Sopa de Tortilla, Ensalada de Nopal', 4),

-- Menú Wok Fusion (idMenu: 5)
(21, 'Wok de Carnes', 'Res, pollo y cerdo salteados al wok', 5),
(22, 'Wok de Mariscos y Vegetales', 'Frescos vegetales y frutos del mar', 5),
(23, 'Fideos y Arroces Wok', 'Chow Mein, Arroz Frito y Pad Thai', 5),
(24, 'Entradas Asiáticas', 'Rollitos Primavera, Gyozas, Satays', 5),
(25, 'Salsas Especiales', 'Salsa de ostras, agridulce, cacahuete', 5),

-- Menú Curry Tradicional (idMenu: 6)
(26, 'Currys Rojos', 'Picantes y aromáticos con leche de coco', 6),
(27, 'Currys Verdes', 'Ligeros y herbáceos con especias frescas', 6),
(28, 'Currys Amarillos', 'Suaves y cremosos, ideales para iniciarse', 6),
(29, 'Acompañamientos', 'Arroz Basmati, Naan, Chutney', 6),
(30, 'Platos Tandoori', 'Carnes y panes cocidos en horno Tandoor', 6),

-- Menú Mediterráneo (idMenu: 7)
(31, 'Entradas Griegas y Árabes', 'Hummus, Tzatziki, Baba Ghanoush', 7),
(32, 'Pescados y Mariscos Frescos', 'A la plancha, al horno y en papillote', 7),
(33, 'Ensaladas Mediterráneas', 'Tabule, Griega, Caprese', 7),
(34, 'Platos Principales', 'Moussaka, Kebab, Cuscús', 7),
(35, 'Postres Ligeros', 'Frutas frescas, Yogur Griego con miel', 7),

-- Menú Arepera 24/7 (idMenu: 8)
(36, 'Arepas Rellenas Clásicas', 'Reina Pepiada, Dominó, Pelúa', 8),
(37, 'Arepas Gourmet', 'Combinaciones especiales e ingredientes premium', 8),
(38, 'Arepas Veganas', 'Opciones con rellenos a base de plantas', 8),
(39, 'Empanadas y Tequeños', 'Pasapalos venezolanos tradicionales', 8),
(40, 'Jugos Naturales', 'Bebidas frescas y energéticas', 8),

-- Menú Boulangerie (idMenu: 9)
(41, 'Panes Artesanales', 'Baguettes, Campesinos, Croissants', 9),
(42, 'Bollería Fina', 'Pain au chocolat, Brioches, Danesas', 9),
(43, 'Tartas y Pasteles', 'Éclairs, Tarte Tatin, Mille-feuille', 9),
(44, 'Sándwiches Gourmet', 'Bocadillos con pan recién horneado', 9),
(45, 'Bebidas Calientes', 'Café, Chocolate, Infusiones', 9),

-- Menú Paellero (idMenu: 10)
(46, 'Paellas de Mariscos', 'La clásica valenciana con frutos del mar', 10),
(47, 'Paellas Mixtas', 'Mariscos y carnes de pollo y conejo', 10),
(48, 'Paellas de Carne y Vegetales', 'Opciones robustas sin mariscos', 10),
(49, 'Tapas y Entremeses', 'Patatas Bravas, Gambas al Ajillo, Chorizo a la Sidra', 10),
(50, 'Bebidas Españolas', 'Sangría, Cava, Vinos de la región', 10),

-- Menú Cevichero (idMenu: 11)
(51, 'Ceviches Clásicos', 'Pescado blanco, mixtos, con ají amarillo', 11),
(52, 'Tiraditos y Causas', 'Delicados cortes y purés de papa', 11),
(53, 'Leche de Tigre', 'La esencia del ceviche para beber', 11),
(54, 'Platos Calientes Peruanos', 'Lomo Saltado, Ají de Gallina', 11),
(55, 'Bebidas Peruanas', 'Chicha Morada, Inca Kola', 11),

-- Menú Churrasco (idMenu: 12)
(56, 'Cortes de Res', 'Picanha, Maminha, Fraldinha', 12),
(57, 'Cortes de Cerdo y Pollo', 'Costillas, Linguiça, Corazón de Pollo', 12),
(58, 'Acompañamientos Brasileños', 'Arroz, Feijão, Farofa, Vinagrete', 12),
(59, 'Ensaladas Frescas', 'Variedad para equilibrar las carnes', 12),
(60, 'Postres Típicos', 'Brigadeiro, Pudim de Leite Condensado', 12),

-- Menú Coreano (idMenu: 13)
(61, 'Sopas y Estofados', 'Kimchi Jjigae, Sundubu Jjigae', 13),
(62, 'Noodles Coreanos', 'Japchae, Bibim Guksu', 13),
(63, 'Arroces Coreanos', 'Bibimbap, Gimbap', 13),
(64, 'Acompañamientos (Banchan)', 'Kimchi, Danmuji, Namul', 13),
(65, 'Fritos y Snacks', 'Tteokbokki, Pajeon', 13),

-- Menú Thai (idMenu: 14)
(66, 'Currys Tailandeses', 'Massaman, Panang, Gaeng Keow Wan', 14),
(67, 'Fideos y Arroces', 'Pad Thai, Khao Pad, Pad See Ew', 14),
(68, 'Sopas Thai', 'Tom Yum Goong, Tom Kha Gai', 14),
(69, 'Platos Salteados', 'Pad Krapow, Pad Priew Wan', 14),
(70, 'Entradas y Postres', 'Spring Rolls, Mango Sticky Rice', 14),

-- Menú Vietnamita (idMenu: 15)
(71, 'Pho y Sopas', 'La icónica sopa de fideos, Bun Bo Hue', 15),
(72, 'Rollos Frescos y Fritos', 'Gỏi Cuốn (Rollos de Verano), Nem Rán (Rollos Fritos)', 15),
(73, 'Platos con Arroz', 'Cơm Tấm (Arroz Partido), Arroz Frito Vietnamita', 15),
(74, 'Platos con Fideos de Arroz', 'Bún Chả, Bún Thịt Nướng', 15),
(75, 'Bebidas y Postres', 'Café Vietnamita, Chè', 15),

-- Menú Colombiano (idMenu: 16)
(76, 'Bandejas y Platos Fuertes', 'Bandeja Paisa, Sancocho, Lechona', 16),
(77, 'Arepas y Empanadas', 'Variedad de rellenos y acompañamientos', 16),
(78, 'Sopas y Cremas', 'Ajiaco, Crema de Champiñones', 16),
(79, 'Postres Típicos', 'Obleas, Natilla, Brevas con Arequipe', 16),
(80, 'Bebidas Colombianas', 'Aguapanela, Jugos en Leche', 16),

-- Menú Sin Gluten (idMenu: 17)
(81, 'Entradas Libres de Gluten', 'Ensaladas, cremas, y aperitivos sin trigo', 17),
(82, 'Platos Principales Sin Gluten', 'Carnes, pescados y aves con guarniciones GF', 17),
(83, 'Pastas y Panes Sin Gluten', 'Opciones seguras y deliciosas', 17),
(84, 'Postres Sin Gluten', 'Variedad de dulces aptos para celíacos', 17),
(85, 'Opciones Veganas Sin Gluten', 'Platos basados en plantas y sin gluten', 17),

-- Menú Salvadoreño (idMenu: 18)
(86, 'Pupusas y Curtido', 'La especialidad salvadoreña por excelencia', 18),
(87, 'Tamales y Yuca', 'Platos tradicionales con maíz y yuca', 18),
(88, 'Sopas y Caldos', 'Sopa de Res, Sopa de Pescado', 18),
(89, 'Platos Fuertes', 'Carne Asada, Pollo Guisado', 18),
(90, 'Bebidas Tradicionales', 'Horchata de Morro, Tamarindo', 18),

-- Menú Griego (idMenu: 19)
(91, 'Mezze (Entradas)', 'Tzatziki, Hummus, Dolmades', 19),
(92, 'Platos Principales Griegos', 'Moussaka, Gyros, Souvlaki', 19),
(93, 'Ensaladas y Guarniciones', 'Ensalada Griega, Arroz Pilaf', 19),
(94, 'Mariscos y Pescados', 'Pulpo a la Parrilla, Pescado Fresco', 19),
(95, 'Postres Griegos', 'Baklava, Loukoumades', 19),

-- Menú Turco (idMenu: 20)
(96, 'Mezze Fríos', 'Haydari, Ezme, Patlıcan Salatası', 20),
(97, 'Mezze Calientes', 'Sigara Böreği, Sucuk Izgara', 20),
(98, 'Kebabs y Carnes a la Parrilla', 'Adana Kebab, Shish Kebab, Köfte', 20),
(99, 'Platos Principales', 'Testi Kebab, İskender Kebab', 20),
(100, 'Postres Turcos', 'Baklava, Künefe, Lokum', 20),

-- Menú Alemán (idMenu: 21)
(101, 'Salchichas y Wurst', 'Bratwurst, Currywurst, Weisswurst', 21),
(102, 'Platos con Carne', 'Schnitzel, Schweinshaxe (Codillo de cerdo)', 21),
(103, 'Acompañamientos', 'Sauerkraut, Knödel, Spätzle', 21),
(104, 'Sopas y Ensaladas', 'Kartoffelsalat (Ensalada de Papa), Goulashsuppe', 21),
(105, 'Postres Alemanes', 'Apfelstrudel, Schwarzwälder Kirschtorte (Tarta Selva Negra)', 21),

-- Menú Fusión (idMenu: 22)
(106, 'Entradas Fusion', 'Combinaciones inesperadas de sabores', 22),
(107, 'Platos Fuertes Fusion', 'Creaciones únicas con influencias diversas', 22),
(108, 'Wok y Salteados Fusion', 'Técnicas asiáticas con ingredientes occidentales', 22),
(109, 'Sushi Creativo', 'Rolls con ingredientes no tradicionales', 22),
(110, 'Postres Innovadores', 'Mezclas de dulces de diferentes culturas', 22),

-- Menú Orgánico (idMenu: 23)
(111, 'Ensaladas Orgánicas', 'Frescas y de temporada con aderezos naturales', 23),
(112, 'Platos Principales Orgánicos', 'Carnes, aves y vegetales de granjas sostenibles', 23),
(113, 'Opciones Veganas Orgánicas', 'Basadas en plantas con certificación orgánica', 23),
(114, 'Sopas y Cremas Orgánicas', 'Elaboradas con ingredientes de cultivo ecológico', 23),
(115, 'Bebidas y Postres Orgánicos', 'Jugos, infusiones y dulces saludables', 23),

-- Menú Casero (idMenu: 24)
(116, 'Sopas y Cremas Caseras', 'Recetas de la abuela, con sabor a hogar', 24),
(117, 'Platos Principales Caseros', 'Guisos, Asados y Estofados tradicionales', 24),
(118, 'Contornos Venezolanos', 'Arroz, Tajadas, Ensalada rallada', 24),
(119, 'Postres de la Abuela', 'Arroz con leche, Dulce de lechosa', 24),
(120, 'Bebidas Refrescantes', 'Papelón con limón, Chicha', 24),

-- Menú Tex-Mex (idMenu: 25)
(121, 'Nachos y Entradas Tex-Mex', 'Queso, jalapeños, guacamole', 25),
(122, 'Fajitas y Chimichangas', 'Con carnes, pollo o vegetales', 25),
(123, 'Burritos y Enchiladas', 'Rellenos abundantes y salsas picantes', 25),
(124, 'Chili y Soups', 'Chili con carne, Sopa de tortilla', 25),
(125, 'Bebidas Americanas', 'Refrescos, Cervezas artesanales', 25),

-- Menú Street Food (idMenu: 26)
(126, 'Tacos y Arepas Callejeras', 'Variedad de rellenos rápidos', 26),
(127, 'Burgers y Hot Dogs Gourmet', 'Versiones elevadas de clásicos urbanos', 26),
(128, 'Brochetas y Pinchos', 'Carnes, vegetales y mariscos a la brasa', 26),
(129, 'Fritos Internacionales', 'Papas fritas con aderezos, Churros', 26),
(130, 'Bebidas Refrescantes', 'Limonadas, Tes fríos, Smoothies', 26),

-- Menú Saludable (idMenu: 27)
(131, 'Ensaladas de Autor', 'Frescas y nutritivas con ingredientes de calidad', 27),
(132, 'Proteínas Magras', 'Pollo a la plancha, Pescado al vapor, Tofu', 27),
(133, 'Bowl de Cereales y Vegetales', 'Quinoa, Arroz integral, Legumbres', 27),
(134, 'Snacks Saludables', 'Frutas, frutos secos, barras energéticas', 27),
(135, 'Jugos Verdes y Detox', 'Combinaciones de frutas y vegetales', 27),

-- Menú Comfort Food (idMenu: 28)
(136, 'Sopas y Guisos Reconfortantes', 'Sopa de lentejas, Estofado de res', 28),
(137, 'Platos Clásicos Americanos', 'Mac and Cheese, Albóndigas, Pastel de carne', 28),
(138, 'Acompañamientos Abundantes', 'Puré de papa, Patatas asadas', 28),
(139, 'Postres Caseros', 'Brownies, Crumble de manzana, Cookies', 28),
(140, 'Bebidas Clásicas', 'Malteadas, Chocolates Calientes', 28),

-- Menú Mar y Tierra (idMenu: 29)
(141, 'Cortes Premium de Carne', 'Filet Mignon, Ribeye, Lomo de Cerdo', 29),
(142, 'Mariscos Frescos', 'Langosta, Camarones, Pulpo a la parrilla', 29),
(143, 'Combinados de Mar y Tierra', 'Surf & Turf, Paella Mixta', 29),
(144, 'Guarniciones Gourmet', 'Espárragos, Patatas gratinadas, Hongos salteados', 29),
(145, 'Postres Delicados', 'Mousse de chocolate, Crème brûlée', 29),

-- Menú Pizza Napolitana (idMenu: 30)
(146, 'Pizzas Clásicas', 'Margherita, Marinara, Prosciutto e Funghi', 30),
(147, 'Pizzas Especiales', 'Combinaciones únicas con ingredientes frescos', 30),
(148, 'Focaccias y Calzones', 'Panes y masas rellenas', 30),
(149, 'Ensaladas Italianas', 'Para acompañar tu pizza', 30),
(150, 'Bebidas y Cervezas', 'Gaseosas, cervezas artesanales', 30),

-- Menú Oriental (idMenu: 31)
(151, 'Dim Sum y Dumplings', 'Variedad de rellenos al vapor o fritos', 31),
(152, 'Platos con Arroz', 'Arroz frito, arroz al vapor, arroces especiales', 31),
(153, 'Fideos Orientales', 'Chow Mein, Pad Thai, Udon', 31),
(154, 'Sopas Orientales', 'Sopa wonton, Sopa agripicante, Ramen', 31),
(155, 'Entradas y Postres', 'Rollitos, helados de té verde', 31),

-- Menú Argentino (idMenu: 32)
(156, 'Cortes de Res Argentinos', 'Bife de Chorizo, Ojo de Bife, Asado de Tira', 32),
(157, 'Empanadas Argentinas', 'Carne, Pollo, Jamón y Queso', 32),
(158, 'Achuras y Provolone', 'Mollejas, Chinchulines, Queso Provolone a la parrilla', 32),
(159, 'Guarniciones Típicas', 'Papas fritas, Ensalada mixta, Puré de calabaza', 32),
(160, 'Postres y Bebidas', 'Flan mixto, Alfajores, Vinos argentinos', 32),

-- Menú Francés (idMenu: 33)
(161, 'Entradas Francesas', 'Sopa de cebolla, Paté, Tartare de bœuf', 33),
(162, 'Platos Principales Clásicos', 'Coq au Vin, Boeuf Bourguignon, Confit de Canard', 33),
(163, 'Pescados y Mariscos', 'Meunière, Bouillabaisse', 33),
(164, 'Guarniciones y Verduras', 'Gratin Dauphinois, Haricots Verts', 33),
(165, 'Postres y Quesos', 'Crème brûlée, Tarta de manzana, Selección de quesos', 33),

-- Menú Español (idMenu: 34)
(166, 'Tapas Frías', 'Jamón Serrano, Queso Manchego, Tortilla Española', 34),
(167, 'Tapas Calientes', 'Gambas al ajillo, Croquetas, Patatas Bravas', 34),
(168, 'Paellas y Arroces', 'Paella de marisco, Arroz negro, Fideuá', 34),
(169, 'Platos Principales', 'Cochinillo Asado, Rabo de Toro', 34),
(170, 'Postres Españoles', 'Churros con chocolate, Crema catalana', 34),

-- Menú Coreano BBQ (idMenu: 35)
(171, 'Cortes de Carne para BBQ', 'Bulgogi, Galbi, Samgyeopsal', 35),
(172, 'Marinados Especiales', 'Recetas tradicionales y picantes', 35),
(173, 'Guarniciones de BBQ (Banchan)', 'Kimchi fresco, Ensaladas de repollo', 35),
(174, 'Sopas y Arroces Complementarios', 'Doenjang Jjigae, Gyeran Jjim', 35),
(175, 'Bebidas Coreanas', 'Soju, Makgeolli, Cervezas locales', 35);


-- 120 Platos

INSERT INTO Plato (id, nombre, orden, cantidadDisponible, precio, descripcion, idSeccion) VALUES
-- Platos para Menú Parrillero (idMenu: 1, idSeccion: 1-5)
(1, 'Asado Negro Criollo', 1, 20, 18.50, 'Carne de res cocida lentamente en su jugo oscuro.', 1),
(2, 'Punta Trasera a la Brasa', 2, 25, 22.00, 'Corte jugoso y tierno, ideal para amantes de la carne.', 1),
(3, 'Chorizo Parrillero', 3, 30, 8.00, 'Chorizo casero asado a la perfección.', 3),
(4, 'Ensalada Rallada', 1, 50, 5.00, 'Repollo y zanahoria rallados con aderezo suave.', 2),

-- Platos para Menú Sushi Experience (idMenu: 2, idSeccion: 6-10)
(5, 'Roll California', 1, 40, 12.00, 'Clásico rollo con cangrejo, aguacate y pepino.', 7),
(6, 'Nigiri Salmón', 2, 35, 3.50, 'Fina lámina de salmón fresco sobre arroz avinagrado.', 6),
(7, 'Sopa Miso', 1, 60, 4.00, 'Caldo ligero con tofu, alga nori y cebollín.', 10),
(8, 'Ebi Tempura', 1, 28, 15.00, 'Camarones en tempura crujiente.', 9),

-- Platos para Menú Pasta Artesanal (idMenu: 3, idSeccion: 11-15)
(9, 'Fettuccine Alfredo', 1, 30, 14.50, 'Pasta fresca con cremosa salsa Alfredo.', 11),
(10, 'Lasagna Clásica', 2, 20, 16.00, 'Capas de pasta, carne y bechamel horneadas.', 12),
(11, 'Ensalada Caprese', 1, 35, 9.00, 'Tomate, mozzarella fresca y albahaca.', 14),
(12, 'Tiramisú', 1, 25, 7.50, 'Postre italiano con café, mascarpone y bizcochos.', 15),

-- Platos para Menú Mexicano (idMenu: 4, idSeccion: 16-20)
(13, 'Tacos al Pastor', 1, 45, 10.00, 'Cerdo marinado y asado con piña.', 16),
(14, 'Burrito de Carnitas', 2, 30, 11.50, 'Tortilla de trigo rellena de cerdo confitado.', 16),
(15, 'Guacamole con Totopos', 1, 50, 8.00, 'Aguacate fresco machacado con pico de gallo.', 19),
(16, 'Enchiladas Rojas', 1, 25, 13.00, 'Tortillas rellenas bañadas en salsa roja.', 17),

-- Platos para Menú Wok Fusion (idMenu: 5, idSeccion: 21-25)
(17, 'Wok de Pollo Teriyaki', 1, 35, 14.00, 'Pollo salteado con vegetales y salsa teriyaki.', 21),
(18, 'Arroz Frito Especial', 2, 40, 10.50, 'Arroz con camarones, pollo y vegetales.', 23),
(19, 'Rollitos Primavera', 1, 50, 7.00, 'Vegetales frescos envueltos y fritos.', 24),
(20, 'Fideos de Arroz con Camarones', 1, 30, 16.00, 'Fideos finos con camarones y salsa suave.', 22),

-- Platos para Menú Curry Tradicional (idMenu: 6, idSeccion: 26-30)
(21, 'Curry Rojo de Res', 1, 25, 17.00, 'Carne de res en curry rojo tailandés.', 26),
(22, 'Curry Verde de Pollo', 2, 30, 15.50, 'Pollo en cremoso curry verde.', 27),
(23, 'Arroz Basmati', 1, 50, 4.00, 'Arroz aromático para acompañar.', 29),
(24, 'Pan Naan', 1, 40, 3.00, 'Pan plano tradicional indio.', 29),

-- Platos para Menú Mediterráneo (idMenu: 7, idSeccion: 31-35)
(25, 'Hummus con Pan Pita', 1, 40, 8.50, 'Crema de garbanzos con pan árabe.', 31),
(26, 'Moussaka', 1, 20, 16.00, 'Pastel de berenjenas, carne y bechamel.', 34),
(27, 'Ensalada Griega', 1, 35, 9.50, 'Tomate, pepino, cebolla, aceitunas y queso feta.', 33),
(28, 'Souvlaki de Pollo', 1, 28, 14.00, 'Brochetas de pollo a la parrilla.', 32),

-- Platos para Menú Arepera 24/7 (idMenu: 8, idSeccion: 36-40)
(29, 'Arepa Reina Pepiada', 1, 60, 9.00, 'Rellena de pollo desmechado con aguacate.', 36),
(30, 'Arepa Pelúa', 2, 55, 9.50, 'Rellena de carne mechada con queso amarillo.', 36),
(31, 'Empanada de Carne', 1, 70, 4.00, 'Crujiente empanada frita rellena de carne.', 39),
(32, 'Jugo de Parchita', 1, 50, 3.50, 'Jugo natural de maracuyá.', 40),

-- Platos para Menú Boulangerie (idMenu: 9, idSeccion: 41-45)
(33, 'Croissant de Almendras', 1, 40, 4.50, 'Crujiente croissant con crema de almendras.', 42),
(34, 'Baguette Clásica', 1, 30, 3.00, 'Pan francés recién horneado.', 41),
(35, 'Éclair de Chocolate', 1, 25, 5.00, 'Dulce francés relleno de crema y cubierto de chocolate.', 43),
(36, 'Café Latte', 1, 60, 4.00, 'Café con leche espumosa.', 45),

-- Platos para Menú Paellero (idMenu: 10, idSeccion: 46-50)
(37, 'Paella de Mariscos', 1, 20, 25.00, 'Arroz con azafrán y una variedad de mariscos.', 46),
(38, 'Tapas de Gambas al Ajillo', 1, 30, 12.00, 'Gambas salteadas en aceite de oliva y ajo.', 49),
(39, 'Paella Mixta', 2, 18, 24.00, 'Arroz con pollo, cerdo y mariscos.', 47),
(40, 'Sangría Tradicional', 1, 25, 8.00, 'Vino tinto con frutas y especias.', 50),

-- Platos para Menú Cevichero (idMenu: 11, idSeccion: 51-55)
(41, 'Ceviche Clásico de Pescado', 1, 30, 18.00, 'Pescado blanco marinado en leche de tigre.', 51),
(42, 'Tiradito de Pulpo', 1, 25, 19.50, 'Finas láminas de pulpo con salsa de aceitunas.', 52),
(43, 'Causa Limeña', 1, 28, 14.00, 'Puré de papa amarilla relleno de atún o pollo.', 52),
(44, 'Chicha Morada', 1, 40, 4.00, 'Bebida de maíz morado.', 55),

-- Platos para Menú Churrasco (idMenu: 12, idSeccion: 56-60)
(45, 'Picanha a la Espada', 1, 20, 28.00, 'Corte estrella de la churrasquería brasileña.', 56),
(46, 'Fraldinha', 2, 22, 26.00, 'Corte de falda jugoso y lleno de sabor.', 56),
(47, 'Arroz Blanco', 1, 50, 4.00, 'Arroz suelto y perfecto para acompañar.', 58),
(48, 'Brigadeiro', 1, 35, 3.00, 'Dulce de chocolate brasileño.', 60),

-- Platos para Menú Coreano (idMenu: 13, idSeccion: 61-65)
(49, 'Bibimbap', 1, 30, 16.00, 'Arroz mezclado con vegetales, carne y huevo.', 63),
(50, 'Kimchi Jjigae', 1, 25, 14.00, 'Estofado picante de kimchi con tofu y carne.', 61),
(51, 'Japchae', 1, 28, 13.50, 'Fideos de batata salteados con vegetales y carne.', 62),
(52, 'Kimchi', 1, 50, 5.00, 'Col fermentada picante, acompañamiento esencial.', 64),

-- Platos para Menú Thai (idMenu: 14, idSeccion: 66-70)
(53, 'Pad Thai con Pollo', 1, 35, 14.00, 'Fideos de arroz salteados con pollo, huevo y cacahuetes.', 67),
(54, 'Tom Yum Goong', 1, 28, 12.00, 'Sopa picante de camarones con hierbas aromáticas.', 68),
(55, 'Curry Massaman con Res', 1, 20, 17.50, 'Curry suave y aromático con cacahuetes y papa.', 66),
(56, 'Mango Sticky Rice', 1, 25, 7.00, 'Arroz pegajoso con mango fresco y leche de coco.', 70),

-- Platos para Menú Vietnamita (idMenu: 15, idSeccion: 71-75)
(57, 'Pho Bo (Sopa de Res)', 1, 30, 15.00, 'Sopa de fideos de arroz con carne de res y hierbas.', 71),
(58, 'Gỏi Cuốn (Rollos de Verano)', 1, 40, 9.00, 'Rollos frescos con camarones, cerdo y vegetales.', 72),
(59, 'Bún Chả', 1, 25, 16.00, 'Fideos de arroz con carne de cerdo a la parrilla.', 74),
(60, 'Café Vietnamita con Leche Condensada', 1, 35, 5.00, 'Café fuerte con leche condensada dulce.', 75),

-- Platos para Menú Colombiano (idMenu: 16, idSeccion: 76-80)
(61, 'Bandeja Paisa', 1, 20, 20.00, 'Plato insignia con carne, frijoles, arroz, huevo, etc.', 76),
(62, 'Ajiaco Santafereño', 1, 25, 15.00, 'Sopa de pollo y papas con mazorca y aguacate.', 78),
(63, 'Empanadas Colombianas', 1, 40, 3.50, 'Empanadas de maíz rellenas de papa y carne.', 77),
(64, 'Postre de Natilla', 1, 30, 5.00, 'Postre cremoso tradicional.', 79),

-- Platos para Menú Sin Gluten (idMenu: 17, idSeccion: 81-85)
(65, 'Salmón al Horno con Vegetales Asados', 1, 25, 21.00, 'Plato principal saludable y sin gluten.', 82),
(66, 'Pasta de Lentejas con Pesto de Albahaca', 1, 30, 15.00, 'Pasta sin gluten con salsa pesto casera.', 83),
(67, 'Brownie de Chocolate Sin Gluten', 1, 35, 6.00, 'Delicioso brownie apto para celíacos.', 84),
(68, 'Ensalada Quinoa y Aguacate', 1, 40, 12.00, 'Ensalada nutritiva con proteína completa.', 81),

-- Platos para Menú Salvadoreño (idMenu: 18, idSeccion: 86-90)
(69, 'Pupusa de Queso con Loroco', 1, 45, 4.00, 'Pupusa rellena de queso y flor de loroco.', 86),
(70, 'Pupusa Revuelta', 2, 40, 4.50, 'Pupusa con chicharrón, frijol y queso.', 86),
(71, 'Yuca con Chicharrón', 1, 30, 10.00, 'Yuca cocida o frita con trozos de cerdo crujientes.', 87),
(72, 'Sopa de Res Salvadoreña', 1, 20, 14.00, 'Caldo sustancioso con vegetales y carne.', 88),

-- Platos para Menú Griego (idMenu: 19, idSeccion: 91-95)
(73, 'Gyros de Cerdo', 1, 30, 13.00, 'Carne de cerdo en pan pita con tzatziki.', 92),
(74, 'Moussaka', 1, 25, 16.50, 'Capas de berenjena, carne picada y bechamel.', 92),
(75, 'Tzatziki con Pan Pita', 1, 40, 7.50, 'Salsa de yogur, pepino y ajo.', 91),
(76, 'Baklava', 1, 35, 6.00, 'Postre de hojaldre con nueces y almíbar.', 95),

-- Platos para Menú Turco (idMenu: 20, idSeccion: 96-100)
(77, 'Adana Kebab', 1, 28, 15.00, 'Brocheta de carne picada sazonada y asada.', 98),
(78, 'Lahmacun', 1, 35, 9.00, 'Pizza turca con carne picada y vegetales.', 99),
(79, 'Hummus', 1, 40, 7.00, 'Crema de garbanzos tradicional.', 96),
(80, 'Künefe', 1, 20, 8.00, 'Postre de queso caliente con cabello de ángel.', 100),

-- Platos para Menú Alemán (idMenu: 21, idSeccion: 101-105)
(81, 'Bratwurst con Sauerkraut', 1, 30, 14.00, 'Salchicha alemana con col fermentada.', 101),
(82, 'Wiener Schnitzel', 1, 25, 18.00, 'Escalope de ternera empanado y frito.', 102),
(83, 'Kartoffelsalat', 1, 40, 6.00, 'Ensalada de papa al estilo alemán.', 104),
(84, 'Apfelstrudel', 1, 30, 6.50, 'Strudel de manzana con helado o crema.', 105),

-- Platos para Menú Fusión (idMenu: 22, idSeccion: 106-110)
(85, 'Tacos de Kimchi y Cerdo', 1, 35, 12.00, 'Fusión coreano-mexicana.', 106),
(86, 'Sushi Burger', 1, 28, 16.00, 'Hamburguesa con pan de arroz y relleno de sushi.', 109),
(87, 'Pasta al Curry y Leche de Coco', 1, 25, 15.00, 'Combinación de sabores italianos y asiáticos.', 107),
(88, 'Cheesecake de Matcha', 1, 20, 8.00, 'Postre clásico con toque japonés.', 110),

-- Platos para Menú Orgánico (idMenu: 23, idSeccion: 111-115)
(89, 'Ensalada de Lentejas y Vegetales Orgánicos', 1, 40, 11.00, 'Opción saludable y nutritiva.', 111),
(90, 'Pollo Orgánico al Limón con Quinoa', 1, 30, 19.00, 'Plato principal con ingredientes de calidad.', 112),
(91, 'Sopa de Calabaza Asada Orgánica', 1, 35, 9.00, 'Crema cremosa y natural.', 114),
(92, 'Smoothie Verde Detox', 1, 50, 7.00, 'Mezcla de frutas y vegetales frescos.', 115),

-- Platos para Menú Casero (idMenu: 24, idSeccion: 116-120)
(93, 'Pabellón Criollo Completo', 1, 25, 17.00, 'Plato nacional venezolano con todos sus componentes.', 117),
(94, 'Sopa de Costilla Casera', 1, 30, 12.00, 'Caldo sustancioso con costilla de res.', 116),
(95, 'Arroz con Leche', 1, 40, 5.00, 'Postre cremoso de arroz y leche.', 119),
(96, 'Asado Negro', 1, 20, 18.00, 'Versión casera del clásico venezolano.', 117),

-- Platos para Menú Tex-Mex (idMenu: 25, idSeccion: 121-125)
(97, 'Fajitas de Pollo', 1, 30, 15.00, 'Tiras de pollo a la parrilla con pimientos y cebolla.', 122),
(98, 'Nachos Supremos', 1, 40, 11.00, 'Tortillas de maíz con queso, frijoles y más.', 121),
(99, 'Burrito de Carne Asada', 1, 35, 13.00, 'Relleno de carne asada, arroz, frijoles y salsa.', 123),
(100, 'Chili con Carne', 1, 25, 10.00, 'Estofado de carne picada con frijoles y especias.', 124),

-- Platos para Menú Street Food (idMenu: 26, idSeccion: 126-130)
(101, 'Taco de Carnitas', 1, 45, 4.00, 'Mini taco con cerdo confitado y cilantro.', 126),
(102, 'Hamburguesa Clásica con Papas', 1, 35, 12.00, 'Carne, queso, lechuga, tomate y papas fritas.', 127),
(103, 'Churros con Chocolate', 1, 50, 6.00, 'Masa frita con azúcar y salsa de chocolate.', 129),
(104, 'Arepa con Queso Telita', 1, 40, 7.50, 'Arepa rellena de queso fresco y suave.', 126),

-- Platos para Menú Saludable (idMenu: 27, idSeccion: 131-135)
(105, 'Bowl de Salmón y Aguacate', 1, 30, 16.00, 'Salmón a la plancha, aguacate, quinoa y vegetales.', 133),
(106, 'Ensalada de Pollo a la Parrilla', 1, 35, 13.00, 'Pechuga de pollo, mix de lechugas, aderezo ligero.', 131),
(107, 'Lentejas Estofadas con Verduras', 1, 28, 10.00, 'Plato vegano y nutritivo.', 132),
(108, 'Barra Energética Casera', 1, 40, 4.00, 'Avena, frutos secos y miel.', 134),

-- Platos para Menú Comfort Food (idMenu: 28, idSeccion: 136-140)
(109, 'Mac and Cheese Clásico', 1, 30, 12.00, 'Macarrones con cremosa salsa de queso.', 137),
(110, 'Albóndigas en Salsa de Tomate', 1, 25, 14.00, 'Albóndigas de carne en salsa casera.', 137),
(111, 'Puré de Papa Cremoso', 1, 40, 6.00, 'Acompañamiento clásico.', 138),
(112, 'Brownie con Helado', 1, 35, 7.00, 'Cálido brownie con bola de helado de vainilla.', 139),

-- Platos para Menú Mar y Tierra (idMenu: 29, idSeccion: 141-145)
(113, 'Surf & Turf', 1, 20, 35.00, 'Filet mignon con cola de langosta.', 143),
(114, 'Ribeye a la Parrilla', 1, 25, 29.00, 'Corte premium de carne.', 141),
(115, 'Camarones al Ajillo', 1, 30, 18.00, 'Camarones salteados en aceite de oliva y ajo.', 142),
(116, 'Espárragos Asados', 1, 40, 7.00, 'Guarnición fresca y saludable.', 144),

-- Platos para Menú Pizza Napolitana (idMenu: 30, idSeccion: 146-150)
(117, 'Pizza Margherita', 1, 40, 14.00, 'Clásica pizza con tomate, mozzarella y albahaca.', 146),
(118, 'Pizza Diavola', 2, 35, 16.00, 'Pizza picante con salami y chile.', 147),
(119, 'Calzone Relleno', 1, 25, 15.00, 'Masa de pizza doblada con ricotta, jamón y mozzarella.', 148),
(120, 'Ensalada Rúcula y Parmesano', 1, 30, 9.00, 'Ensalada fresca para acompañar.', 149);

INSERT INTO Opcion (id, nombre, descripcion) VALUES
(1, 'Tamaño', 'Permite seleccionar entre diferentes tamaños del plato.'),
(2, 'Nivel de picante', 'Selecciona el nivel de picante deseado para el plato.'),
(3, 'Tipo de pan', 'Elige el tipo de pan para hamburguesas o sándwiches.'),
(4, 'Tipo de pasta', 'Selecciona el tipo de pasta en platos italianos.'),
(5, 'Salsas adicionales', 'Agrega salsas adicionales al plato.'),
(6, 'Toppings', 'Agrega toppings como queso, tocineta o cebolla crujiente.'),
(7, 'Extras', 'Permite añadir ingredientes extra al plato.'),
(8, 'Exclusiones', 'Permite quitar ingredientes del plato.'),
(9, 'Contornos', 'Selecciona acompañantes como arroz, ensalada o papas.'),
(10, 'Método de cocción', 'Selecciona cómo debe cocinarse el plato o carne.'),
(11, 'Tipo de queso', 'Permite seleccionar entre varios tipos de queso.'),
(12, 'Tipo de carne', 'Permite elegir entre carne de res, pollo o vegetariana.'),
(13, 'Tamaño de bebida', 'Permite seleccionar el tamaño de la bebida.'),
(14, 'Tipo de leche', 'Permite elegir leche entera, descremada o vegetal.'),
(15, 'Tipo de azúcar', 'Selecciona entre azúcar blanca, morena o edulcorante.'),
(16, 'Decoración', 'Permite seleccionar decoraciones comestibles en postres.'),
(17, 'Tipo de arroz', 'Permite elegir entre arroz blanco, integral o jazmín.'),
(18, 'Grado de cocción', 'Selecciona el término de cocción de carnes.'),
(19, 'Tipo de tortilla', 'Selecciona el tipo de tortilla para tacos o burritos.'),
(20, 'Cantidad de cubiertos', 'Indica cuántos juegos de cubiertos se requieren.'),
(21, 'Incluir servilletas', 'Permite decidir si se incluyen servilletas.'),
(22, 'Opción sin gluten', 'Permite solicitar platos sin gluten.'),
(23, 'Opción vegana', 'Indica si se desea una versión vegana del plato.'),
(24, 'Nivel de azúcar', 'Selecciona el nivel de dulzor en bebidas o postres.'),
(25, 'Tipo de condimentos', 'Permite seleccionar condimentos como mostaza o ketchup.'),
(26, 'Fruta adicional', 'Agrega frutas adicionales a un bowl o postre.'),
(27, 'Sabor de helado', 'Selecciona entre varios sabores de helado.'),
(28, 'Tipo de topping dulce', 'Selecciona toppings dulces como chips o sirope.'),
(29, 'Borde relleno', 'Permite agregar borde de queso u otros al pizza.'),
(30, 'Tamaño de porción', 'Permite elegir porciones normales, grandes o familiares.'),
(31, 'Temperatura del plato', 'Solicita el plato frío, templado o caliente.'),
(32, 'Nivel de sal', 'Permite ajustar la cantidad de sal.'),
(33, 'Tipo de bebida', 'Permite elegir entre soda, jugo o agua.'),
(34, 'Sabor de bebida', 'Selecciona el sabor de jugos o batidos.'),
(35, 'Tipo de base', 'Elige la base para ensaladas o bowls.'),
(36, 'Cobertura', 'Permite elegir coberturas para postres o helados.'),
(37, 'Estilo de preparación', 'Frito, al horno, a la plancha, etc.'),
(38, 'Sabor de torta', 'Selecciona el sabor de la torta o pastel.'),
(39, 'Nivel de tostado', 'Permite elegir el nivel de tostado para panes o ingredientes.'),
(40, 'Tipo de cobertura de pizza', 'Selecciona entre coberturas como pepperoni, vegetales o jamón.');

INSERT INTO OpcionValor (id, idOpcion, nombre, precio_extra) VALUES
(1, 1, 'Pequeño', 0.00),
(2, 1, 'Mediano', 1.00),
(3, 1, 'Grande', 2.00),

(4, 2, 'Sin picante', 0.00),
(5, 2, 'Medio', 0.00),
(6, 2, 'Picante', 0.00),
(7, 2, 'Muy picante', 0.00),

(8, 3, 'Pan blanco', 0.00),
(9, 3, 'Pan integral', 0.50),
(10, 3, 'Pan sin gluten', 1.00),

(11, 4, 'Espagueti', 0.00),
(12, 4, 'Fettuccine', 0.50),
(13, 4, 'Penne', 0.50),

(14, 5, 'Barbacoa', 0.50),
(15, 5, 'Mostaza miel', 0.50),
(16, 5, 'Picante', 0.50),

(17, 6, 'Queso cheddar', 0.50),
(18, 6, 'Tocineta', 1.00),
(19, 6, 'Cebolla crujiente', 0.50),

(20, 7, 'Aguacate', 1.00),
(21, 7, 'Huevo', 0.75),

(22, 8, 'Sin cebolla', 0.00),
(23, 8, 'Sin tomate', 0.00),

(24, 9, 'Arroz', 0.00),
(25, 9, 'Papas fritas', 0.00),
(26, 9, 'Ensalada', 0.00),

(27, 10, 'Frito', 0.00),
(28, 10, 'A la plancha', 0.00),
(29, 10, 'Horno', 0.00),

(30, 11, 'Mozzarella', 0.00),
(31, 11, 'Cheddar', 0.50),
(32, 11, 'Azul', 1.00),

(33, 12, 'Carne de res', 1.00),
(34, 12, 'Pollo', 0.75),
(35, 12, 'Vegetariana', 0.00),

(36, 13, 'Pequeña', 0.00),
(37, 13, 'Mediana', 0.50),
(38, 13, 'Grande', 1.00),

(39, 14, 'Entera', 0.00),
(40, 14, 'Descremada', 0.00),
(41, 14, 'Vegetal', 0.50),

(42, 15, 'Blanca', 0.00),
(43, 15, 'Morena', 0.00),
(44, 15, 'Edulcorante', 0.00),

(45, 16, 'Confites', 0.50),
(46, 16, 'Frutas', 0.75),

(47, 17, 'Blanco', 0.00),
(48, 17, 'Integral', 0.00),
(49, 17, 'Jazmín', 0.50),

(50, 18, 'Poco hecho', 0.00),
(51, 18, 'Término medio', 0.00),
(52, 18, 'Bien cocido', 0.00),

(53, 19, 'Maíz', 0.00),
(54, 19, 'Harina de trigo', 0.00),
(55, 19, 'Integral', 0.25),

(56, 20, '1 juego', 0.00),
(57, 20, '2 juegos', 0.00),

(58, 21, 'Sí', 0.00),
(59, 21, 'No', 0.00),

(60, 22, 'Solicitar sin gluten', 0.00),

(61, 23, 'Versión vegana', 0.00),

(62, 24, 'Poco dulce', 0.00),
(63, 24, 'Normal', 0.00),
(64, 24, 'Muy dulce', 0.00),

(65, 25, 'Mostaza', 0.00),
(66, 25, 'Mayonesa', 0.00),
(67, 25, 'Ketchup', 0.00),

(68, 26, 'Fresas', 0.75),
(69, 26, 'Mango', 0.75),

(70, 27, 'Chocolate', 0.00),
(71, 27, 'Vainilla', 0.00),
(72, 27, 'Fresa', 0.00),

(73, 28, 'Chispas de chocolate', 0.50),
(74, 28, 'Sirope de caramelo', 0.50),

(75, 29, 'Queso mozzarella', 1.00),
(76, 29, 'Queso crema', 1.25),

(77, 30, 'Normal', 0.00),
(78, 30, 'Grande', 1.00),
(79, 30, 'Familiar', 2.00),

(80, 31, 'Frío', 0.00),
(81, 31, 'Templado', 0.00),
(82, 31, 'Caliente', 0.00),

(83, 32, 'Normal', 0.00),
(84, 32, 'Poca sal', 0.00),
(85, 32, 'Sin sal', 0.00),

(86, 33, 'Soda', 0.00),
(87, 33, 'Jugo', 0.50),
(88, 33, 'Agua', 0.00),

(89, 34, 'Naranja', 0.00),
(90, 34, 'Fresa', 0.00),
(91, 34, 'Mango', 0.00),

(92, 35, 'Lechuga', 0.00),
(93, 35, 'Quinoa', 0.75),
(94, 35, 'Arroz', 0.50),

(95, 36, 'Sirope de chocolate', 0.50),
(96, 36, 'Nueces', 0.75),

(97, 37, 'Frito', 0.00),
(98, 37, 'A la plancha', 0.00),
(99, 37, 'Horneado', 0.00),

(100, 38, 'Chocolate', 0.00),
(101, 38, 'Vainilla', 0.00),
(102, 38, 'Zanahoria', 0.00),

(103, 39, 'Tostado ligero', 0.00),
(104, 39, 'Tostado medio', 0.00),
(105, 39, 'Tostado fuerte', 0.00),

(106, 40, 'Pepperoni', 1.00),
(107, 40, 'Vegetales', 0.75),
(108, 40, 'Jamón', 1.00);

