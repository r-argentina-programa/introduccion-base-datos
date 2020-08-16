SELECT * FROM liga_italiana WHERE id = 1;
/* Actualiza los registros que cumplen con la condición (en este caso sólo 1) */
UPDATE liga_italiana SET nombre = 'CALCIO FC' WHERE id = 1;
SELECT * FROM liga_italiana;

/* Actualiza todos los registros  */
UPDATE liga_italiana SET jugados = 27;
SELECT * FROM liga_italiana;

/* Cualquier equipo que termine con FC*/
UPDATE liga_italiana SET jugados = 26, posicion = 1
WHERE nombre LIKE '%FC';

SELECT * FROM liga_italiana;

/* Cualquier equipo que tenga la 'o' en su nombre*/
UPDATE liga_italiana SET jugados = 28, posicion = 2
WHERE nombre LIKE '%o%';

SELECT * FROM liga_italiana;
