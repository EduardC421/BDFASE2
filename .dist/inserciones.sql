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
(5, 'Bebidas', 'Jugos naturales y refrescos', 1),

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
(45, 'Bebidas', 'Café, Chocolate, Infusiones', 9),

-- Menú Paellero (idMenu: 10)
(46, 'Paellas de Mariscos', 'La clásica valenciana con frutos del mar', 10),
(47, 'Paellas Mixtas', 'Mariscos y carnes de pollo y conejo', 10),
(48, 'Paellas de Carne y Vegetales', 'Opciones robustas sin mariscos', 10),
(49, 'Tapas y Entremeses', 'Patatas Bravas, Gambas al Ajillo, Chorizo a la Sidra', 10),
(50, 'Bebidas', 'Sangría, Cava, Vinos de la región', 10),

-- Menú Cevichero (idMenu: 11)
(51, 'Ceviches Clásicos', 'Pescado blanco, mixtos, con ají amarillo', 11),
(52, 'Tiraditos y Causas', 'Delicados cortes y purés de papa', 11),
(53, 'Leche de Tigre', 'La esencia del ceviche para beber', 11),
(54, 'Platos Calientes Peruanos', 'Lomo Saltado, Ají de Gallina', 11),
(55, 'Bebidas', 'Chicha Morada, Inca Kola', 11),

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
(80, 'Bebidas', 'Aguapanela, Jugos en Leche', 16),

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
(90, 'Bebidas', 'Horchata de Morro, Tamarindo', 18),

-- Menú Griego (idMenu: 19)
(91, 'Mezze (Entradas)', 'Tzatziki, Hummus, Dolmades', 19),
(92, 'Principales', 'Moussaka, Gyros, Souvlaki', 19),
(93, 'Ensaladas y Guarniciones', 'Ensalada Griega, Arroz Pilaf', 19),
(94, 'Mariscos y Pescados', 'Pulpo a la Parrilla, Pescado Fresco', 19),
(95, 'Postres Griegos', 'Baklava, Loukoumades', 19),

-- Menú Turco (idMenu: 20)
(96, 'Mezze Fríos', 'Haydari, Ezme, Patlıcan Salatası', 20),
(97, 'Mezze Calientes', 'Sigara Böreği, Sucuk Izgara', 20),
(98, 'Kebabs y Carnes a la Parrilla', 'Adana Kebab, Shish Kebab, Köfte', 20),
(99, 'Principales', 'Testi Kebab, İskender Kebab', 20),
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
(175, 'Bebidas', 'Soju, Makgeolli, Cervezas locales', 35);


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
(20, 'Sin Lactosa', 'Preparación sin productos lácteos.'),
(21, 'Sin Nueces', 'Excluir nueces o alérgenos de nueces.'),
(22, 'Opción sin gluten', 'Permite solicitar platos sin gluten.'),
(23, 'Opción vegana', 'Indica si se desea una versión vegana del plato.'),
(24, 'Nivel de azúcar', 'Selecciona el nivel de dulzor en bebidas o postres.'),
(25, 'Tipo de condimentos', 'Permite seleccionar condimentos como mostaza o ketchup.'),
(26, 'Fruta adicional', 'Agrega frutas adicionales a un bowl o postre.'),
(27, 'Sabor de helado', 'Selecciona entre varios sabores de helado.'),
(28, 'Tipo de topping dulce', 'Selecciona toppings dulces como chips o sirope.'),
(29, 'Borde relleno', 'Permite agregar borde de queso u otros al pizza.'),
(30, 'Extra Proteína', 'Añadir una porción extra de proteína.'),
(31, 'Vegetales Extras', 'Añade vegetales adicionales a tu plato.'),
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
(5, 2, 'Medio', 1.00), 
(6, 2, 'Picante', 1.50),
(7, 2, 'Muy picante', 3.00),

(8, 3, 'Pan blanco', 1.00),
(9, 3, 'Pan integral', 0.50),
(10, 3, 'Pan sin gluten', 1.00),

(11, 4, 'Espagueti', 0.60),
(12, 4, 'Fettuccine', 0.58),
(13, 4, 'Penne', 0.50),

(14, 5, 'Barbacoa', 0.70),
(15, 5, 'Mostaza miel', 0.50),
(16, 5, 'Picante', 0.50),

(17, 6, 'Queso cheddar', 0.50),
(18, 6, 'Tocineta', 1.00),
(19, 6, 'Cebolla crujiente', 0.50),

(20, 7, 'Aguacate', 1.00),
(21, 7, 'Huevo', 0.75),

(22, 8, 'Sin cebolla', 0.00),
(23, 8, 'Sin tomate', 0.00),

(24, 9, 'Arroz', 1.20),
(25, 9, 'Papas fritas', 0.25),
(26, 9, 'Ensalada', 2.00),

(27, 10, 'Frito', 1.00),
(28, 10, 'A la plancha', 0.50),
(29, 10, 'Horno', 1.00),

(30, 11, 'Mozzarella', 0.00),
(31, 11, 'Cheddar', 0.50),
(32, 11, 'Azul', 1.00),

(33, 12, 'Carne de res', 1.00),
(34, 12, 'Pollo', 0.75),
(35, 12, 'Vegetariana', 5.00),

(36, 13, 'Pequeña', 0.00),
(37, 13, 'Mediana', 0.50),
(38, 13, 'Grande', 1.00),

(39, 14, 'Entera', 0.50),
(40, 14, 'Descremada', 0.60),
(41, 14, 'Vegetal', 0.60),

(42, 15, 'Blanca', 0.60),
(43, 15, 'Morena', 0.90),
(44, 15, 'Edulcorante', 0.90),

(45, 16, 'Confites', 0.50),
(46, 16, 'Frutas', 0.75),

(47, 17, 'Blanco', 0.00),
(48, 17, 'Integral', 0.00),
(49, 17, 'Jazmín', 0.00),

(50, 18, 'Poco hecho', 0.00),
(51, 18, 'Término medio', 0.00),
(52, 18, 'Bien cocido', 0.00),

(53, 19, 'Maíz', 0.10),
(54, 19, 'Harina de trigo', 0.50),
(55, 19, 'Integral', 0.75),

(56, 20, 'Sí', 0.00), 

(57, 21, 'Sí', 0.00),

(58, 31, 'Brócoli', 1.50),      
(59, 31, 'Zanahoria', 1.00),
(60, 31, 'Pimientos', 1.25),

(61, 22, 'Solicitar sin gluten', 0.00),

(62, 23, 'Versión vegana', 0.00),

(63, 24, 'Poco dulce', 0.50),
(64, 24, 'Normal', 1.20),
(65, 24, 'Muy dulce', 2.04),

(66, 25, 'Mostaza', 0.00),
(67, 25, 'Mayonesa', 0.00),
(68, 25, 'Ketchup', 0.00),

(69, 26, 'Fresas', 0.75),
(70, 26, 'Mango', 0.75),

(71, 27, 'Chocolate', 0.00),
(72, 27, 'Vainilla', 0.00),
(73, 27, 'Fresa', 0.00),

(74, 28, 'Chispas de chocolate', 0.50),
(75, 28, 'Sirope de caramelo', 0.50),

(76, 29, 'Queso mozzarella', 1.00),
(77, 29, 'Queso crema', 1.25),

(78, 30, 'Sí', 4.00),    

(79, 32, 'Normal', 0.00),
(80, 32, 'Poca sal', 0.00),
(81, 32, 'Sin sal', 0.00),

(82, 33, 'Soda', 0.00),
(83, 33, 'Jugo', 0.50),
(84, 33, 'Agua', 0.00),

(85, 34, 'Naranja', 0.00),
(86, 34, 'Fresa', 0.00),
(87, 34, 'Mango', 0.00),

(88, 35, 'Lechuga', 0.50),
(89, 35, 'Quinoa', 0.75),
(90, 35, 'Arroz', 0.50),

(91, 36, 'Sirope de chocolate', 0.50),
(92, 36, 'Nueces', 0.75),

(93, 37, 'Frito', 0.00),
(94, 37, 'A la plancha', 0.00),
(95, 37, 'Horneado', 0.00),

(96, 38, 'Chocolate', 0.50),
(97, 38, 'Vainilla', 0.50),
(98, 38, 'Zanahoria', 0.50),

(99, 39, 'Tostado ligero', 0.00),
(100, 39, 'Tostado medio', 0.00),
(101, 39, 'Tostado fuerte', 0.00),

(102, 40, 'Pepperoni', 1.00),
(103, 40, 'Vegetales', 0.75),
(104, 40, 'Jamón', 1.00);

INSERT INTO PlatoOpcion (idPlato, idOpcion) VALUES
(1, 9),
(1, 11),
(2, 9),
(2, 30),
(3, 9),
(3, 23),
(3, 30),
(4, 31),
(4, 35),
(5, 1),
(5, 2),
(5, 6),
(6, 1),
(6, 2),
(6, 7),
(7, 1),
(7, 7),
(7, 22),
(8, 1),
(8, 22),
(9, 1),
(9, 4),
(9, 5),
(10, 5),
(10, 8),
(11, 7),
(11, 31),
(12, 16),
(12, 28),
(12, 36),
(13, 1),
(13, 2),
(13, 18),
(14, 1),
(14, 19),
(14, 23),
(15, 7),
(15, 21),
(15, 22),
(16, 1),
(16, 2),
(16, 5),
(17, 1),
(17, 4),
(17, 31),
(18, 1),
(18, 17),
(18, 31),
(19, 7),
(19, 31),
(19, 28),
(20, 1),
(20, 4),
(20, 32),
(21, 1),
(21, 2),
(21, 5),
(22, 1),
(22, 2),
(22, 5),
(23, 17),
(23, 31),
(23, 35),
(24, 3),
(24, 20),
(24, 21),
(25, 3),
(25, 7),
(25, 20),
(26, 1),
(26, 8),
(26, 32),
(27, 7),
(27, 31),
(27, 20),
(28, 1),
(28, 18),
(28, 30),
(29, 7),
(29, 23),
(30, 7),
(30, 11),
(31, 7),
(31, 20),
(32, 13),
(32, 14),
(32, 15),
(33, 16),
(33, 28),
(33, 36),
(34, 3),
(34, 39),
(35, 16),
(35, 36),
(35, 27),
(36, 14),
(36, 15),
(36, 24),
(37, 9),
(37, 30),
(37, 40),
(38, 6),
(38, 7),
(38, 30),
(39, 9),
(39, 11),
(39, 30),
(40, 33),
(41, 1),
(41, 2),
(41, 6),
(42, 1),
(42, 6),
(42, 18),
(43, 1),
(43, 31),
(43, 35),
(44, 33),
(45, 1),
(45, 18),
(45, 9),
(46, 1),
(46, 18),
(46, 30),
(47, 17),
(47, 31),
(47, 35),
(48, 27),
(48, 36),
(48, 28),
(49, 1),
(49, 31),
(49, 35),
(50, 2),
(50, 6),
(50, 7),
(51, 4),
(51, 7),
(51, 31),
(52, 7),
(52, 22),
(52, 20),
(53, 1),
(53, 2),
(53, 31),
(54, 2),
(54, 7),
(54, 32),
(55, 1),
(55, 2),
(55, 5),
(56, 26),
(56, 24),
(56, 36),
(57, 1),
(57, 17),
(58, 35),
(59, 1),
(60, 14),
(61, 9),
(62, 9),
(63, 7),
(64, 36),
(65, 30),
(66, 4),
(67, 36),
(68, 31),
(69, 19),
(70, 19),
(71, 9),
(72, 9),
(73, 3),
(74, 1),
(75, 7),
(76, 36),
(77, 18),
(78, 1),
(79, 7),
(80, 36),
(81, 9),
(82, 18),
(83, 9),
(84, 36),
(85, 1),
(86, 3),
(87, 4),
(88, 28),
(89, 35),
(90, 30),
(91, 4),
(92, 26),
(93, 9),
(94, 9),
(95, 36),
(96, 9),
(97, 1),
(98, 6),
(99, 19),
(100, 2),
(101, 1),
(102, 1),
(103, 36),
(104, 7),
(105, 31),
(106, 7),
(107, 31),
(108, 28),
(109, 1),
(110, 9),
(111, 9),
(112, 36),
(113, 30),
(114, 18),
(115, 9),
(116, 31),
(117, 29),
(118, 2),
(119, 1),
(120, 35);

-- Platos 1-10 (Ejemplo: Asado Negro, Punta Trasera, Chorizo, etc.)
INSERT INTO PlatoOpcionValor (idPlato, idOpcionValor, idOpcion) VALUES
-- Plato 1: Asado Negro Criollo (Contornos: 9, Tipo de queso: 11)
(1, 24, 9), (1, 25, 9), (1, 26, 9), (1, 30, 11), (1, 31, 11), (1, 32, 11),
-- Plato 2: Punta Trasera a la Brasa (Contornos: 9, Extra Proteína: 30)
(2, 24, 9), (2, 25, 9), (2, 26, 9), (2, 78, 30),
-- Plato 3: Chorizo Parrillero (Contornos: 9, Opción vegana: 23, Extra Proteína: 30)
(3, 24, 9), (3, 25, 9), (3, 26, 9), (3, 62, 23), (3, 78, 30),
-- Plato 4: Ensalada Rallada (Vegetales Extras: 31, Tipo de base: 35)
(4, 58, 31), (4, 59, 31), (4, 60, 31), (4, 88, 35), (4, 89, 35), (4, 90, 35),
-- Plato 5: Roll California (Tamaño: 1, Nivel de picante: 2, Toppings: 6)
(5, 1, 1), (5, 2, 1), (5, 3, 1), (5, 4, 2), (5, 5, 2), (5, 6, 2), (5, 7, 2), (5, 17, 6), (5, 18, 6), (5, 19, 6),
-- Plato 6: Nigiri Salmón (Tamaño: 1, Nivel de picante: 2, Extras: 7)
(6, 1, 1), (6, 2, 1), (6, 3, 1), (6, 4, 2), (6, 5, 2), (6, 6, 2), (6, 7, 2), (6, 20, 7), (6, 21, 7),
-- Plato 7: Sopa Miso (Tamaño: 1, Extras: 7, Opción sin gluten: 22)
(7, 1, 1), (7, 2, 1), (7, 3, 1), (7, 20, 7), (7, 21, 7), (7, 61, 22),
-- Plato 8: Ebi Tempura (Tamaño: 1, Opción sin gluten: 22)
(8, 1, 1), (8, 2, 1), (8, 3, 1), (8, 61, 22),
-- Plato 9: Fettuccine Alfredo (Tamaño: 1, Tipo de pasta: 4, Salsas adicionales: 5)
(9, 1, 1), (9, 2, 1), (9, 3, 1), (9, 11, 4), (9, 12, 4), (9, 13, 4), (9, 14, 5), (9, 15, 5), (9, 16, 5),
-- Plato 10: Lasagna Clásica (Salsas adicionales: 5, Exclusiones: 8)
(10, 14, 5), (10, 15, 5), (10, 16, 5), (10, 22, 8), (10, 23, 8),

-- Platos 11-20 (Ensalada Caprese, Tiramisú, Tacos al Pastor, etc.)
-- Plato 11: Ensalada Caprese (Extras: 7, Vegetales Extras: 31)
(11, 20, 7), (11, 21, 7), (11, 58, 31), (11, 59, 31), (11, 60, 31),
-- Plato 12: Tiramisú (Decoración: 16, Tipo de topping dulce: 28, Cobertura: 36)
(12, 45, 16), (12, 46, 16), (12, 74, 28), (12, 75, 28), (12, 91, 36), (12, 92, 36),
-- Plato 13: Tacos al Pastor (Tamaño: 1, Nivel de picante: 2, Toppings: 18)
(13, 1, 1), (13, 2, 1), (13, 3, 1), (13, 4, 2), (13, 5, 2), (13, 6, 2), (13, 7, 2), (13, 76, 18), (13, 77, 18),
-- Plato 14: Burrito de Carnitas (Tamaño: 1, Toppings: 19, Opción vegana: 23)
(14, 1, 1), (14, 2, 1), (14, 3, 1), (14, 76, 19), (14, 77, 19), (14, 62, 23),
-- Plato 15: Guacamole con Totopos (Extras: 7, Sin Nueces: 21, Exclusiones: 22)
(15, 20, 7), (15, 21, 7), (15, 56, 21), (15, 22, 22), (15, 23, 22),
-- Plato 16: Enchiladas Rojas (Tamaño: 1, Nivel de picante: 2, Salsas adicionales: 5)
(16, 1, 1), (16, 2, 1), (16, 3, 1), (16, 4, 2), (16, 5, 2), (16, 6, 2), (16, 7, 2), (16, 14, 5), (16, 15, 5), (16, 16, 5),
-- Plato 17: Wok de Pollo Teriyaki (Tamaño: 1, Tipo de pasta: 4, Vegetales Extras: 31)
(17, 1, 1), (17, 2, 1), (17, 3, 1), (17, 11, 4), (17, 12, 4), (17, 13, 4), (17, 58, 31), (17, 59, 31), (17, 60, 31),
-- Plato 18: Arroz Frito Especial (Tamaño: 1, Tipo de arroz: 17, Vegetales Extras: 31)
(18, 1, 1), (18, 2, 1), (18, 3, 1), (18, 47, 17), (18, 48, 17), (18, 49, 17), (18, 58, 31), (18, 59, 31), (18, 60, 31),
-- Plato 19: Rollitos Primavera (Extras: 7, Vegetales Extras: 31, Tipo de topping dulce: 28)
(19, 20, 7), (19, 21, 7), (19, 58, 31), (19, 59, 31), (19, 60, 31), (19, 74, 28), (19, 75, 28),
-- Plato 20: Fideos de Arroz con Camarones (Tamaño: 1, Tipo de pasta: 4, Nivel de sal: 32)
(20, 1, 1), (20, 2, 1), (20, 3, 1), (20, 11, 4), (20, 12, 4), (20, 13, 4), (20, 79, 32), (20, 80, 32), (20, 81, 32),

-- Platos 21-30 (Curry Rojo de Res, Curry Verde de Pollo, Arroz Basmati, etc.)
-- Plato 21: Curry Rojo de Res (Tamaño: 1, Nivel de picante: 2, Salsas adicionales: 5)
(21, 1, 1), (21, 2, 1), (21, 3, 1), (21, 4, 2), (21, 5, 2), (21, 6, 2), (21, 7, 2), (21, 14, 5), (21, 15, 5), (21, 16, 5),
-- Plato 22: Curry Verde de Pollo (Tamaño: 1, Nivel de picante: 2, Salsas adicionales: 5)
(22, 1, 1), (22, 2, 1), (22, 3, 1), (22, 4, 2), (22, 5, 2), (22, 6, 2), (22, 7, 2), (22, 14, 5), (22, 15, 5), (22, 16, 5),
-- Plato 23: Arroz Basmati (Tipo de arroz: 17, Vegetales Extras: 31, Tipo de base: 35)
(23, 47, 17), (23, 48, 17), (23, 49, 17), (23, 58, 31), (23, 59, 31), (23, 60, 31), (23, 88, 35), (23, 89, 35), (23, 90, 35),
-- Plato 24: Pan Naan (Tipo de pan: 3, Sin Lactosa: 20, Extras: 21)
(24, 8, 3), (24, 9, 3), (24, 10, 3), (24, 56, 20), (24, 57, 21),
-- Plato 25: Hummus con Pan Pita (Tipo de pan: 3, Extras: 7, Sin Lactosa: 20)
(25, 8, 3), (25, 9, 3), (25, 10, 3), (25, 20, 7), (25, 21, 7), (25, 56, 20),
-- Plato 26: Moussaka (Tamaño: 1, Exclusiones: 8, Nivel de sal: 32)
(26, 1, 1), (26, 2, 1), (26, 3, 1), (26, 22, 8), (26, 23, 8), (26, 79, 32), (26, 80, 32), (26, 81, 32),
-- Plato 27: Ensalada Griega (Extras: 7, Vegetales Extras: 31, Sin Lactosa: 20)
(27, 20, 7), (27, 21, 7), (27, 58, 31), (27, 59, 31), (27, 60, 31), (27, 56, 20),
-- Plato 28: Souvlaki de Pollo (Tamaño: 1, Toppings: 18, Extra Proteína: 30)
(28, 1, 1), (28, 2, 1), (28, 3, 1), (28, 76, 18), (28, 77, 18), (28, 78, 30),
-- Plato 29: Arepa Reina Pepiada (Extras: 7, Opción vegana: 23)
(29, 20, 7), (29, 21, 7), (29, 62, 23),
-- Plato 30: Arepa Pelúa (Extras: 7, Tipo de queso: 11)
(30, 20, 7), (30, 21, 7), (30, 30, 11), (30, 31, 11), (30, 32, 11),

-- Platos 31-40 (Empanada de Carne, Jugo de Parchita, Croissant de Almendras, etc.)
-- Plato 31: Empanada de Carne (Extras: 7, Sin Lactosa: 20)
(31, 20, 7), (31, 21, 7), (31, 56, 20),
-- Plato 32: Jugo de Parchita (Tamaño de bebida: 13, Tipo de leche: 14, Tipo de azúcar: 15)
(32, 36, 13), (32, 37, 13), (32, 38, 13), (32, 39, 14), (32, 40, 14), (32, 41, 14), (32, 42, 15), (32, 43, 15), (32, 44, 15),
-- Plato 33: Croissant de Almendras (Decoración: 16, Tipo de topping dulce: 28, Cobertura: 36)
(33, 45, 16), (33, 46, 16), (33, 74, 28), (33, 75, 28), (33, 91, 36), (33, 92, 36),
-- Plato 34: Baguette Clásica (Tipo de pan: 3, Nivel de tostado: 39)
(34, 8, 3), (34, 9, 3), (34, 10, 3), (34, 99, 39), (34, 100, 39), (34, 101, 39),
-- Plato 35: Éclair de Chocolate (Decoración: 16, Cobertura: 36, Sabor de helado: 27)
(35, 45, 16), (35, 46, 16), (35, 91, 36), (35, 92, 36), (35, 71, 27), (35, 72, 27), (35, 73, 27),
-- Plato 36: Café Latte (Tipo de leche: 14, Tipo de azúcar: 15, Nivel de azúcar: 24)
(36, 39, 14), (36, 40, 14), (36, 41, 14), (36, 42, 15), (36, 43, 15), (36, 44, 15), (36, 63, 24), (36, 64, 24), (36, 65, 24),
-- Plato 37: Paella de Mariscos (Contornos: 9, Extra Proteína: 30, Tipo de cobertura de pizza: 40)
(37, 24, 9), (37, 25, 9), (37, 26, 9), (37, 78, 30), (37, 102, 40), (37, 103, 40), (37, 104, 40),
-- Plato 38: Tapas de Gambas al Ajillo (Nivel de picante: 2, Extras: 7, Extra Proteína: 30)
(38, 4, 2), (38, 5, 2), (38, 6, 2), (38, 7, 2), (38, 20, 7), (38, 21, 7), (38, 78, 30),
-- Plato 39: Paella Mixta (Contornos: 9, Tipo de queso: 11, Extra Proteína: 30)
(39, 24, 9), (39, 25, 9), (39, 26, 9), (39, 30, 11), (39, 31, 11), (39, 32, 11), (39, 78, 30),
-- Plato 40: Sangría Tradicional (Tipo de bebida: 33, Sabor de bebida: 34, Nivel de azúcar: 24)
(40, 82, 33), (40, 83, 33), (40, 84, 33), (40, 85, 34), (40, 86, 34), (40, 87, 34), (40, 63, 24), (40, 64, 24), (40, 65, 24),

-- Platos 41-50 (Ceviche Clásico, Tiradito de Pulpo, Causa Limeña, etc.)
-- Plato 41: Ceviche Clásico de Pescado (Tamaño: 1, Nivel de picante: 2, Toppings: 6)
(41, 1, 1), (41, 2, 1), (41, 3, 1), (41, 4, 2), (41, 5, 2), (41, 6, 2), (41, 7, 2), (41, 17, 6), (41, 18, 6), (41, 19, 6),
-- Plato 42: Tiradito de Pulpo (Tamaño: 1, Nivel de picante: 2, Toppings: 18)
(42, 1, 1), (42, 2, 1), (42, 3, 1), (42, 4, 2), (42, 5, 2), (42, 6, 2), (42, 7, 2), (42, 76, 18), (42, 77, 18),
-- Plato 43: Causa Limeña (Tamaño: 1, Vegetales Extras: 31, Tipo de base: 35)
(43, 1, 1), (43, 2, 1), (43, 3, 1), (43, 58, 31), (43, 59, 31), (43, 60, 31), (43, 88, 35), (43, 89, 35), (43, 90, 35),
-- Plato 44: Chicha Morada (Tipo de bebida: 33, Sabor de bebida: 34, Nivel de azúcar: 24)
(44, 82, 33), (44, 83, 33), (44, 84, 33), (44, 85, 34), (44, 86, 34), (44, 87, 34), (44, 63, 24), (44, 64, 24), (44, 65, 24),
-- Plato 45: Picanha a la Espada (Tamaño: 1, Toppings: 18, Contornos: 9)
(45, 1, 1), (45, 2, 1), (45, 3, 1), (45, 76, 18), (45, 77, 18), (45, 24, 9), (45, 25, 9), (45, 26, 9),
-- Plato 46: Fraldinha (Tamaño: 1, Toppings: 18, Extra Proteína: 30)
(46, 1, 1), (46, 2, 1), (46, 3, 1), (46, 76, 18), (46, 77, 18), (46, 78, 30),
-- Plato 47: Arroz Blanco (Tipo de arroz: 17, Vegetales Extras: 31, Tipo de base: 35)
(47, 47, 17), (47, 48, 17), (47, 49, 17), (47, 58, 31), (47, 59, 31), (47, 60, 31), (47, 88, 35), (47, 89, 35), (47, 90, 35),
-- Plato 48: Brigadeiro (Decoración: 16, Cobertura: 36, Sabor de helado: 27)
(48, 45, 16), (48, 46, 16), (48, 91, 36), (48, 92, 36), (48, 71, 27), (48, 72, 27), (48, 73, 27),
-- Plato 49: Bibimbap (Tamaño: 1, Vegetales Extras: 31, Tipo de base: 35)
(49, 1, 1), (49, 2, 1), (49, 3, 1), (49, 58, 31), (49, 59, 31), (49, 60, 31), (49, 88, 35), (49, 89, 35), (49, 90, 35),
-- Plato 50: Kimchi Jjigae (Nivel de picante: 2, Extras: 7, Nivel de sal: 32)
(50, 4, 2), (50, 5, 2), (50, 6, 2), (50, 7, 2), (50, 20, 7), (50, 21, 7), (50, 79, 32), (50, 80, 32), (50, 81, 32),
-- Platos 51-60 (Japchae, Kimchi, Pad Thai, Tom Yum Goong, etc.)
-- Plato 51: Japchae (Tipo de pasta: 4, Extras: 7, Vegetales Extras: 31)
(51, 11, 4), (51, 12, 4), (51, 13, 4), (51, 20, 7), (51, 21, 7), (51, 58, 31), (51, 59, 31), (51, 60, 31),
-- Plato 52: Kimchi (Extras: 7, Opción sin gluten: 22, Sin Lactosa: 20)
(52, 20, 7), (52, 21, 7), (52, 61, 22), (52, 56, 20),
-- Plato 53: Pad Thai con Pollo (Tamaño: 1, Nivel de picante: 2, Vegetales Extras: 31)
(53, 1, 1), (53, 2, 1), (53, 3, 1), (53, 4, 2), (53, 5, 2), (53, 6, 2), (53, 7, 2), (53, 58, 31), (53, 59, 31), (53, 60, 31),
-- Plato 54: Tom Yum Goong (Nivel de picante: 2, Extras: 7, Nivel de sal: 32)
(54, 4, 2), (54, 5, 2), (54, 6, 2), (54, 7, 2), (54, 20, 7), (54, 21, 7), (54, 79, 32), (54, 80, 32), (54, 81, 32),
-- Plato 55: Curry Massaman con Res (Tamaño: 1, Nivel de picante: 2, Salsas adicionales: 5)
(55, 1, 1), (55, 2, 1), (55, 3, 1), (55, 4, 2), (55, 5, 2), (55, 6, 2), (55, 7, 2), (55, 14, 5), (55, 15, 5), (55, 16, 5),
-- Plato 56: Mango Sticky Rice (Fruta adicional: 26, Nivel de azúcar: 24, Cobertura: 36)
(56, 69, 26), (56, 70, 26), (56, 63, 24), (56, 64, 24), (56, 65, 24), (56, 91, 36), (56, 92, 36),
-- Plato 57: Pho Bo (Sopa de Res) (Tamaño: 1, Tipo de arroz: 17)
(57, 1, 1), (57, 2, 1), (57, 3, 1), (57, 47, 17), (57, 48, 17), (57, 49, 17),
-- Plato 58: Gỏi Cuốn (Rollos de Verano) (Tipo de base: 35)
(58, 88, 35), (58, 89, 35), (58, 90, 35),
-- Plato 59: Bún Chả (Tamaño: 1)
(59, 1, 1), (59, 2, 1), (59, 3, 1),
-- Plato 60: Café Vietnamita con Leche Condensada (Tipo de leche: 14, Tipo de azúcar: 15)
(60, 39, 14), (60, 40, 14), (60, 41, 14), (60, 42, 15), (60, 43, 15), (60, 44, 15),

-- Platos 61-70 (Bandeja Paisa, Ajiaco Santafereño, Empanadas Colombianas, etc.)
-- Plato 61: Bandeja Paisa (Contornos: 9)
(61, 24, 9), (61, 25, 9), (61, 26, 9),
-- Plato 62: Ajiaco Santafereño (Contornos: 9)
(62, 24, 9), (62, 25, 9), (62, 26, 9),
-- Plato 63: Empanadas Colombianas (Extras: 7, Sin Lactosa: 20)
(63, 20, 7), (63, 21, 7), (63, 56, 20),
-- Plato 64: Postre de Natilla (Cobertura: 36)
(64, 91, 36), (64, 92, 36),
-- Plato 65: Salmón al Horno con Vegetales Asados (Extra Proteína: 30)
(65, 78, 30),
-- Plato 66: Pasta de Lentejas con Pesto (Tipo de pasta: 4)
(66, 11, 4), (66, 12, 4), (66, 13, 4),
-- Plato 67: Brownie de Chocolate Sin Gluten (Cobertura: 36)
(67, 91, 36), (67, 92, 36),
-- Plato 68: Ensalada Quinoa y Aguacate (Vegetales Extras: 31)
(68, 58, 31), (68, 59, 31), (68, 60, 31),
-- Plato 69: Pupusa de Queso con Loroco (Toppings: 19)
(69, 76, 19), (69, 77, 19),
-- Plato 70: Pupusa Revuelta (Toppings: 19)
(70, 76, 19), (70, 77, 19),

-- Platos 71-80 (Yuca con Chicharrón, Sopa de Res Salvadoreña, Gyros de Cerdo, etc.)
-- Plato 71: Yuca con Chicharrón (Contornos: 9)
(71, 24, 9), (71, 25, 9), (71, 26, 9),
-- Plato 72: Sopa de Res Salvadoreña (Contornos: 9)
(72, 24, 9), (72, 25, 9), (72, 26, 9),
-- Plato 73: Gyros de Cerdo (Tipo de pan: 3)
(73, 8, 3), (73, 9, 3), (73, 10, 3),
-- Plato 74: Moussaka (Tamaño: 1)
(74, 1, 1), (74, 2, 1), (74, 3, 1),
-- Plato 75: Tzatziki con Pan Pita (Extras: 7)
(75, 20, 7), (75, 21, 7),
-- Plato 76: Baklava (Cobertura: 36)
(76, 91, 36), (76, 92, 36),
-- Plato 77: Adana Kebab (Toppings: 18)
(77, 76, 18), (77, 77, 18),
-- Plato 78: Lahmacun (Tamaño: 1)
(78, 1, 1), (78, 2, 1), (78, 3, 1),
-- Plato 79: Hummus (Extras: 7)
(79, 20, 7), (79, 21, 7),
-- Plato 80: Künefe (Cobertura: 36)
(80, 91, 36), (80, 92, 36)
-- Platos 81-90 (Bratwurst con Sauerkraut, Wiener Schnitzel, Kartoffelsalat, etc.)
-- Plato 81: Bratwurst con Sauerkraut (Contornos: 9)
(81, 24, 9), (81, 25, 9), (81, 26, 9),
-- Plato 82: Wiener Schnitzel (Toppings: 18)
(82, 76, 18), (82, 77, 18),
-- Plato 83: Kartoffelsalat (Vegetales Extras: 31)
(83, 58, 31), (83, 59, 31), (83, 60, 31),
-- Plato 84: Apfelstrudel (Cobertura: 36)
(84, 91, 36), (84, 92, 36),
-- Plato 85: Tacos de Kimchi y Cerdo (Tamaño: 1)
(85, 1, 1), (85, 2, 1), (85, 3, 1),
-- Plato 86: Sushi Burger (Tipo de pan: 3)
(86, 8, 3), (86, 9, 3), (86, 10, 3),
-- Plato 87: Pasta al Curry y Leche de Coco (Tipo de pasta: 4)
(87, 11, 4), (87, 12, 4), (87, 13, 4),
-- Plato 88: Cheesecake de Matcha (Cobertura: 36)
(88, 91, 36), (88, 92, 36),
-- Plato 89: Ensalada de Lentejas y Vegetales Orgánicos (Vegetales Extras: 31)
(89, 58, 31), (89, 59, 31), (89, 60, 31),
-- Plato 90: Pollo Orgánico al Limón con Quinoa (Extra Proteína: 30)
(90, 78, 30),
-- Platos 91-100 (Sopa de Calabaza Asada, Smoothie Verde, Pabellón Criollo, etc.)
-- Plato 91: Sopa de Calabaza Asada (Tipo de pasta: 4)
(91, 11, 4), (91, 12, 4), (91, 13, 4),
-- Plato 92: Smoothie Verde Detox (Fruta adicional: 26)
(92, 69, 26), (92, 70, 26),
-- Plato 93: Pabellón Criollo Completo (Contornos: 9)
(93, 24, 9), (93, 25, 9), (93, 26, 9),
-- Plato 94: Sopa de Costilla Casera (Contornos: 9)
(94, 24, 9), (94, 25, 9), (94, 26, 9),
-- Plato 95: Arroz con Leche (Cobertura: 36)
(95, 91, 36), (95, 92, 36),
-- Plato 96: Asado Negro (Contornos: 9)
(96, 24, 9), (96, 25, 9), (96, 26, 9),
-- Plato 97: Fajitas de Pollo (Tamaño: 1)
(97, 1, 1), (97, 2, 1), (97, 3, 1),
-- Plato 98: Nachos Supremos (Toppings: 6)
(98, 17, 6), (98, 18, 6), (98, 19, 6),
-- Plato 99: Burrito de Carne Asada (Toppings: 19)
(99, 76, 19), (99, 77, 19),
-- Plato 100: Chili con Carne (Nivel de picante: 2)
(100, 4, 2), (100, 5, 2), (100, 6, 2), (100, 7, 2),
-- Platos 101-110 (Taco de Carnitas, Hamburguesa Clásica, Churros, etc.)
-- Plato 101: Taco de Carnitas (Tamaño: 1)
(101, 1, 1), (101, 2, 1), (101, 3, 1),
-- Plato 102: Hamburguesa Clásica con Papas (Tamaño: 1)
(102, 1, 1), (102, 2, 1), (102, 3, 1),
-- Plato 103: Churros con Chocolate (Cobertura: 36)
(103, 91, 36), (103, 92, 36),
-- Plato 104: Arepa con Queso Telita (Extras: 7)
(104, 20, 7), (104, 21, 7),
-- Plato 105: Bowl de Salmón y Aguacate (Vegetales Extras: 31)
(105, 58, 31), (105, 59, 31), (105, 60, 31),
-- Plato 106: Ensalada de Pollo a la Parrilla (Extras: 7)
(106, 20, 7), (106, 21, 7),
-- Plato 107: Lentejas Estofadas con Verduras (Vegetales Extras: 31)
(107, 58, 31), (107, 59, 31), (107, 60, 31),
-- Plato 108: Barra Energética Casera (Cobertura: 36)
(108, 91, 36), (108, 92, 36),
-- Plato 109: Mac and Cheese Clásico (Tamaño: 1)
(109, 1, 1), (109, 2, 1), (109, 3, 1),
-- Plato 110: Albóndigas en Salsa de Tomate (Contornos: 9)
(110, 24, 9), (110, 25, 9), (110, 26, 9),
-- Platos 111-120 (Puré de Papa, Brownie con Helado, Surf & Turf, etc.)
-- Plato 111: Puré de Papa (Contornos: 9)
(111, 24, 9), (111, 25, 9), (111, 26, 9),
-- Plato 112: Brownie con Helado (Cobertura: 36)
(112, 91, 36), (112, 92, 36),
-- Plato 113: Surf & Turf (Extra Proteína: 30)
(113, 78, 30),
-- Plato 114: Ribeye a la Parrilla (Toppings: 18)
(114, 76, 18), (114, 77, 18),
-- Plato 115: Camarones al Ajillo (Contornos: 9)
(115, 24, 9), (115, 25, 9), (115, 26, 9),
-- Plato 116: Espárragos Asados (Vegetales Extras: 31)
(116, 58, 31), (116, 59, 31), (116, 60, 31),
-- Plato 117: Pizza Margherita (Borde relleno: 29)
(117, 76, 29), (117, 77, 29),
-- Plato 118: Pizza Diavola (Nivel de picante: 2)
(118, 4, 2), (118, 5, 2), (118, 6, 2), (118, 7, 2),
-- Plato 119: Calzone Relleno (Tamaño: 1)
(119, 1, 1), (119, 2, 1), (119, 3, 1),
-- Plato 120: Ensalada Rúcula y Parmesano (Tipo de base: 35)
(120, 88, 35), (120, 89, 35), (120, 90, 35);

INSERT INTO Repartidor (id, password, telefono, fecha_registro, correo, nombre, apellido, fecha_nac, nro_documento, detalle_vehiculo, estado) VALUES
(1, 'repartidor001', '04121234567', '2024-01-20', 'david.romero1@gmail.com', 'David', 'Romero', '1990-01-15', 'E10111222', 'Moto Kawasaki Ninja 400 placa A123', 'Activo'),
(2, 'repartidor002', '04147654321', '2023-03-10', 'elena.gomez2@gmail.com', 'Elena', 'Gomez', '1985-03-20', 'V11333444', 'Bicicleta Montañera Trek', 'Inactivo'),
(3, 'repartidor003', '04248765432', '2025-02-05', 'fernando.diaz3@gmail.com', 'Fernando', 'Diaz', '1992-07-01', 'E12555666', 'Carro Chevrolet Spark placa B123', 'Activo'),
(4, 'repartidor004', '04169876543', '2024-06-18', 'gabriel.rojas4@gmail.com', 'Gabriel', 'Rojas', '1988-11-10', 'V13777888', 'Moto Empire Horse placa C123', 'Activo'),
(5, 'repartidor005', '04121112233', '2023-09-22', 'hilda.peres5@gmail.com', 'Hilda', 'Peres', '1995-02-28', 'E14999000', 'Bicicleta de Paseo', 'Inactivo'),
(6, 'repartidor006', '04143334455', '2025-01-01', 'ivan.soto6@gmail.com', 'Ivan', 'Soto', '1980-06-05', 'V15111222', 'Carro Ford Fiesta placa A456', 'Activo'),
(7, 'repartidor007', '04245556677', '2024-04-14', 'juana.flores7@gmail.com', 'Juana', 'Flores', '1993-09-12', 'E16333444', 'Moto Bera Socialista B456', 'Activo'),
(8, 'repartidor008', '04167778899', '2023-11-08', 'kenneth.muñoz8@gmail.com', 'Kenneth', 'Muñoz', '1987-04-25', 'V17555666', 'Bicicleta Urbana', 'Inactivo'),
(9, 'repartidor009', '04120001111', '2025-03-27', 'luisa.vargas9@gmail.com', 'Luisa', 'Vargas', '1991-08-03', 'E18777888', 'Carro Toyota Corolla placa C456', 'Activo'),
(10, 'repartidor010', '04142223344', '2024-07-01', 'marcos.ruiz10@gmail.com', 'Marcos', 'Ruiz', '1983-12-18', 'V19999000', 'Moto Suzuky GN 125 placa A789', 'Activo'),
(11, 'repartidor011', '04244445566', '2023-10-15', 'natalia.castro11@gmail.com', 'Natalia', 'Castro', '1996-01-09', 'E20111222', 'Bicicleta Eléctrica', 'Inactivo'),
(12, 'repartidor012', '04166667788', '2025-04-01', 'oscar.hernandez12@gmail.com', 'Oscar', 'Hernandez', '1979-05-30', 'V21333444', 'Carro Hyundai Accent placa B789', 'Activo'),
(13, 'repartidor013', '04128889900', '2024-08-09', 'paola.jimenez13@gmail.com', 'Paola', 'Jimenez', '1994-10-07', 'E22555666', 'Moto Yamaha R1 placa C789', 'Activo'),
(14, 'repartidor014', '04140001122', '2023-12-01', 'raul.morales14@gmail.com', 'Raul', 'Morales', '1986-07-22', 'V23777888', 'Bicicleta Plegable', 'Inactivo'),
(15, 'repartidor015', '04241112233', '2025-05-11', 'sofia.perez15@gmail.com', 'Sofia', 'Perez', '1997-03-04', 'E24999000', 'Carro Renault Twingo placa A475', 'Activo'),
(16, 'repartidor016', '04163334455', '2024-09-25', 'tomas.rodriguez16@gmail.com', 'Tomas', 'Rodriguez', '1981-09-19', 'V25111222', 'Moto Haojue hj150 placa B475', 'Activo'),
(17, 'repartidor017', '04125556677', '2023-02-14', 'ursula.gonzalez17@gmail.com', 'Ursula', 'Gonzalez', '1990-11-25', 'E26333444', 'Bicicleta de Carga placa C6523', 'Inactivo'),
(18, 'clave018', '04240003333', '2024-04-13', 'javier.soto18@gmail.com', 'Javier', 'Soto', '1979-05-25', 'V27000133', 'Automóvil Fiat Palio placa A3840', 'Activo'),
(19, 'clave019', '04160004444', '2021-07-13', 'sofia.martin19@gmail.com', 'Sofia', 'Martin', '2025-07-13', 'V28000144', 'Bicicleta de Ruta Specialized', 'Inactivo'),
(20, 'clave020', '04240005555', '2022-03-13', 'david.rojas20@gmail.com', 'David', 'Rojas', '1991-01-09', 'V29090155', 'Moto Honda placa C6430202', 'Activo');

INSERT INTO Pedido (id, cantidad_items, costo_envio, nota, tiempo_entrega, total) VALUES
(1, 8, 7.62, 'Añadir cubiertos extra', 45, 107.62),
(2, 5, 5.17, 'Sin nota', 33, 65.17),
(3, 7, 8.95, 'Llamar al llegar', 58, 98.95),
(4, 2, 4.31, 'Sin nota', 28, 24.31),
(5, 9, 9.88, 'Dejar con el vecino', 51, 129.88),
(6, 6, 6.04, 'Sin nota', 39, 78.04),
(7, 4, 3.29, 'Sin nota', 30, 43.29),
(8, 10, 8.11, 'Incluir servilletas', 55, 138.11),
(9, 3, 2.76, 'Sin nota', 25, 32.76),
(10, 7, 7.01, 'No tocar timbre', 48, 97.01),
(11, 5, 5.50, 'Sin nota', 35, 65.50),
(12, 8, 9.12, 'Entregar al conserje', 52, 109.12),
(13, 2, 3.80, 'Sin nota', 27, 23.80),
(14, 6, 6.75, 'Sin nota', 41, 78.75),
(15, 9, 9.20, 'Pedido urgente', 59, 129.20),
(16, 4, 4.00, 'Sin nota', 32, 44.00),
(17, 7, 8.05, 'Entrega en la recepción', 49, 98.05),
(18, 3, 2.99, 'Sin nota', 26, 32.99),
(19, 10, 7.80, 'Añadir cubiertos extra', 56, 137.80),
(20, 5, 5.65, 'Sin nota', 34, 65.65),
(21, 8, 8.70, 'Dejar en la entrada', 53, 108.70),
(22, 2, 4.10, 'Sin nota', 29, 24.10),
(23, 6, 6.25, 'Sin nota', 40, 78.25),
(24, 9, 9.55, 'Comida caliente, por favor', 57, 129.55),
(25, 4, 3.70, 'Sin nota', 31, 43.70),
(26, 7, 7.45, 'Pedido grande, cuidado', 46, 97.45),
(27, 3, 2.50, 'Sin nota', 24, 32.50),
(28, 10, 9.00, 'Entregar personalmente', 60, 139.00),
(29, 5, 5.90, 'Sin nota', 36, 65.90),
(30, 8, 8.40, 'No molestar al perro', 50, 108.40),
(31, 2, 3.50, 'Sin nota', 22, 23.50),
(32, 6, 6.80, 'Sin nota', 42, 78.80),
(33, 9, 9.99, 'Verificar dirección', 54, 129.99),
(34, 4, 3.15, 'Sin nota', 23, 43.15),
(35, 7, 7.90, 'Entrega programada', 47, 97.90),
(36, 3, 2.80, 'Sin nota', 21, 32.80),
(37, 10, 8.50, 'Dejar con el recepcionista', 58, 138.50),
(38, 5, 5.00, 'Sin nota', 38, 65.00),
(39, 8, 9.30, 'Recoger efectivo', 55, 109.30),
(40, 2, 4.40, 'Sin nota', 30, 24.40),
(41, 6, 6.50, 'Sin nota', 44, 78.50),
(42, 9, 9.75, 'Llamar 5 minutos antes', 59, 129.75),
(43, 4, 3.90, 'Sin nota', 25, 43.90),
(44, 7, 7.20, 'Pago en efectivo', 50, 97.20),
(45, 3, 2.60, 'Sin nota', 26, 32.60),
(46, 10, 8.80, 'Solo entregar al titular', 57, 138.80),
(47, 5, 5.25, 'Sin nota', 37, 65.25),
(48, 8, 8.10, 'Pedido delicado', 52, 108.10),
(49, 2, 4.00, 'Sin nota', 29, 24.00),
(50, 6, 6.10, 'Sin nota', 41, 78.10),
(51, 9, 9.40, 'Entregar antes de las 3pm', 56, 129.40),
(52, 4, 3.60, 'Sin nota', 33, 43.60),
(53, 7, 7.70, 'Dejar sobre la mesa de la entrada', 48, 97.70),
(54, 3, 2.40, 'Sin nota', 20, 32.40),
(55, 10, 8.90, 'Entrega en la recepción', 59, 138.90),
(56, 5, 5.80, 'Sin nota', 39, 65.80),
(57, 8, 8.30, 'Con bebida extra', 54, 108.30),
(58, 2, 3.40, 'Sin nota', 23, 23.40),
(59, 6, 6.90, 'Sin nota', 40, 78.90),
(60, 9, 9.10, 'Pedido urgente', 51, 129.10),
(61, 4, 3.00, 'Sin nota', 21, 43.00),
(62, 7, 7.10, 'Pedido para oficina', 45, 97.10),
(63, 3, 2.30, 'Sin nota', 22, 32.30),
(64, 10, 8.60, 'Pago en efectivo', 58, 138.60),
(65, 5, 5.40, 'Sin nota', 35, 65.40),
(66, 8, 9.60, 'No doblar el recibo', 53, 109.60),
(67, 2, 4.20, 'Sin nota', 28, 24.20),
(68, 6, 6.30, 'Sin nota', 42, 78.30),
(69, 9, 9.35, 'Con salsa adicional', 57, 129.35),
(70, 4, 3.85, 'Sin nota', 31, 43.85),
(71, 7, 7.55, 'Contactar si hay retraso', 49, 97.55),
(72, 3, 2.75, 'Sin nota', 24, 32.75),
(73, 10, 8.20, 'Dejar el pedido en la puerta', 56, 138.20),
(74, 5, 5.75, 'Sin nota', 36, 65.75),
(75, 8, 8.65, 'Revisar la dirección dos veces', 50, 108.65),
(76, 2, 3.95, 'Sin nota', 27, 23.95),
(77, 6, 6.45, 'Sin nota', 43, 78.45),
(78, 9, 9.05, 'Pedido para un evento', 55, 129.05),
(79, 4, 3.20, 'Sin nota', 20, 43.20),
(80, 7, 7.30, 'Llamar al llegar al edificio', 47, 97.30),
(81, 3, 2.90, 'Sin nota', 25, 32.90),
(82, 10, 8.75, 'No tocar el timbre, llamar al teléfono', 60, 138.75),
(83, 5, 5.10, 'Sin nota', 34, 65.10),
(84, 8, 9.45, 'Asegurarse que la bebida esté fría', 52, 109.45),
(85, 2, 4.05, 'Sin nota', 29, 24.05),
(86, 6, 6.00, 'Sin nota', 38, 78.00),
(87, 9, 9.65, 'Cuidado con el empaque', 59, 129.65),
(88, 4, 3.30, 'Sin nota', 26, 43.30),
(89, 7, 7.85, 'Entregar antes de las 9pm', 51, 97.85),
(90, 3, 2.65, 'Sin nota', 21, 32.65),
(91, 10, 8.95, 'Dejar en la recepción del gimnasio', 53, 138.95),
(92, 5, 5.35, 'Sin nota', 32, 65.35),
(93, 8, 8.00, 'Con comprobante de entrega', 56, 108.00),
(94, 2, 4.15, 'Sin nota', 30, 24.15),
(95, 6, 6.20, 'Sin nota', 40, 78.20),
(96, 9, 9.25, 'Para cumpleaños, urgente', 58, 129.25),
(97, 4, 3.45, 'Sin nota', 24, 43.45),
(98, 7, 7.00, 'Verificar contenido del paquete', 46, 97.00),
(99, 3, 2.55, 'Sin nota', 22, 32.55),
(100, 10, 9.00, 'Entrega en la oficina principal', 60, 139.00),
(101, 8, 7.50, 'Con recibo detallado', 44, 107.50),
(102, 5, 5.05, 'Sin nota', 31, 65.05),
(103, 7, 8.80, 'Entrega silenciosa', 57, 98.80),
(104, 2, 4.25, 'Sin nota', 27, 24.25),
(105, 9, 9.70, 'Llamar 5 min antes de llegar', 50, 129.70),
(106, 6, 6.15, 'Sin nota', 39, 78.15),
(107, 4, 3.35, 'Sin nota', 25, 43.35),
(108, 10, 8.45, 'Añadir cubiertos extra', 55, 138.45),
(109, 3, 2.85, 'Sin nota', 23, 32.85),
(110, 7, 7.95, 'Dejar junto a la puerta trasera', 48, 97.95),
(111, 5, 5.60, 'Sin nota', 36, 65.60),
(112, 8, 9.15, 'Con mensaje personalizado', 52, 109.15),
(113, 2, 3.75, 'Sin nota', 26, 23.75),
(114, 6, 6.85, 'Sin nota', 41, 78.85),
(115, 9, 9.90, 'Regalo, no dañar el paquete', 59, 129.90),
(116, 4, 3.99, 'Sin nota', 32, 43.99),
(117, 7, 7.15, 'Para evento especial', 49, 97.15),
(118, 3, 2.00, 'Sin nota', 20, 32.00),
(119, 10, 8.35, 'Entregar al primer piso', 54, 138.35),
(120, 5, 5.95, 'Sin nota', 35, 65.95),
(121, 8, 8.25, 'Verificar identidad', 51, 108.25),
(122, 2, 3.05, 'Sin nota', 22, 23.05),
(123, 6, 6.70, 'Sin nota', 40, 78.70),
(124, 9, 9.50, 'Confirmar llegada por teléfono', 56, 129.50),
(125, 4, 3.10, 'Sin nota', 28, 43.10),
(126, 7, 7.40, 'Entrega en horario de almuerzo', 45, 97.40),
(127, 3, 2.20, 'Sin nota', 21, 32.20),
(128, 10, 8.05, 'Para el gerente', 58, 138.05),
(129, 5, 5.55, 'Sin nota', 33, 65.55),
(130, 8, 9.20, 'Con hielo adicional', 55, 109.20),
(131, 2, 4.30, 'Sin nota', 29, 24.30),
(132, 6, 6.00, 'Sin nota', 42, 78.00),
(133, 9, 9.30, 'Entregar con guantes', 57, 129.30),
(134, 4, 3.50, 'Sin nota', 30, 43.50),
(135, 7, 7.60, 'No despertar al bebé', 47, 97.60),
(136, 3, 2.90, 'Sin nota', 24, 32.90),
(137, 10, 8.80, 'Incluir 5 vasos de plástico', 59, 138.80),
(138, 5, 5.20, 'Sin nota', 37, 65.20),
(139, 8, 8.50, 'Incluir servilletas', 53, 108.50),
(140, 2, 3.60, 'Sin nota', 25, 23.60),
(141, 6, 6.95, 'Sin nota', 44, 78.95),
(142, 9, 9.75, 'Asegurar que la caja no se voltee', 60, 129.75),
(143, 4, 3.00, 'Sin nota', 26, 43.00),
(144, 7, 7.30, 'Llamar al teléfono antes', 48, 97.30),
(145, 3, 2.10, 'Sin nota', 21, 32.10),
(146, 10, 8.40, 'Recoger pago con tarjeta', 52, 138.40),
(147, 5, 5.70, 'Sin nota', 38, 65.70),
(148, 8, 8.15, 'Entrega en el mostrador', 50, 108.15),
(149, 2, 4.00, 'Sin nota', 23, 24.00),
(150, 6, 6.50, 'Sin nota', 39, 78.50);

INSERT INTO ClientePedido (idCliente, idPedido, fecha) VALUES
(14, 1, '2024-11-20'),
(28, 2, '2024-03-23'),
(72, 3, '2024-08-10'),
(95, 4, '2025-01-05'),
(26, 5, '2023-09-01'),
(13, 6, '2024-06-18'),
(86, 7, '2025-02-14'),
(97, 8, '2023-11-11'),
(100, 9, '2024-05-07'),
(92, 10, '2025-04-29'),
(23, 11, '2023-08-20'),
(24, 12, '2024-01-15'),
(30, 13, '2025-03-01'),
(98, 14, '2023-10-05'),
(94, 15, '2024-07-22'),
(49, 16, '2025-06-10'),
(79, 17, '2023-12-03'),
(69, 18, '2024-04-28'),
(17, 19, '2025-07-01'),
(88, 20, '2023-07-15'),
(45, 21, '2024-02-09'),
(67, 22, '2025-05-18'),
(54, 23, '2023-09-29'),
(61, 24, '2024-09-06'),
(12, 25, '2025-01-27'),
(11, 26, '2023-10-18'),
(74, 27, '2024-03-02'),
(82, 28, '2025-07-15'),
(99, 29, '2023-07-28'),
(48, 30, '2024-12-01'),
(6, 31, '2025-04-10'),
(89, 32, '2023-11-25'),
(83, 33, '2024-08-19'),
(80, 34, '2025-02-28'),
(77, 35, '2023-09-14'),
(47, 36, '2024-01-01'),
(87, 37, '2025-06-20'),
(75, 38, '2023-12-10'),
(34, 39, '2024-05-15'),
(90, 40, '2025-03-09'),
(76, 41, '2023-08-05'),
(57, 42, '2024-02-22'),
(96, 43, '2025-01-01'),
(91, 44, '2023-10-25'),
(15, 45, '2024-07-03'),
(1, 46, '2025-05-01'),
(59, 47, '2023-11-08'),
(52, 48, '2024-04-17'),
(66, 49, '2025-02-05'),
(27, 50, '2023-07-20'),
(56, 51, '2024-10-09'),
(44, 52, '2025-01-19'),
(8, 53, '2023-09-07'),
(60, 54, '2024-06-25'),
(38, 55, '2025-04-20'),
(4, 56, '2023-12-19'),
(32, 57, '2024-08-01'),
(2, 58, '2025-03-15'),
(51, 59, '2023-10-10'),
(78, 60, '2024-05-29'),
(37, 61, '2025-07-10'),
(65, 62, '2023-08-12'),
(5, 63, '2024-03-10'),
(9, 64, '2025-01-22'),
(20, 65, '2023-09-20'),
(35, 66, '2024-11-05'),
(31, 67, '2025-06-01'),
(55, 68, '2023-11-30'),
(63, 69, '2024-04-05'),
(46, 70, '2025-02-12'),
(16, 71, '2023-07-05'),
(43, 72, '2024-09-12'),
(10, 73, '2025-03-25'),
(68, 74, '2023-10-30'),
(39, 75, '2024-07-14'),
(21, 76, '2025-05-09'),
(19, 77, '2023-12-25'),
(84, 78, '2024-01-29'),
(70, 79, '2025-06-28'),
(50, 80, '2023-09-03'),
(7, 81, '2024-10-22'),
(42, 82, '2025-04-01'),
(36, 83, '2023-08-27'),
(62, 84, '2024-03-05'),
(33, 85, '2025-01-10'),
(25, 86, '2023-11-18'),
(29, 87, '2024-07-08'),
(71, 88, '2025-05-20'),
(40, 89, '2023-12-08'),
(85, 90, '2024-02-19'),
(18, 91, '2025-07-05'),
(53, 92, '2023-07-18'),
(93, 93, '2024-11-13'),
(22, 94, '2025-04-25'),
(3, 95, '2023-09-10'),
(41, 96, '2024-06-03'),
(73, 97, '2025-01-08'),
(64, 98, '2023-10-01'),
(58, 99, '2024-05-20'),
(4, 100, '2025-03-01'),
(14, 101, '2024-11-20'),
(28, 102, '2024-03-23'),
(72, 103, '2024-08-10'),
(95, 104, '2025-01-05'),
(26, 105, '2023-09-01'),
(13, 106, '2024-06-18'),
(86, 107, '2025-02-14'),
(97, 108, '2023-11-11'),
(100, 109, '2024-05-07'),
(92, 110, '2025-04-29'),
(23, 111, '2023-08-20'),
(24, 112, '2024-01-15'),
(30, 113, '2025-03-01'),
(98, 114, '2023-10-05'),
(94, 115, '2024-07-22'),
(49, 116, '2025-06-10'),
(79, 117, '2023-12-03'),
(69, 118, '2024-04-28'),
(17, 119, '2025-07-01'),
(88, 120, '2023-07-15'),
(45, 121, '2024-02-09'),
(67, 122, '2025-05-18'),
(54, 123, '2023-09-29'),
(61, 124, '2024-09-06'),
(12, 125, '2025-01-27'),
(11, 126, '2023-10-18'),
(74, 127, '2024-03-02'),
(82, 128, '2025-07-15'),
(99, 129, '2023-07-28'),
(48, 130, '2024-12-01'),
(6, 131, '2025-04-10'),
(89, 132, '2023-11-25'),
(83, 133, '2024-08-19'),
(80, 134, '2025-02-28'),
(77, 135, '2023-09-14'),
(47, 136, '2024-01-01'),
(87, 137, '2025-06-20'),
(75, 138, '2023-12-10'),
(34, 139, '2024-05-15'),
(90, 140, '2025-03-09'),
(76, 141, '2023-08-05'),
(57, 142, '2024-02-22'),
(96, 143, '2025-01-01'),
(91, 144, '2023-10-25'),
(15, 145, '2024-07-03'),
(1, 146, '2025-05-01'),
(59, 147, '2023-11-08'),
(52, 148, '2024-04-17'),
(66, 149, '2025-02-05'),
(27, 150, '2023-07-20');

INSERT INTO Factura (numero, fecha_emision, sub_total, porcentajeIva, montoIva, monto_total, idPedido) VALUES
(1, '2023-07-16', 85.50, 16.00, 13.68, 99.18, 1),
(2, '2023-07-17', 120.00, 16.00, 19.20, 139.20, 2),
(3, '2023-07-18', 45.75, 16.00, 7.32, 53.07, 3),
(4, '2023-07-19', 200.25, 16.00, 32.04, 232.29, 4),
(5, '2023-07-20', 70.00, 16.00, 11.20, 81.20, 5),
(6, '2023-07-21', 95.00, 16.00, 15.20, 110.20, 6),
(7, '2023-07-22', 150.00, 16.00, 24.00, 174.00, 7),
(8, '2023-07-23', 30.00, 16.00, 4.80, 34.80, 8),
(9, '2023-07-24', 180.50, 16.00, 28.88, 209.38, 9),
(10, '2023-07-25', 62.50, 16.00, 10.00, 72.50, 10),
(11, '2023-07-26', 110.00, 16.00, 17.60, 127.60, 11),
(12, '2023-07-27', 75.00, 16.00, 12.00, 87.00, 12),
(13, '2023-07-28', 130.00, 16.00, 20.80, 150.80, 13),
(14, '2023-07-29', 55.00, 16.00, 8.80, 63.80, 14),
(15, '2023-07-30', 90.00, 16.00, 14.40, 104.40, 15),
(16, '2023-07-31', 170.00, 16.00, 27.20, 197.20, 16),
(17, '2023-08-01', 40.00, 16.00, 6.40, 46.40, 17),
(18, '2023-08-02', 105.00, 16.00, 16.80, 121.80, 18),
(19, '2023-08-03', 80.00, 16.00, 12.80, 92.80, 19),
(20, '2023-08-04', 140.00, 16.00, 22.40, 162.40, 20),
(21, '2023-08-05', 60.00, 16.00, 9.60, 69.60, 21),
(22, '2023-08-06', 115.00, 16.00, 18.40, 133.40, 22),
(23, '2023-08-07', 88.00, 16.00, 14.08, 102.08, 23),
(24, '2023-08-08', 190.00, 16.00, 30.40, 220.40, 24),
(25, '2023-08-09', 72.00, 16.00, 11.52, 83.52, 25),
(26, '2023-08-10', 125.00, 16.00, 20.00, 145.00, 26),
(27, '2023-08-11', 50.00, 16.00, 8.00, 58.00, 27),
(28, '2023-08-12', 160.00, 16.00, 25.60, 185.60, 28),
(29, '2023-08-13', 65.00, 16.00, 10.40, 75.40, 29),
(30, '2023-08-14', 100.00, 16.00, 16.00, 116.00, 30),
(31, '2023-08-15', 82.00, 16.00, 13.12, 95.12, 31),
(32, '2023-08-16', 175.00, 16.00, 28.00, 203.00, 32),
(33, '2023-08-17', 48.00, 16.00, 7.68, 55.68, 33),
(34, '2023-08-18', 135.00, 16.00, 21.60, 156.60, 34),
(35, '2023-08-19', 93.00, 16.00, 14.88, 107.88, 35),
(36, '2023-08-20', 210.00, 16.00, 33.60, 243.60, 36),
(37, '2023-08-21', 78.00, 16.00, 12.48, 90.48, 37),
(38, '2023-08-22', 118.00, 16.00, 18.88, 136.88, 38),
(39, '2023-08-23', 85.00, 16.00, 13.60, 98.60, 39),
(40, '2023-08-24', 155.00, 16.00, 24.80, 179.80, 40),
(41, '2023-08-25', 52.00, 16.00, 8.32, 60.32, 41),
(42, '2023-08-26', 165.00, 16.00, 26.40, 191.40, 42),
(43, '2023-08-27', 70.00, 16.00, 11.20, 81.20, 43),
(44, '2023-08-28', 122.00, 16.00, 19.52, 141.52, 44),
(45, '2023-08-29', 90.00, 16.00, 14.40, 104.40, 45),
(46, '2023-08-30', 185.00, 16.00, 29.60, 214.60, 46),
(47, '2023-08-31', 42.00, 16.00, 6.72, 48.72, 47),
(48, '2023-09-01', 108.00, 16.00, 17.28, 125.28, 48),
(49, '2023-09-02', 83.00, 16.00, 13.28, 96.28, 49),
(50, '2023-09-03', 145.00, 16.00, 23.20, 168.20, 50),
(51, '2023-09-04', 68.00, 16.00, 10.88, 78.88, 51),
(52, '2023-09-05', 112.00, 16.00, 17.92, 129.92, 52),
(53, '2023-09-06', 95.00, 16.00, 15.20, 110.20, 53),
(54, '2023-09-07', 205.00, 16.00, 32.80, 237.80, 54),
(55, '2023-09-08', 75.00, 16.00, 12.00, 87.00, 55),
(56, '2023-09-09', 130.00, 16.00, 20.80, 150.80, 56),
(57, '2023-09-10', 58.00, 16.00, 9.28, 67.28, 57),
(58, '2023-09-11', 170.00, 16.00, 27.20, 197.20, 58),
(59, '2023-09-12', 62.00, 16.00, 9.92, 71.92, 59),
(60, '2023-09-13', 105.00, 16.00, 16.80, 121.80, 60),
(61, '2023-09-14', 88.00, 16.00, 14.08, 102.08, 61),
(62, '2023-09-15', 180.00, 16.00, 28.80, 208.80, 62),
(63, '2023-09-16', 45.00, 16.00, 7.20, 52.20, 63),
(64, '2023-09-17', 115.00, 16.00, 18.40, 133.40, 64),
(65, '2023-09-18', 79.00, 16.00, 12.64, 91.64, 65),
(66, '2023-09-19', 150.00, 16.00, 24.00, 174.00, 66),
(67, '2023-09-20', 60.00, 16.00, 9.60, 69.60, 67),
(68, '2023-09-21', 140.00, 16.00, 22.40, 162.40, 68),
(69, '2023-09-22', 92.00, 16.00, 14.72, 106.72, 69),
(70, '2023-09-23', 220.00, 16.00, 35.20, 255.20, 70),
(71, '2023-09-24', 70.00, 16.00, 11.20, 81.20, 71),
(72, '2023-09-25', 128.00, 16.00, 20.48, 148.48, 72),
(73, '2023-09-26', 85.00, 16.00, 13.60, 98.60, 73),
(74, '2023-09-27', 195.00, 16.00, 31.20, 226.20, 74),
(75, '2023-09-28', 55.00, 16.00, 8.80, 63.80, 75),
(76, '2023-09-29', 160.00, 16.00, 25.60, 185.60, 76),
(77, '2023-09-30', 65.00, 16.00, 10.40, 75.40, 77),
(78, '2023-10-01', 110.00, 16.00, 17.60, 127.60, 78),
(79, '2023-10-02', 80.00, 16.00, 12.80, 92.80, 79),
(80, '2023-10-03', 175.00, 16.00, 28.00, 203.00, 80),
(81, '2023-10-04', 40.00, 16.00, 6.40, 46.40, 81),
(82, '2023-10-05', 135.00, 16.00, 21.60, 156.60, 82),
(83, '2023-10-06', 98.00, 16.00, 15.68, 113.68, 83),
(84, '2023-10-07', 200.00, 16.00, 32.00, 232.00, 84),
(85, '2023-10-08', 72.00, 16.00, 11.52, 83.52, 85),
(86, '2023-10-09', 120.00, 16.00, 19.20, 139.20, 86),
(87, '2023-10-10', 50.00, 16.00, 8.00, 58.00, 87),
(88, '2023-10-11', 140.00, 16.00, 22.40, 162.40, 88),
(89, '2023-10-12', 60.00, 16.00, 9.60, 69.60, 89),
(90, '2023-10-13', 100.00, 16.00, 16.00, 116.00, 90),
(91, '2023-10-14', 85.00, 16.00, 13.60, 98.60, 91),
(92, '2023-10-15', 150.00, 16.00, 24.00, 174.00, 92),
(93, '2023-10-16', 45.00, 16.00, 7.20, 52.20, 93),
(94, '2023-10-17', 115.00, 16.00, 18.40, 133.40, 94),
(95, '2023-10-18', 78.00, 16.00, 12.48, 90.48, 95),
(96, '2023-10-19', 190.00, 16.00, 30.40, 220.40, 96),
(97, '2023-10-20', 68.00, 16.00, 10.88, 78.88, 97),
(98, '2023-10-21', 125.00, 16.00, 20.00, 145.00, 98),
(99, '2023-10-22', 93.00, 16.00, 14.88, 107.88, 99),
(100, '2023-10-23', 210.00, 16.00, 33.60, 243.60, 100),
(101, '2024-01-01', 50.00, 16.00, 8.00, 58.00, 101),
(102, '2024-01-05', 120.00, 16.00, 19.20, 139.20, 102),
(103, '2024-01-10', 75.00, 16.00, 12.00, 87.00, 103),
(104, '2024-01-15', 180.00, 16.00, 28.80, 208.80, 104),
(105, '2024-01-20', 60.00, 16.00, 9.60, 69.60, 105),
(106, '2024-01-25', 140.00, 16.00, 22.40, 162.40, 106),
(107, '2024-01-30', 90.00, 16.00, 14.40, 104.40, 107),
(108, '2024-02-04', 200.00, 16.00, 32.00, 232.00, 108),
(109, '2024-02-09', 65.00, 16.00, 10.40, 75.40, 109),
(110, '2024-02-14', 110.00, 16.00, 17.60, 127.60, 110),
(111, '2024-02-19', 85.00, 16.00, 13.60, 98.60, 111),
(112, '2024-02-24', 160.00, 16.00, 25.60, 185.60, 112),
(113, '2024-02-29', 48.00, 16.00, 7.68, 55.68, 113),
(114, '2024-03-05', 130.00, 16.00, 20.80, 150.80, 114),
(115, '2024-03-10', 95.00, 16.00, 15.20, 110.20, 115),
(116, '2024-03-15', 215.00, 16.00, 34.40, 249.40, 116),
(117, '2024-03-20', 70.00, 16.00, 11.20, 81.20, 117),
(118, '2024-03-25', 125.00, 16.00, 20.00, 145.00, 118),
(119, '2024-03-30', 80.00, 16.00, 12.80, 92.80, 119),
(120, '2024-04-04', 170.00, 16.00, 27.20, 197.20, 120),
(121, '2024-04-09', 55.00, 16.00, 8.80, 63.80, 121),
(122, '2024-04-14', 150.00, 16.00, 24.00, 174.00, 122),
(123, '2024-04-19', 62.00, 16.00, 9.92, 71.92, 123),
(124, '2024-04-24', 105.00, 16.00, 16.80, 121.80, 124),
(125, '2024-04-29', 98.00, 16.00, 15.68, 113.68, 125),
(126, '2024-05-04', 190.00, 16.00, 30.40, 220.40, 126),
(127, '2024-05-09', 75.00, 16.00, 12.00, 87.00, 127),
(128, '2024-05-14', 135.00, 16.00, 21.60, 156.60, 128),
(129, '2024-05-19', 88.00, 16.00, 14.08, 102.08, 129),
(130, '2024-05-24', 200.00, 16.00, 32.00, 232.00, 130),
(131, '2024-05-29', 42.00, 16.00, 6.72, 48.72, 131),
(132, '2024-06-03', 112.00, 16.00, 17.92, 129.92, 132),
(133, '2024-06-08', 70.00, 16.00, 11.20, 81.20, 133),
(134, '2024-06-13', 145.00, 16.00, 23.20, 168.20, 134),
(135, '2024-06-18', 60.00, 16.00, 9.60, 69.60, 135),
(136, '2024-06-23', 100.00, 16.00, 16.00, 116.00, 136),
(137, '2024-06-28', 85.00, 16.00, 13.60, 98.60, 137),
(138, '2024-07-03', 150.00, 16.00, 24.00, 174.00, 138),
(139, '2024-07-08', 45.00, 16.00, 7.20, 52.20, 139),
(140, '2024-07-13', 115.00, 16.00, 18.40, 133.40, 140),
(141, '2024-07-18', 78.00, 16.00, 12.48, 90.48, 141),
(142, '2024-07-23', 190.00, 16.00, 30.40, 220.40, 142),
(143, '2024-07-28', 68.00, 16.00, 10.88, 78.88, 143),
(144, '2024-08-02', 125.00, 16.00, 20.00, 145.00, 144),
(145, '2024-08-07', 93.00, 16.00, 14.88, 107.88, 145),
(146, '2024-08-12', 210.00, 16.00, 33.60, 243.60, 146),
(147, '2024-08-17', 50.00, 16.00, 8.00, 58.00, 147),
(148, '2024-08-22', 120.00, 16.00, 19.20, 139.20, 148),
(149, '2024-08-27', 75.00, 16.00, 12.00, 87.00, 149),
(150, '2024-09-01', 180.00, 16.00, 28.80, 208.80, 150);


INSERT INTO ClienteRepartidor (idCliente, idRepartidor, fecha, puntaje, comentario) VALUES
(1, 1, '2025-07-10', 5, 'Excelente servicio, muy rápido y amable.'),
(2, 3, '2024-06-25', 4, 'Entrega puntual, todo en orden.'),
(3, 4, '2025-01-15', 5, 'Muy profesional, la comida llegó perfecta.'),
(4, 6, '2024-03-01', 3, 'La entrega fue un poco tardía, pero llegó bien.'),
(5, 7, '2025-05-20', 5, 'Siempre eficiente y con buena disposición.'),
(6, 9, '2024-08-05', 4, 'Buen repartidor, sin problemas.'),
(7, 10, '2025-02-28', 5, 'Rapidez y amabilidad, un 10.'),
(8, 12, '2024-11-12', 4, 'Todo correcto, buena comunicación.'),
(9, 13, '2025-04-03', 5, 'Servicio impecable, muy atento.'),
(10, 15, '2024-02-09', 1, 'Demoró un poco más de lo esperado y la comida llego fria'),
(11, 16, '2025-06-01', 5, 'Increíble, superó mis expectativas.'),
(12, 18, '2024-09-17', 4, 'La entrega fue como se esperaba.'),
(13, 20, '2025-03-10', 5, 'Repartidor muy educado y rápido.'),
(14, 1, '2024-12-01', 4, 'Buena experiencia, repetiría.'),
(15, 3, '2025-07-05', 5, 'Simplemente perfecto.'),
(16, 4, '2023-05-19', 3, 'Algunos problemas con la dirección, pero se solucionó.'),
(17, 6, '2025-01-22', 5, 'Entrega muy profesional, packaging intacto.'),
(18, 7, '2024-07-30', 4, 'Llegó en el tiempo estimado.'),
(19, 9, '2025-06-10', 5, 'Siempre confío en este repartidor, excelente.'),
(20, 10, '2023-08-14', 4, 'Cumplió con todo lo acordado.'),
(21, 12, '2025-02-01', 5, 'Muy buena actitud y servicio.'),
(22, 13, '2024-04-20', 3, 'La ruta fue un poco confusa.'),
(23, 15, '2025-07-14', 5, 'No puedo pedir más, fue genial.'),
(24, 16, '2023-10-05', 4, 'Repartidor eficiente y cuidadoso.'),
(25, 18, '2025-03-25', 5, 'Una entrega impecable.'),
(26, 20, '2024-01-01', 4, 'Todo bien, llegó sin problemas.'),
(27, 1, '2025-05-08', 5, 'El mejor repartidor que me ha tocado.'),
(28, 3, '2023-07-07', 3, 'Se equivocó de piso, pero lo corrigió.'),
(29, 4, '2025-07-01', 5, 'Super rápido y muy atento.'),
(30, 6, '2024-05-11', 4, 'Entrega correcta y a tiempo.'),
(31, 7, '2025-01-30', 5, 'Un servicio de primera, lo recomiendo.'),
(32, 9, '2023-09-02', 4, 'Amable y la entrega fue rápida.'),
(33, 10, '2025-04-18', 5, 'Increíble, mi pedido en minutos.'),
(34, 12, '2024-02-29', 3, 'Hubo un pequeño retraso, pero avisó.'),
(35, 13, '2025-07-08', 5, 'Siempre confiable y profesional.'),
(36, 15, '2023-11-11', 4, 'La entrega fue fluida y sin contratiempos.'),
(37, 16, '2025-06-15', 5, 'Absolutamente satisfecho con el servicio.'),
(38, 18, '2024-03-07', 4, 'Buen trabajo, ninguna queja.'),
(39, 20, '2025-07-02', 5, 'Simplemente excelente, volvería a pedir.'),
(40, 1, '2023-01-28', 4, 'Cumplió con las expectativas.');

INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato) VALUES
-- Pedido 1 (8 items)
(1, 2, 'Sin cebolla por favor', 37.00, 1, 1),
(2, 1, 'Extra picante', 22.00, 1, 2),
(3, 1, 'Sin Nota', 8.00, 1, 3),
(4, 2, 'Sin Nota', 10.00, 1, 4),
(5, 1, 'Para llevar', 12.00, 1, 5),
(6, 1, 'Sin Nota', 3.50, 1, 6),

-- Pedido 2 (5 items)
(7, 1, 'Sin gluten', 18.50, 2, 1),
(8, 2, 'Bien cocido', 44.00, 2, 2),
(9, 1, 'Sin Nota', 8.00, 2, 3),
(10, 1, 'Sin Nota', 5.00, 2, 4),

-- Pedido 3 (7 items)
(11, 1, 'Sin salsa', 12.00, 3, 5),
(12, 2, 'Sin Nota', 7.00, 3, 6),
(13, 1, 'Sin Nota', 4.00, 3, 7),
(14, 1, 'Extra crujiente', 15.00, 3, 8),
(15, 2, 'Sin Nota', 28.00, 3, 9),

-- Pedido 4 (2 items)
(16, 1, 'Sin Nota', 10.00, 4, 13),
(17, 1, 'Sin picante', 11.50, 4, 14),

-- Pedido 5 (9 items)
(18, 2, 'Extra queso', 28.00, 5, 17),
(19, 1, 'Sin Nota', 10.50, 5, 18),
(20, 2, 'Sin Nota', 14.00, 5, 19),
(21, 1, 'Sin ajo', 16.00, 5, 20),
(22, 3, 'Sin Nota', 51.00, 5, 21),

-- Pedido 6 (6 items)
(23, 1, 'Sin Nota', 15.50, 6, 22),
(24, 2, 'Sin Nota', 8.00, 6, 23),
(25, 1, 'Sin Nota', 3.00, 6, 24),
(26, 1, 'Extra salsa', 8.50, 6, 25),
(27, 1, 'Sin Nota', 16.00, 6, 26),

-- Pedido 7 (4 items)
(28, 1, 'Sin Nota', 9.00, 7, 27),
(29, 1, 'Sin aceitunas', 14.00, 7, 28),
(30, 2, 'Sin Nota', 18.00, 7, 29),

-- Pedido 8 (10 items)
(31, 2, 'Sin Nota', 18.00, 8, 29),
(32, 2, 'Sin Nota', 19.00, 8, 30),
(33, 3, 'Sin Nota', 12.00, 8, 31),
(34, 1, 'Sin Nota', 3.50, 8, 32),
(35, 2, 'Sin Nota', 9.00, 8, 33),

-- Pedido 9 (3 items)
(36, 1, 'Sin Nota', 4.50, 9, 33),
(37, 1, 'Sin Nota', 3.00, 9, 34),
(38, 1, 'Sin Nota', 5.00, 9, 35),

-- Pedido 10 (7 items)
(39, 1, 'Sin Nota', 25.00, 10, 37),
(40, 1, 'Sin Nota', 12.00, 10, 38),
(41, 2, 'Sin Nota', 48.00, 10, 39),
(42, 1, 'Sin Nota', 8.00, 10, 40),
(43, 2, 'Sin Nota', 4.00, 10, 41),

-- Pedido 11 (5 items)
(44, 1, 'Sin Nota', 18.00, 11, 41),
(45, 1, 'Sin Nota', 19.50, 11, 42),
(46, 1, 'Sin Nota', 14.00, 11, 43),
(47, 1, 'Sin Nota', 4.00, 11, 44),
(48, 1, 'Sin Nota', 10.00, 11, 45),

-- Pedido 12 (8 items)
(49, 1, 'Sin Nota', 28.00, 12, 45),
(50, 1, 'Sin Nota', 26.00, 12, 46),
(51, 2, 'Sin Nota', 8.00, 12, 47),
(52, 1, 'Sin Nota', 3.00, 12, 48),
(53, 3, 'Sin Nota', 48.00, 12, 49),

-- Pedido 13 (2 items)
(54, 1, 'Sin Nota', 16.00, 13, 49),
(55, 1, 'Sin Nota', 14.00, 13, 50),

-- Pedido 14 (6 items)
(56, 1, 'Sin Nota', 13.50, 14, 51),
(57, 1, 'Sin Nota', 5.00, 14, 52),
(58, 2, 'Sin Nota', 28.00, 14, 53),
(59, 1, 'Sin Nota', 12.00, 14, 54),
(60, 1, 'Sin Nota', 7.00, 14, 55),

-- Pedido 15 (9 items)
(61, 2, 'Sin Nota', 30.00, 15, 57),
(62, 1, 'Sin Nota', 9.00, 15, 58),
(63, 1, 'Sin Nota', 16.00, 15, 59),
(64, 1, 'Sin Nota', 5.00, 15, 60),
(65, 4, 'Sin Nota', 80.00, 15, 61),

-- Pedido 16 (4 items)
(66, 1, 'Sin Nota', 20.00, 16, 61),
(67, 1, 'Sin Nota', 15.00, 16, 62),
(68, 1, 'Sin Nota', 3.50, 16, 63),
(69, 1, 'Sin Nota', 5.00, 16, 64),

-- Pedido 17 (7 items)
(70, 1, 'Sin Nota', 21.00, 17, 65),
(71, 1, 'Sin Nota', 15.00, 17, 66),
(72, 1, 'Sin Nota', 6.00, 17, 67),
(73, 1, 'Sin Nota', 12.00, 17, 68),
(74, 3, 'Sin Nota', 36.00, 17, 69),

-- Pedido 18 (3 items)
(75, 1, 'Sin Nota', 4.00, 18, 69),
(76, 1, 'Sin Nota', 4.50, 18, 70),
(77, 1, 'Sin Nota', 10.00, 18, 71),

-- Pedido 19 (10 items)
(78, 2, 'Sin Nota', 8.00, 19, 69),
(79, 2, 'Sin Nota', 9.00, 19, 70),
(80, 3, 'Sin Nota', 30.00, 19, 71),
(81, 1, 'Sin Nota', 14.00, 19, 72),
(82, 2, 'Sin Nota', 10.00, 19, 73),

-- Pedido 20 (5 items)
(83, 1, 'Sin Nota', 13.00, 20, 73),
(84, 1, 'Sin Nota', 16.50, 20, 74),
(85, 1, 'Sin Nota', 6.00, 20, 75),
(86, 1, 'Sin Nota', 7.50, 20, 76),
(87, 1, 'Sin Nota', 15.00, 20, 77),
-- Pedido 21 (ID 21 en tabla Pedido: nota 'Sin Nota')
(68, 1, 'Sin Nota', 6.00, 21, 75),

-- Pedido 22 (ID 22 en tabla Pedido: nota 'Sin Nota')
(69, 1, 'Sin Nota', 15.00, 22, 77),

-- Pedido 23 (ID 23 en tabla Pedido: nota "Con opciones adicionales")
(70, 1, 'Sin ajo, Extra pimentón', 7.50, 23, 79),

-- Pedido 24 (ID 24 en tabla Pedido: nota 'Sin Nota')
(71, 1, 'Sin Nota', 14.00, 24, 81),

-- Pedido 25 (ID 25 en tabla Pedido: nota 'Sin Nota')
(72, 1, 'Sin Nota', 6.00, 25, 83),

-- Pedido 26 (ID 26 en tabla Pedido: nota "Con opciones adicionales")
(73, 1, 'Penne, Picante medio', 13.50, 26, 85),

-- Pedido 27 (ID 27 en tabla Pedido: nota 'Sin Nota')
(74, 1, 'Sin Nota', 15.00, 27, 87),

-- Pedido 28 (ID 28 en tabla Pedido: nota 'Sin Nota')
(75, 1, 'Sin Nota', 11.00, 28, 89),

-- Pedido 29 (ID 29 en tabla Pedido: nota "Con opciones adicionales")
(76, 1, 'Extra crema, Pan tostado medio', 10.25, 29, 91),

-- Pedido 30 (ID 30 en tabla Pedido: nota 'Sin Nota')
(77, 1, 'Sin Nota', 17.00, 30, 93),

-- Pedido 31 (ID 31 en tabla Pedido: nota 'Sin Nota')
(78, 1, 'Sin Nota', 5.00, 31, 95),

-- Pedido 32 (ID 32 en tabla Pedido: nota "Con opciones adicionales")
(79, 1, 'Extra vegetales, Término medio', 16.00, 32, 97),

-- Pedido 33 (ID 33 en tabla Pedido: nota 'Sin Nota')
(80, 1, 'Sin Nota', 13.00, 33, 99),

-- Pedido 34 (ID 34 en tabla Pedido: nota 'Sin Nota')
(81, 1, 'Sin Nota', 4.00, 34, 101),

-- Pedido 35 (ID 35 en tabla Pedido: nota "Con opciones adicionales")
(82, 1, 'Extra chocolate, Muy dulce', 7.04, 35, 103),

-- Pedido 36 (ID 36 en tabla Pedido: nota 'Sin Nota')
(83, 1, 'Sin Nota', 16.00, 36, 105),

-- Pedido 37 (ID 37 en tabla Pedido: nota 'Sin Nota')
(84, 1, 'Sin Nota', 10.00, 37, 107),

-- Pedido 38 (ID 38 en tabla Pedido: nota "Con opciones adicionales")
(85, 1, 'Extra queso, Queso cheddar', 13.50, 38, 109),

-- Pedido 39 (ID 39 en tabla Pedido: nota 'Sin Nota')
(86, 1, 'Sin Nota', 6.00, 39, 111),

-- Pedido 40 (ID 40 en tabla Pedido: nota 'Sin Nota')
(87, 1, 'Sin Nota', 35.00, 40, 113);

-- Pedidos 41-60
(88, 1, 'Sin Nota', 18.00, 41, 114),
(89, 1, 'Sin Nota', 7.00, 42, 116),
(90, 1, 'Vegetales extra, Sin sal', 7.00, 43, 116),
(91, 1, 'Sin Nota', 14.00, 44, 117),
(92, 1, 'Sin Nota', 16.00, 45, 118),
(93, 1, 'Borde de queso, Extra picante', 17.50, 46, 118),
(94, 1, 'Sin Nota', 15.00, 47, 119),
(95, 1, 'Sin Nota', 9.00, 48, 120),
(96, 1, 'Base quinoa, Aderezo aparte', 10.25, 49, 120),
(97, 1, 'Sin Nota', 28.00, 50, 45),
(98, 1, 'Sin Nota', 26.00, 51, 46),
(99, 1, 'Arroz integral, Bien cocido', 27.50, 52, 46),
(100, 1, 'Sin Nota', 4.00, 53, 47),
(101, 1, 'Sin Nota', 3.00, 54, 48),
(102, 1, 'Extra chocolate', 3.75, 55, 48),
(103, 1, 'Sin Nota', 16.00, 56, 49),
(104, 1, 'Sin Nota', 14.00, 57, 50),
(105, 1, 'Extra picante, Tofu extra', 15.50, 58, 50),
(106, 1, 'Sin Nota', 13.50, 59, 51),
(107, 1, 'Sin Nota', 5.00, 60, 52);

-- Pedidos 61-80
(108, 1, 'Sin Nota', 14.00, 61, 53),
(109, 1, 'Sin Nota', 12.00, 62, 54),
(110, 1, 'Sin camarones, Extra vegetales', 12.00, 63, 54),
(111, 1, 'Sin Nota', 17.50, 64, 55),
(112, 1, 'Sin Nota', 7.00, 65, 56),
(113, 1, 'Leche de coco extra', 8.00, 66, 56),
(114, 1, 'Sin Nota', 15.00, 67, 57),
(115, 1, 'Sin Nota', 9.00, 68, 58),
(116, 1, 'Sin cerdo, Tofu', 10.00, 69, 58),
(117, 1, 'Sin Nota', 16.00, 70, 59),
(118, 1, 'Sin Nota', 5.00, 71, 60),
(119, 1, 'Leche condensada extra', 6.00, 72, 60),
(120, 1, 'Sin Nota', 20.00, 73, 61),
(121, 1, 'Sin Nota', 15.00, 74, 62),
(122, 1, 'Sin aguacate', 15.00, 75, 62),
(123, 1, 'Sin Nota', 3.50, 76, 63),
(124, 1, 'Sin Nota', 5.00, 77, 64),
(125, 1, 'Extra canela', 5.50, 78, 64),
(126, 1, 'Sin Nota', 21.00, 79, 65),
(127, 1, 'Sin Nota', 15.00, 80, 66);

-- Pedidos 81-100
(128, 1, 'Sin Nota', 6.00, 81, 67),
(129, 1, 'Sin Nota', 12.00, 82, 68),
(130, 1, 'Quinoa extra, Aguacate extra', 14.00, 83, 68),
(131, 1, 'Sin Nota', 4.00, 84, 69),
(132, 1, 'Sin Nota', 4.50, 85, 70),
(133, 1, 'Extra chicharrón', 5.50, 86, 70),
(134, 1, 'Sin Nota', 10.00, 87, 71),
(135, 1, 'Sin Nota', 14.00, 88, 72),
(136, 1, 'Extra carne', 16.00, 89, 72),
(137, 1, 'Sin Nota', 13.00, 90, 73),
(138, 1, 'Sin Nota', 16.50, 91, 74),
(139, 1, 'Sin berenjena', 16.50, 92, 74),
(140, 1, 'Sin Nota', 7.50, 93, 75),
(141, 1, 'Sin Nota', 6.00, 94, 76),
(142, 1, 'Extra miel', 6.75, 95, 76),
(143, 1, 'Sin Nota', 15.00, 96, 77),
(144, 1, 'Sin Nota', 9.00, 97, 78),
(145, 1, 'Extra ajo', 10.00, 98, 78),
(146, 1, 'Sin Nota', 7.00, 99, 79),
(147, 1, 'Sin Nota', 8.00, 100, 80);

-- Pedidos 101-120
(148, 1, 'Sin Nota', 14.00, 101, 81),
(149, 1, 'Sin Nota', 18.00, 102, 82),
(150, 1, 'Término medio, Papas extra', 19.50, 103, 82),
(151, 1, 'Sin Nota', 6.00, 104, 83),
(152, 1, 'Sin Nota', 6.50, 105, 84),
(153, 1, 'Extra helado', 7.50, 106, 84),
(154, 1, 'Sin Nota', 12.00, 107, 85),
(155, 1, 'Sin Nota', 16.00, 108, 86),
(156, 1, 'Pan de arroz integral', 17.00, 109, 86),
(157, 1, 'Sin Nota', 15.00, 110, 87),
(158, 1, 'Sin Nota', 8.00, 111, 88),
(159, 1, 'Extra matcha', 9.00, 112, 88),
(160, 1, 'Sin Nota', 11.00, 113, 89),
(161, 1, 'Sin Nota', 19.00, 114, 90),
(162, 1, 'Sin lácteos', 19.00, 115, 90),
(163, 1, 'Sin Nota', 9.00, 116, 91),
(164, 1, 'Sin Nota', 7.00, 117, 92),
(165, 1, 'Extra jengibre', 8.00, 118, 92),
(166, 1, 'Sin Nota', 17.00, 119, 93),
(167, 1, 'Sin Nota', 12.00, 120, 94);

-- Pedidos 121-150
(168, 1, 'Sin Nota', 5.00, 121, 95),
(169, 1, 'Sin Nota', 18.00, 122, 96),
(170, 1, 'Sin cebolla', 18.00, 123, 96),
(171, 1, 'Sin Nota', 15.00, 124, 97),
(172, 1, 'Sin Nota', 11.00, 125, 98),
(173, 1, 'Extra queso', 12.50, 126, 98),
(174, 1, 'Sin Nota', 13.00, 127, 99),
(175, 1, 'Sin Nota', 10.00, 128, 100),
(176, 1, 'Extra frijoles', 11.50, 129, 100),
(177, 1, 'Sin Nota', 4.00, 130, 101),
(178, 1, 'Sin Nota', 12.00, 131, 102),
(179, 1, 'Queso azul', 13.00, 132, 102),
(180, 1, 'Sin Nota', 6.00, 133, 103),
(181, 1, 'Sin Nota', 7.50, 134, 104),
(182, 1, 'Extra queso', 8.75, 135, 104),
(183, 1, 'Sin Nota', 16.00, 136, 105),
(184, 1, 'Sin Nota', 13.00, 137, 106),
(185, 1, 'Aderezo aparte', 13.00, 138, 106),
(186, 1, 'Sin Nota', 10.00, 139, 107),
(187, 1, 'Sin Nota', 4.00, 140, 108),
(188, 1, 'Sin Nota', 12.00, 141, 109),
(189, 1, 'Sin Nota', 14.00, 142, 110),
(190, 1, 'Puré extra', 15.00, 143, 111),
(191, 1, 'Sin Nota', 7.00, 144, 112),
(192, 1, 'Sin Nota', 35.00, 145, 113),
(193, 1, 'Sin Nota', 29.00, 146, 114),
(194, 1, 'Término medio', 29.00, 147, 114),
(195, 1, 'Sin Nota', 18.00, 148, 115),
(196, 1, 'Sin Nota', 7.00, 149, 116),
(197, 1, 'Sin Nota', 14.00, 150, 117);

INSERT INTO RepartidorPedido (idRepartidor, idPedido, tiempo_entrega) VALUES
(1, 1, 45),
(2, 2, 33),
(3, 3, 58),
(4, 4, 28),
(5, 5, 51),
(6, 6, 39),
(7, 7, 30),
(8, 8, 55),
(9, 9, 25),
(10, 10, 48),
(11, 11, 35),
(12, 12, 52),
(13, 13, 27),
(14, 14, 41),
(15, 15, 59),
(16, 16, 32),
(17, 17, 49),
(18, 18, 26),
(19, 19, 56),
(20, 20, 34),
(1, 21, 53),
(2, 22, 29),
(3, 23, 40),
(4, 24, 57),
(5, 25, 31),
(6, 26, 46),
(7, 27, 24),
(8, 28, 60),
(9, 29, 36),
(10, 30, 50),
(11, 31, 22),
(12, 32, 42),
(13, 33, 54),
(14, 34, 23),
(15, 35, 47),
(16, 36, 21),
(17, 37, 58),
(18, 38, 38),
(19, 39, 55),
(20, 40, 30),
(1, 41, 44),
(2, 42, 59),
(3, 43, 25),
(4, 44, 50),
(5, 45, 26),
(6, 46, 57),
(7, 47, 37),
(8, 48, 52),
(9, 49, 29),
(10, 50, 41),
(11, 51, 56),
(12, 52, 33),
(13, 53, 48),
(14, 54, 20),
(15, 55, 59),
(16, 56, 39),
(17, 57, 54),
(18, 58, 23),
(19, 59, 40),
(20, 60, 51),
(1, 61, 21),
(2, 62, 45),
(3, 63, 22),
(4, 64, 58),
(5, 65, 35),
(6, 66, 53),
(7, 67, 28),
(8, 68, 42),
(9, 69, 57),
(10, 70, 31),
(11, 71, 49),
(12, 72, 24),
(13, 73, 56),
(14, 74, 36),
(15, 75, 50),
(16, 76, 27),
(17, 77, 43),
(18, 78, 55),
(19, 79, 20),
(20, 80, 47),
(1, 81, 25),
(2, 82, 60),
(3, 83, 34),
(4, 84, 52),
(5, 85, 29),
(6, 86, 38),
(7, 87, 59),
(8, 88, 26),
(9, 89, 51),
(10, 90, 21),
(11, 91, 53),
(12, 92, 32),
(13, 93, 56),
(14, 94, 30),
(15, 95, 40),
(16, 96, 58),
(17, 97, 24),
(18, 98, 46),
(19, 99, 22),
(20, 100, 60),
(1, 101, 44),
(2, 102, 31),
(3, 103, 57),
(4, 104, 27),
(5, 105, 50),
(6, 106, 39),
(7, 107, 25),
(8, 108, 55),
(9, 109, 23),
(10, 110, 48),
(11, 111, 36),
(12, 112, 52),
(13, 113, 26),
(14, 114, 41),
(15, 115, 59),
(16, 116, 32),
(17, 117, 49),
(18, 118, 20),
(19, 119, 54),
(20, 120, 35),
(1, 121, 51),
(2, 122, 22),
(3, 123, 40),
(4, 124, 56),
(5, 125, 28),
(6, 126, 45),
(7, 127, 21),
(8, 128, 58),
(9, 129, 33),
(10, 130, 55),
(11, 131, 29),
(12, 132, 42),
(13, 133, 57),
(14, 134, 30),
(15, 135, 47),
(16, 136, 24),
(17, 137, 59),
(18, 138, 37),
(19, 139, 53),
(20, 140, 25),
(1, 141, 44),
(2, 142, 60),
(3, 143, 26),
(4, 144, 48),
(5, 145, 21),
(6, 146, 52),
(7, 147, 38),
(8, 148, 50),
(9, 149, 23),
(10, 150, 39);

INSERT INTO PedidoDetalleOpcionValor (idPedidoDetalle, idOpcionValor, idOpcion) VALUES
-- Opciones para el pedido detalle 1 (ejemplos iniciales)
(1, 3, 1),    -- Tamaño (OpcionValor 3 de Opcion 1)
(1, 5, 2),    -- Nivel de picante (OpcionValor 5 de Opcion 2)
(1, 8, 3),    -- Tipo de pan (OpcionValor 8 de Opcion 3),
-- Opciones para el pedido detalle 2
(2, 10, 4),   -- Tipo de pasta (OpcionValor 10 de Opcion 4)
(2, 12, 5),   -- Salsas adicionales (OpcionValor 12 de Opcion 5)
(2, 14, 6),   -- Ingredientes extra (OpcionValor 14 de Opcion 6)
-- Opciones para el pedido detalle 3
(3, 17, 7),   -- Extras (OpcionValor 17 de Opcion 7)
(3, 22, 22),  -- Exclusiones (OpcionValor 22 de Opcion 22)
(3, 58, 31),  -- Vegetales Extras (OpcionValor 58 de Opcion 31)
-- Opciones para el pedido detalle 4
(4, 91, 36),  -- Cobertura (OpcionValor 91 de Opcion 36)
(4, 24, 9),   -- Contornos (OpcionValor 24 de Opcion 9)
(4, 78, 30),  -- Extra Proteína (OpcionValor 78 de Opcion 30)
-- Opciones para el pedido detalle 5
(5, 76, 18),  -- Toppings (OpcionValor 76 de Opcion 18)
(5, 76, 29),  -- Borde relleno (OpcionValor 76 de Opcion 29)
(5, 88, 35),  -- Tipo de base (OpcionValor 88 de Opcion 35)
-- Opciones para el pedido detalle 6
(6, 1, 1),    -- Tamaño (OpcionValor 1 de Opcion 1)
(6, 4, 2),    -- Nivel de picante (OpcionValor 4 de Opcion 2)
(6, 9, 3),    -- Tipo de pan (OpcionValor 9 de Opcion 3)
-- Opciones para el pedido detalle 7
(7, 11, 4),   -- Tipo de pasta (OpcionValor 11 de Opcion 4)
(7, 13, 5),   -- Salsas adicionales (OpcionValor 13 de Opcion 5)
(7, 15, 6),   -- Ingredientes extra (OpcionValor 15 de Opcion 6)
-- Opciones para el pedido detalle 8
(8, 18, 7),   -- Extras (OpcionValor 18 de Opcion 7)
(8, 23, 22),  -- Exclusiones (OpcionValor 23 de Opcion 22)
(8, 59, 31),  -- Vegetales Extras (OpcionValor 59 de Opcion 31)
-- Opciones para el pedido detalle 9
(9, 92, 36),  -- Cobertura (OpcionValor 92 de Opcion 36)
(9, 25, 9),   -- Contornos (OpcionValor 25 de Opcion 9)
(9, 77, 18),  -- Toppings (OpcionValor 77 de Opcion 18)
-- Opciones para el pedido detalle 10
(10, 77, 29), -- Borde relleno (OpcionValor 77 de Opcion 29)
(10, 89, 35), -- Tipo de base (OpcionValor 89 de Opcion 35)
(10, 2, 1),   -- Tamaño (OpcionValor 2 de Opcion 1)
-- Opciones para el pedido detalle 11
(11, 6, 2),   -- Nivel de picante (OpcionValor 6 de Opcion 2)
(11, 16, 6),  -- Ingredientes extra (OpcionValor 16 de Opcion 6)
(11, 19, 7),  -- Extras (OpcionValor 19 de Opcion 7)
-- Opciones para el pedido detalle 12
(12, 60, 31), -- Vegetales Extras (OpcionValor 60 de Opcion 31)
(12, 26, 9),  -- Contornos (OpcionValor 26 de Opcion 9)
(12, 90, 35), -- Tipo de base (OpcionValor 90 de Opcion 35)
-- Opciones para el pedido detalle 13
(13, 7, 2),   -- Nivel de picante (OpcionValor 7 de Opcion 2)
(13, 20, 7),  -- Extras (OpcionValor 20 de Opcion 7)
(13, 21, 7),  -- Extras (OpcionValor 21 de Opcion 7)
-- Opciones para el pedido detalle 14
(14, 3, 1),   -- Tamaño (OpcionValor 3 de Opcion 1)
(14, 5, 2),   -- Nivel de picante (OpcionValor 5 de Opcion 2)
(14, 8, 3),   -- Tipo de pan (OpcionValor 8 de Opcion 3)
-- Opciones para el pedido detalle 15
(15, 10, 4),  -- Tipo de pasta (OpcionValor 10 de Opcion 4)
(15, 12, 5),  -- Salsas adicionales (OpcionValor 12 de Opcion 5)
(15, 14, 6);  -- Ingredientes extra (OpcionValor 14 de Opcion 6)
-- Pedido Detalle 15: Variedad de opciones
(15, 10, 4),  -- Tipo de pasta: Espagueti
(15, 12, 5),  -- Salsas adicionales: Tomate
(15, 14, 6),  -- Ingredientes extra: Champiñones
(15, 17, 7),  -- Extras: Queso
-- Pedido Detalle 16: Opciones de picante y exclusiones
(16, 6, 2),   -- Nivel de picante: Alto
(16, 23, 22), -- Exclusiones: Lactosa
-- Pedido Detalle 17: Personalización de ingredientes
(17, 58, 31), -- Vegetales Extras: Tomate
(17, 91, 36), -- Cobertura: Chocolate
-- Pedido Detalle 18: Contornos y toppings
(18, 24, 9),  -- Contornos: Papas fritas
(18, 76, 18), -- Toppings: Crema
-- Pedido Detalle 19: Proteínas y base
(19, 78, 30), -- Extra Proteína: Pollo
(19, 88, 35), -- Tipo de base: Delgada
-- Pedido Detalle 20: Más personalización
(20, 3, 1),   -- Tamaño: Grande
(20, 7, 2),   -- Nivel de picante: Muy Alto
-- Pedido Detalle 21: Combinaciones variadas
(21, 9, 3),   -- Tipo de pan: Integral
(21, 11, 4),  -- Tipo de pasta: Fetuccini
-- Pedido Detalle 22: Salsas e ingredientes
(22, 13, 5),  -- Salsas adicionales: Blanca
(22, 15, 6),  -- Ingredientes extra: Pepinillos
-- Pedido Detalle 23: Extras y exclusiones
(23, 19, 7),  -- Extras: Jengibre
(23, 22, 22), -- Exclusiones: Frijoles
-- Pedido Detalle 24: Vegetales y coberturas
(24, 59, 31), -- Vegetales Extras: Lechuga
(24, 92, 36), -- Cobertura: Caramelo
-- Pedido Detalle 25: Contornos y toppings
(25, 25, 9),  -- Contornos: Arroz
(25, 77, 18), -- Toppings: Chocolate
-- Pedido Detalle 26: Proteínas y bordes
(26, 78, 30), -- Extra Proteína: Pollo
(26, 76, 29), -- Borde relleno: Queso
-- Pedido Detalle 27: Tipos de base y tamaño
(27, 89, 35), -- Tipo de base: Gruesa
(27, 1, 1),   -- Tamaño: Pequeño
-- Pedido Detalle 28: Nivel de picante y pan
(28, 5, 2),   -- Nivel de picante: Medio
(28, 8, 3),   -- Tipo de pan: Blanco
-- Pedido Detalle 29: Pasta y salsas
(29, 10, 4),  -- Tipo de pasta: Espagueti
(29, 12, 5),  -- Salsas adicionales: Tomate
-- Pedido Detalle 30: Ingredientes y extras
(30, 14, 6),  -- Ingredientes extra: Champiñones
(30, 18, 7),  -- Extras: Aguacate
-- Pedido Detalle 31: Exclusiones y vegetales
(31, 23, 22), -- Exclusiones: Lactosa
(31, 60, 31), -- Vegetales Extras: Cebolla
-- Pedido Detalle 32: Coberturas y contornos
(32, 91, 36), -- Cobertura: Chocolate
(32, 26, 9),  -- Contornos: Ensalada
-- Pedido Detalle 33: Toppings y bordes
(33, 77, 18), -- Toppings: Chocolate
(33, 77, 29), -- Borde relleno: Ajo
-- Pedido Detalle 34: Bases y tamaños
(34, 90, 35), -- Tipo de base: Sin gluten
(34, 2, 1),   -- Tamaño: Mediano
-- Pedido Detalle 35: Nivel de picante y pan
(35, 4, 2),   -- Nivel de picante: Bajo
(35, 9, 3),   -- Tipo de pan: Integral
-- Pedido Detalle 36: Pasta y salsas
(36, 11, 4),  -- Tipo de pasta: Fetuccini
(36, 13, 5),  -- Salsas adicionales: Blanca
-- Pedido Detalle 37: Ingredientes y extras
(37, 16, 6),  -- Ingredientes extra: Cebolla
(37, 20, 7),  -- Extras: Piña
-- Pedido Detalle 38: Exclusiones y vegetales
(38, 22, 22), -- Exclusiones: Frijoles
(38, 58, 31), -- Vegetales Extras: Tomate
-- Pedido Detalle 39: Coberturas y contornos
(39, 92, 36), -- Cobertura: Caramelo
(39, 24, 9),  -- Contornos: Papas fritas
-- Pedido Detalle 40: Toppings y proteínas
(40, 76, 18), -- Toppings: Crema
(40, 78, 30); -- Extra Proteína: Pollo
-- Pedido Detalle 41: Tamaño y nivel de picante
(41, 1, 1),   -- Tamaño: Pequeño
(41, 4, 2),   -- Nivel de picante: Bajo
-- Pedido Detalle 42: Tipo de pan y pasta
(42, 8, 3),   -- Tipo de pan: Blanco
(42, 10, 4),  -- Tipo de pasta: Espagueti
-- Pedido Detalle 43: Salsas e ingredientes extra
(43, 12, 5),  -- Salsas adicionales: Tomate
(43, 14, 6),  -- Ingredientes extra: Champiñones
-- Pedido Detalle 44: Extras y exclusiones
(44, 17, 7),  -- Extras: Queso
(44, 22, 22), -- Exclusiones: Frijoles
-- Pedido Detalle 45: Vegetales extra y cobertura
(45, 58, 31), -- Vegetales Extras: Tomate
(45, 91, 36), -- Cobertura: Chocolate
-- Pedido Detalle 46: Contornos y toppings
(46, 24, 9),  -- Contornos: Papas fritas
(46, 76, 18), -- Toppings: Crema
-- Pedido Detalle 47: Extra proteína y borde relleno
(47, 78, 30), -- Extra Proteína: Pollo
(47, 76, 29), -- Borde relleno: Queso
-- Pedido Detalle 48: Tipo de base y tamaño
(48, 88, 35), -- Tipo de base: Delgada
(48, 2, 1),   -- Tamaño: Mediano
-- Pedido Detalle 49: Nivel de picante y tipo de pan
(49, 5, 2),   -- Nivel de picante: Medio
(49, 9, 3),   -- Tipo de pan: Integral
-- Pedido Detalle 50: Tipo de pasta y salsas adicionales
(50, 11, 4),  -- Tipo de pasta: Fetuccini
(50, 13, 5),  -- Salsas adicionales: Blanca
-- Pedido Detalle 51: Ingredientes extra y extras
(51, 15, 6),  -- Ingredientes extra: Pepinillos
(51, 18, 7),  -- Extras: Aguacate
-- Pedido Detalle 52: Exclusiones y vegetales extra
(52, 23, 22), -- Exclusiones: Lactosa
(52, 59, 31), -- Vegetales Extras: Lechuga
-- Pedido Detalle 53: Cobertura y contornos
(53, 92, 36), -- Cobertura: Caramelo
(53, 25, 9),  -- Contornos: Arroz
-- Pedido Detalle 54: Toppings y borde relleno
(54, 77, 18), -- Toppings: Chocolate
(54, 77, 29), -- Borde relleno: Ajo
-- Pedido Detalle 55: Tipo de base y tamaño
(55, 89, 35), -- Tipo de base: Gruesa
(55, 3, 1),   -- Tamaño: Grande
-- Pedido Detalle 56: Nivel de picante y tipo de pan
(56, 6, 2),   -- Nivel de picante: Alto
(56, 8, 3),   -- Tipo de pan: Blanco
-- Pedido Detalle 57: Tipo de pasta y salsas adicionales
(57, 10, 4),  -- Tipo de pasta: Espagueti
(57, 12, 5),  -- Salsas adicionales: Tomate
-- Pedido Detalle 58: Ingredientes extra y extras
(58, 16, 6),  -- Ingredientes extra: Cebolla
(58, 19, 7),  -- Extras: Jengibre
-- Pedido Detalle 59: Exclusiones y vegetales extra
(59, 22, 22), -- Exclusiones: Frijoles
(59, 60, 31), -- Vegetales Extras: Cebolla
-- Pedido Detalle 60: Cobertura y contornos
(60, 91, 36), -- Cobertura: Chocolate
(60, 26, 9),  -- Contornos: Ensalada
-- Pedido Detalle 61: Toppings y extra proteína
(61, 76, 18), -- Toppings: Crema
(61, 78, 30), -- Extra Proteína: Pollo
-- Pedido Detalle 62: Borde relleno y tipo de base
(62, 76, 29), -- Borde relleno: Queso
(62, 90, 35), -- Tipo de base: Sin gluten
-- Pedido Detalle 63: Tamaño y nivel de picante
(63, 1, 1),   -- Tamaño: Pequeño
(63, 7, 2),   -- Nivel de picante: Muy Alto
-- Pedido Detalle 64: Tipo de pan y pasta
(64, 8, 3),   -- Tipo de pan: Blanco
(64, 11, 4),  -- Tipo de pasta: Fetuccini
-- Pedido Detalle 65: Salsas e ingredientes extra
(65, 13, 5),  -- Salsas adicionales: Blanca
(65, 14, 6),  -- Ingredientes extra: Champiñones
-- Pedido Detalle 66: Extras y exclusiones
(66, 20, 7),  -- Extras: Piña
(66, 23, 22), -- Exclusiones: Lactosa
-- Pedido Detalle 67: Vegetales extra y cobertura
(67, 58, 31), -- Vegetales Extras: Tomate
(67, 92, 36), -- Cobertura: Caramelo
-- Pedido Detalle 68: Contornos y toppings
(68, 24, 9),  -- Contornos: Papas fritas
(68, 77, 18), -- Toppings: Chocolate
-- Pedido Detalle 69: Extra proteína y borde relleno
(69, 78, 30), -- Extra Proteína: Pollo
(69, 77, 29), -- Borde relleno: Ajo
-- Pedido Detalle 70: Tipo de base y tamaño
(70, 88, 35), -- Tipo de base: Delgada
(70, 3, 1),   -- Tamaño: Grande
-- Pedido Detalle 71: Nivel de picante y tipo de pan
(71, 4, 2),   -- Nivel de picante: Bajo
(71, 9, 3),   -- Tipo de pan: Integral
-- Pedido Detalle 72: Tipo de pasta y salsas adicionales
(72, 10, 4),  -- Tipo de pasta: Espagueti
(72, 12, 5),  -- Salsas adicionales: Tomate
-- Pedido Detalle 73: Ingredientes extra y extras
(73, 15, 6),  -- Ingredientes extra: Pepinillos
(73, 21, 7),  -- Extras: Crema batida
-- Pedido Detalle 74: Exclusiones y vegetales extra
(74, 22, 22), -- Exclusiones: Frijoles
(74, 59, 31), -- Vegetales Extras: Lechuga
-- Pedido Detalle 75: Cobertura y contornos
(75, 91, 36), -- Cobertura: Chocolate
(75, 25, 9),  -- Contornos: Arroz
-- Pedido Detalle 76: Toppings y extra proteína
(76, 76, 18), -- Toppings: Crema
(76, 78, 30), -- Extra Proteína: Pollo
-- Pedido Detalle 77: Borde relleno y tipo de base
(77, 76, 29), -- Borde relleno: Queso
(77, 89, 35), -- Tipo de base: Gruesa
-- Pedido Detalle 78: Tamaño y nivel de picante
(78, 1, 1),   -- Tamaño: Pequeño
(78, 5, 2),   -- Nivel de picante: Medio
-- Pedido Detalle 79: Tipo de pan y pasta
(79, 8, 3),   -- Tipo de pan: Blanco
(79, 11, 4),  -- Tipo de pasta: Fetuccini
-- Pedido Detalle 80: Salsas e ingredientes extra
(80, 13, 5),  -- Salsas adicionales: Blanca
(80, 16, 6);  -- Ingredientes extra: Cebolla
-- Pedido Detalle 81 (idPlato: 41): Extra queso
(81, 76, 29), -- Borde relleno: Queso (consistent with Plato 41 options, as closest for 'queso')
(81, 17, 7),  -- Extras: Queso (general option for 'extra queso')
-- Pedido Detalle 82 (idPlato: 42): Sin Nota
(82, 88, 35), -- Tipo de base: Delgada (consistent with Plato 42 options)
(82, 1, 1),   -- Tamaño: Pequeño (general option)
-- Pedido Detalle 83 (idPlato: 43): Sin Nota (idPlato > 42, using general options)
(83, 1, 1),   -- Tamaño: Pequeño
(83, 4, 2),   -- Nivel de picante: Bajo
-- Pedido Detalle 84 (idPlato: 44): Extra picante (idPlato > 42, using general options)
(84, 7, 2),   -- Nivel de picante: Muy Alto
(84, 8, 3),   -- Tipo de pan: Blanco
-- Pedido Detalle 85 (idPlato: 45): Sin cebolla (idPlato > 42, using general options)
(85, 16, 6),  -- Ingredientes extra: Cebolla (as exclusion)
(85, 10, 4),  -- Tipo de pasta: Espagueti (general option)
-- Pedido Detalle 86 (idPlato: 46): Tamaño grande (idPlato > 42, using general options)
(86, 3, 1),   -- Tamaño: Grande
(86, 12, 5),  -- Salsas adicionales: Tomate
-- Pedido Detalle 87 (idPlato: 47): Sin Nota (idPlato > 42, using general options)
(87, 14, 6),  -- Ingredientes extra: Champiñones
(87, 17, 7),  -- Extras: Queso
-- Pedido Detalle 88 (idPlato: 48): Con extra de salsa (idPlato > 42, using general options)
(88, 12, 5),  -- Salsas adicionales: Tomate
(88, 22, 22), -- Exclusiones: Frijoles (general option)
-- Pedido Detalle 89 (idPlato: 49): Vegetales extra (idPlato > 42, using general options)
(89, 58, 31), -- Vegetales Extras: Tomate
(89, 91, 36), -- Cobertura: Chocolate
-- Pedido Detalle 90 (idPlato: 50): Sin lactosa (idPlato > 42, using general options)
(90, 23, 22), -- Exclusiones: Lactosa
(90, 24, 9),  -- Contornos: Papas fritas (general option)
-- Pedido Detalle 91 (idPlato: 51): Con crema batida (idPlato > 42, using general options)
(91, 21, 7),  -- Extras: Crema batida
(91, 78, 30), -- Extra Proteína: Pollo
-- Pedido Detalle 92 (idPlato: 52): Sin Nota (idPlato > 42, using general options)
(92, 76, 18), -- Toppings: Crema
(92, 76, 29), -- Borde relleno: Queso
-- Pedido Detalle 93 (idPlato: 53): Tipo de pan integral (idPlato > 42, using general options)
(93, 9, 3),   -- Tipo de pan: Integral
(93, 88, 35), -- Tipo de base: Delgada
-- Pedido Detalle 94 (idPlato: 54): Borde grueso (idPlato > 42, using general options)
(94, 89, 35), -- Tipo de base: Gruesa
(94, 1, 1),   -- Tamaño: Pequeño
-- Pedido Detalle 95 (idPlato: 55): Extra proteína de pollo (idPlato > 42, using general options)
(95, 78, 30), -- Extra Proteína: Pollo
(95, 4, 2),   -- Nivel de picante: Bajo (general option)
-- Pedido Detalle 96 (idPlato: 56): Sin azúcar (idPlato > 42, using general options)
(96, 22, 22), -- Exclusiones: Frijoles (as general exclusion)
(96, 8, 3),   -- Tipo de pan: Blanco (general option)
-- Pedido Detalle 97 (idPlato: 57): Con champiñones (idPlato > 42, using general options)
(97, 14, 6),  -- Ingredientes extra: Champiñones
(97, 10, 4),  -- Tipo de pasta: Espagueti (general option)
-- Pedido Detalle 98 (idPlato: 58): Sin Nota (idPlato > 42, using general options)
(98, 12, 5),  -- Salsas adicionales: Tomate
(98, 15, 6),  -- Ingredientes extra: Pepinillos
-- Pedido Detalle 99 (idPlato: 59): Extra jengibre (idPlato > 42, using general options)
(99, 19, 7),  -- Extras: Jengibre
(99, 18, 7),  -- Extras: Aguacate
-- Pedido Detalle 100 (idPlato: 60): Sin pepinillos (idPlato > 42, using general options)
(100, 15, 6), -- Ingredientes extra: Pepinillos (as exclusion)
(100, 22, 22),-- Exclusiones: Frijoles
-- Pedido Detalle 101 (idPlato: 61): Con extra de piña (idPlato > 42, using general options)
(101, 20, 7), -- Extras: Piña
(101, 58, 31),-- Vegetales Extras: Tomate
-- Pedido Detalle 102 (idPlato: 62): Sin Nota (idPlato > 42, using general options)
(102, 91, 36),-- Cobertura: Chocolate
(102, 24, 9), -- Contornos: Papas fritas
-- Pedido Detalle 103 (idPlato: 63): Sin gluten (idPlato > 42, using general options)
(103, 90, 35),-- Tipo de base: Sin gluten
(103, 76, 18),-- Toppings: Crema
-- Pedido Detalle 104 (idPlato: 64): Bajo en calorías (idPlato > 42, using general options)
(104, 2, 1),  -- Tamaño: Mediano (general option)
(104, 78, 30),-- Extra Proteína: Pollo (general option)
-- Pedido Detalle 105 (idPlato: 65): Picante suave (idPlato > 42, using general options)
(105, 4, 2),  -- Nivel de picante: Bajo
(105, 76, 29),-- Borde relleno: Queso
-- Pedido Detalle 106 (idPlato: 66): Sin Nota (idPlato > 42, using general options)
(106, 88, 35),-- Tipo de base: Delgada
(106, 8, 3),  -- Tipo de pan: Blanco
-- Pedido Detalle 107 (idPlato: 67): Sin frijoles (idPlato > 42, using general options)
(107, 22, 22),-- Exclusiones: Frijoles
(107, 10, 4), -- Tipo de pasta: Espagueti
-- Pedido Detalle 108 (idPlato: 68): Con aderezo aparte (idPlato > 42, using general options)
(108, 13, 5), -- Salsas adicionales: Blanca
(108, 16, 6), -- Ingredientes extra: Cebolla
-- Pedido Detalle 109 (idPlato: 69): Sin Nota (idPlato > 42, using general options)
(109, 17, 7), -- Extras: Queso
(109, 19, 7), -- Extras: Jengibre
-- Pedido Detalle 110 (idPlato: 70): Extra queso (idPlato > 42, using general options)
(110, 17, 7), -- Extras: Queso
(110, 23, 22),-- Exclusiones: Lactosa
-- Pedido Detalle 111 (idPlato: 71): Sin cebolla (idPlato > 42, using general options)
(111, 16, 6), -- Ingredientes extra: Cebolla (as exclusion)
(111, 58, 31),-- Vegetales Extras: Tomate
-- Pedido Detalle 112 (idPlato: 72): Tamaño grande (idPlato > 42, using general options)
(112, 3, 1),  -- Tamaño: Grande
(112, 91, 36),-- Cobertura: Chocolate
-- Pedido Detalle 113 (idPlato: 73): Sin Nota (idPlato > 42, using general options)
(113, 24, 9), -- Contornos: Papas fritas
(113, 76, 18),-- Toppings: Crema
-- Pedido Detalle 114 (idPlato: 74): Con extra de salsa (idPlato > 42, using general options)
(114, 12, 5), -- Salsas adicionales: Tomate
(114, 78, 30),-- Extra Proteína: Pollo
-- Pedido Detalle 115 (idPlato: 75): Vegetales extra (idPlato > 42, using general options)
(115, 58, 31),-- Vegetales Extras: Tomate
(115, 76, 29),-- Borde relleno: Queso
-- Pedido Detalle 116 (idPlato: 76): Sin lactosa (idPlato > 42, using general options)
(116, 23, 22),-- Exclusiones: Lactosa
(116, 88, 35),-- Tipo de base: Delgada
-- Pedido Detalle 117 (idPlato: 77): Sin Nota (idPlato > 42, using general options)
(117, 1, 1),  -- Tamaño: Pequeño
(117, 4, 2),  -- Nivel de picante: Bajo
-- Pedido Detalle 118 (idPlato: 78): Sin picante (idPlato > 42, using general options)
(118, 4, 2),  -- Nivel de picante: Bajo
(118, 8, 3),  -- Tipo de pan: Blanco
-- Pedido Detalle 119 (idPlato: 79): Sin Nota (idPlato > 42, using general options)
(119, 10, 4), -- Tipo de pasta: Espagueti
(119, 12, 5), -- Salsas adicionales: Tomate
-- Pedido Detalle 120 (idPlato: 80): Sin Nota (idPlato > 42, using general options)
(120, 14, 6), -- Ingredientes extra: Champiñones
(120, 17, 7), -- Extras: Queso
-- Pedido Detalle 121 (idPlato: 95): Sin Nota (idPlato > 42, using general options)
(121, 1, 1),   -- Tamaño: Pequeño
(121, 4, 2),   -- Nivel de picante: Bajo
-- Pedido Detalle 122 (idPlato: 96): Sin Nota (idPlato > 42, using general options)
(122, 8, 3),   -- Tipo de pan: Blanco
(122, 10, 4),  -- Tipo de pasta: Espagueti
-- Pedido Detalle 123 (idPlato: 96): Sin cebolla (idPlato > 42, using general options)
(123, 16, 6),  -- Ingredientes extra: Cebolla (as exclusion)
(123, 12, 5),  -- Salsas adicionales: Tomate (general option)
-- Pedido Detalle 124 (idPlato: 97): Sin Nota (idPlato > 42, using general options)
(124, 14, 6),  -- Ingredientes extra: Champiñones
(124, 17, 7),  -- Extras: Queso
-- Pedido Detalle 125 (idPlato: 98): Sin Nota (idPlato > 42, using general options)
(125, 22, 22), -- Exclusiones: Frijoles
(125, 58, 31), -- Vegetales Extras: Tomate
-- Pedido Detalle 126 (idPlato: 99): Sin Nota (idPlato > 42, using general options)
(126, 91, 36), -- Cobertura: Chocolate
(126, 24, 9),  -- Contornos: Papas fritas
-- Pedido Detalle 127 (idPlato: 100): Sin Nota (idPlato > 42, using general options)
(127, 76, 18), -- Toppings: Crema
(127, 78, 30), -- Extra Proteína: Pollo
-- Pedido Detalle 128 (idPlato: 101): Sin Nota (idPlato > 42, using general options)
(128, 76, 29), -- Borde relleno: Queso
(128, 88, 35), -- Tipo de base: Delgada
-- Pedido Detalle 129 (idPlato: 102): Extra queso (idPlato > 42, using general options)
(129, 17, 7),  -- Extras: Queso
(129, 2, 1),   -- Tamaño: Mediano (general option)
-- Pedido Detalle 130 (idPlato: 103): Bien cocido (idPlato > 42, general options, no direct option)
(130, 5, 2),   -- Nivel de picante: Medio
(130, 9, 3),   -- Tipo de pan: Integral
-- Pedido Detalle 131 (idPlato: 104): Poco cocido (idPlato > 42, general options, no direct option)
(131, 11, 4),  -- Tipo de pasta: Fetuccini
(131, 13, 5),  -- Salsas adicionales: Blanca
-- Pedido Detalle 132 (idPlato: 105): Sin lactosa (idPlato > 42, using general options)
(132, 23, 22), -- Exclusiones: Lactosa
(132, 15, 6),  -- Ingredientes extra: Pepinillos (general option)
-- Pedido Detalle 133 (idPlato: 106): Con extra de salsa (idPlato > 42, using general options)
(133, 12, 5),  -- Salsas adicionales: Tomate
(133, 18, 7),  -- Extras: Aguacate
-- Pedido Detalle 134 (idPlato: 107): Extra picante (idPlato > 42, using general options)
(134, 7, 2),   -- Nivel de picante: Muy Alto
(134, 20, 7),  -- Extras: Piña (general option)
-- Pedido Detalle 135 (idPlato: 108): Sin gluten (idPlato > 42, using general options)
(135, 90, 35), -- Tipo de base: Sin gluten (closest match for exclusion)
(135, 22, 22), -- Exclusiones: Frijoles
-- Pedido Detalle 136 (idPlato: 109): Bajo en sal (idPlato > 42, general options, no direct option)
(136, 58, 31), -- Vegetales Extras: Tomate
(136, 92, 36), -- Cobertura: Caramelo
-- Pedido Detalle 137 (idPlato: 110): Vegetales extra (idPlato > 42, using general options)
(137, 58, 31), -- Vegetales Extras: Tomate
(137, 59, 31), -- Vegetales Extras: Lechuga
-- Pedido Detalle 138 (idPlato: 111): Sin azúcar (idPlato > 42, using general options)
(138, 22, 22), -- Exclusiones: Frijoles (as general exclusion)
(138, 26, 9),  -- Contornos: Ensalada (general option)
-- Pedido Detalle 139 (idPlato: 112): Tamaño grande (idPlato > 42, using general options)
(139, 3, 1),   -- Tamaño: Grande
(139, 77, 18), -- Toppings: Chocolate
-- Pedido Detalle 140 (idPlato: 113): Tipo de pan integral (idPlato > 42, using general options)
(140, 9, 3),   -- Tipo de pan: Integral
(140, 77, 29), -- Borde relleno: Ajo
-- Pedido Detalle 141 (idPlato: 114): Con cebolla (idPlato > 42, using general options)
(141, 16, 6),  -- Ingredientes extra: Cebolla
(141, 89, 35), -- Tipo de base: Gruesa (general option)
-- Pedido Detalle 142 (idPlato: 115): Extra jengibre (idPlato > 42, using general options)
(142, 19, 7),  -- Extras: Jengibre
(142, 17, 7),  -- Extras: Queso
-- Pedido Detalle 143 (idPlato: 116): Bajo en calorías (idPlato > 42, general options, no direct option)
(143, 1, 1),   -- Tamaño: Pequeño
(143, 4, 2),   -- Nivel de picante: Bajo
-- Pedido Detalle 144 (idPlato: 117): Con crema batida (idPlato > 42, using general options)
(144, 21, 7),  -- Extras: Crema batida
(144, 76, 18), -- Toppings: Crema
-- Pedido Detalle 145 (idPlato: 118): Sin pepinillos (idPlato > 42, using general options)
(145, 15, 6),  -- Ingredientes extra: Pepinillos (as exclusion)
(145, 23, 22), -- Exclusiones: Lactosa
-- Pedido Detalle 146 (idPlato: 119): Con extra de piña (idPlato > 42, using general options)
(146, 20, 7),  -- Extras: Piña
(146, 59, 31), -- Vegetales Extras: Lechuga
-- Pedido Detalle 147 (idPlato: 120): Borde grueso (idPlato > 42, using general options)
(147, 89, 35), -- Tipo de base: Gruesa
(147, 77, 29), -- Borde relleno: Ajo
-- Pedido Detalle 148 (idPlato: 121): Extra proteína de pollo (idPlato > 42, using general options)
(148, 78, 30), -- Extra Proteína: Pollo
(148, 25, 9),  -- Contornos: Arroz (general option)
-- Pedido Detalle 149 (idPlato: 122): Con aderezo aparte (idPlato > 42, using general options)
(149, 13, 5),  -- Salsas adicionales: Blanca
(149, 12, 5),  -- Salsas adicionales: Tomate
-- Pedido Detalle 150 (idPlato: 123): Sin frijoles (idPlato > 42, using general options)
(150, 22, 22), -- Exclusiones: Frijoles
(150, 90, 35); -- Tipo de base: Sin gluten (closest for general exclusion)

INSERT INTO PedidoEstadoPedido (idPedido, idEstadoPedido, fecha_inicio) VALUES
-- Pedido 1: Ruta feliz
(1, 1, '2025-07-10 16:53:35'), -- Pendiente
(1, 2, '2025-07-10 17:05:35'), -- Confirmado
(1, 3, '2025-07-10 17:28:35'), -- En Preparación
(1, 4, '2025-07-10 17:35:35'), -- Listo para Entrega
(1, 5, '2025-07-10 17:42:35'), -- En Camino
(1, 6, '2025-07-10 18:24:35'), -- Entregado

-- Pedido 2: Cancelado por el cliente
(2, 1, '2025-07-11 05:27:14'), -- Pendiente
(2, 2, '2025-07-11 05:32:14'), -- Confirmado
(2, 7, '2025-07-11 05:45:14'), -- Cancelado

-- Pedido 3: Retrasado y luego entregado
(3, 1, '2025-07-10 19:48:42'), -- Pendiente
(3, 2, '2025-07-10 19:54:42'), -- Confirmado
(3, 3, '2025-07-10 20:17:42'), -- En Preparación
(3, 8, '2025-07-10 20:25:42'), -- Retrasado
(3, 4, '2025-07-10 20:40:42'), -- Listo para Entrega (después de retraso)
(3, 5, '2025-07-10 20:50:42'), -- En Camino
(3, 6, '2025-07-10 21:20:42'), -- Entregado

-- Pedido 4: Rechazado por comercio (MODIFICADO)
(4, 1, '2025-07-11 11:22:20'), -- Pendiente
(4, 11, '2025-07-11 11:30:20'), -- Rechazado por Comercio
(4, 7, '2025-07-11 11:40:20'), -- Cancelado

-- Pedido 5: Error en pago y cancelado
(5, 1, '2025-07-10 19:04:36'), -- Pendiente
(5, 15, '2025-07-10 19:10:36'), -- Error en Pago
(5, 7, '2025-07-10 19:20:36'), -- Cancelado

-- Pedido 6: Esperando repartidor, luego entregado
(6, 1, '2025-07-11 12:35:53'), -- Pendiente
(6, 2, '2025-07-11 12:47:53'), -- Confirmado
(6, 3, '2025-07-11 13:00:53'), -- En Preparación
(6, 4, '2025-07-11 13:07:53'), -- Listo para Entrega
(6, 12, '2025-07-11 13:15:53'), -- Esperando Repartidor
(6, 5, '2025-07-11 13:25:53'), -- En Camino
(6, 6, '2025-07-11 13:51:53'), -- Entregado

-- Pedido 7: Programado y entregado
(7, 1, '2025-07-10 18:28:16'), -- Pendiente
(7, 14, '2025-07-10 18:35:16'), -- Programado
(7, 4, '2025-07-10 19:10:16'), -- Listo para Entrega (a la hora programada)
(7, 5, '2025-07-10 19:24:16'), -- En Camino
(7, 6, '2025-07-10 19:59:16'), -- Entregado

-- Pedido 8: Devolución en proceso (después de una entrega simulada)
(8, 1, '2025-07-11 15:46:27'), -- Pendiente
(8, 2, '2025-07-11 15:52:27'), -- Confirmado
(8, 3, '2025-07-11 16:16:27'), -- En Preparación
(8, 4, '2025-07-11 16:26:27'), -- Listo para Entrega
(8, 5, '2025-07-11 16:34:27'), -- En Camino
(8, 6, '2025-07-11 17:09:27'), -- Entregado
(8, 9, '2025-07-11 17:30:27'), -- Devolución en Proceso
(8, 10, '2025-07-11 17:45:27'), -- Reembolsado

-- Pedido 9: Reintento de entrega
(9, 1, '2025-07-11 02:49:50'), -- Pendiente
(9, 2, '2025-07-11 03:00:50'), -- Confirmado
(9, 3, '2025-07-11 03:22:50'), -- En Preparación
(9, 4, '2025-07-11 03:30:50'), -- Listo para Entrega
(9, 5, '2025-07-11 03:41:50'), -- En Camino
(9, 13, '2025-07-11 04:00:50'), -- Reintento de Entrega (fallido)
(9, 5, '2025-07-11 04:10:50'), -- En Camino (segundo intento)
(9, 6, '2025-07-11 04:30:50'), -- Entregado

-- Pedido 10-150: Variaciones de los escenarios anteriores

-- Ruta Feliz (varias instancias)
(10, 1, '2025-07-11 10:18:20'), (10, 2, '2025-07-11 10:28:20'), (10, 3, '2025-07-11 10:48:20'), (10, 4, '2025-07-11 10:57:20'), (10, 5, '2025-07-11 11:10:20'), (10, 6, '2025-07-11 11:42:20'),
(11, 1, '2025-07-11 01:23:49'), (11, 2, '2025-07-11 01:31:49'), (11, 3, '2025-07-11 01:46:49'), (11, 4, '2025-07-11 01:54:49'), (11, 5, '2025-07-11 02:08:49'), (11, 6, '2025-07-11 02:37:49'),
(12, 1, '2025-07-11 10:04:13'), (12, 2, '2025-07-11 10:12:13'), (12, 3, '2025-07-11 10:39:13'), (12, 4, '2025-07-11 10:47:13'), (12, 5, '2025-07-11 10:55:13'), (12, 6, '2025-07-11 11:32:13'),
(13, 1, '2025-07-11 05:44:03'), (13, 2, '2025-07-11 05:51:03'), (13, 3, '2025-07-11 06:16:03'), (13, 4, '2025-07-11 06:21:03'), (13, 5, '2025-07-11 06:28:03'), (13, 6, '2025-07-11 07:07:03'),
(14, 1, '2025-07-10 16:54:02'), (14, 2, '2025-07-10 17:01:02'), (14, 3, '2025-07-10 17:15:02'), (14, 4, '2025-07-10 17:23:02'), (14, 5, '2025-07-10 17:37:02'), (14, 6, '2025-07-10 18:04:02'),
(15, 1, '2025-07-11 09:37:03'), (15, 2, '2025-07-11 09:47:03'), (15, 3, '2025-07-11 10:11:03'), (15, 4, '2025-07-11 10:20:03'), (15, 5, '2025-07-11 10:25:03'), (15, 6, '2025-07-11 10:57:03'),
(16, 1, '2025-07-11 00:09:05'), (16, 2, '2025-07-11 00:15:05'), (16, 3, '2025-07-11 00:39:05'), (16, 4, '2025-07-11 00:46:05'), (16, 5, '2025-07-11 00:56:05'), (16, 6, '2025-07-11 01:21:05'),

-- Cancelaciones tempranas (después de Pendiente o Confirmado)
(17, 1, '2025-07-11 06:58:19'), -- Pendiente
(17, 2, '2025-07-11 07:05:19'), -- Confirmado (ADDED)
(17, 7, '2025-07-11 07:10:19'), -- Cancelado
(18, 1, '2025-07-11 00:23:14'), (18, 2, '2025-07-11 00:33:14'), (18, 7, '2025-07-11 00:45:14'), -- Cancelado

-- Rechazado por Comercio
(19, 1, '2025-07-11 09:20:31'), -- Pendiente
(19, 11, '2025-07-11 09:28:31'), -- Rechazado por Comercio
(19, 7, '2025-07-11 09:38:31'), -- Cancelado (ADDED)
(20, 1, '2025-07-11 02:40:19'), (20, 2, '2025-07-11 02:48:19'), (20, 11, '2025-07-11 03:00:19'), -- Rechazado por Comercio

-- Retrasados
(21, 1, '2025-07-11 12:44:48'), (21, 2, '2025-07-11 12:54:48'), (21, 3, '2025-07-11 13:16:48'), (21, 8, '2025-07-11 13:25:48'), (21, 5, '2025-07-11 13:40:48'), (21, 6, '2025-07-11 14:10:48'),
(22, 1, '2025-07-10 14:13:58'), (22, 2, '2025-07-10 14:24:58'), (22, 3, '2025-07-10 14:48:58'), (22, 8, '2025-07-10 14:58:58'), (22, 4, '2025-07-10 15:15:58'), (22, 5, '2025-07-10 15:25:58'), (22, 6, '2025-07-10 15:55:58'),

-- Esperando Repartidor (varias instancias)
(23, 1, '2025-07-10 18:27:00'), (23, 2, '2025-07-10 18:37:00'), (23, 3, '2025-07-10 18:59:00'), (23, 4, '2025-07-10 19:07:00'), (23, 12, '2025-07-10 19:15:00'), (23, 5, '2025-07-10 19:25:00'), (23, 6, '2025-07-10 19:58:00'),
(24, 1, '2025-07-11 07:11:03'), (24, 2, '2025-07-11 07:22:03'), (24, 3, '2025-07-11 07:44:03'), (24, 4, '2025-07-11 07:53:03'), (24, 12, '2025-07-11 08:00:03'), (24, 5, '2025-07-11 08:10:03'), (24, 6, '2025-07-11 08:40:03'),

-- Reintento de Entrega
(25, 1, '2025-07-10 17:09:52'), (25, 2, '2025-07-10 17:16:52'), (25, 3, '2025-07-10 17:39:52'), (25, 4, '2025-07-10 17:49:52'), (25, 5, '2025-07-10 18:04:52'), (25, 13, '2025-07-10 18:15:52'), (25, 5, '2025-07-10 18:25:52'), (25, 6, '2025-07-10 18:50:52'),

-- Error en Pago y Cancelado
(26, 1, '2025-07-11 08:32:00'), (26, 15, '2025-07-11 08:40:00'), (26, 7, '2025-07-11 08:50:00'),
(27, 1, '2025-07-11 04:09:46'), (27, 2, '2025-07-11 04:19:46'), (27, 15, '2025-07-11 04:30:46'), (27, 7, '2025-07-11 04:40:46'),

-- Programado (varias instancias)
(28, 1, '2025-07-11 00:03:00'), (28, 14, '2025-07-11 00:10:00'), (28, 4, '2025-07-11 00:40:00'), (28, 5, '2025-07-11 00:50:00'), (28, 6, '2025-07-11 01:25:00'),
(29, 1, '2025-07-11 01:43:40'), (29, 14, '2025-07-11 01:50:40'), (29, 4, '2025-07-11 02:20:40'), (29, 5, '2025-07-11 02:30:40'), (29, 6, '2025-07-11 03:05:40'),

-- Mezcla de estados: Retrasado -> Cancelado
(30, 1, '2025-07-10 13:00:33'), (30, 2, '2025-07-10 13:08:33'), (30, 3, '2025-07-10 13:31:33'), (30, 8, '2025-07-10 13:38:33'), (30, 7, '2025-07-10 13:50:33'),

-- Mezcla de estados: Esperando Repartidor -> Retrasado -> Entregado
(31, 1, '2025-07-10 17:09:47'), (31, 2, '2025-07-10 17:20:47'), (31, 3, '2025-07-10 17:39:47'), (31, 4, '2025-07-10 17:45:47'), (31, 12, '2025-07-10 17:59:47'), (31, 8, '2025-07-10 18:15:47'), (31, 5, '2025-07-10 18:25:47'), (31, 6, '2025-07-10 18:55:47'),

-- Más rutas felices
(32, 1, '2025-07-11 09:21:28'), (32, 2, '2025-07-11 09:27:28'), (32, 3, '2025-07-11 09:47:28'), (32, 4, '2025-07-11 09:54:28'), (32, 5, '2025-07-11 10:01:28'), (32, 6, '2025-07-11 10:33:28'),
(33, 1, '2025-07-10 20:25:01'), (33, 2, '2025-07-10 20:30:01'), (33, 3, '2025-07-10 20:57:01'), (33, 4, '2025-07-10 21:05:01'), (33, 5, '2025-07-10 21:13:01'), (33, 6, '2025-07-10 21:50:01'),
(34, 1, '2025-07-11 05:43:16'), (34, 2, '2025-07-11 05:51:16'), (34, 3, '2025-07-11 06:14:16'), (34, 4, '2025-07-11 06:21:16'), (34, 5, '2025-07-11 06:26:16'), (34, 6, '2025-07-11 06:51:16'),
(35, 1, '2025-07-11 03:00:26'), (35, 2, '2025-07-11 03:06:26'), (35, 3, '2025-07-11 03:22:26'), (35, 4, '2025-07-11 03:31:26'), (35, 5, '2025-07-11 03:36:26'), (35, 6, '2025-07-11 04:08:26'),
(36, 1, '2025-07-11 07:44:59'), (36, 2, '2025-07-11 07:53:59'), (36, 3, '2025-07-11 08:14:59'), (36, 4, '2025-07-11 08:23:59'), (36, 5, '2025-07-11 08:35:59'), (36, 6, '2025-07-11 09:18:59'),
(37, 1, '2025-07-10 13:08:18'), (37, 2, '2025-07-10 13:16:18'), (37, 3, '2025-07-10 13:41:18'), (37, 4, '2025-07-10 13:46:18'), (37, 5, '2025-07-10 13:58:18'), (37, 6, '2025-07-10 14:38:18'),
(38, 1, '2025-07-11 07:07:07'), (38, 2, '2025-07-11 07:12:07'), (38, 3, '2025-07-11 07:33:07'), (38, 4, '2025-07-11 07:42:07'), (38, 5, '2025-07-11 07:54:07'), (38, 6, '2025-07-11 08:23:07'),
(39, 1, '2025-07-11 00:03:52'), (39, 2, '2025-07-11 00:13:52'), (39, 3, '2025-07-11 00:36:52'), (39, 4, '2025-07-11 00:46:52'), (39, 5, '2025-07-11 00:59:52'), (39, 6, '2025-07-11 01:29:52'),
(40, 1, '2025-07-11 11:27:26'), (40, 2, '2025-07-11 11:34:26'), (40, 3, '2025-07-11 11:51:26'), (40, 4, '2025-07-11 12:00:26'), (40, 5, '2025-07-11 12:12:26'), (40, 6, '2025-07-11 12:47:26'),

-- Más cancelaciones (después de Confirmado)
(41, 1, '2025-07-10 13:47:49'), (41, 2, '2025-07-10 13:58:49'), (41, 7, '2025-07-10 14:10:49'),
(42, 1, '2025-07-10 20:39:27'), (42, 2, '2025-07-10 20:47:27'), (42, 7, '2025-07-10 20:55:27'),

-- Más rechazos por comercio
(43, 1, '2025-07-11 00:45:00'), -- Pendiente
(43, 11, '2025-07-11 00:55:00'), -- Rechazado por Comercio
(43, 7, '2025-07-11 01:05:00'), -- Cancelado (ADDED)
(44, 1, '2025-07-11 07:18:03'), (44, 2, '2025-07-11 07:23:03'), (44, 11, '2025-07-11 07:35:03'),

-- Más errores de pago
(45, 1, '2025-07-11 04:30:05'), (45, 15, '2025-07-11 04:37:05'), (45, 7, '2025-07-11 04:45:05'),

-- Más retrasos
(46, 1, '2025-07-11 00:03:36'), (46, 2, '2025-07-11 00:10:36'), (46, 3, '2025-07-11 00:30:36'), (46, 8, '2025-07-11 00:36:36'), (46, 5, '2025-07-11 00:45:36'), (46, 6, '2025-07-11 01:15:36'),

-- Más esperando repartidor
(47, 1, '2025-07-11 06:17:16'), (47, 2, '2025-07-11 06:27:16'), (47, 3, '2025-07-11 06:48:16'), (47, 4, '2025-07-11 06:55:16'), (47, 12, '2025-07-11 07:07:16'), (47, 5, '2025-07-11 07:17:16'), (47, 6, '2025-07-11 07:45:16'),

-- Más reintentos de entrega
(48, 1, '2025-07-11 03:03:42'), (48, 2, '2025-07-11 03:08:42'), (48, 3, '2025-07-11 03:38:42'), (48, 4, '2025-07-11 03:45:42'), (48, 5, '2025-07-11 03:52:42'), (48, 13, '2025-07-11 04:05:42'), (48, 6, '2025-07-11 04:25:42'),

-- Devoluciones (después de entrega)
(49, 1, '2025-07-10 13:58:39'), (49, 2, '2025-07-10 14:04:39'), (49, 3, '2025-07-10 14:25:39'), (49, 4, '2025-07-10 14:30:39'), (49, 5, '2025-07-10 14:41:39'), (49, 6, '2025-07-10 15:15:39'), (49, 9, '2025-07-10 15:30:39'), (49, 10, '2025-07-10 15:45:39'),

-- Combinación: Pendiente -> Programado -> Cancelado (antes de entrega)
(50, 1, '2025-07-11 09:27:36'), (50, 14, '2025-07-11 09:37:36'), (50, 7, '2025-07-11 10:00:36'),

-- Repetimos y mezclamos para llegar a 150 pedidos con variaciones
-- Ruta Feliz
(51, 1, '2025-07-10 18:31:21'), (51, 2, '2025-07-10 18:37:21'), (51, 3, '2025-07-10 19:04:21'), (51, 4, '2025-07-10 19:10:21'), (51, 5, '2025-07-10 19:19:21'), (51, 6, '2025-07-10 19:57:21'),
(52, 1, '2025-07-11 09:34:36'), (52, 2, '2025-07-11 09:41:36'), (52, 3, '2025-07-11 10:00:36'), (52, 4, '2025-07-11 10:05:36'), (52, 5, '2025-07-11 10:19:36'), (52, 6, '2025-07-11 10:56:36'),
(53, 1, '2025-07-11 03:00:15'), (53, 2, '2025-07-11 03:06:15'), (53, 3, '2025-07-11 03:34:15'), (53, 4, '2025-07-11 03:40:15'), (53, 5, '2025-07-11 03:52:15'), (53, 6, '2025-07-11 04:26:15'),
(54, 1, '2025-07-10 17:09:49'), (54, 2, '2025-07-10 17:16:49'), (54, 3, '2025-07-10 17:42:49'), (54, 4, '2025-07-10 17:48:49'), (54, 5, '2025-07-10 17:58:49'), (54, 6, '2025-07-10 18:27:49'),
(55, 1, '2025-07-10 13:57:20'), (55, 2, '2025-07-10 14:02:20'), (55, 3, '2025-07-10 14:22:20'), (55, 4, '2025-07-10 14:31:20'), (55, 5, '2025-07-10 14:41:20'), (55, 6, '2025-07-10 15:15:20'),
(56, 1, '2025-07-11 00:54:19'), (56, 2, '2025-07-11 01:04:19'), (56, 3, '2025-07-11 01:21:19'), (56, 4, '2025-07-11 01:27:19'), (56, 5, '2025-07-11 01:40:19'), (56, 6, '2025-07-11 02:05:19'),
(57, 1, '2025-07-11 08:35:10'), (57, 2, '2025-07-11 08:44:10'), (57, 3, '2025-07-11 09:07:10'), (57, 4, '2025-07-11 09:12:10'), (57, 5, '2025-07-11 09:23:10'), (57, 6, '2025-07-11 10:05:10'),
(58, 1, '2025-07-10 18:59:16'), (58, 2, '2025-07-10 19:07:16'), (58, 3, '2025-07-10 19:20:16'), (58, 4, '2025-07-10 19:29:16'), (58, 5, '2025-07-10 19:35:16'), (58, 6, '2025-07-10 20:01:16'),
(59, 1, '2025-07-11 07:05:15'), (59, 2, '2025-07-11 07:14:15'), (59, 3, '2025-07-11 07:38:15'), (59, 4, '2025-07-11 07:44:15'), (59, 5, '2025-07-11 07:54:15'), (59, 6, '2025-07-11 08:31:15'),
(60, 1, '2025-07-10 18:37:11'), (60, 2, '2025-07-10 18:47:11'), (60, 3, '2025-07-10 19:15:11'), (60, 4, '2025-07-10 19:22:11'), (60, 5, '2025-07-10 19:30:11'), (60, 6, '2025-07-10 20:00:11'),

-- Más Cancelaciones
(61, 1, '2025-07-11 00:19:16'), -- Pendiente
(61, 2, '2025-07-11 00:25:16'), -- Confirmado (ADDED)
(61, 7, '2025-07-11 00:30:16'), -- Cancelado
(62, 1, '2025-07-11 06:14:00'), (62, 2, '2025-07-11 06:21:00'), (62, 7, '2025-07-11 06:35:00'),

-- Más Rechazos por Comercio
(63, 1, '2025-07-11 02:44:23'), -- Pendiente
(63, 11, '2025-07-11 02:55:23'), -- Rechazado por Comercio
(63, 7, '2025-07-11 03:05:23'), -- Cancelado (ADDED)
(64, 1, '2025-07-10 14:52:33'), (64, 2, '2025-07-10 15:01:33'), (64, 11, '2025-07-10 15:10:33'),

-- Más Errores en Pago
(65, 1, '2025-07-11 03:41:25'), (65, 15, '2025-07-11 03:46:25'), (65, 7, '2025-07-11 03:55:25'),

-- Más Retrasados
(66, 1, '2025-07-10 14:18:49'), (66, 2, '2025-07-10 14:26:49'), (66, 3, '2025-07-10 14:48:49'), (66, 8, '2025-07-10 14:57:49'), (66, 5, '2025-07-10 15:10:49'), (66, 6, '2025-07-10 15:40:49'),

-- Más Esperando Repartidor
(67, 1, '2025-07-11 02:44:03'), (67, 2, '2025-07-11 02:51:03'), (67, 3, '2025-07-11 03:13:03'), (67, 4, '2025-07-11 03:22:03'), (67, 12, '2025-07-11 03:30:03'), (67, 5, '2025-07-11 03:40:03'), (67, 6, '2025-07-11 04:05:03'),

-- Más Reintentos de Entrega
(68, 1, '2025-07-10 15:10:04'), (68, 2, '2025-07-10 15:21:04'), (68, 3, '2025-07-10 15:43:04'), (68, 4, '2025-07-10 15:52:04'), (68, 5, '2025-07-10 16:03:04'), (68, 13, '2025-07-10 16:15:04'), (68, 6, '2025-07-10 16:40:04'),

-- Más Devoluciones
(69, 1, '2025-07-10 17:34:25'), (69, 2, '2025-07-10 17:44:25'), (69, 3, '2025-07-10 18:02:25'), (69, 4, '2025-07-10 18:11:25'), (69, 5, '2025-07-10 18:24:25'), (69, 6, '2025-07-10 18:50:25'), (69, 9, '2025-07-10 19:05:25'), (69, 10, '2025-07-10 19:20:25'),

-- Más Programados
(70, 1, '2025-07-11 07:11:42'), (70, 14, '2025-07-11 07:22:42'), (70, 4, '2025-07-11 07:50:42'), (70, 5, '2025-07-11 08:00:42'), (70, 6, '2025-07-11 08:35:42'),

-- Mezclas Adicionales
(71, 1, '2025-07-10 18:35:50'), (71, 2, '2025-07-10 18:41:50'), (71, 8, '2025-07-10 19:00:50'), (71, 7, '2025-07-10 19:15:50'), -- Retrasado y Cancelado
(72, 1, '2025-07-11 00:36:28'), (72, 15, '2025-07-11 00:43:28'), (72, 11, '2025-07-11 00:55:28'), -- Error en Pago y Rechazado
(73, 1, '2025-07-11 00:46:58'), (73, 2, '2025-07-11 00:54:58'), (73, 3, '2025-07-11 01:13:58'), (73, 12, '2025-07-11 01:19:58'), (73, 8, '2025-07-11 01:35:58'), (73, 5, '2025-07-11 01:45:58'), (73, 6, '2025-07-11 02:15:58'), -- Esperando Repartidor, Retrasado, Entregado
(74, 1, '2025-07-10 17:51:49'), (74, 14, '2025-07-10 18:02:49'), (74, 7, '2025-07-10 18:20:49'), -- Programado y Cancelado

-- Continuación de estados variados para los pedidos restantes (75-150)
-- Mezclando los patrones ya definidos: Ruta Feliz, Cancelado, Retrasado, Rechazado, Esperando Repartidor, Programado, Devolución/Reembolso, Reintento.

-- Pedidos 75-80: Ruta Feliz
(75, 1, '2025-07-10 19:57:42'), (75, 2, '2025-07-10 20:07:42'), (75, 3, '2025-07-10 20:25:42'), (75, 4, '2025-07-10 20:34:42'), (75, 5, '2025-07-10 20:49:42'), (75, 6, '2025-07-10 21:19:42'),
(76, 1, '2025-07-10 20:03:00'), (76, 2, '2025-07-10 20:13:00'), (76, 3, '2025-07-10 20:36:00'), (76, 4, '2025-07-10 20:46:00'), (76, 5, '2025-07-10 20:53:00'), (76, 6, '2025-07-10 21:28:00'),
(77, 1, '2025-07-11 00:09:44'), (77, 2, '2025-07-11 00:15:44'), (77, 3, '2025-07-11 00:36:44'), (77, 4, '2025-07-11 00:43:44'), (77, 5, '2025-07-11 00:54:44'), (77, 6, '2025-07-11 01:25:44'),
(78, 1, '2025-07-11 02:49:50'), (78, 2, '2025-07-11 02:59:50'), (78, 3, '2025-07-11 03:22:50'), (78, 4, '2025-07-11 03:28:50'), (78, 5, '2025-07-11 03:41:50'), (78, 6, '2025-07-11 04:14:50'),
(79, 1, '2025-07-11 00:13:16'), (79, 2, '2025-07-11 00:18:16'), (79, 3, '2025-07-11 00:33:16'), (79, 4, '2025-07-11 00:40:16'), (79, 5, '2025-07-11 00:53:16'), (79, 6, '2025-07-11 01:21:16'),
(80, 1, '2025-07-11 03:09:59'), (80, 2, '2025-07-11 03:19:59'), (80, 3, '2025-07-11 03:39:59'), (80, 4, '2025-07-11 03:49:59'), (80, 5, '2025-07-11 03:57:59'), (80, 6, '2025-07-11 04:22:59'),

-- Pedidos 81-85: Cancelados o Rechazados
(81, 1, '2025-07-11 01:54:57'), (81, 2, '2025-07-11 02:04:57'), (81, 7, '2025-07-11 02:15:57'),
(82, 1, '2025-07-10 22:54:25'), -- Pendiente
(82, 11, '2025-07-10 23:05:25'), -- Rechazado por Comercio
(82, 7, '2025-07-10 23:15:25'), -- Cancelado (ADDED)
(83, 1, '2025-07-11 04:36:19'), (83, 2, '2025-07-11 04:47:19'), (83, 15, '2025-07-11 04:55:19'), (83, 7, '2025-07-11 05:05:19'),
(84, 1, '2025-07-11 00:17:59'), (84, 14, '2025-07-11 00:25:59'), (84, 7, '2025-07-11 00:40:59'),
(85, 1, '2025-07-11 05:51:57'), (85, 2, '2025-07-11 06:01:57'), (85, 3, '2025-07-11 06:21:57'), (85, 8, '2025-07-11 06:30:57'), (85, 7, '2025-07-11 06:45:57'),

-- Pedidos 86-90: Rutas con retraso o esperando repartidor
(86, 1, '2025-07-11 04:54:02'), (86, 2, '2025-07-11 05:03:02'), (86, 3, '2025-07-11 05:22:02'), (86, 8, '2025-07-11 05:31:02'), (86, 5, '2025-07-11 05:43:02'), (86, 6, '2025-07-11 06:17:02'),
(87, 1, '2025-07-10 18:29:40'), (87, 2, '2025-07-10 18:36:40'), (87, 3, '2025-07-10 19:00:40'), (87, 4, '2025-07-10 19:07:40'), (87, 12, '2025-07-10 19:15:40'), (87, 5, '2025-07-10 19:25:40'), (87, 6, '2025-07-10 19:54:40'),
(88, 1, '2025-07-11 08:31:47'), (88, 2, '2025-07-11 08:42:47'), (88, 3, '2025-07-11 09:07:47'), (88, 4, '2025-07-11 09:12:47'), (88, 13, '2025-07-11 09:25:47'), (88, 6, '2025-07-11 09:59:47'),
(89, 1, '2025-07-11 01:21:58'), (89, 2, '2025-07-11 01:29:58'), (89, 3, '2025-07-11 01:59:58'), (89, 4, '2025-07-11 02:07:58'), (89, 12, '2025-07-11 02:18:58'), (89, 8, '2025-07-11 02:30:58'), (89, 5, '2025-07-11 02:40:58'), (89, 6, '2025-07-11 03:10:58'),
(90, 1, '2025-07-11 03:00:36'), (90, 2, '2025-07-11 03:05:36'), (90, 3, '2025-07-11 03:22:36'), (90, 8, '2025-07-11 03:28:36'), (90, 5, '2025-07-11 03:42:36'), (90, 6, '2025-07-11 04:17:36'),

-- Pedidos 91-100: Más variaciones
(91, 1, '2025-07-11 03:09:31'), (91, 2, '2025-07-11 03:19:31'), (91, 3, '2025-07-11 03:41:31'), (91, 4, '2025-07-11 03:46:31'), (91, 5, '2025-07-11 03:52:31'), (91, 6, '2025-07-11 04:22:31'),
(92, 1, '2025-07-11 05:27:00'), (92, 2, '2025-07-11 05:33:00'), (92, 3, '2025-07-11 05:51:00'), (92, 4, '2025-07-11 06:00:00'), (92, 5, '2025-07-11 06:05:00'), (92, 6, '2025-07-11 06:40:00'),
(93, 1, '2025-07-10 16:35:10'), (93, 2, '2025-07-10 16:44:10'), (93, 3, '2025-07-10 17:09:10'), (93, 4, '2025-07-10 17:15:10'), (93, 5, '2025-07-10 17:21:10'), (93, 6, '2025-07-10 17:58:10'),
(94, 1, '2025-07-11 02:49:15'), (94, 2, '2025-07-11 02:59:15'), (94, 3, '2025-07-11 03:19:15'), (94, 4, '2025-07-11 03:25:15'), (94, 5, '2025-07-11 03:30:15'), (94, 6, '2025-07-11 03:58:15'),
(95, 1, '2025-07-10 19:35:01'), (95, 2, '2025-07-10 19:40:01'), (95, 3, '2025-07-10 20:00:01'), (95, 4, '2025-07-10 20:06:01'), (95, 5, '2025-07-10 20:13:01'), (95, 6, '2025-07-10 20:44:01'),
(96, 1, '2025-07-10 18:22:18'), (96, 2, '2025-07-10 18:28:18'), (96, 3, '2025-07-10 18:57:18'), (96, 4, '2025-07-10 19:04:18'), (96, 5, '2025-07-10 19:11:18'), (96, 6, '2025-07-10 19:43:18'),
(97, 1, '2025-07-11 08:38:08'), (97, 2, '2025-07-11 08:44:08'), (97, 3, '2025-07-11 09:07:08'), (97, 4, '2025-07-11 09:16:08'), (97, 5, '2025-07-11 09:21:08'), (97, 6, '2025-07-11 09:59:08'),
(98, 1, '2025-07-11 02:49:15'), (98, 2, '2025-07-11 02:59:15'), (98, 3, '2025-07-11 03:22:15'), (98, 4, '2025-07-11 03:31:15'), (98, 5, '2025-07-11 03:43:15'), (98, 6, '2025-07-11 04:18:15'),
(99, 1, '2025-07-11 06:14:13'), (99, 2, '2025-07-11 06:24:13'), (99, 3, '2025-07-11 06:40:13'), (99, 4, '2025-07-11 06:49:13'), (99, 5, '2025-07-11 06:58:13'), (99, 6, '2025-07-11 07:33:13'),
(100, 1, '2025-07-11 02:18:04'), (100, 2, '2025-07-11 02:26:04'), (100, 3, '2025-07-11 02:49:04'), (100, 4, '2025-07-11 02:59:04'), (100, 5, '2025-07-11 03:06:04'), (100, 6, '2025-07-11 03:44:04'),

-- Pedidos 101-110: Variaciones de cancelación, retraso, etc.
(101, 1, '2025-07-11 04:30:10'), (101, 2, '2025-07-11 04:36:10'), (101, 7, '2025-07-11 04:50:10'),
(102, 1, '2025-07-11 00:23:08'), -- Pendiente
(102, 11, '2025-07-11 00:35:08'), -- Rechazado por Comercio
(102, 7, '2025-07-11 00:45:08'), -- Cancelado (ADDED)
(103, 1, '2025-07-11 06:17:51'), (103, 2, '2025-07-11 06:27:51'), (103, 3, '2025-07-11 06:47:51'), (103, 8, '2025-07-11 06:53:51'), (103, 5, '2025-07-11 07:05:51'), (103, 6, '2025-07-11 07:34:51'),
(104, 1, '2025-07-10 18:28:16'), (104, 2, '2025-07-10 18:35:16'), (104, 3, '2025-07-10 18:59:16'), (104, 4, '2025-07-10 19:08:16'), (104, 12, '2025-07-10 19:15:16'), (104, 5, '2025-07-10 19:25:16'), (104, 6, '2025-07-10 19:50:16'),
(105, 1, '2025-07-11 03:41:25'), (105, 14, '2025-07-11 03:51:25'), (105, 7, '2025-07-11 04:10:25'),
(106, 1, '2025-07-10 17:27:26'), (106, 2, '2025-07-10 17:34:26'), (106, 3, '2025-07-10 17:51:26'), (106, 4, '2025-07-10 17:59:26'), (106, 13, '2025-07-10 18:12:26'), (106, 6, '2025-07-10 18:45:26'),
(107, 1, '2025-07-11 07:11:42'), (107, 15, '2025-07-11 07:16:42'), (107, 11, '2025-07-11 07:25:42'),
(108, 1, '2025-07-11 03:00:15'), (108, 2, '2025-07-11 03:05:15'), (108, 3, '2025-07-11 03:26:15'), (108, 4, '2025-07-11 03:34:15'), (108, 5, '2025-07-11 03:44:15'), (108, 6, '2025-07-11 04:15:15'),
(109, 1, '2025-07-11 00:09:44'), (109, 2, '2025-07-11 00:14:44'), (109, 3, '2025-07-11 00:30:44'), (109, 4, '2025-07-11 00:39:44'), (109, 5, '2025-07-11 00:44:44'), (109, 6, '2025-07-11 01:21:44'),
(110, 1, '2025-07-10 16:35:10'), (110, 2, '2025-07-10 16:40:10'), (110, 3, '2025-07-10 17:03:10'), (110, 4, '2025-07-10 17:08:10'), (110, 5, '2025-07-10 17:15:10'), (110, 6, '2025-07-10 17:51:10'),

-- Pedidos 111-120: Más variaciones
(111, 1, '2025-07-11 00:13:16'), (111, 2, '2025-07-11 00:21:16'), (111, 3, '2025-07-11 00:39:16'), (111, 8, '2025-07-11 00:44:16'), (111, 5, '2025-07-11 00:54:16'), (111, 6, '2025-07-11 01:32:16'),
(112, 1, '2025-07-10 22:54:25'), (112, 2, '2025-07-10 23:02:25'), (112, 3, '2025-07-10 23:23:25'), (112, 4, '2025-07-10 23:28:25'), (112, 12, '2025-07-10 23:36:25'), (112, 5, '2025-07-10 23:45:25'), (112, 6, '2025-07-11 00:15:25'),
(113, 1, '2025-07-11 05:43:16'), (113, 2, '2025-07-11 05:48:16'), (113, 7, '2025-07-11 06:00:16'),
(114, 1, '2025-07-11 02:40:19'), -- Pendiente
(114, 11, '2025-07-11 02:50:19'), -- Rechazado por Comercio
(114, 7, '2025-07-11 03:00:19'), -- Cancelado (ADDED)
(115, 1, '2025-07-10 19:35:01'), (115, 15, '2025-07-10 19:40:01'), (115, 7, '2025-07-10 19:50:01'),
(116, 1, '2025-07-11 04:54:02'), (116, 2, '2025-07-11 05:03:02'), (116, 3, '2025-07-11 05:22:02'), (116, 4, '2025-07-11 05:31:02'), (116, 5, '2025-07-11 05:44:02'), (116, 6, '2025-07-11 06:18:02'),
(117, 1, '2025-07-11 07:18:03'), (117, 2, '2025-07-11 07:28:03'), (117, 3, '2025-07-11 07:46:03'), (117, 4, '2025-07-11 07:53:03'), (117, 5, '2025-07-11 08:00:03'), (117, 6, '2025-07-11 08:34:03'),
(118, 1, '2025-07-11 00:45:00'), (118, 2, '2025-07-11 00:50:00'), (118, 3, '2025-07-11 01:08:00'), (118, 4, '2025-07-11 01:17:00'), (118, 5, '2025-07-11 01:25:00'), (118, 6, '2025-07-11 01:53:00'),
(119, 1, '2025-07-11 07:05:15'), (119, 2, '2025-07-11 07:10:15'), (119, 3, '2025-07-11 07:29:15'), (119, 4, '2025-07-11 07:37:15'), (119, 5, '2025-07-11 07:42:15'), (119, 6, '2025-07-11 08:14:15'),
(120, 1, '2025-07-10 18:31:21'), (120, 2, '2025-07-10 18:36:21'), (120, 3, '2025-07-10 18:57:21'), (120, 4, '2025-07-10 19:03:21'), (120, 5, '2025-07-10 19:16:21'), (120, 6, '2025-07-10 19:43:21'),

-- Pedidos 121-130: Nuevas combinaciones
(121, 1, '2025-07-11 00:54:19'), (121, 2, '2025-07-11 01:04:19'), (121, 3, '2025-07-11 01:26:19'), (121, 8, '2025-07-11 01:31:19'), (121, 7, '2025-07-11 01:45:19'), -- Retrasado y Cancelado
(122, 1, '2025-07-11 06:17:16'), (122, 14, '2025-07-11 06:27:16'), (122, 4, '2025-07-11 06:50:16'), (122, 5, '2025-07-11 06:59:16'), (122, 6, '2025-07-11 07:31:16'), -- Programado y Entregado
(123, 1, '2025-07-10 13:58:39'), (123, 2, '2025-07-10 14:03:39'), (123, 12, '2025-07-10 14:15:39'), (123, 8, '2025-07-10 14:25:39'), (123, 7, '2025-07-10 14:40:39'), -- Esperando Repartidor, Retrasado, Cancelado
(124, 1, '2025-07-11 09:27:36'), (124, 15, '2025-07-11 09:37:36'), (124, 11, '2025-07-11 09:45:36'), -- Error en Pago y Rechazado
(125, 1, '2025-07-10 18:31:21'), (125, 2, '2025-07-10 18:37:21'), (125, 3, '2025-07-10 19:04:21'), (125, 4, '2025-07-10 19:10:21'), (125, 5, '2025-07-10 19:22:21'), (125, 6, '2025-07-10 19:54:21'), (125, 9, '2025-07-10 20:10:21'), (125, 10, '2025-07-10 20:25:21'), -- Devolución y Reembolso
(126, 1, '2025-07-11 09:34:36'), (126, 2, '2025-07-11 09:41:36'), (126, 3, '2025-07-11 10:00:36'), (126, 4, '2025-07-11 10:08:36'), (126, 5, '2025-07-11 10:15:36'), (126, 6, '2025-07-11 10:52:36'),
(127, 1, '2025-07-11 03:00:15'), (127, 2, '2025-07-11 03:11:15'), (127, 3, '2025-07-11 03:29:15'), (127, 4, '2025-07-11 03:38:15'), (127, 5, '2025-07-11 03:43:15'), (127, 6, '2025-07-11 04:18:15'),
(128, 1, '2025-07-10 17:09:49'), (128, 2, '2025-07-10 17:16:49'), (128, 3, '2025-07-10 17:42:49'), (128, 4, '2025-07-10 17:51:49'), (128, 5, '2025-07-10 17:58:49'), (128, 6, '2025-07-10 18:31:49'),
(129, 1, '2025-07-10 13:57:20'), (129, 2, '2025-07-10 14:07:20'), (129, 3, '2025-07-10 14:26:20'), (129, 4, '2025-07-10 14:35:20'), (129, 5, '2025-07-10 14:48:20'), (129, 6, '2025-07-10 15:15:20'),
(130, 1, '2025-07-11 00:54:19'), (130, 2, '2025-07-11 01:04:19'), (130, 3, '2025-07-11 01:21:19'), (130, 4, '2025-07-11 01:27:19'), (130, 5, '2025-07-11 01:34:19'), (130, 6, '2025-07-11 02:08:19'),

-- Pedidos 131-140: Más variaciones y repeticiones
(131, 1, '2025-07-11 08:35:10'), (131, 2, '2025-07-11 08:44:10'), (131, 3, '2025-07-11 09:07:10'), (131, 4, '2025-07-11 09:12:10'), (131, 5, '2025-07-11 09:23:10'), (131, 6, '2025-07-11 09:59:10'),
(132, 1, '2025-07-10 18:59:16'), (132, 2, '2025-07-10 19:07:16'), (132, 3, '2025-07-10 19:20:16'), (132, 4, '2025-07-10 19:26:16'), (132, 5, '2025-07-10 19:35:16'), (132, 6, '2025-07-10 20:12:16'),
(133, 1, '2025-07-11 07:05:15'), (133, 2, '2025-07-11 07:14:15'), (133, 3, '2025-07-11 07:38:15'), (133, 4, '2025-07-11 07:43:15'), (133, 5, '2025-07-11 07:56:15'), (133, 6, '2025-07-11 08:31:15'),
(134, 1, '2025-07-10 18:37:11'), (134, 2, '2025-07-10 18:47:11'), (134, 3, '2025-07-10 19:15:11'), (134, 4, '2025-07-10 19:20:11'), (134, 5, '2025-07-10 19:33:11'), (134, 6, '2025-07-10 20:06:11'),
(135, 1, '2025-07-11 00:19:16'), (135, 2, '2025-07-11 00:27:16'), (135, 3, '2025-07-11 00:46:16'), (135, 4, '2025-07-11 00:54:16'), (135, 5, '2025-07-11 01:03:16'), (135, 6, '2025-07-11 01:36:16'),
(136, 1, '2025-07-11 06:14:00'), (136, 2, '2025-07-11 06:21:00'), (136, 3, '2025-07-11 06:40:00'), (136, 4, '2025-07-11 06:46:00'), (136, 5, '2025-07-11 06:54:00'), (136, 6, '2025-07-11 07:29:00'),
(137, 1, '2025-07-11 02:44:23'), (137, 2, '2025-07-11 02:51:23'), (137, 3, '2025-07-11 03:13:23'), (137, 4, '2025-07-11 03:22:23'), (137, 5, '2025-07-11 03:37:23'), (137, 6, '2025-07-11 04:08:23'),
(138, 1, '2025-07-10 14:52:33'), (138, 2, '2025-07-10 15:01:33'), (138, 3, '2025-07-10 15:21:33'), (138, 4, '2025-07-10 15:29:33'), (138, 5, '2025-07-10 15:37:33'), (138, 6, '2025-07-10 16:15:33'),
(139, 1, '2025-07-11 03:41:25'), (139, 2, '2025-07-11 03:46:25'), (139, 3, '2025-07-11 04:02:25'), (139, 4, '2025-07-11 04:10:25'), (139, 5, '2025-07-11 04:19:25'), (139, 6, '2025-07-11 04:54:25'),
(140, 1, '2025-07-10 14:18:49'), (140, 2, '2025-07-10 14:26:49'), (140, 3, '2025-07-10 14:48:49'), (140, 4, '2025-07-10 14:57:49'), (140, 5, '2025-07-10 15:07:49'), (140, 6, '2025-07-10 15:43:49'),

-- Pedidos 141-150: Más variaciones
(141, 1, '2025-07-11 02:44:03'), (141, 2, '2025-07-11 02:51:03'), (141, 3, '2025-07-11 03:13:03'), (141, 4, '2025-07-11 03:22:03'), (141, 5, '2025-07-11 03:34:03'), (141, 6, '2025-07-11 04:03:03'),
(142, 1, '2025-07-10 15:10:04'), (142, 2, '2025-07-10 15:21:04'), (142, 3, '2025-07-10 15:43:04'), (142, 4, '2025-07-10 15:52:04'), (142, 5, '2025-07-10 16:03:04'), (142, 6, '2025-07-10 16:36:04'),
(143, 1, '2025-07-10 17:34:25'), (143, 2, '2025-07-10 17:44:25'), (143, 3, '2025-07-10 18:02:25'), (143, 4, '2025-07-10 18:11:25'), (143, 5, '2025-07-10 18:24:25'), (143, 6, '2025-07-10 19:00:25'),
(144, 1, '2025-07-11 07:11:42'), (144, 2, '2025-07-11 07:22:42'), (144, 3, '2025-07-11 07:42:42'), (144, 4, '2025-07-11 07:51:42'), (144, 5, '2025-07-11 08:00:42'), (144, 6, '2025-07-11 08:35:42'),
(145, 1, '2025-07-10 18:35:50'), (145, 2, '2025-07-10 18:41:50'), (145, 3, '2025-07-10 19:04:50'), (145, 4, '2025-07-10 19:10:50'), (145, 5, '2025-07-10 19:22:50'), (145, 6, '2025-07-10 19:54:50'),
(146, 1, '2025-07-11 00:36:28'), (146, 2, '2025-07-11 00:43:28'), (146, 3, '2025-07-11 00:58:28'), (146, 4, '2025-07-11 01:05:28'), (146, 5, '2025-07-11 01:13:28'), (146, 6, '2025-07-11 01:43:28'),
(147, 1, '2025-07-11 00:46:58'), (147, 2, '2025-07-11 00:54:58'), (147, 3, '2025-07-11 01:13:58'), (147, 4, '2025-07-11 01:19:58'), (147, 5, '2025-07-11 01:31:58'), (147, 6, '2025-07-11 02:08:58'),
(148, 1, '2025-07-10 17:51:49'), (148, 2, '2025-07-10 18:02:49'), (148, 3, '2025-07-10 18:24:49'), (148, 4, '2025-07-10 18:31:49'), (148, 5, '2025-07-10 18:37:49'), (148, 6, '2025-07-10 19:11:49'),
(149, 1, '2025-07-10 19:57:42'), (149, 2, '2025-07-10 20:07:42'), (149, 3, '2025-07-10 20:25:42'), (149, 4, '2025-07-10 20:34:42'), (149, 5, '2025-07-10 20:49:42'), (149, 6, '2025-07-10 21:19:42'),
(150, 1, '2025-07-10 20:03:00'), (150, 2, '2025-07-10 20:13:00'), (150, 3, '2025-07-10 20:36:00'), (150, 4, '2025-07-10 20:46:00'), (150, 5, '2025-07-10 20:53:00'), (150, 6, '2025-07-10 21:28:00');

