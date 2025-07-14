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

