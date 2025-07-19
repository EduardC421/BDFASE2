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

DECLARE @FechaInicio DATE = DATEADD(MONTH, -1, GETDATE());

--  Comercios activos, con o sin facturación
WITH comercios_base AS (
  SELECT id AS id_comercio, nombre AS nombre_comercio
  FROM Comercio
  WHERE estaActivo = 1
),

facturacion_ultimo_mes AS (
  SELECT
    c.id AS id_comercio,
    SUM(f.monto_total) AS total_facturado
  FROM Comercio c
  JOIN Menu m ON m.idComercio = c.id
  JOIN Seccion s ON s.idMenu = m.id
  JOIN Plato p ON p.idSeccion = s.id
  JOIN PedidoDetalle pd ON pd.idPlato = p.id
  JOIN Pedido pe ON pe.id = pd.idPedido
  JOIN Factura f ON f.idPedido = pe.id
  WHERE f.fecha_emision >= @FechaInicio
  GROUP BY c.id
),

-- Usamos COALESCE para mostrar 0 si no hay facturación
comercios_facturados AS (
  SELECT
    cb.id_comercio,
    cb.nombre_comercio,
    COALESCE(f.total_facturado, 0) AS total_facturado
  FROM comercios_base cb
  LEFT JOIN facturacion_ultimo_mes f ON cb.id_comercio = f.id_comercio
),

promedio_general AS (
  SELECT AVG(total_facturado * 1.0) AS promedio
  FROM comercios_facturados
),

cocina_principal AS (
  SELECT
    cc.idComercio,
    MIN(co.nombre) AS nombre
  FROM ComercioCocina cc
  JOIN Cocina co ON co.id = cc.idCocina
  GROUP BY cc.idComercio
),

platos_pedidos AS (
  SELECT
    m.idComercio,
    p.id AS id_plato,
    p.nombre AS nombre_plato,
    COUNT(*) AS cantidad_pedidos
  FROM PedidoDetalle pd
  JOIN Plato p ON pd.idPlato = p.id
  JOIN Seccion s ON p.idSeccion = s.id
  JOIN Menu m ON s.idMenu = m.id
  JOIN Pedido pe ON pd.idPedido = pe.id
  JOIN Factura f ON pe.id = f.idPedido
  WHERE f.fecha_emision >= @FechaInicio
  GROUP BY m.idComercio, p.id, p.nombre
),

plato_mas_pedido AS (
  SELECT
    pp1.idComercio,
    pp1.nombre_plato
  FROM platos_pedidos pp1
  INNER JOIN (
    SELECT
      idComercio,
      MAX(cantidad_pedidos) AS max_pedidos
    FROM platos_pedidos
    GROUP BY idComercio
  ) pp2 ON pp1.idComercio = pp2.idComercio AND pp1.cantidad_pedidos = pp2.max_pedidos
)

-- Resultado final enriquecido
SELECT
  cf.nombre_comercio,
  cf.total_facturado,
  ISNULL(cp.nombre, 'Sin cocina registrada') AS cocina_principal,
  ISNULL(pm.nombre_plato, 'Sin pedidos recientes') AS plato_mas_pedido,
  CASE
    WHEN cf.total_facturado > pg.promedio THEN 'Por encima del promedio'
    WHEN cf.total_facturado < pg.promedio THEN 'Por debajo del promedio'
    ELSE 'Promedio exacto'
  END AS comparacion,
  @FechaInicio AS periodo_desde,
  GETDATE() AS periodo_hasta
FROM comercios_facturados cf
CROSS JOIN promedio_general pg
LEFT JOIN cocina_principal cp ON cp.idComercio = cf.id_comercio
LEFT JOIN plato_mas_pedido pm ON pm.idComercio = cf.id_comercio
ORDER BY cf.total_facturado DESC;





--Consulta C
WITH RECENT_DELIVERED_ORDERS AS (
    SELECT
        p.id AS PedidoID,
        cp.idCliente,
        f.monto_total,
        f.fecha_emision
    FROM
        Pedido p
        JOIN ClientePedido cp ON p.id = cp.idPedido
        JOIN Factura f ON p.id = f.idPedido
        JOIN (
            SELECT idPedido, MAX(fecha_inicio) AS last_status_date
            FROM PedidoEstadoPedido
            GROUP BY idPedido
        ) AS latest_status ON p.id = latest_status.idPedido
        JOIN PedidoEstadoPedido pep ON pep.idPedido = p.id AND pep.fecha_inicio = latest_status.last_status_date
    WHERE
        pep.idEstadoPedido = 6 -- Entregado
        AND f.fecha_emision >= DATEADD(MONTH, -6, CAST('2025-07-18' AS DATE))
),
ORDER_DISH_SECTION_COUNTS AS (
    SELECT
        rd.PedidoID,
        COUNT(DISTINCT pd.idPlato) AS DistinctPlatos,
        COUNT(DISTINCT s.id) AS DistinctSecciones
    FROM
        RECENT_DELIVERED_ORDERS rd
        JOIN PedidoDetalle pd ON rd.PedidoID = pd.idPedido
        JOIN Plato pl ON pd.idPlato = pl.id
        JOIN Seccion s ON pl.idSeccion = s.id
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
        SUM(rdo.monto_total) AS MontoTotalGastado
    FROM
        RECENT_DELIVERED_ORDERS rdo
        JOIN ORDER_DISH_SECTION_COUNTS odsc ON rdo.PedidoID = odsc.PedidoID
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
        cr.puntaje,
        ROW_NUMBER() OVER (PARTITION BY cr.idCliente ORDER BY cr.puntaje DESC, r.nombre) AS rn
    FROM
        ClienteRepartidor cr
        JOIN Repartidor r ON cr.idRepartidor = r.id
    WHERE
        cr.puntaje >= 4
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
    JOIN QUALIFIED_CUSTOMER_ORDERS qco ON c.id = qco.idCliente
    LEFT JOIN (
        SELECT * FROM CUSTOMER_BEST_DELIVERY_PERSON WHERE rn = 1
    ) AS cbdp ON c.id = cbdp.idCliente
ORDER BY
    qco.MontoTotalGastado DESC;


--G. Listar los comercios que han recibido más de 20 pedidos en el último mes y que 
--trabajan al menos 50 horas semanales en la cocina principal de “China”. 


WIth PedidoUltimoMes AS (
 Select C.id, COUNT(DISTINCT CP.idPedido) AS TotalPedidos 
  from ClientePedido as CP 
  JOIN PedidoDetalle as PD ON CP.idPedido = PD.idPedido
  JOIN Plato AS P ON PD.idPlato = P.id
  JOIN Seccion as S ON P.idSeccion = S.id
  JOIN Menu as M on S.idMenu = M.id
 JOIN Comercio as C ON M.idComercio = C.id
  Where CP.fecha >= DATEADD(MONTH,-1,GETDATE())
  GROUP BY C.id),
  
  CocinasChinas AS ( select CC.idComercio
                    from ComercioCocina as CC
                    JOIN Cocina as CO on CC.idCocina = CO.id
                    Where CO.nombre = 'China')
     SELECT C.id, C.nombre as 'Nombre del Comercio', PUM.TotalPedidos, C.hora_apertura, C.hora_cierre, 
    (CASE WHEN c.hora_cierre >= c.hora_apertura THEN c.hora_cierre - c.hora_apertura
        ELSE 24 - c.hora_apertura + c.hora_cierre
     END) * 7 AS horas_semanales
    FROM Comercio as C
JOIN PedidoUltimoMes as PUM ON C.id = PUM.id
JOIN CocinasChinas as CHI ON C.id = CHI.idComercio

     where PUM.TotalPedidos > 20 AND (CASE
            WHEN c.hora_cierre >= c.hora_apertura THEN c.hora_cierre - c.hora_apertura
            ELSE 24 - c.hora_apertura + c.hora_cierre
        END) * 7 >= 50
        ORDER BY PUM.TotalPedidos;