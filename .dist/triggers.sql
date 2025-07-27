--triggers parte a

-- Factura
CREATE TRIGGER trg_GenerarFactura
ON Pedido
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @porcentajeIVA DECIMAL(5,2) = 16.00; -- Puedes ajustar este valor según tu configuración fiscal

    INSERT INTO Factura (
        numero,
        fecha_emision,
        sub_total,
        porcentajeIva,
        montoIva,
        monto_total,
        idPedido
    )
    SELECT
        i.id,  -- usaremos el id del pedido como número de factura
        CAST(GETDATE() AS DATE) AS fecha_emision,
        CAST(ISNULL(PD.TotalItems + Extras.TotalExtras, 0) AS DECIMAL(10,2)) AS sub_total,
        @porcentajeIVA,
        CAST(ISNULL((PD.TotalItems + Extras.TotalExtras) * @porcentajeIVA / 100, 0) AS DECIMAL(10,2)) AS montoIva,
        CAST(ISNULL((PD.TotalItems + Extras.TotalExtras) * (1 + @porcentajeIVA / 100), 0) AS DECIMAL(10,2)) AS monto_total,
        i.id AS idPedido
    FROM
        inserted i
    LEFT JOIN (
        SELECT
            idPedido,
            SUM(total) AS TotalItems
        FROM PedidoDetalle
        GROUP BY idPedido
    ) PD ON PD.idPedido = i.id
    LEFT JOIN (
        SELECT
            PD.idPedido,
            SUM(OV.precio_extra) AS TotalExtras
        FROM PedidoDetalle PD
        JOIN PedidoDetalleOpcionValor PDOV ON PD.id = PDOV.idPedidoDetalle
        JOIN OpcionValor OV ON PDOV.idOpcionValor = OV.id
        GROUP BY PD.idPedido
    ) Extras ON Extras.idPedido = i.id;
END;


-- al insertar en Cliente se inserta en ClienteConClienteReferido
CREATE TRIGGER llenarClienteConClienteReferido
ON Cliente
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @NuevoClienteID INT;
    DECLARE @ClienteReferidoID INT;
    SELECT @NuevoClienteID = id FROM inserted;
    -- Buscar el último cliente insertado antes del actual para usarlo como referido
    SELECT TOP 1 @ClienteReferidoID = id 
    FROM Cliente 
    WHERE id < @NuevoClienteID 
    ORDER BY id DESC;
    IF @ClienteReferidoID IS NOT NULL AND @NuevoClienteID > 1
    BEGIN
        INSERT INTO ClienteConClienteReferido (idCliente, idClienteReferido, fecha_referido)
        VALUES (@NuevoClienteID, @ClienteReferidoID, GETDATE());
    END
END;


-- Al insertar un registro en PedidoEstadoPedido con el estado = “Entregado”, se inserta la valoración en ClienteRepartidor
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




--------------b--------------
-- Al eliminar una fila de PedidoDetalle, se interpreta como devolución
CREATE TRIGGER devolucion_PedidoDetalle
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
--al insertar en PedidoDetalle, se insertan los valores de las opciones tambien
CREATE TRIGGER InsertarOpciones_PedidoDetalle
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

--ejemplo de prueba del trigger c
-- creamos un nuevo pedido
INSERT INTO Pedido (id, cantidad_items, costo_envio, nota, tiempo_entrega, total) VALUES
(151, 6, 6.50, 'prueba', 39, 78.50);

SELECT * FROM Pedido;
SELECT * FROM Factura;

-- hay 5 unidades disponibles de este plato
INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato)
VALUES (1001, 2, 'Sin cebolla', 25.00, 218, 1);
-- ejemplo de cuando hay suficientes unidades disponibles del plato ahora es 3

-- El plato ahora tiene solo 3 unidades disponibles
INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato)
VALUES (1002, 4, 'Extra picante', 50.00, 218, 1);
-- ejmplo de cuando no hay unidades suficientes del producto para esta compra”

-- dejamos la disponibilidad del plato en 0 para simular agotado
UPDATE Plato SET cantidadDisponible = 0 WHERE id = 1;

-- Intentamos pedir 1 unidad
INSERT INTO PedidoDetalle (id, cantidad, nota, total, idPedido, idPlato)
VALUES (1003, 1, 'Sin sal', 12.00, 218, 1);
-- Error: “El producto no está disponible por los momentos”



------------- Es el D ------------------
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
