-- trigger para insertar en ClienteConClienteReferido automaticamente
CREATE TRIGGER trg_Cliente_AfterInsert
ON Cliente
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    -- Asumiendo que el cliente referido es el último cliente insertado antes del actual
    DECLARE @NuevoClienteID INT;
    DECLARE @ClienteReferidoID INT;
    -- Obtener el ID del cliente recién insertado
    SELECT @NuevoClienteID = id FROM inserted;
    -- Buscar el último cliente insertado antes del actual para usarlo como referido
    -- (esto es un ejemplo, ajusta según tu lógica de negocio)
    SELECT TOP 1 @ClienteReferidoID = id 
    FROM Cliente 
    WHERE id < @NuevoClienteID 
    ORDER BY id DESC;
    -- Solo insertar si encontramos un cliente referido válido (no para el primer cliente)
    IF @ClienteReferidoID IS NOT NULL AND @NuevoClienteID > 1
    BEGIN
        INSERT INTO ClienteConClienteReferido (idCliente, idClienteReferido, fecha_referido)
        VALUES (@NuevoClienteID, @ClienteReferidoID, GETDATE());
    END
END;

-- crear un nuevo cliente
INSERT INTO Cliente (id, password, telefono, fecha_registro, correo, nombre, apellido, fecha_nac, nro_documento) VALUES
(101, 'prueba', 'prueba', '2025-07-13', 'manuel.herrera1@gmail.com', 'Manuel', 'Herrera', '1985-10-31', 'V17147694');














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

-- trigger para insertar en ClienteConClienteReferido automaticamente
CREATE TRIGGER trg_Cliente_AfterInsert
ON Cliente
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    -- Asumiendo que el cliente referido es el último cliente insertado antes del actual
    DECLARE @NuevoClienteID INT;
    DECLARE @ClienteReferidoID INT;
    -- Obtener el ID del cliente recién insertado
    SELECT @NuevoClienteID = id FROM inserted;
    -- Buscar el último cliente insertado antes del actual para usarlo como referido
    -- (esto es un ejemplo, ajusta según tu lógica de negocio)
    SELECT TOP 1 @ClienteReferidoID = id 
    FROM Cliente 
    WHERE id < @NuevoClienteID 
    ORDER BY id DESC;
    -- Solo insertar si encontramos un cliente referido válido (no para el primer cliente)
    IF @ClienteReferidoID IS NOT NULL AND @NuevoClienteID > 1
    BEGIN
        INSERT INTO ClienteConClienteReferido (idCliente, idClienteReferido, fecha_referido)
        VALUES (@NuevoClienteID, @ClienteReferidoID, GETDATE());
    END
END;

INSERT INTO Cliente (id, password, telefono, fecha_registro, correo, nombre, apellido, fecha_nac, nro_documento) VALUES
(101, 'prueba', 'prueba', '2025-07-13', 'manuel.herrera1@gmail.com', 'Manuel', 'Herrera', '1985-10-31', 'V17147694');
INSERT INTO Cliente (id, password, telefono, fecha_registro, correo, nombre, apellido, fecha_nac, nro_documento) VALUES
(1, 'clave001', '04128433977', '2025-07-13', 'manuel.herrera1@gmail.com', 'Manuel', 'Herrera', '1985-10-31', 'V17147694'),
(2, 'clave002', '04144064468', '2025-08-13', 'manuel.torres2@gmail.com', 'Manuel', 'Torres', '1989-05-30', 'V21060916'),
(3, 'clave003', '04243993464', '2025-09-13', 'miguel.mendoza3@gmail.com', 'Miguel', 'Mendoza', '1988-11-20', 'V13820454'),
(4, 'clave004', '04123001786', '2025-08-18', 'laura.mendoza4@gmail.com', 'Laura', 'Mendoza', '2001-07-05', 'V23802098'),
(5, 'clave005', '04246686214', '2025-07-13', 'ana.fernandez5@gmail.com', 'Ana', 'Fernandez', '1963-04-30', 'V11099308'),
(6, 'clave006', '04120001111', '2025-10-13', 'juan.garcia6@gmail.com', 'Juan', 'Garcia', '1975-12-12', 'V19325561'),
(7, 'clave007', '04220002222', '2025-05-16', 'maria.lopez7@gmail.com', 'Maria', 'Lopez', '1990-06-15', 'V26997002'),
(8, 'clave008', '04130003333', '2025-04-13', 'carlos.ramirez8@gmail.com', 'Carlos', 'Ramirez', '1982-03-10', 'V27234433'),
(9, 'clave009', '04240004444', '2025-03-13', 'sandra.gomez9@gmail.com', 'Sandra', 'Gomez', '1978-09-23', 'V18768944'),
(10, 'clave010', '04140005555', '2024-07-13', 'pedro.sanchez10@gmail.com', 'Pedro', 'Sanchez', '1987-11-01', 'V19555055'),
(11, 'clave011', '04160006666', '2025-01-13', 'laura.perez11@gmail.com', 'Laura', 'Perez', '1995-04-04', 'V20000066'),
(12, 'clave012', '04240007777', '2023-06-15', 'jose.martinez12@gmail.com', 'Jose', 'Martinez', '1980-01-19', 'V21000077'),
(13, 'clave013', '04160008888', '2025-07-13', 'marta.silva13@gmail.com', 'Marta', 'Silva', '1965-07-07', 'V22088444'),
(14, 'clave014', '04260009999', '2021-08-13', 'luis.rodriguez14@gmail.com', 'Luis', 'Rodriguez', '1973-08-16', 'V23788099'),
(15, 'clave015', '04160001010', '2022-07-13', 'ana.moreno15@gmail.com', 'Ana', 'Moreno', '1992-12-30', 'V24510127'),
(16, 'clave016', '04240891511', '2022-09-13', 'francisco.diaz16@gmail.com', 'Francisco', 'Diaz', '1989-10-02', 'V25999111'),
(17, 'clave017', '04120002222', '2023-07-13', 'paula.torres17@gmail.com', 'Paula', 'Torres', '1997-03-21', 'V26999122'),
(18, 'clave018', '04240003333', '2024-04-13', 'javier.soto18@gmail.com', 'Javier', 'Soto', '1979-05-25', 'V27000133'),
(19, 'clave019', '04160004444', '2025-07-13', 'sofia.martin19@gmail.com', 'Sofia', 'Martin', '1984-11-11', 'V28000144'),
(20, 'clave020', '04240005555', '2022-03-13', 'david.rojas20@gmail.com', 'David', 'Rojas', '1991-01-09', 'V29090155'),
(21, 'clave021', '04127896504', '2023-06-13', 'maria.torres21@gmail.com', 'Maria', 'Torres', '1986-07-07', 'V30987066'),
(22, 'clave022', '04144467230', '2025-07-13', 'carlos.martin22@gmail.com', 'Carlos', 'Martin', '1994-02-14', 'V31999177'),
(23, 'clave023', '04123458888', '2024-08-13', 'luis.lopez23@gmail.com', 'Luis', 'Lopez', '1971-08-25', 'V32060188'),
(24, 'clave024', '04245569696', '2023-07-13', 'ana.gomez24@gmail.com', 'Ana', 'Gomez', '1983-09-03', 'V33890199'),
(25, 'clave025', '04163450330', '2021-02-13', 'miguel.perez25@gmail.com', 'Miguel', 'Perez', '1990-04-18', 'V34000200'),
(26, 'clave026', '04263751177', '2023-07-13', 'laura.ramirez26@gmail.com', 'Laura', 'Ramirez', '1987-06-06', 'V35000211'),
(27, 'clave027', '04143452222', '2022-04-11', 'juan.sanchez27@gmail.com', 'Juan', 'Sanchez', '1978-11-12', 'V36000222'),
(28, 'clave028', '04163453333', '2021-07-13', 'sofia.martinez28@gmail.com', 'Sofia', 'Martinez', '1968-03-20', 'V37000233'),
(29, 'clave029', '04167764744', '2025-03-13', 'pedro.diaz29@gmail.com', 'Pedro', 'Diaz', '1992-12-08', 'V35070244'),
(30, 'clave030', '04263457558', '2022-07-13', 'francisco.garcia30@gmail.com', 'Francisco', 'Garcia', '1981-10-30', 'V35030255'),
(31, 'clave031', '04163426690', '2024-07-29', 'marta.lopez31@gmail.com', 'Marta', 'Lopez', '1995-07-01', 'V30858266'),
(32, 'clave032', '04243457797', '2024-04-13', 'javier.mendoza32@gmail.com', 'Javier', 'Mendoza', '1970-01-15', 'V31054277'),
(33, 'clave033', '04141057898', '2023-05-13', 'ana.torres33@gmail.com', 'Ana', 'Torres', '1988-05-09', 'V32000288'),
(34, 'clave034', '04242559909', '2025-07-28', 'manuel.perez34@gmail.com', 'Manuel', 'Perez', '1999-03-28', 'V33040299'),
(35, 'clave035', '04167850770', '2025-06-13', 'laura.garcia35@gmail.com', 'Laura', 'Garcia', '1983-07-16', 'V31440300'),
(36, 'clave036', '04263451121', '2020-07-13', 'carlos.diaz36@gmail.com', 'Carlos', 'Diaz', '1976-06-23', 'V28500311'),
(37, 'clave037', '04144352572', '2024-02-19', 'paula.martinez37@gmail.com', 'Paula', 'Martinez', '1984-09-17', 'V46000322'),
(38, 'clave038', '04243453333', '2024-07-13', 'miguel.soto38@gmail.com', 'Miguel', 'Soto', '1991-12-29', 'V47000333'),
(39, 'clave039', '04123494444', '2019-07-28', 'sofia.lopez39@gmail.com', 'Sofia', 'Lopez', '1969-11-05', 'V48000344'),
(40, 'clave040', '04263455905', '2022-02-13', 'jose.perez40@gmail.com', 'Jose', 'Perez', '1985-04-13', 'V24900355'),
(41, 'clave041', '04123456767', '2025-07-13', 'maria.gomez41@gmail.com', 'Maria', 'Gomez', '1993-08-07', 'V25000366'),
(42, 'clave042', '04263457077', '2021-01-13', 'juan.ramirez42@gmail.com', 'Juan', 'Ramirez', '1987-09-19', 'V25133877'),
(43, 'clave043', '04163458888', '2025-04-24', 'luis.sanchez43@gmail.com', 'Luis', 'Sanchez', '1974-05-24', 'V22044388'),
(44, 'clave044', '04263459999', '2022-05-13', 'ana.torres44@gmail.com', 'Ana', 'Torres', '1989-07-02', 'V24500399'),
(45, 'clave045', '04164598000', '2025-06-13', 'carlos.martinez45@gmail.com', 'Carlos', 'Martinez', '1992-10-11', 'V12504400'),
(46, 'clave046', '04263453432', '2021-02-15', 'marta.rodriguez46@gmail.com', 'Marta', 'Rodriguez', '1980-02-28', 'V5000411'),
(47, 'clave047', '04141255672', '2025-07-25', 'pedro.soto47@gmail.com', 'Pedro', 'Soto', '1977-03-15', 'V56000422'),
(48, 'clave048', '04266378877', '2024-01-13', 'francisco.gomez48@gmail.com', 'Francisco', 'Gomez', '1983-06-27', 'V57000433'),
(49, 'clave049', '04123454444', '2025-07-21', 'paula.lopez49@gmail.com', 'Paula', 'Lopez', '1966-01-09', 'V5800444'),
(50, 'clave050', '04243455555', '2024-04-13', 'miguel.perez50@gmail.com', 'Miguel', 'Perez', '1994-12-21', 'V5950455'),
(51, 'clave051', '04123456666', '2024-06-12', 'sofia.ramirez51@gmail.com', 'Sofia', 'Ramirez', '1981-07-18', 'V6800466'),
(52, 'clave052', '04243457777', '2025-07-13', 'jose.garcia52@gmail.com', 'Jose', 'Garcia', '1970-08-30', 'V6109477'),
(53, 'clave053', '04143458888', '2023-08-13', 'laura.sanchez53@gmail.com', 'Laura', 'Sanchez', '1993-05-26', 'V6200908'),
(54, 'clave054', '04243459999', '2022-07-13', 'miguel.lopez54@gmail.com', 'Miguel', 'Lopez', '1988-04-14', 'V8380499'),
(55, 'clave055', '04123450000', '2025-02-13', 'ana.martinez55@gmail.com', 'Ana', 'Martinez', '1975-02-01', 'V9479500'),
(56, 'clave056', '04243451111', '2023-04-13', 'carlos.perez56@gmail.com', 'Carlos', 'Perez', '1986-11-22', 'V10154851'),
(57, 'clave057', '04163452222', '2025-07-13', 'maria.gomez57@gmail.com', 'Maria', 'Gomez', '1973-01-13', 'V6897522'),
(58, 'clave058', '04263548810', '2022-06-13', 'juan.soto58@gmail.com', 'Juan', 'Soto', '1980-09-19', 'V6750533'),
(59, 'clave059', '04163454444', '2021-07-13', 'paula.lopez59@gmail.com', 'Paula', 'Lopez', '1991-10-31', 'V68000544'),
(60, 'clave060', '04240112551', '2021-02-13', 'miguel.perez60@gmail.com', 'Miguel', 'Perez', '1984-06-07', 'V69000555'),
(61, 'clave061', '04126536271', '2019-07-13', 'sofia.ramirez61@gmail.com', 'Sofia', 'Ramirez', '1976-12-15', 'V70000566'),
(62, 'clave062', '04249000307', '2022-03-13', 'jose.garcia62@gmail.com', 'Jose', 'Garcia', '1989-03-25', 'V71000577'),
(63, 'clave063', '04165498685', '2023-01-13', 'laura.sanchez63@gmail.com', 'Laura', 'Sanchez', '1992-07-29', 'V72000588'),
(64, 'clave064', '04247778799', '2024-02-13', 'miguel.lopez64@gmail.com', 'Miguel', 'Lopez', '1978-01-17', 'V73000599'),
(65, 'clave065', '04163450000', '2022-07-18', 'ana.martinez65@gmail.com', 'Ana', 'Martinez', '1987-09-02', 'V74000600'),
(66, 'clave066', '04267755524', '2021-03-13', 'carlos.perez66@gmail.com', 'Carlos', 'Perez', '1990-11-22', 'V75000611'),
(67, 'clave067', '04149052622', '2024-07-14', 'maria.gomez67@gmail.com', 'Maria', 'Gomez', '1969-05-05', 'V76000622'),
(68, 'clave068', '04143323033', '2022-07-13', 'juan.soto68@gmail.com', 'Juan', 'Soto', '1974-08-16', 'V77000633'),
(69, 'clave069', '04143454444', '2023-07-13', 'paula.lopez69@gmail.com', 'Paula', 'Lopez', '1981-02-26', 'V20555555'),
(70, 'clave070', '04265599055', '2019-07-12', 'sofia.martinez70@gmail.com', 'Sofia', 'Martinez', '1985-04-11', 'V78000644'),
(71, 'clave071', '04163456666', '2025-04-13', 'jose.rodriguez71@gmail.com', 'Jose', 'Rodriguez', '1974-09-05', 'V79000655'),
(72, 'clave072', '04242305777', '2023-07-13', 'maria.diaz72@gmail.com', 'Maria', 'Diaz', '1988-01-17', 'V28678916'),
(73, 'clave073', '04120978819', '2022-10-11', 'carlos.soto73@gmail.com', 'Carlos', 'Soto', '1991-10-29', 'V28160677'),
(74, 'clave074', '04247479099', '2025-12-11', 'ana.lopez74@gmail.com', 'Ana', 'Lopez', '1982-12-23', 'V28234609'),
(75, 'clave075', '04144450070', '2024-11-13', 'miguel.gomez75@gmail.com', 'Miguel', 'Gomez', '1979-06-15', 'V29611485'),
(76, 'clave076', '04263451111', '2025-07-12', 'laura.perez76@gmail.com', 'Laura', 'Perez', '1990-08-03', 'V23157889'),
(77, 'clave077', '04123452222', '2022-11-13', 'juan.torres77@gmail.com', 'Juan', 'Torres', '1983-02-26', 'V2685340'),
(78, 'clave078', '04264258331', '2021-09-13', 'paula.sanchez78@gmail.com', 'Paula', 'Sanchez', '1975-07-19', 'V26500722'),
(79, 'clave079', '04149031124', '2024-07-14', 'javier.garcia79@gmail.com', 'Javier', 'Garcia', '1986-11-13', 'V27570733'),
(80, 'clave080', '04260435756', '2020-07-13', 'sofia.moreno80@gmail.com', 'Sofia', 'Moreno', '1994-09-07', 'V18040744'),
(81, 'clave081', '04162223756', '2022-02-14', 'jose.lopez81@gmail.com', 'Jose', 'Lopez', '1977-04-30', 'V29680755'),
(82, 'clave082', '04241235679', '2025-07-13', 'maria.rodriguez82@gmail.com', 'Maria', 'Rodriguez', '1981-08-21', 'V28002766'),
(83, 'clave083', '04122134509', '2025-04-15', 'carlos.torres83@gmail.com', 'Carlos', 'Torres', '1993-12-25', 'V15603777'),
(84, 'clave084', '04247272965', '2021-07-13', 'ana.soto84@gmail.com', 'Ana', 'Soto', '1987-06-10', 'V22010788'),
(85, 'clave085', '04149999999', '2025-03-16', 'miguel.martinez85@gmail.com', 'Miguel', 'Martinez', '1990-05-04', 'V33075729'),
(86, 'clave086', '04240348592', '2023-07-17', 'laura.gomez86@gmail.com', 'Laura', 'Gomez', '1983-09-14', 'V30456780'),
(87, 'clave087', '04128764343', '2025-07-18', 'juan.lopez87@gmail.com', 'Juan', 'Lopez', '1976-03-07', 'V31000811'),
(88, 'clave088', '04247555583', '2023-07-24', 'paula.sanchez88@gmail.com', 'Paula', 'Sanchez', '1989-11-30', 'V26680822'),
(89, 'clave089', '04123454234', '2025-07-13', 'javier.perez89@gmail.com', 'Javier', 'Perez', '1992-07-18', 'V27960833'),
(90, 'clave090', '04263455555', '2025-07-13', 'sofia.torres90@gmail.com', 'Sofia', 'Torres', '1985-01-27', 'V28506844'),
(91, 'clave091', '04143456666', '2022-07-27', 'jose.garcia91@gmail.com', 'Jose', 'Garcia', '1974-10-11', 'V29040855'),
(92, 'clave092', '04240304756', '2025-07-29', 'maria.martinez92@gmail.com', 'Maria', 'Martinez', '1988-03-03', 'V28799066'),
(93, 'clave093', '04123458688', '2021-07-23', 'carlos.soto93@gmail.com', 'Carlos', 'Soto', '1991-05-15', 'V29056977'),
(94, 'clave094', '04143459599', '2023-07-13', 'ana.lopez94@gmail.com', 'Ana', 'Lopez', '1982-08-21', 'V6201088'),
(95, 'clave095', '04122165030', '2025-07-22', 'miguel.gomez95@gmail.com', 'Miguel', 'Gomez', '1979-02-06', 'V273001199'),
(96, 'clave096', '04263352211', '2025-07-14', 'laura.perez96@gmail.com', 'Laura', 'Perez', '1990-09-29', 'V254001200'),
(97, 'clave097', '04163332532', '2023-07-13', 'juan.torres97@gmail.com', 'Juan', 'Torres', '1983-04-18', 'V22001311'),
(98, 'clave098', '04240053930', '2020-07-13', 'paula.sanchez98@gmail.com', 'Paula', 'Sanchez', '1975-07-27', 'V8764002'),
(99, 'clave099', '04149909999', '2021-07-13', 'laura.vargas99@gmail.com', 'Laura', 'Vargas', '1987-08-25', 'V29000999'),
(100, 'clave100', '04260010302', '2022-07-13', 'miguel.castro100@gmail.com', 'Miguel', 'Castro', '1993-12-10', 'V9768576');

SELECT * FROM ClienteConClienteReferido;