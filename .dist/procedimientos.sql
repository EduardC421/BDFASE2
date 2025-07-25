--A

CREATE PROCEDURE CrearPedidoConFactura
    @idCliente INT,
    @nombreCliente VARCHAR(100),
    @telefono VARCHAR(20),
    @direccion VARCHAR(255),

    -- Platos (hasta 3 para este ejemplo)
    @idPlato1 INT, @cantidad1 INT, @opcionValor1 INT = NULL,
    @idPlato2 INT = NULL, @cantidad2 INT = NULL, @opcionValor2 INT = NULL,
    @idPlato3 INT = NULL, @cantidad3 INT = NULL, @opcionValor3 INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si cliente ya existe
    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE id = @idCliente)
    BEGIN
        INSERT INTO Cliente (id, nombre, telefono, direccion)
        VALUES (@idCliente, @nombreCliente, @telefono, @direccion);
    END

    -- Crear nuevo ID de pedido
    DECLARE @idPedido INT;
    SELECT @idPedido = ISNULL(MAX(id), 0) + 1 FROM Pedido;

    -- Crear el pedido en estado 'Pendiente' (idEstadoPedido = 1)
    INSERT INTO Pedido (id, idCliente, fecha, idEstadoPedido, total)
    VALUES (@idPedido, @idCliente, GETDATE(), 1, 0);

    -- Variables auxiliares
    DECLARE @precio DECIMAL(10,2), @extra DECIMAL(10,2), @subtotal DECIMAL(10,2);
    DECLARE @totalPedido DECIMAL(10,2) = 0;

    -- === Plato 1 ===
    IF @idPlato1 IS NOT NULL AND @cantidad1 IS NOT NULL
    BEGIN
        SELECT @precio = precio FROM Plato WHERE id = @idPlato1;
        SELECT @extra = ISNULL((SELECT precio_extra FROM OpcionValor WHERE id = @opcionValor1), 0);
        SET @subtotal = (@precio + @extra) * @cantidad1;
        
        INSERT INTO PedidoPlato (idPedido, idPlato, cantidad, subtotal)
        VALUES (@idPedido, @idPlato1, @cantidad1, @subtotal);
        
        IF @opcionValor1 IS NOT NULL
            INSERT INTO PedidoPlatoOpcionValor (idPedido, idPlato, idOpcionValor)
            VALUES (@idPedido, @idPlato1, @opcionValor1);

        SET @totalPedido += @subtotal;
    END

    -- === Plato 2 ===
    IF @idPlato2 IS NOT NULL AND @cantidad2 IS NOT NULL
    BEGIN
        SELECT @precio = precio FROM Plato WHERE id = @idPlato2;
        SELECT @extra = ISNULL((SELECT precio_extra FROM OpcionValor WHERE id = @opcionValor2), 0);
        SET @subtotal = (@precio + @extra) * @cantidad2;
        
        INSERT INTO PedidoPlato (idPedido, idPlato, cantidad, subtotal)
        VALUES (@idPedido, @idPlato2, @cantidad2, @subtotal);
        
        IF @opcionValor2 IS NOT NULL
            INSERT INTO PedidoPlatoOpcionValor (idPedido, idPlato, idOpcionValor)
            VALUES (@idPedido, @idPlato2, @opcionValor2);

        SET @totalPedido += @subtotal;
    END

    -- === Plato 3 ===
    IF @idPlato3 IS NOT NULL AND @cantidad3 IS NOT NULL
    BEGIN
        SELECT @precio = precio FROM Plato WHERE id = @idPlato3;
        SELECT @extra = ISNULL((SELECT precio_extra FROM OpcionValor WHERE id = @opcionValor3), 0);
        SET @subtotal = (@precio + @extra) * @cantidad3;
        
        INSERT INTO PedidoPlato (idPedido, idPlato, cantidad, subtotal)
        VALUES (@idPedido, @idPlato3, @cantidad3, @subtotal);
        
        IF @opcionValor3 IS NOT NULL
            INSERT INTO PedidoPlatoOpcionValor (idPedido, idPlato, idOpcionValor)
            VALUES (@idPedido, @idPlato3, @opcionValor3);

        SET @totalPedido += @subtotal;
    END

    -- Actualizar total del pedido
    UPDATE Pedido
    SET total = @totalPedido
    WHERE id = @idPedido;

    -- Mostrar la factura
    SELECT 
        P.id AS PedidoID,
        C.nombre AS Cliente,
        P.fecha AS Fecha,
        Pl.nombre AS Plato,
        Pl.precio AS PrecioBase,
        PP.cantidad,
        OV.nombre AS Opcion,
        OV.precio_extra AS PrecioExtra,
        (Pl.precio + ISNULL(OV.precio_extra, 0)) * PP.cantidad AS Subtotal
    FROM Pedido P
    JOIN Cliente C ON C.id = P.idCliente
    JOIN PedidoPlato PP ON P.id = PP.idPedido
    JOIN Plato Pl ON PP.idPlato = Pl.id
    LEFT JOIN PedidoPlatoOpcionValor PPOV ON PPOV.idPedido = PP.idPedido AND PPOV.idPlato = PP.idPlato
    LEFT JOIN OpcionValor OV ON OV.id = PPOV.idOpcionValor
    WHERE P.id = @idPedido;

    PRINT 'Total del Pedido: $' + CAST(@totalPedido AS VARCHAR);
END;

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

