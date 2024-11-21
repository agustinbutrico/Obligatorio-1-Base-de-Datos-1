USE Obligatorio_BD;
SET DATEFORMAT YMD;

/*
1. Listar el o los nombres de los pasajeros con la mayor cantidad de pasajes comprados a
su nombre.

/Explicacion de la Consulta:/

INNER JOIN: Une las tablas Turista y Pasaje para obtener los datos de los turistas que compraron pasajes.

GROUP BY: Agrupa por nombres y apellidos del turista.

COUNT(P.ID_Pasaje): Cuenta el número de pasajes comprados por cada turista.

HAVING con subconsulta: La subconsulta interna calcula el número máximo de pasajes comprados por un solo turista.

La condición HAVING selecciona solo los turistas cuya cantidad de pasajes es igual a ese máximo.

*/
SELECT 
    T.Primer_Nombre_turista, 
    T.Apellido_Paterno_turista, 
    T.Apellido_Materno_turista, 
    COUNT(P.ID_Pasaje) AS Cantidad_Pasajes 
FROM 
	Turista T INNER JOIN Pasaje P ON T.ID_Turista = P.ID_Turista
GROUP BY 
    T.Primer_Nombre_turista, T.Apellido_Paterno_turista, T.Apellido_Materno_turista
    
HAVING COUNT(P.ID_Pasaje) = (SELECT MAX(Cantidad)

FROM ( SELECT COUNT(ID_Pasaje) AS Cantidad FROM Pasaje GROUP BY ID_Turista) AS Subquery
);

/*
2. Listar todos los datos de los buses con más de 35 asientos que no tengan asignado
ningún destino que parta el día de mañana.

/Explicación de la Consulta:/

Bus: Tabla principal que contiene los datos de los buses.

LEFT JOIN:  Vincula los buses con los viajes asignados. Los buses sin viajes asignados tendrán valores nulos en la parte de Viaje.

Condiciones: B.Capacidad_Bus > 35: Filtra los buses con más de 35 asientos.

V.ID_Viaje IS NULL: Incluye buses sin viajes asignados.

CAST(V.Fecha_Salida AS DATE) <> CAST(DATEADD(DAY, 1, GETDATE()) AS DATE): Excluye buses que tengan un viaje programado para el día de mañana.

GETDATE(): Devuelve la fecha y hora actuales en SQL Server.

DATEADD(DAY, 1, GETDATE()): Calcula el día de mañana.

*/
SELECT B.* FROM Bus B LEFT JOIN Viaje V ON B.ID_Bus = V.ID_Bus

WHERE B.Capacidad_Bus > 35 AND (V.ID_Viaje IS NULL 
 OR 
CAST(V.Fecha_Salida_Viaje AS DATE) <> CAST(DATEADD(DAY, 1, GETDATE()) AS DATE)
);

/*
3. Listar todos los datos de los pasajeros para los cuales haya registrados en el sistema
más de 5 pasajes comprados.

/Explicación de la Consulta:/

Subconsulta: La subconsulta agrupa los pasajes por ID_Turista y cuenta cuántos pasajes ha comprado cada turista.

Se filtran los turistas con más de 5 pasajes (HAVING COUNT(*) > 5).

INNER JOIN: Se relaciona la subconsulta con la tabla Turista para obtener todos los datos de los turistas que cumplen con la condición.

Resultado: Devuelve todos los datos de los pasajeros que tienen más de 5 pasajes comprados.

*/
SELECT T.* FROM Turista T 

INNER JOIN (SELECT ID_Turista, COUNT(*) AS Cantidad_Pasajes

FROM Pasaje GROUP BY ID_Turista HAVING COUNT(*) > 5)
 
AS P ON T.ID_Turista = P.ID_Turista;



/*
4. Listar idpasajero, nombre, apellidos y asiento (idasiento y fila) que correspondan a
pasajes comprados para el destino cuyo idviaje es 255.

/Explicación de la consulta:/
SELECT: Establece los campos que deseas mostrar: el ID del turista, su nombre, apellidos y los detalles del asiento (ID del bus y número de fila).

FROM Pasaje p: Especifica la tabla Pasaje como la tabla principal desde donde comenzamos la búsqueda.

JOIN Turista t: Se une con la tabla Turista usando la clave foránea ID_Turista para obtener la información del turista.

JOIN Asiento a: Se une con la tabla Asiento usando ID_Bus y Numero_Fila_Asiento para obtener la información del asiento correspondiente.

JOIN Viaje v: Se une con la tabla Viaje usando ID_Viaje para filtrar los registros del viaje cuyo ID_Viaje es 255.

WHERE v.ID_Viaje = 255: Filtra los resultados para solo mostrar los pasajes del viaje con ID 255.
*/
SELECT  t.ID_Turista, 
		t.Primer_Nombre_turista, 
		t.Apellido_Paterno_turista, 
		t.Apellido_Materno_turista, 
		a.ID_Bus, 
		a.Numero_Fila_Asiento
		
FROM Pasaje p JOIN Turista t ON p.ID_Turista = t.ID_Turista 
	JOIN Asiento a ON p.ID_Bus = a.ID_Bus AND p.Numero_Fila_Asiento = a.Numero_Fila_Asiento
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

FORMAT(p.Fecha_Compra_Pasaje, 'yyyy-MM') = '2017-09': Asegura que solo se consideren las compras realizadas durante septiembre de 2017.

GROUP BY p.ID_Viaje: Agrupa los resultados por ID_Viaje para calcular la cantidad de pasajes por viaje.

ORDER BY p.ID_Viaje ASC: Ordena la lista por ID_Viaje en orden ascendente.
*/

SELECT p.ID_Viaje, COUNT(p.ID_Pasaje) AS Cantidad_Pasajes

FROM Pasaje p JOIN Turista t ON p.ID_Turista = t.ID_Turista

WHERE t.Correo_Electronico_turista = 'soyturista@gmail.com' 
      AND DATEPART(YEAR, p.Fecha_Compra_Pasaje) = 2017
      AND DATEPART(MONTH, p.Fecha_Compra_Pasaje) = 9
      
GROUP BY p.ID_Viaje ORDER BY p.ID_Viaje ASC;

