
-- A. Reporte de estados de pedido con: nombre del estado, cantidad de veces usado, tiempo promedio real vs estimado, y porcentaje de cumplimiento. 

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
  TC.nombre AS 'Nombre del Estado',
  COUNT(*) AS 'Cantidad de Veces Usado',
  CAST(AVG(TC.tiempo_real) AS DECIMAL(10,2)) AS 'Tiempo Promedio Real (min)',
  CAST(AVG(TC.tiempo_estimado) AS DECIMAL(10,2)) AS 'Tiempo Promedio Estimado (min)',
  CAST(SUM(TC.cumplio) * 100.0 / COUNT(TC.cumplio) AS DECIMAL(10,2)) AS 'Porcentaje de Cumplimiento (%)'
FROM 
  TiemposCalculados TC
GROUP BY 
  TC.idEstadoPedido, TC.nombre
HAVING
  COUNT(*) > 0
ORDER BY 
  COUNT(*) DESC;







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





-- D. Consultar el historial de un cliente referido, mostrando si ha realizado pedidos, el total gastado y si ha generado otros referidos. 

SELECT 
    CCR.idClienteReferido AS IdReferido,
    C.nombre + ' ' + C.apellido AS NombreCompleto,
    COUNT(DISTINCT CP.idPedido) AS TotalPedidos,
    ISNULL(SUM(F.monto_total), 0) AS TotalGastado,
    CASE 
        WHEN COUNT(DISTINCT CCR2.idClienteReferido) > 0 THEN 'SI'
        ELSE 'NO'
    END AS HaGeneradoReferidos
FROM ClienteConClienteReferido CCR
JOIN Cliente C ON CCR.idClienteReferido = C.id
LEFT JOIN ClientePedido CP ON CP.idCliente = C.id
LEFT JOIN Factura F ON F.idPedido = CP.idPedido
LEFT JOIN ClienteConClienteReferido CCR2 ON CCR2.idCliente = C.id
GROUP BY CCR.idClienteReferido, C.nombre, C.apellido
ORDER BY TotalGastado DESC;






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
-- Nueva CTE para pre-calcular si un pedido tuvo moto
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
        SUM(pmf.tiene_moto) AS pedidos_con_moto_count -- Sumamos el flag para contar
    FROM PedidosUltimos3Meses p
    JOIN PedidosConAmbasSecciones s ON p.idPedido = s.idPedido AND p.idCliente = s.idCliente
    JOIN PedidosMotoFlag pmf ON p.idPedido = pmf.idPedido AND p.idCliente = pmf.idCliente
    GROUP BY p.idCliente
    HAVING
        COUNT(DISTINCT p.idPedido) >= 3 AND
        SUM(pmf.tiene_moto) >= 1 -- Usamos el conteo del flag aquí
),
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





-- H. Se desea calcular el nivel de personalización promedio de los pedidos realizados por los clientes. 
--    Se deben contabilizar todas las veces que un cliente añadió opciones a sus platos, y luego calcular 
--    el promedio de opciones por pedido. El resultado debe mostrar el ID del cliente, su nombre completo, 
--    la cantidad total de pedidos realizados, el total de opciones seleccionadas y el promedio de personalizaciones por pedido. 

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



-- I

--Consulta I
Select D.municipio, C.nombre, P.nombre, SUM(PD.cantidad) as 'Cantidad Total Vendida'
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
ORDER BY 'Cantidad Total Vendida' ASC




-- J   Se requiere obtener un reporte que muestre todos 
--los platos disponibles en el sistema, junto con sus distintas
--opciones. Para cada plato, se debe mostrar: su nombre, la sección a la que pertenece y el listado de 
--nombres de opciones con sus respectivos valores separados por coma, en caso de que un plato no tenga ninguna 
--opción asociada, se debe mostrar igualmente el plato indicando explícitamente “Sin opciones registradas”. 

SELECT 
    p.nombre AS NombrePlato,
    s.nombre AS NombreSeccion,
    ISNULL(
        STRING_AGG(ov.nombre + ' ($' + FORMAT(ov.precio_extra, 'N2') + ')', ', '),
        'Sin opciones registradas'
    ) AS Opciones
FROM Plato p
JOIN Seccion s ON p.idSeccion = s.id
LEFT JOIN PlatoOpcionValor pov ON pov.idPlato = p.id
LEFT JOIN OpcionValor ov ON ov.id = pov.idOpcionValor
GROUP BY p.id, p.nombre, s.nombre
ORDER BY s.nombre, p.nombre;




Mens. 207, Nivel 16, Estado 1, Línea 12
Invalid column name 'idPlato'.
Mens. 207, Nivel 16, Estado 1, Línea 10
Invalid column name 'valor'.

Help: Error 207 Invalid column name 'idPlato'.


-- K. Se desea estimar la proyección de ingresos por pedidos para el próximo año basándose en el comportamiento histórico del último año. 
  --Para ello, se calculará el ingreso mensual promedio (basado en los montos de las facturas de los últimos 12 meses), 
  -- y se multiplicará por 12 para proyectar el ingreso anual esperado. El informe debe incluir: ingreso mensual promedio, 
  -- ingreso total del último año, ingreso proyectado a 12 meses, y la variación porcentual estimada si se mantuviera la misma 
  -- tendencia de crecimiento comparada con el año anterior 


WITH 
-- Datos del último año completo (últimos 12 meses)
UltimoAnio AS (
    SELECT 
        monto_total,
        fecha_emision,
        YEAR(fecha_emision) AS anio,
        MONTH(fecha_emision) AS mes
    FROM Factura
    WHERE fecha_emision >= DATEADD(MONTH, -12, CAST(GETDATE() AS DATE))
),
-- Datos del año anterior (de 13 a 24 meses atrás)
AnioAnterior AS (
    SELECT 
        SUM(monto_total) AS total_anio_anterior
    FROM Factura
    WHERE fecha_emision BETWEEN DATEADD(MONTH, -24, CAST(GETDATE() AS DATE)) 
                          AND DATEADD(MONTH, -12, CAST(GETDATE() AS DATE))
),
-- Resumen por mes del último año
ResumenMensual AS (
    SELECT 
        anio,
        mes,
        SUM(monto_total) AS total_mensual
    FROM UltimoAnio
    GROUP BY anio, mes
)
-- Resultado final
SELECT 
    -- Ingreso mensual promedio
    (SELECT AVG(total_mensual) FROM ResumenMensual) AS ingreso_mensual_promedio,
    
    -- Ingreso total del último año
    (SELECT SUM(monto_total) FROM UltimoAnio) AS ingreso_total_ultimo_anio,
    
    -- Ingreso proyectado a 12 meses (promedio mensual * 12)
    (SELECT AVG(total_mensual) FROM ResumenMensual) * 12 AS ingreso_proyectado_12meses,
    
    -- Variación porcentual estimada comparada con el año anterior
    CASE 
        WHEN (SELECT total_anio_anterior FROM AnioAnterior) = 0 THEN NULL
        ELSE (((SELECT SUM(monto_total) FROM UltimoAnio) - 
              (SELECT total_anio_anterior FROM AnioAnterior)) / 
              (SELECT total_anio_anterior FROM AnioAnterior)) * 100
    END AS variacion_porcentual_estimada;




