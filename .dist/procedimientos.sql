--A

--procedure A V2
CREATE TYPE DetallePedidoType AS TABLE (
    idPedidoDetalle INT,
    idPlato INT,
    cantidad INT,
    nota NVARCHAR(500)
);
CREATE PROCEDURE sp_CrearPedidoCompletoV2
    @idCliente INT,
    @costo_envio DECIMAL(10, 2),
    @nota NVARCHAR(500),
    @tiempo_entrega INT,
    @detallesPedido DetallePedidoType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @cantidad_items INT;
    SELECT @cantidad_items = COUNT(*) FROM @detallesPedido;

    -- Generar nuevo idPedido (ejemplo)
    DECLARE @idPedido INT = (SELECT ISNULL(MAX(id), 0) + 1 FROM Pedido);

    -- Insertar pedido sin fecha ni cliente
    INSERT INTO Pedido (id, cantidad_items, costo_envio, nota, total, tiempo_entrega)
    VALUES (@idPedido, @cantidad_items, @costo_envio, @nota, 0, @tiempo_entrega);

    -- Insertar detalles con total calculado
    INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato)
    SELECT 
        idPedidoDetalle,
        cantidad,
        nota,
        cantidad * p.precio,
        @idPedido,
        idPlato
    FROM @detallesPedido dp
    JOIN Plato p ON p.id = dp.idPlato;

    -- Actualizar total en Pedido sumando los totales de los detalles
    UPDATE Pedido
    SET total = (
        SELECT SUM(total)
        FROM PedidoDetalle
        WHERE idPedido = @idPedido
    )
    WHERE id = @idPedido;

    -- Asociar pedido a cliente
    INSERT INTO ClientePedido (idCliente, idPedido, fecha)
    VALUES (@idCliente, @idPedido, GETDATE());

    -- Insertar estado pendiente
    INSERT INTO PedidoEstadoPedido (idPedido, idEstadoPedido, fecha_inicio)
    VALUES (@idPedido, 1, GETDATE());

    -- Esperar que trigger genere factura, luego actualizarla
    DECLARE @numFactura INT;
    SELECT @numFactura = numero FROM Factura WHERE idPedido = @idPedido;

    UPDATE Factura
    SET
        sub_total = dbo.fn_ObtenerSubTotal(@numFactura),
        montoIva = dbo.fn_ObtenerMontoIVA(@numFactura),
        monto_total = dbo.fn_ObtenerMontoTotal(@numFactura)
    WHERE numero = @numFactura;

    SELECT @idPedido AS NuevoPedidoID;
END;
--caso de prueba
-- Detalles de pedidos relacionados
SELECT * FROM PedidoDetalle WHERE idPedido >= (SELECT ISNULL(MAX(id), 0) + 1 FROM Pedido) - 10;

-- Asociaciones Cliente-Pedido
SELECT * FROM ClientePedido WHERE idPedido >= (SELECT ISNULL(MAX(id), 0) + 1 FROM Pedido) - 10;

-- Estados de pedidos
SELECT * FROM PedidoEstadoPedido WHERE idPedido >= (SELECT ISNULL(MAX(id), 0) + 1 FROM Pedido) - 10;

-- Facturas relacionadas
SELECT * FROM Factura WHERE idPedido >= (SELECT ISNULL(MAX(id), 0) + 1 FROM Pedido) - 10;

-- Ahora, un ejemplo para probar el procedimiento
DECLARE @detalles DetallePedidoType;

-- Supongamos que tienes estos platos con id 1 y 2, con precios ya cargados en Plato
INSERT INTO @detalles (idPedidoDetalle, cantidad, nota, idPlato)
VALUES
(222, 2, 'Sin cebolla', 5),
(223, 1, 'Extra picante', 88);

-- Ejecutamos el procedimiento con estos datos
EXEC sp_CrearPedidoCompletoV2
    @idCliente = 100,          -- Asegúrate que el cliente con id 101 exista
    @costo_envio = 5.00,
    @nota = 'Por favor, rápido',
    @tiempo_entrega = 45,
    @detallesPedido = @detalles;

-- El procedimiento devolverá el id del pedido creado
-- Estado ANTES de ejecutar el procedimiento

-- Pedidos existentes
SELECT * FROM Pedido WHERE id >= (SELECT ISNULL(MAX(id), 0) + 1 FROM Pedido) - 10;



-- Ejecutar el procedimiento aquí
-- EXEC sp_CrearPedidoCompletoV2 ...

-- Estado DESPUÉS de ejecutar el procedimiento

-- Pedidos nuevos
SELECT * FROM Pedido ORDER BY id DESC;

-- Detalles nuevos
SELECT * FROM PedidoDetalle WHERE idPedido = (SELECT MAX(id) FROM Pedido);

-- ClientePedido nuevo
SELECT * FROM ClientePedido WHERE idPedido = (SELECT MAX(id) FROM Pedido);

-- EstadoPedido nuevo
SELECT * FROM PedidoEstadoPedido WHERE idPedido = (SELECT MAX(id) FROM Pedido);

-- Factura nueva
SELECT * FROM Factura WHERE idPedido = (SELECT MAX(id) FROM Pedido);

---- ejemplo de uso

EXEC CrearPedidoConFactura 
    @idCliente = 10,
    @nombreCliente = 'Pedro Ruiz',
    @telefono = '555123456',
    @direccion = 'Av. Central 456',

    @idPlato1 = 1, @cantidad1 = 2, @opcionValor1 = 1,
    @idPlato2 = 2, @cantidad2 = 1, @opcionValor2 = 4,
    @idPlato3 = NULL, @cantidad3 = NULL, @opcionValor3 = NULL;






-- La B

CREATE PROCEDURE asignar_repartidor_menos_cargado
    @id_pedido INT
AS
BEGIN
    SET NOCOUNT ON; -- Suprime los mensajes de conteo de filas afectadas

    DECLARE @fecha_pedido DATE;
    DECLARE @id_repartidor_menos_cargado INT;

    -- 1. Obtener la fecha del pedido desde la tabla ClientePedido
    -- Se asume que cada pedido tiene una entrada en ClientePedido que define su fecha.
    SELECT @fecha_pedido = CP.fecha
    FROM Pedido P
    JOIN ClientePedido CP ON P.id = CP.idPedido
    WHERE P.id = @id_pedido;

    -- Verificar si se encontró la fecha del pedido
    IF @fecha_pedido IS NULL
    BEGIN
        PRINT 'Error: No se encontró la fecha para el pedido con ID ' + CAST(@id_pedido AS NVARCHAR(10)) + '. Asegúrate de que el pedido exista y esté asociado a un cliente en ClientePedido.';
        RETURN; -- Salir del procedimiento si no se encuentra la fecha
    END;

    -- 2. Encontrar el repartidor activo con menos pedidos para esa fecha específica
    -- Se unen Repartidor con un subconsulta que cuenta los pedidos de cada repartidor para la fecha actual.
    SELECT TOP 1 @id_repartidor_menos_cargado = R.id
    FROM Repartidor R
    LEFT JOIN (
        -- Subconsulta para contar los pedidos de cada repartidor para la fecha del pedido
        SELECT RP.idRepartidor, COUNT(RP.idPedido) AS total_pedidos_hoy
        FROM RepartidorPedido RP
        JOIN ClientePedido CP_Inner ON RP.idPedido = CP_Inner.idPedido
        WHERE CP_Inner.fecha = @fecha_pedido
        GROUP BY RP.idRepartidor
    ) AS EntregasDia ON R.id = EntregasDia.idRepartidor
    WHERE R.estado = 'Activo' -- Considerar solo repartidores activos
    ORDER BY ISNULL(EntregasDia.total_pedidos_hoy, 0) ASC; -- Ordenar por el total de pedidos (los NULL van primero)

    -- Verificar si se encontró un repartidor
    IF @id_repartidor_menos_cargado IS NULL
    BEGIN
        PRINT 'Error: No hay repartidores activos disponibles o no se pudo encontrar el menos cargado.';
        RETURN; -- Salir del procedimiento si no se encuentra un repartidor
    END;

    -- 3. Asignar el repartidor al pedido en la tabla RepartidorPedido
    -- Si el pedido ya tiene un repartidor asignado, se actualiza; de lo contrario, se inserta.
    IF EXISTS (SELECT 1 FROM RepartidorPedido WHERE idPedido = @id_pedido)
    BEGIN
        UPDATE RepartidorPedido
        SET idRepartidor = @id_repartidor_menos_cargado,
            tiempo_entrega = NULL -- Puedes ajustar este valor si tienes una lógica específica para el tiempo de entrega inicial
        WHERE idPedido = @id_pedido;
        PRINT 'Repartidor actualizado para el pedido ' + CAST(@id_pedido AS NVARCHAR(10)) + ': ' + CAST(@id_repartidor_menos_cargado AS NVARCHAR(10));
    END
    ELSE
    BEGIN
        INSERT INTO RepartidorPedido (idRepartidor, idPedido, tiempo_entrega)
        VALUES (@id_repartidor_menos_cargado, @id_pedido, NULL); -- tiempo_entrega puede ser NULL inicialmente
        PRINT 'Repartidor asignado al pedido ' + CAST(@id_pedido AS NVARCHAR(10)) + ': ' + CAST(@id_repartidor_menos_cargado AS NVARCHAR(10));
    END
END;

EXEC asignar_repartidor_menos_cargado @idPedido = 123;




---C----
CREATE PROCEDURE ReportePedidosPorComercio
    @idComercio INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Reporte agrupado por día
    SELECT
        CAST(ped.fecha AS DATE) AS fecha,
        COUNT(DISTINCT ped.idPedido) AS cantidad_pedidos,
        SUM(pd.total) AS total_ventas,
        
        -- Plato más solicitado en ese día
        (
            SELECT TOP 1 p.nombre
            FROM PedidoDetalle pd2
            JOIN Pedido pe2 ON pe2.id = pd2.idPedido
            JOIN ClientePedido ped2 ON ped2.idPedido = pe2.id
            JOIN Plato p ON p.id = pd2.idPlato
            JOIN Seccion s ON s.id = p.idSeccion
            JOIN Menu m ON m.id = s.idMenu
            WHERE m.idComercio = @idComercio AND CAST(ped2.fecha AS DATE) = CAST(ped.fecha AS DATE)
            GROUP BY p.nombre
            ORDER BY SUM(pd2.cantidad) DESC
        ) AS plato_mas_solicitado

    FROM
        PedidoDetalle pd
    JOIN Pedido p ON p.id = pd.idPedido
    JOIN ClientePedido ped ON ped.idPedido = p.id
    JOIN Plato pl ON pl.id = pd.idPlato
    JOIN Seccion s ON s.id = pl.idSeccion
    JOIN Menu m ON m.id = s.idMenu
    WHERE m.idComercio = @idComercio
    GROUP BY CAST(ped.fecha AS DATE)
    ORDER BY fecha;
END;
EXEC sp_ReportePedidosConsolidado @idComercio = 3;





-- D --

CREATE PROCEDURE PlatoNuevo
    @idComercio INT,
    @idMenu INT,
    @nombrePlato VARCHAR(100),
    @precio DECIMAL(10,2),
    @descripcion VARCHAR(255),
    @cantidadDisponible INT,
    @ordenAparicion INT,
    @idSeccion INT,
    @opcionesPersonalizables VARCHAR(MAX) = NULL -- tiene la forma "idOpcion1,idOpcionValor1;idOpcion2,idOpcionValor2"
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF NOT EXISTS (SELECT 1 FROM Comercio WHERE id = @idComercio AND estaActivo = 1)
        BEGIN
            RAISERROR('El comercio no existe o no está activo', 16, 1);
            RETURN;
        END
        
        IF NOT EXISTS (SELECT 1 FROM Menu WHERE id = @idMenu AND idComercio = @idComercio)
        BEGIN
            RAISERROR('El menú no existe o no pertenece al comercio', 16, 1);
            RETURN;
        END
        
        IF NOT EXISTS (SELECT 1 FROM Seccion WHERE id = @idSeccion AND idMenu = @idMenu)
        BEGIN
            RAISERROR('La sección especificada no existe en el menú', 16, 1);
            RETURN;
        END
        
        -- 4. Verificar que no existe un plato con el mismo nombre en la misma sección
        IF EXISTS (SELECT 1 FROM Plato WHERE nombre = @nombrePlato AND idSeccion = @idSeccion)
        BEGIN
            RAISERROR('Ya existe este plato', 16, 1);
            RETURN;
        END
        
        -- 5. Generar nuevo ID para el plato
        DECLARE @nuevoIdPlato INT;
        SELECT @nuevoIdPlato = ISNULL(MAX(id), 0) + 1 FROM Plato;
        
        -- 6. Insertar el nuevo plato
        INSERT INTO Plato (
            id, 
            nombre, 
            orden, 
            cantidadDisponible, 
            precio, 
            descripcion, 
            idSeccion, 
            disponibilidad
        ) VALUES (
            @nuevoIdPlato,
            @nombrePlato,
            @ordenAparicion,
            @cantidadDisponible,
            @precio,
            @descripcion,
            @idSeccion,
            1
        );
        
        -- Procesar opciones
        IF @opcionesPersonalizables IS NOT NULL AND @opcionesPersonalizables <> ''
        BEGIN
            -- Crear tabla temporal para almacenar las opciones
            DECLARE @OpcionesTemp TABLE (
                idOpcion INT,
                idOpcionValor INT
            );
            
            -- Procesamos las opciones
            DECLARE @pos INT = 1;
            DECLARE @nextPos INT;
            DECLARE @pair VARCHAR(100);
            DECLARE @commaPos INT;
            DECLARE @idOpcion INT;
            DECLARE @idOpcionValor INT;
            
            WHILE @pos <= LEN(@opcionesPersonalizables)
            BEGIN
                SET @nextPos = CHARINDEX(';', @opcionesPersonalizables, @pos);
                
                IF @nextPos = 0
                    SET @nextPos = LEN(@opcionesPersonalizables) + 1;
                
                SET @pair = SUBSTRING(@opcionesPersonalizables, @pos, @nextPos - @pos);
                
                -- Separamos por idOpcion e idOpcionValor
                SET @commaPos = CHARINDEX(',', @pair);
                
                IF @commaPos > 0
                BEGIN
                    SET @idOpcion = CAST(SUBSTRING(@pair, 1, @commaPos - 1) AS INT);
                    SET @idOpcionValor = CAST(SUBSTRING(@pair, @commaPos + 1, LEN(@pair) - @commaPos) AS INT);
                    
                    -- Verificamos que la opción y el valor existan
                    IF NOT EXISTS (SELECT 1 FROM Opcion WHERE id = @idOpcion)
                    BEGIN
                        RAISERROR('La opción con ID %d no existe.', 16, 1, @idOpcion);
                        RETURN;
                    END
                    
                    IF NOT EXISTS (SELECT 1 FROM OpcionValor WHERE id = @idOpcionValor AND idOpcion = @idOpcion)
                    BEGIN
                        RAISERROR('El valor de opción con ID %d no existe para la opción %d.', 16, 1, @idOpcionValor, @idOpcion);
                        RETURN;
                    END
                    
                    -- Insertar en tabla temporal
                    INSERT INTO @OpcionesTemp (idOpcion, idOpcionValor)
                    VALUES (@idOpcion, @idOpcionValor);
                END
                
                SET @pos = @nextPos + 1;
            END
            
            -- Insertar las opciones en las tablas correspondientes
            INSERT INTO PlatoOpcion (idPlato, idOpcion)
            SELECT @nuevoIdPlato, idOpcion
            FROM @OpcionesTemp;
            
            INSERT INTO PlatoOpcionValor (idPlato, idOpcionValor, idOpcion)
            SELECT @nuevoIdPlato, idOpcionValor, idOpcion
            FROM @OpcionesTemp;
        END
        
        COMMIT TRANSACTION;
        
        SELECT @nuevoIdPlato AS NuevoIdPlato;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
        
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

-- Ejemplo de prueba sin opciones personalizables
EXEC PlatoNuevo
    @idComercio = 1, -- Parrilla Criolla
    @idMenu = 1, -- Menú Parrillero
    @nombrePlato = 'Costillas BBQ',
    @precio = 22.50,
    @descripcion = 'Costillas de cerdo bañadas en salsa BBQ casera',
    @cantidadDisponible = 10,
    @ordenAparicion = 4,
    @idSeccion = 1; -- Carnes a la Brasa

-- Ejemplo de prueba con opciones personalizables
EXEC PlatoNuevo
    @idComercio = 26, -- Street Food Market
    @idMenu = 26, -- Menú Street Food
    @nombrePlato = 'Hamburguesa Gourmet',
    @precio = 15.99,
    @descripcion = 'Hamburguesa artesanal con queso y vegetales frescos',
    @cantidadDisponible = 15,
    @ordenAparicion = 5,
    @idSeccion = 127, -- Burgers y Hot Dogs Gourmet
    @opcionesPersonalizables = '3,8;6,17;7,20'; -- Tipo de pan: Pan blanco; Toppings: Queso cheddar; Extras: Aguacate

-- prueba
SELECT p.*
FROM Plato p
JOIN Seccion s ON p.idSeccion = s.id
JOIN Menu m ON s.idMenu = m.id
WHERE m.id = 26;

SELECT* from Plato where idMenu=1;