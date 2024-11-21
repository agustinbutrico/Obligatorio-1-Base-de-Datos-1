USE Obligatorio_BD;
SET DATEFORMAT YMD;

/*
1. Listar el o los nombres de los pasajeros con la mayor cantidad de pasajes comprados a
su nombre.

/Explicacion de la Consulta:/

T. Turista: Tabla principal que contiene los datos de los Turistas

HAVING COUNT(*) combinado con un filtro que selecciona 

SELECT TOP: muestra el número máximo de pasajes comprados usando SELECT TOP 1 ... ORDER BY COUNT(*) DESC.

*/

SELECT 
    T.ID_Turista,
    T.Primer_Nombre_Turista,
    T.Apellido_Paterno_Turista,
    T.Apellido_Materno_Turista,
    P.Cantidad_Pasajes
    
FROM Turista T
 
JOIN 
	( SELECT ID_Turista, COUNT(*) AS Cantidad_Pasajes

	  FROM Pasaje GROUP BY ID_Turista HAVING COUNT(*) = (SELECT TOP 1 COUNT(*)

	  FROM Pasaje GROUP BY ID_Turista ORDER BY COUNT(*) DESC
    )
) P ON T.ID_Turista = P.ID_Turista;

/*

2. Listar todos los datos de los buses con más de 35 asientos que no tengan asignado
ningún destino que parta el día de mañana.

/Explicación de la Consulta:/

B. Bus: Tabla principal que contiene los datos de los buses.

LEFT JOIN:  Vincula los buses con los viajes asignados.

B.Capacidad_Bus > 35: Filtra los buses con más de 35 asientos.

CAST(V.Fecha_Salida_Viaje AS DATE) <> CAST(DATEADD(DAY, 1, GETDATE()) AS DATE): Excluye buses que tengan un viaje programado 
para el día de mañana.

V.ID_Viaje IS NULL: Incluye buses sin viajes asignados.

GETDATE(): Devuelve la fecha y hora.

*/
SELECT B.* FROM Bus B LEFT JOIN Viaje V ON B.ID_Bus = V.ID_Bus

AND CAST(V.Fecha_Salida_Viaje AS DATE) = CAST(DATEADD(DAY, 1, GETDATE()) AS DATE)

WHERE B.Capacidad_Bus > 35 AND V.ID_Viaje IS NULL;

/*
3. Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema
más de 5 pasajes comprados.

SELECT: Tabla principal que contiene los datos de los Turistas.

JOIN PASAJE P: Vincula a los turistas con los pasajes que han comprado cada uno, basándose en la columna común ID_Turista.

GROUP BY: Agrupa los resultados por las columnas seleccionadas.

HAVING COUNT: Cuenta cuántos pasajes están asociados con cada Turista.
*/
SELECT T.ID_Turista, 
	T.Primer_Nombre_turista, 
    T.Apellido_Paterno_turista, 
    T.Apellido_Materno_turista,
    T.Numero_Documento_turista,
    T.Contrasenia_turista,
    T.Correo_Electronico_turista,
    T.Telefono_turista,
    T.Tipo_Documento_turista
    
FROM Turista T

JOIN Pasaje P on P.ID_Turista = T.ID_Turista

GROUP BY T.ID_Turista, 
	T.Primer_Nombre_turista, 
    T.Apellido_Paterno_turista, 
    T.Apellido_Materno_turista,
    T.Numero_Documento_turista,
    T.Contrasenia_turista,
    T.Correo_Electronico_turista,
    T.Telefono_turista,
    T.Tipo_Documento_turista
    
HAVING COUNT(P.ID_Pasaje)>5


/*

4. Listar idpasajero, nombre, apellidos y asiento (idasiento y fila) que correspondan a
pasajes comprados para el destino cuyo idviaje es 255.

/Explicación de la consulta:/
SELECT: Establece los campos a mostrar, el ID del turista, su nombre, apellidos y los detalles del asiento.

FROM Pasaje p: Especifica la tabla Pasaje para la busqueda.

JOIN Turista t: Se une con la tabla Turista usando la clave foránea ID_Turista para obtener la información del turista.

JOIN Asiento a: Se une con la tabla Asiento usando ID_Bus, Numero_Fila_Asiento y Letra_Columna_Asiento
 para obtener la información del asiento correspondiente.

JOIN Viaje v: Se une con la tabla Viaje usando ID_Viaje para filtrar los registros del viaje cuyo ID_Viaje es 255.

WHERE v.ID_Viaje = X: Filtra los resultados para solo mostrar los pasajes del viaje con ID X.

*/
SELECT  t.ID_Turista, 
		t.Primer_Nombre_turista, 
		t.Apellido_Paterno_turista, 
		t.Apellido_Materno_turista, 
		a.ID_Bus, 
		a.Numero_Fila_Asiento,
		a.Letra_Columna_Asiento
		
FROM Pasaje p JOIN Turista t ON p.ID_Turista = t.ID_Turista 

	JOIN Asiento a ON p.ID_Bus = a.ID_Bus AND p.Numero_Fila_Asiento = a.Numero_Fila_Asiento
	
	AND p.Letra_Columna_Asiento = a.Letra_Columna_Asiento
		
	JOIN Viaje v ON p.ID_Viaje = v.ID_Viaje
	
WHERE 
    v.ID_Viaje = 5; -- Puede ser cualquier valor que se tenga que buscar
    
/*

5. Listar todos los idviaje y cantidad de pasajes comprados durante el mes de Setiembre de
este año para c/u de los destinos del pasajero cuyo correo es soyturista@gmail.com
comprados en Setiembre del 2017. La lista debe estar ordenada por idviaje ascendente.

/Explicación de la consulta:/

SELECT: p.ID_Viaje: Muestra el ID del viaje.

COUNT(p.ID_Pasaje): Cuenta la cantidad de pasajes comprados para cada viaje.

FROM Pasaje p: Especifica la tabla Pasaje como la base de la consulta.

JOIN Turista t: Se une con la tabla Turista usando la clave foránea ID_Turista para vincular los pasajes con los datos del turista.

WHERE: t.Correo_Electronico_turista = 'soyturista@gmail.com': Filtra los resultados para el turista con el correo especificado.

FORMAT(p.Fecha_Compra_Pasaje, 'yyyy-MM') = '2017-09': Asegura que solo se consideren las compras realizadas 
durante septiembre de 2017.

GROUP BY p.ID_Viaje: Agrupa los resultados por ID_Viaje para calcular la cantidad de pasajes por viaje.

ORDER BY p.ID_Viaje ASC: Ordena la lista por ID_Viaje en orden ascendente.

*/

SELECT p.ID_Viaje, COUNT(p.ID_Pasaje) AS Cantidad_Pasajes

FROM Pasaje p JOIN Turista t ON p.ID_Turista = t.ID_Turista

WHERE t.Correo_Electronico_turista = 'soyturista@gmail.com' 
      AND DATEPART(YEAR, p.Fecha_Compra_Pasaje) = 2017
      AND DATEPART(MONTH, p.Fecha_Compra_Pasaje) = 9
      
GROUP BY p.ID_Viaje ORDER BY p.ID_Viaje ASC;

