--Consulta A
WITH TiemposCalculados AS (
  SELECT 
    PEP.idEstadoPedido,
    EP.nombre,
    DATEDIFF(MINUTE, PEP.fecha_inicio, NEXT_PEP.fecha_inicio) AS tiempo_real,
    EP.tiempo_promedio AS tiempo_estimado,
    CASE WHEN DATEDIFF(MINUTE, PEP.fecha_inicio, NEXT_PEP.fecha_inicio) <= EP.tiempo_promedio 
      THEN 1 ELSE 0 END AS cumplio
  FROM 
    PedidoEstadoPedido PEP   
  INNER JOIN 
    EstadoPedido EP ON PEP.idEstadoPedido = EP.id
  LEFT JOIN 
    PedidoEstadoPedido NEXT_PEP ON PEP.idPedido = NEXT_PEP.idPedido AND NEXT_PEP.fecha_inicio = (
          SELECT MIN(fecha_inicio) 
            FROM PedidoEstadoPedido 
            WHERE idPedido = PEP.idPedido 
            AND fecha_inicio > PEP.fecha_inicio
          )
  WHERE 
    NEXT_PEP.fecha_inicio IS NOT NULL
)

SELECT 
  TC.nombre AS 'Estado',
  COUNT(*) AS 'Cantidad de veces usado',
  CAST(AVG(TC.tiempo_real) AS DECIMAL(10,2)) AS 'Tiempo promedio (min)',
  CAST(AVG(TC.tiempo_estimado) AS DECIMAL(10,2)) AS 'Tiempo promedio estimado (min)',
  CAST(SUM(TC.cumplio) * 100.0 / COUNT(TC.cumplio) AS DECIMAL(10,2)) AS 'Porcentaje de cumplimiento'
FROM 
  TiemposCalculados TC
GROUP BY 
  TC.idEstadoPedido, TC.nombre
HAVING
  COUNT(*) > 0
ORDER BY 
  COUNT(*) DESC;

------------- B----------------------
DECLARE @FechaInicio DATE = DATEADD(MONTH, -1, GETDATE());

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

SELECT
  cf.nombre_comercio,
  cf.total_facturado,
  ISNULL(cp.nombre, 'Sin cocina registrada') AS cocina_principal,
  ISNULL(pm.nombre_plato, 'Sin pedidos recientes') AS plato_mas_pedido,
  CASE
    WHEN cf.total_facturado > pg.promedio THEN 'Por encima del promedio'       
    WHEN cf.total_facturado < pg.promedio THEN 'Por debajo del promedio'
    ELSE 'Promedio exacto'
  END AS comparacion
FROM comercios_facturados cf
CROSS JOIN promedio_general pg
LEFT JOIN cocina_principal cp ON cp.idComercio = cf.id_comercio
LEFT JOIN plato_mas_pedido pm ON pm.idComercio = cf.id_comercio
ORDER BY cf.total_facturado DESC;


-------------- C ------------
WITH pedidos_recientes_entregados AS (
    SELECT
        p.id AS id_pedido,
        cp.idcliente,
        f.monto_total,
        f.fecha_emision
    FROM
        pedido p
        JOIN clientepedido cp ON p.id = cp.idpedido
        JOIN factura f ON p.id = f.idpedido
        JOIN (
            SELECT idpedido, MAX(fecha_inicio) AS ultima_fecha_estado
            FROM pedidoestadopedido
            GROUP BY idpedido
        ) AS ultimo_estado ON p.id = ultimo_estado.idpedido
        JOIN pedidoestadopedido pep ON pep.idpedido = p.id AND pep.fecha_inicio = ultimo_estado.ultima_fecha_estado
    WHERE
        pep.idestadopedido = 6 
        AND f.fecha_emision >= DATEADD(MONTH, -6, CAST('2025-07-18' AS DATE)) -- Fecha de referencia para los últimos 6 meses
),
conteo_platos_secciones_por_pedido AS (
    SELECT
        pre.id_pedido,
        COUNT(DISTINCT pd.idplato) AS total_platos_distintos,
        COUNT(DISTINCT s.id) AS total_secciones_distintas
    FROM
        pedidos_recientes_entregados pre
        JOIN pedidodetalle pd ON pre.id_pedido = pd.idpedido
        JOIN plato pl ON pd.idplato = pl.id
        JOIN seccion s ON pl.idseccion = s.id
    GROUP BY
        pre.id_pedido
    HAVING
        COUNT(DISTINCT pd.idplato) >= 2
        AND COUNT(DISTINCT s.id) >= 2
),
clientes_pedidos_calificados AS (
    SELECT
        pre.idcliente,
        COUNT(DISTINCT pre.id_pedido) AS cantidad_pedidos_validos,
        SUM(pre.monto_total) AS monto_total_gastado
    FROM
        pedidos_recientes_entregados pre
        JOIN conteo_platos_secciones_por_pedido cpspp ON pre.id_pedido = cpspp.id_pedido
    GROUP BY
        pre.idcliente
    HAVING
        COUNT(DISTINCT pre.id_pedido) >= 4
),
repartidor_mejor_calificado_por_cliente AS (
    SELECT
        cr.idcliente,
        r.nombre AS nombre_repartidor,
        r.apellido AS apellido_repartidor,
        cr.puntaje,
        ROW_NUMBER() OVER (PARTITION BY cr.idcliente ORDER BY cr.puntaje DESC, r.nombre) AS rn
    FROM
        clienterepartidor cr
        JOIN repartidor r ON cr.idrepartidor = r.id
    WHERE
        cr.puntaje >= 4
)
SELECT
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    cpc.cantidad_pedidos_validos,
    cpc.monto_total_gastado,
    ISNULL(rmcc.nombre_repartidor, 'N/A') AS nombre_repartidor_preferido,
    ISNULL(rmcc.apellido_repartidor, 'N/A') AS apellido_repartidor_preferido
FROM
    cliente c
    JOIN clientes_pedidos_calificados cpc ON c.id = cpc.idcliente
    LEFT JOIN (
        SELECT idcliente, nombre_repartidor, apellido_repartidor
        FROM repartidor_mejor_calificado_por_cliente
        WHERE rn = 1
    ) AS rmcc ON c.id = rmcc.idcliente
ORDER BY
    cpc.monto_total_gastado DESC;



----------- D------------------------------
SELECT 
    CCR.idClienteReferido AS id_referido,
    C.nombre + ' ' + C.apellido AS nombre_completo,
    COUNT(DISTINCT CP.idPedido) AS total_pedidos,
    ISNULL(SUM(F.monto_total), 0) AS total_gastado,
    CASE 
        WHEN COUNT(DISTINCT CCR2.idClienteReferido) > 0 THEN 'SI'
        ELSE 'NO'
    END AS ha_generado_referidos
FROM ClienteConClienteReferido CCR
JOIN Cliente C ON CCR.idClienteReferido = C.id
LEFT JOIN ClientePedido CP ON CP.idCliente = C.id
LEFT JOIN Factura F ON F.idPedido = CP.idPedido
LEFT JOIN ClienteConClienteReferido CCR2 ON CCR2.idCliente = C.id
GROUP BY CCR.idClienteReferido, C.nombre, C.apellido
ORDER BY Total_Gastado DESC;


--Consulta E
SELECT
    r.id AS id_repartidor,
    r.nombre + ' ' + r.apellido AS nombre_completo,
    
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


--Consulta F
WITH PedidosUltimos3Meses AS (
    SELECT cp.idCliente, cp.idPedido, cp.fecha, p.total
    FROM ClientePedido cp
    JOIN Pedido p ON cp.idPedido = p.id
    WHERE cp.fecha >= DATEADD(MONTH, -3, CAST(GETDATE() AS DATE))
),
PedidosConAmbasSecciones AS (
    SELECT pd.idPedido, cp.idCliente
    FROM PedidoDetalle pd
    JOIN Plato pl ON pd.idPlato = pl.id
    JOIN Seccion s ON pl.idSeccion = s.id
    JOIN ClientePedido cp ON cp.idPedido = pd.idPedido
    WHERE s.nombre IN ('Principales', 'Bebidas')
    GROUP BY pd.idPedido, cp.idCliente
    HAVING
        COUNT(DISTINCT CASE WHEN s.nombre = 'Principales' THEN s.id END) > 0 AND
        COUNT(DISTINCT CASE WHEN s.nombre = 'Bebidas' THEN s.id END) > 0
),
PedidosConRepartidorMoto AS (
    SELECT DISTINCT rp.idPedido
    FROM RepartidorPedido rp
    JOIN Repartidor r ON rp.idRepartidor = r.id
    WHERE r.detalle_vehiculo LIKE '%Moto%'
),

PedidosMotoFlag AS (
    SELECT
        pum.idCliente,
        pum.idPedido,
        CASE WHEN pcr.idPedido IS NOT NULL THEN 1 ELSE 0 END AS tiene_moto
    FROM PedidosUltimos3Meses pum
    LEFT JOIN PedidosConRepartidorMoto pcr ON pum.idPedido = pcr.idPedido
),
ClientesValidos AS (
    SELECT
        p.idCliente,
        COUNT(DISTINCT p.idPedido) AS cantidad_pedidos,
        SUM(p.total) AS total_gastado,
        SUM(pmf.tiene_moto) AS pedidos_con_moto_count
    FROM PedidosUltimos3Meses p
    JOIN PedidosConAmbasSecciones s ON p.idPedido = s.idPedido AND p.idCliente = s.idCliente
    JOIN PedidosMotoFlag pmf ON p.idPedido = pmf.idPedido AND p.idCliente = pmf.idCliente
    GROUP BY p.idCliente
    HAVING
        COUNT(DISTINCT p.idPedido) >= 3 AND
        SUM(pmf.tiene_moto) >= 1),

PromedioGastoGlobal AS (
    SELECT AVG(p.total) AS promedio_global
    FROM ClientePedido cp
    JOIN Pedido p ON cp.idPedido = p.id
    WHERE cp.fecha >= DATEADD(MONTH, -3, CAST(GETDATE() AS DATE))
)
SELECT
    c.nombre,
    cv.cantidad_pedidos,
    cv.total_gastado,
    pg.promedio_global
FROM ClientesValidos cv
JOIN Cliente c ON c.id = cv.idCliente
CROSS JOIN PromedioGastoGlobal pg
WHERE cv.total_gastado > pg.promedio_global;


--Consulta G
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


--Consulta H
SELECT
    C.id AS ID_Cliente,
    C.nombre AS Nombre,
    C.apellido AS Apellido,
    COUNT(DISTINCT CP.idPedido) AS Total_Pedidos,
    COUNT(PDOV.idOpcionValor) AS Total_Opciones,
    CAST(
        ISNULL(
            CAST(COUNT(PDOV.idOpcionValor) AS FLOAT) / NULLIF(COUNT(DISTINCT CP.idPedido), 0),
        0.0)
    AS DECIMAL(10,2)) AS Promedio_Opciones_Por_Pedido
FROM
    Cliente AS C
JOIN
    ClientePedido AS CP ON C.id = CP.idCliente
LEFT JOIN
    PedidoDetalle AS PD ON CP.idPedido = PD.idPedido
LEFT JOIN
    PedidoDetalleOpcionValor AS PDOV ON PD.id = PDOV.idPedidoDetalle
GROUP BY
    C.id, C.nombre, C.apellido
ORDER BY
    C.id;

--Consulta I
Select D.municipio, C.nombre, P.nombre, SUM(PD.cantidad) as 'cantidad_total_vendida'
From Plato as P
JOIN Seccion as S on P.idSeccion = S.id
JOIN Menu as M on S.idMenu = M.id
JOIN Comercio as C on M.idComercio = C.id
JOIN PedidoDetalle as PD on P.id = PD.idPlato
JOIN Pedido as PE on PD.idPedido = PE.id
JOIN ClientePedido as CP on PE.id = CP.idPedido
JOIN Cliente as CL on CP.idCliente = CL.id
JOIN DireccionCliente AS DC on CL.id = DC.idCliente
JOIN Direccion as D ON DC.idDireccion = D.id
WHERE P.nombre LIKE '%Pizza%'
GROUP BY D.municipio, C.nombre, P.nombre
ORDER BY 'cantidad_total_vendida' ASC

--Consulta J
SELECT 
    p.nombre AS nombre_plato,
    s.nombre AS nombre_seccion,
    ISNULL(
        STRING_AGG(ov.nombre + ' ($' + FORMAT(ov.precio_extra, 'N2') + ')', ', '),
        'Sin opciones registradas'
    ) AS opciones
FROM Plato p
JOIN Seccion s ON p.idSeccion = s.id
LEFT JOIN PlatoOpcionValor pov ON pov.idPlato = p.id
LEFT JOIN OpcionValor ov ON ov.id = pov.idOpcionValor
GROUP BY p.id, p.nombre, s.nombre
ORDER BY s.nombre, p.nombre;

--Consulta K
WITH 
UltimoAnio AS (
    SELECT 
        monto_total,
        fecha_emision,
        YEAR(fecha_emision) AS anio,
        MONTH(fecha_emision) AS mes
    FROM Factura
    WHERE fecha_emision >= DATEADD(MONTH, -12, CAST(GETDATE() AS DATE))
    AND fecha_emision < CAST(GETDATE() AS DATE) -- Quitamos el mes actual que está incompleto
),
AnioAnterior AS (
    SELECT 
        CAST(ROUND(SUM(monto_total), 2) AS DECIMAL(18,2)) AS anioAnterior
    FROM Factura
    WHERE fecha_emision >= DATEADD(MONTH, -24, CAST(GETDATE() AS DATE))
    AND fecha_emision < DATEADD(MONTH, -12, CAST(GETDATE() AS DATE))
),
ResumenMensual AS (
    SELECT 
        anio,
        mes,
        CAST(ROUND(SUM(monto_total), 2) AS DECIMAL(18,2)) AS total_mensual
    FROM UltimoAnio
    GROUP BY anio, mes
),
Totales AS (
    SELECT
        CAST(ROUND(AVG(total_mensual), 2) AS DECIMAL(18,2)) AS avg_mensual,
        CAST(ROUND(SUM(total_mensual), 2) AS DECIMAL(18,2)) AS ultimoAnio,
        CAST((SELECT anioAnterior FROM AnioAnterior) AS DECIMAL(18,2)) AS anioAnterior
    FROM ResumenMensual
)
SELECT 
    CAST(avg_mensual AS DECIMAL(18,2)) AS AVG_ingreso_mensual,
    CAST(ultimoAnio AS DECIMAL(18,2)) AS ingreso_total_ultimo_anio,
    CAST(ROUND(avg_mensual * 12, 2) AS DECIMAL(18,2)) AS ingreso_proyectado_12meses,
    -- Variación porcentual estimada comparada con el año anterior
    CASE 
        WHEN anioAnterior = 0 THEN NULL
        ELSE CAST(ROUND((ABS(ultimoAnio - anioAnterior) / NULLIF(anioAnterior, 0)) * 100, 2) AS DECIMAL(18,2))
    END AS variacion_porcentual_estimada
FROM Totales;