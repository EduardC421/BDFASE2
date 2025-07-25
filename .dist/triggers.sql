--trigger a


-- Factura
CREATE TRIGGER trg_GenerarFacturas
ON PedidoDetalleOpcionValor
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @porcentajeIVA DECIMAL(5,2) = 16;

    WITH PedidosAfectados AS (
        SELECT DISTINCT PD.idPedido
        FROM inserted i
        JOIN PedidoDetalle PD ON PD.id = i.idPedidoDetalle
    ),
    TotalPorItems AS (
        SELECT PD.idPedido, SUM(PD.total) AS TotalItems
        FROM PedidoDetalle PD
        WHERE PD.idPedido IN (SELECT idPedido FROM PedidosAfectados)
        GROUP BY PD.idPedido
    ),
    TotalExtras AS (
        SELECT PD.idPedido, SUM(OV.precio_extra) AS TotalExtras
        FROM inserted i
        JOIN PedidoDetalle PD ON PD.id = i.idPedidoDetalle
        JOIN OpcionValor OV ON OV.id = i.idOpcionValor
        WHERE PD.idPedido IN (SELECT idPedido FROM PedidosAfectados)
        GROUP BY PD.idPedido
    )
    INSERT INTO Factura (numero, fecha_emision, sub_total, porcentajeIva, montoIva, monto_total, idPedido)
    SELECT 
        P.idPedido,                   -- numero factura igual idPedido
        CAST(GETDATE() AS DATE),      -- fecha emisión actual
        ROUND(ISNULL(I.TotalItems, 0) + ISNULL(E.TotalExtras, 0), 2),   -- subtotal sin IVA
        @porcentajeIVA,               -- porcentaje IVA fijo
        ROUND((ISNULL(I.TotalItems, 0) + ISNULL(E.TotalExtras, 0)) * @porcentajeIVA / 100.0, 2), -- monto IVA
        ROUND(
            (ISNULL(I.TotalItems, 0) + ISNULL(E.TotalExtras, 0)) * (1 + @porcentajeIVA / 100.0)
            + ISNULL(P2.costo_envio, 0), 2),   -- total con IVA + costo envío
        P.idPedido
    FROM PedidosAfectados P
    LEFT JOIN TotalPorItems I ON I.idPedido = P.idPedido
    LEFT JOIN TotalExtras E ON E.idPedido = P.idPedido
    JOIN Pedido P2 ON P2.id = P.idPedido
    WHERE NOT EXISTS (
        SELECT 1 FROM Factura F WHERE F.idPedido = P.idPedido
    );
END;


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


-- Al cambiar el estado del pedido a “Entregado” en PedidoEstadoPedido, se inserta la valoración en ClienteRepartidor

CREATE TRIGGER llenarClienteRepartidor
ON PedidoEstadoPedido
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @estado INT;

    SELECT @estado = id
    FROM EstadoPedido
    WHERE nombre = 'Entregado';


    INSERT INTO ClienteRepartidor (idCliente, idRepartidor, fecha, puntaje, comentario)
    SELECT
        cp.idCliente,
        rp.idRepartidor,
        CAST(GETDATE() AS DATE),
        5,
        'Sin valoración'
    FROM
        inserted i
    INNER JOIN RepartidorPedido rp ON rp.idPedido = i.idPedido
    INNER JOIN ClientePedido cp ON cp.idPedido = i.idPedido
    LEFT JOIN ClienteRepartidor cr ON
        cr.idCliente = cp.idCliente AND
        cr.idRepartidor = rp.idRepartidor AND
        cr.fecha = CAST(GETDATE() AS DATE)
    WHERE
        i.idEstadoPedido = @estado AND
        cr.idCliente IS NULL; -- Se hará el insert si el cliente no ha calificado a ese repartidor
END;




--B----------------
-- Este trigger se ejecuta DESPUÉS de eliminar una fila de la tabla PedidoDetalle.
-- Su propósito es ajustar la cantidad disponible del plato correspondiente
-- y "restaurar" la disponibilidad si el plato estaba agotado.
CREATE TRIGGER trg_InsteadOfDelete_PedidoDetalle
ON PedidoDetalle
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Eliminar registros dependientes en PedidoDetalleOpcionValor
    DELETE FROM PedidoDetalleOpcionValor
    WHERE idPedidoDetalle IN (SELECT id FROM DELETED);

    -- 2. Actualizar la cantidad disponible y disponibilidad del Plato
    UPDATE P
    SET
        P.cantidadDisponible = P.cantidadDisponible + D.cantidad,
        P.disponibilidad = 1 -- suponiendo que es BIT y 1 significa "disponible"
    FROM Plato P
    INNER JOIN DELETED D ON D.idPlato = P.id;

    -- 3. Eliminar de PedidoDetalle
    DELETE FROM PedidoDetalle
    WHERE id IN (SELECT id FROM DELETED);
END;


----------------------C---------------------------
CREATE TRIGGER trg_InsertarOpciones_PedidoDetalle
ON PedidoDetalle
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PedidoDetalleOpcionValor (idPedidoDetalle, idOpcion, idOpcionValor)
    SELECT 
        i.id, 
        pov.idOpcion,
        pov.idOpcionValor
    FROM inserted i
    INNER JOIN PlatoOpcionValor pov ON pov.idPlato = i.idPlato;
END;


-- nuevo pedido
INSERT INTO Pedido (id, cantidad_items, costo_envio, nota, tiempo_entrega, total) VALUES
(151, 6, 6.50, 'prueba', 39, 78.50);

SELECT * FROM Pedido;
SELECT * FROM Factura;

--Es el D

-- El plato tiene 5 unidades disponibles
INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato)
VALUES (1001, 2, 'Sin cebolla', 25.00, 218, 1);
-- Esperado: éxito, y el inventario se reduce a 3 unidades


-- El plato ahora tiene solo 3 unidades disponibles
INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato)
VALUES (1002, 4, 'Extra picante', 50.00, 218, 1);
-- Esperado: ERROR -> “No hay unidades suficientes del producto para esta compra”


-- Manualmente dejamos el inventario en 0 para simular agotado
UPDATE Plato SET cantidadDisponible = 0 WHERE id = 1;

-- Intentamos pedir 1 unidad
INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato)
VALUES (1003, 1, 'Sin sal', 12.00, 218, 1);
-- Esperado: ERROR -> “El producto no está disponible por los momentos”

CREATE TRIGGER trg_validar_inventario_pedido_detalle
ON PedidoDetalle
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar existencia de los platos
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN Plato p ON i.idPlato = p.id
        WHERE p.id IS NULL
    )
    BEGIN
        RAISERROR('Uno o más productos no existen.', 16, 1);
        RETURN;
    END

    -- Validar que haya al menos una unidad disponible
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Plato p ON i.idPlato = p.id
        WHERE p.cantidadDisponible = 0
    )
    BEGIN
        RAISERROR('El producto no está disponible por los momentos.', 16, 1);
        RETURN;
    END

    -- Validar que haya suficientes unidades disponibles para todos los detalles
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Plato p ON i.idPlato = p.id
        WHERE i.cantidad > p.cantidadDisponible
    )
    BEGIN
        RAISERROR('No hay unidades suficientes del producto para esta compra.', 16, 1);
        RETURN;
    END

    -- Si todo está correcto, insertar los registros
    INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato)
    SELECT id, cantidad, nota, total, idPedido, idPlato
    FROM inserted;

    -- Actualizar el inventario restando las cantidades correspondientes
    UPDATE P
    SET P.cantidadDisponible = P.cantidadDisponible - T.total_cantidad
    FROM Plato P
    JOIN (
        SELECT idPlato, SUM(cantidad) AS total_cantidad
        FROM inserted
        GROUP BY idPlato
    ) T ON P.id = T.idPlato;
END;
