--trigger a


-- Factura



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


--  ClienteRepartidor (al registrarse una entrega en RepartidorPedido, y una vez el estado del pedido cambie a
-- “Entregado” en PedidoEstadoPedido, se debe insertar automáticamente un registro en ClienteRepartidor con un 
-- puntaje por defecto y un comentario genérico si el cliente aún no ha emitido su valoración) 



    -- Este trigger se ejecuta DESPUÉS de eliminar una fila de la tabla PedidoDetalle.
-- Su propósito es ajustar la cantidad disponible del plato correspondiente
-- y "restaurar" la disponibilidad si el plato estaba agotado.

CREATE TRIGGER trg_AfterDeletePedidoDetalle
ON PedidoDetalle
AFTER DELETE
AS
BEGIN
    -- Para cada fila eliminada de PedidoDetalle
    UPDATE P
    SET
        -- Incrementa la cantidad disponible del plato
        P.cantidadDisponible = P.cantidadDisponible + D.cantidad
        -- Nota: No hay una columna 'disponibilidad' explícita en la tabla Plato.
        -- Se asume que la disponibilidad se infiere de 'cantidadDisponible' (> 0 significa disponible).
        -- Si hubiera una columna 'disponibilidad' booleana, la lógica sería:
        -- P.disponibilidad = CASE WHEN (P.cantidadDisponible + D.cantidad) > 0 THEN 1 ELSE P.disponibilidad END
    FROM
        Plato AS P
    INNER JOIN
        DELETED AS D ON P.id = D.idPlato;
END;

