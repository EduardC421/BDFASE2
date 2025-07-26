--Funciones necesarias para generar factura

CREATE FUNCTION fn_ObtenerCostoEnvio (@numeroFactura INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @costo_envio DECIMAL(10,2);

    SELECT @costo_envio = p.costo_envio
    FROM Factura f
    JOIN Pedido p ON f.idPedido = p.id
    WHERE f.numero = @numeroFactura;

    RETURN ISNULL(@costo_envio, 0);
END;

CREATE FUNCTION fn_ObtenerSubTotal (@numeroFactura INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @idPedido INT;
    SELECT @idPedido = idPedido FROM Factura WHERE numero = @numeroFactura;

    -- Sumar los totales base
    DECLARE @totalItems DECIMAL(10,2) = (
        SELECT SUM(total)
        FROM PedidoDetalle
        WHERE idPedido = @idPedido
    );

    -- Sumar los extras personalizados
    DECLARE @extras DECIMAL(10,2) = (
        SELECT SUM(ov.precio_extra)
        FROM PedidoDetalle pd
        JOIN PedidoDetalleOpcionValor pdov ON pd.id = pdov.idPedidoDetalle
        JOIN OpcionValor ov ON ov.id = pdov.idOpcionValor
        WHERE pd.idPedido = @idPedido
    );

    -- Devolver suma segura
    RETURN ISNULL(@totalItems, 0) + ISNULL(@extras, 0);
END;

CREATE FUNCTION fn_ObtenerMontoIVA (@numeroFactura INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @sub_total DECIMAL(10,2);
    DECLARE @porcentaje DECIMAL(5,2);
    DECLARE @idPedido INT;

    -- 1. Obtener el idPedido relacionado a esa factura
    SELECT 
        @idPedido = idPedido, 
        @porcentaje = porcentajeIva
    FROM Factura
    WHERE numero = @numeroFactura;

    -- 2. Calcular el subtotal del pedido
    SELECT @sub_total = 
        ISNULL((
            SELECT SUM(total)
            FROM PedidoDetalle
            WHERE idPedido = @idPedido
        ), 0) +
        ISNULL((
            SELECT SUM(OV.precio_extra)
            FROM PedidoDetalle PD
            JOIN PedidoDetalleOpcionValor PDOV ON PD.id = PDOV.idPedidoDetalle
            JOIN OpcionValor OV ON OV.id = PDOV.idOpcionValor
            WHERE PD.idPedido = @idPedido
        ), 0);

    -- 3. Calcular el IVA real
    RETURN ROUND(@sub_total * (@porcentaje / 100.0), 2);
END;


CREATE FUNCTION fn_ObtenerMontoTotal (@numeroFactura INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @sub_total DECIMAL(10,2);
    DECLARE @iva DECIMAL(10,2);
    DECLARE @envio DECIMAL(10,2);

    -- Reutilizamos funciones ya definidas
    SET @sub_total = dbo.fn_ObtenerSubTotal(@numeroFactura);
    SET @iva = dbo.fn_ObtenerMontoIVA(@numeroFactura);
    SET @envio = dbo.fn_ObtenerCostoEnvio(@numeroFactura);

    RETURN ROUND(@sub_total + @iva + @envio, 2);
END;

--SELECT 
    --numero AS Factura,
    --dbo.fn_ObtenerSubTotal(numero) AS SubTotal,
    --dbo.fn_ObtenerMontoIVA(numero) AS IVA,
   -- dbo.fn_ObtenerCostoEnvio(numero) AS Envio,
    --dbo.fn_ObtenerMontoTotal(numero) AS TotalFinal
--FROM Factura
--WHERE numero = 152;
CREATE FUNCTION fn_RepartidorDisponible (
    @idRepartidor INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @disponible BIT = 0;

    IF EXISTS (
        SELECT 1
        FROM Repartidor r
        WHERE r.id = @idRepartidor AND r.estado = 'Activo'
              AND NOT EXISTS (
                SELECT 1
                FROM RepartidorPedido rp
                JOIN (
                    SELECT pep.idPedido, MAX(pep.fecha_inicio) AS fecha_max
                    FROM PedidoEstadoPedido pep
                    GROUP BY pep.idPedido
                ) ultimos ON ultimos.idPedido = rp.idPedido
                JOIN PedidoEstadoPedido pep_actual ON pep_actual.idPedido = ultimos.idPedido AND pep_actual.fecha_inicio = ultimos.fecha_max
                JOIN EstadoPedido ep ON ep.id = pep_actual.idEstadoPedido
                WHERE rp.idRepartidor = r.id
                AND ep.nombre NOT IN ('Entregado', 'Cancelado')
              )
    )
    BEGIN
        SET @disponible = 1;
    END

    RETURN @disponible;
END;
