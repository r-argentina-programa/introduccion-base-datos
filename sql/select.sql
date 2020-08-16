/* Selecciona todos los registros de la tabla */
SELECT * FROM liga_italiana;

/* Selecciona todos los registros de la tabla según condición */
SELECT * FROM liga_italiana WHERE id = 1;

/* Selecciona todos los equipos que terminen con 'FC' */
SELECT * FROM liga_italiana WHERE nombre LIKE '%FC';

/* Selecciona todos los equipos que terminen con ' FC' */
SELECT * FROM liga_italiana WHERE nombre LIKE '% FC';

/* Selecciona todos los registros que cumplan estas 2 condiciones */
SELECT * FROM liga_italiana 
WHERE goles_diferencia_total > 20
AND goles_favor_total > 40;

/* Selecciona todos los registros que cumplan estas 2 condiciones */
SELECT * FROM liga_italiana 
WHERE
(goles_diferencia_total > 20 AND goles_favor_total > 40)
OR (goles_diferencia_total < 0);

/* Notar que no hace falta seleccionar las mismas columnas por las que se filtra */
SELECT posicion, nombre, puntos_total FROM liga_italiana 
WHERE
(goles_diferencia_total > 20 AND goles_favor_total > 40)
OR (goles_diferencia_total < 0);

/* Selecciona los equipos que tengan en su nombre alguna de estas condiciones */
SELECT * FROM liga_italiana WHERE nombre IN('Parma', 'Cagliari Calcio');

/* Cuenta cuantos registros hay en esta tabla */
SELECT COUNT(*) FROM liga_italiana;

/* Cuenta cuantos registros cumplen con estas condiciones */
SELECT COUNT(*) FROM liga_italiana 
WHERE
(goles_diferencia_total > 20 AND goles_favor_total > 40)
OR (goles_diferencia_total < 0);

/* Equipo con más goles a favor fuera */
SELECT posicion, nombre, MAX(goles_favor_fuera) FROM liga_italiana;

/* Equipo con menos goles a favor en casa */
SELECT posicion, nombre, MIN(goles_favor_casa) FROM liga_italiana;

/* Total de goles en la liga italiana */
SELECT SUM(goles_favor_total) FROM liga_italiana;

/* Promedio de goles en contra */
SELECT AVG(goles_contra_total) FROM liga_italiana;

/* Seleccionar la fecha con la hora local del servidor */
SELECT DATETIME(created_at, 'localtime'), DATETIME(updated_at, 'localtime') FROM liga_italiana;

/* Agrupamos por partidos jugados y contamos cuántos equipos hay en cada grupo */
SELECT jugados, COUNT(*) AS cantidad_equipos FROM liga_italiana GROUP BY jugados;

/* Agrupamos por partidos jugados y contamos cuántos equipos hay en cada grupo
y sólo nos enfocamos en los grupos con más de 2 */
SELECT jugados, COUNT(*) AS cantidad_equipos FROM liga_italiana
GROUP BY jugados
HAVING cantidad_equipos > 2;

/* Suma la cantidad de equipos que vienen en el subquery */
SELECT SUM(cantidad_equipos) FROM (
  SELECT jugados, COUNT(*) AS cantidad_equipos FROM liga_italiana
  GROUP BY jugados
  HAVING cantidad_equipos > 2
);

/* Todos los equipos que tengan goles_contra_total mayor al promedio de goles_contra_total */
SELECT * FROM liga_italiana 
WHERE goles_contra_total > (
  SELECT AVG(goles_contra_total) FROM liga_italiana
);

