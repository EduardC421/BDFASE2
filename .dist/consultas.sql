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


--CONSULTA B
-- Total facturado por comercio en el último mes
WITH facturacion_ultimo_mes AS (
  SELECT
    c.id AS id_comercio,
    c.nombre AS nombre_comercio,
    SUM(f.total) AS total_facturado
  FROM Comercio c
  JOIN Cocina co ON co.id_comercio = c.id
  JOIN Plato p ON p.id_cocina = co.id
  JOIN Pedido pe ON pe.id_plato = p.id
  JOIN Factura f ON f.id = pe.id_factura
  WHERE f.fecha_emision >= DATEADD(MONTH, -1, GETDATE())
  GROUP BY c.id, c.nombre
),

-- Promedio general del total facturado
promedio_general AS (
  SELECT AVG(total_facturado * 1.0) AS promedio
  FROM facturacion_ultimo_mes
),

-- Cocina principal (primera alfabéticamente por comercio)
cocina_principal AS (
  SELECT id_comercio, nombre
  FROM (
    SELECT
      co.id_comercio,
      co.nombre,
      ROW_NUMBER() OVER (PARTITION BY co.id_comercio ORDER BY co.nombre ASC) AS rn
    FROM Cocina co
  ) AS sub
  WHERE rn = 1
),

-- Plato más pedido por comercio
plato_mas_pedido AS (
  SELECT id_comercio, nombre_plato
  FROM (
    SELECT
      c.id AS id_comercio,
      p.nombre AS nombre_plato,
      COUNT(*) AS cantidad,
      ROW_NUMBER() OVER (PARTITION BY c.id ORDER BY COUNT(*) DESC) AS rn
    FROM Comercio c
    JOIN Cocina co ON co.id_comercio = c.id
    JOIN Plato p ON p.id_cocina = co.id
    JOIN Pedido pe ON pe.id_plato = p.id
    JOIN Factura f ON f.id = pe.id_factura
    WHERE f.fecha_emision >= DATEADD(MONTH, -1, GETDATE())
    GROUP BY c.id, p.nombre
  ) AS sub
  WHERE rn = 1
)

-- Resultado final combinando todo
SELECT
  f.nombre_comercio,
  f.total_facturado,
  cp.nombre AS cocina_principal,
  pm.nombre_plato AS plato_mas_pedido,
  CASE
    WHEN f.total_facturado > pg.promedio THEN 'Por encima del promedio'
    WHEN f.total_facturado < pg.promedio THEN 'Por debajo del promedio'
    ELSE 'Promedio exacto'
  END AS comparacion
FROM facturacion_ultimo_mes f
CROSS JOIN promedio_general pg
LEFT JOIN cocina_principal cp ON cp.id_comercio = f.id_comercio
LEFT JOIN plato_mas_pedido pm ON pm.id_comercio = f.id_comercio
ORDER BY f.total_facturado DESC;





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
