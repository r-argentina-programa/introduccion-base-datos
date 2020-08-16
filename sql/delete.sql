SELECT COUNT(*) FROM liga_italiana;
DELETE FROM liga_italiana WHERE id = 1;

/* No da error, simplemente no actualiza nada */
DELETE FROM liga_italiana WHERE id = 1;
SELECT COUNT(*) FROM liga_italiana;


SELECT COUNT(*) FROM liga_italiana;
DELETE FROM liga_italiana WHERE nombre LIKE '%FC' OR
posicion > 10;
SELECT COUNT(*) FROM liga_italiana;

/* Esto difiere de TRUNCATE porque TRUNCATE también resetearía el AUTOINCREMENT a 0*/
DELETE FROM liga_italiana;
SELECT COUNT(*) FROM liga_italiana;

/* EL id es 21 en vez de 1*/
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(1,'SS Lazio',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
SELECT * FROM liga_italiana;

/* Simular el TRUNCATE para que el ID sea 1 */
DELETE FROM liga_italiana;
DELETE FROM sqlite_sequence WHERE NAME='liga_italiana';
SELECT COUNT(*) FROM liga_italiana;
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(1,'SS Lazio',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
SELECT * FROM liga_italiana;
