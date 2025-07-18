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

--Consulta B 

SELECT
    C.nombre AS NombreComercio,
    SUM(P.total_con_iva) AS TotalFacturado,
    (SELECT Co.nombre
     FROM ComercioCocina CC
     JOIN Cocina Co ON CC.idCocina = Co.id
     WHERE CC.idComercio = C.id
     ORDER BY Co.nombre ASC
     LIMIT 1) AS CocinaPrincipal,
    (SELECT Pl.nombre
     FROM PedidoDetalle PD_inner
     JOIN Pedido P_inner ON PD_inner.idPedido = P_inner.id
     JOIN Plato Pl ON PD_inner.idPlato = Pl.id
     WHERE P_inner.idComercio = C.id
       AND P_inner.fecha_creacion >= '2025-06-18'
       AND P_inner.fecha_creacion <= '2025-07-18'
     GROUP BY Pl.nombre
     ORDER BY SUM(PD_inner.cantidad) DESC, Pl.nombre ASC
     LIMIT 1) AS PlatoMasPedido,
    CASE
        WHEN SUM(P.total_con_iva) > (SELECT AVG(TotalPorComercio.Monto)
                                      FROM (SELECT SUM(P_avg.total_con_iva) AS Monto
                                            FROM Pedido P_avg
                                            WHERE P_avg.fecha_creacion >= '2025-06-18'
                                              AND P_avg.fecha_creacion <= '2025-07-18'
                                            GROUP BY P_avg.idComercio) AS TotalPorComercio)
        THEN 'Por encima del promedio'
        WHEN SUM(P.total_con_iva) < (SELECT AVG(TotalPorComercio.Monto)
                                      FROM (SELECT SUM(P_avg.total_con_iva) AS Monto
                                            FROM Pedido P_avg
                                            WHERE P_avg.fecha_creacion >= '2025-06-18'
                                              AND P_avg.fecha_creacion <= '2025-07-18'
                                            GROUP BY P_avg.idComercio) AS TotalPorComercio)
        THEN 'Por debajo del promedio'
        ELSE 'Igual al promedio'
    END AS ComparacionPromedio
FROM
    Comercio C
JOIN
    Pedido P ON C.id = P.idComercio
WHERE
    P.fecha_creacion >= '2025-06-18' AND P.fecha_creacion <= '2025-07-18'
GROUP BY
    C.id, C.nombre;



---Consulta C

WITH RECENT_DELIVERED_ORDERS AS (
    SELECT
        p.id AS PedidoID,
        p.idCliente,
        p.total_con_iva,
        p.fecha_pedido
    FROM
        Pedido p
    JOIN
        (SELECT idPedido, MAX(fecha_cambio_estado) AS last_status_date
         FROM EstadoPedido_log
         GROUP BY idPedido) AS latest_status
    ON p.id = latest_status.idPedido
    JOIN
        EstadoPedido_log esl
    ON esl.idPedido = p.id AND esl.fecha_cambio_estado = latest_status.last_status_date
    WHERE
        esl.idEstado = 6 -- 'Entregado'
        AND p.fecha_pedido >= DATE('2025-07-18', '-6 months')
),
ORDER_DISH_SECTION_COUNTS AS (
    
    SELECT
        rd.PedidoID,
        COUNT(DISTINCT pd.idPlato) AS DistinctPlatos,
        COUNT(DISTINCT s.id) AS DistinctSecciones
    FROM
        RECENT_DELIVERED_ORDERS rd
    JOIN
        PedidoDetalle pd ON rd.PedidoID = pd.idPedido
    JOIN
        Plato pl ON pd.idPlato = pl.id
    JOIN
        Seccion s ON pl.idSeccion = s.id
    GROUP BY
        rd.PedidoID
    HAVING
        COUNT(DISTINCT pd.idPlato) >= 2
        AND COUNT(DISTINCT s.id) >= 2
),
QUALIFIED_CUSTOMER_ORDERS AS (
    SELECT
        rdo.idCliente,
        COUNT(DISTINCT rdo.PedidoID) AS TotalPedidosValidos,
        SUM(rdo.total_con_iva) AS MontoTotalGastado
    FROM
        RECENT_DELIVERED_ORDERS rdo
    JOIN
        ORDER_DISH_SECTION_COUNTS odsc ON rdo.PedidoID = odsc.PedidoID
    GROUP BY
        rdo.idCliente
    HAVING
        COUNT(DISTINCT rdo.PedidoID) >= 4
),
CUSTOMER_BEST_DELIVERY_PERSON AS (
    SELECT
        cr.idCliente,
        r.nombre AS NombreRepartidor,
        r.apellido AS ApellidoRepartidor,
        MAX(cr.estrellas) AS MaxEstrellas
    FROM
        CalificacionRepartidor cr
    JOIN
        Repartidor r ON cr.idRepartidor = r.id
    WHERE
        cr.estrellas >= 4
    GROUP BY
        cr.idCliente, r.nombre, r.apellido
    QUALIFY ROW_NUMBER() OVER (PARTITION BY cr.idCliente ORDER BY MAX(cr.estrellas) DESC, r.nombre) = 1
)
SELECT
    c.nombre AS NombreCliente,
    c.apellido AS ApellidoCliente,
    qco.TotalPedidosValidos,
    qco.MontoTotalGastado,
    cbdp.NombreRepartidor,
    cbdp.ApellidoRepartidor
FROM
    Cliente c
JOIN
    QUALIFIED_CUSTOMER_ORDERS qco ON c.id = qco.idCliente
LEFT JOIN
    CUSTOMER_BEST_DELIVERY_PERSON cbdp ON c.id = cbdp.idCliente
ORDER BY
    qco.MontoTotalGastado DESC;

--Consulta E

SELECT
    r.id AS id_repartidor,
    r.nombre || ' ' || r.apellido AS nombre_completo,
    
    COUNT(DISTINCT rp.idPedido) AS total_pedidos_asignados,
    
    ROUND(AVG(cr.puntaje), 2) AS promedio_puntaje,
    
    ROUND(AVG(CASE 
        WHEN pe.idEstadoPedido = 6 THEN rp.tiempo_entrega
        ELSE NULL
    END), 2) AS tiempo_promedio_entrega_exitosas
    
FROM
    Repartidor r
LEFT JOIN RepartidorPedido rp ON r.id = rp.idRepartidor
LEFT JOIN ClienteRepartidor cr ON r.id = cr.idRepartidor
LEFT JOIN PedidoEstadoPedido pe ON rp.idPedido = pe.idPedido

GROUP BY r.id, r.nombre, r.apellido
ORDER BY r.id;
