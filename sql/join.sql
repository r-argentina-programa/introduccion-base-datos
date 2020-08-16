/*
Con el JOIN uno 2 o más tablas
INNER implica que a menos que la condición de unión se cumpla, (ej. ON l1.id = p.fk_equipo_casa) el registro no aparece en el resultado
*/
SELECT 
  l1.nombre AS nombre_casa, 
  l2.nombre AS nombre_fuera,
  p.*
FROM partidos p
INNER JOIN liga_italiana l1
ON l1.id = p.fk_equipo_casa
INNER JOIN liga_italiana l2
ON l2.id = p.fk_equipo_fuera;

/*
Con el JOIN uno 2 o más tablas
INNER implica que a menos que la condición de unión se cumpla, (ej. ON l1.id = p.fk_equipo_casa) el registro no aparece en el resultado
cacho no tiene equipo por lo tanto no aparece en los resultados
*/
SELECT j.nombre, l.nombre AS nombre_equipo FROM jugadores j
INNER JOIN liga_italiana l
ON l.id = j.fk_equipo;


/*
Con el JOIN uno 2 o más tablas
LEFT implica que quiero los registros de la tabla de la  "izquierda" por más que no haya correspondencia en las otras tablas
RIGHT, OUTER existen en otros motores pero no en SQLITE.
RIGHT es como LEFT pero al revés
OUTER es la combinación de LEFT y RIGHT
*/
SELECT j.nombre, l.nombre AS nombre_equipo FROM jugadores j
LEFT JOIN liga_italiana l
ON l.id = j.fk_equipo;
