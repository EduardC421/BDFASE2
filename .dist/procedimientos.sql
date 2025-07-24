-- La B

DELIMITER //

CREATE PROCEDURE asignar_repartidor_menos_cargado(IN id_pedido INT)
BEGIN
    DECLARE fecha_pedido DATE;
    DECLARE id_repartidor_menos_cargado INT;

    -- Obtener la fecha del pedido
    SELECT fecha INTO fecha_pedido
    FROM Pedido
    WHERE id = id_pedido;

    -- Encontrar el repartidor activo con menos pedidos ese día
    SELECT r.id
    INTO id_repartidor_menos_cargado
    FROM Repartidor r
    LEFT JOIN (
        SELECT idRepartidor, COUNT(*) AS total
        FROM Pedido
        WHERE fecha = fecha_pedido AND idRepartidor IS NOT NULL
        GROUP BY idRepartidor
    ) AS entregas_dia ON r.id = entregas_dia.idRepartidor
    WHERE r.estado = 'Activo'
    ORDER BY IFNULL(entregas_dia.total, 0) ASC
    LIMIT 1;

    -- Asignar el repartidor al pedido
    UPDATE Pedido
    SET idRepartidor = id_repartidor_menos_cargado
    WHERE id = id_pedido;
END;
//

DELIMITER ;



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
