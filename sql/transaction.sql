/* Todas los queries se ejecutan satisfactoriamente o no se ejecuta ninguno (conocido como un ROLLBACK) */
BEGIN TRANSACTION;
  INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(1,'Nuevo equipo 1',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
  INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(1,'Nuevo equipo 2',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
/* El commit hace que la transacción finalice, si no lo ejecutamos todo lo que hagamos estará "pendiente" (ver journal)*/
COMMIT;

/*
 El primer query está bien porque el ID 99 no existe. El segundo (id 1) da error porque ya existe 
 El problema es que la primer transacción existe en la tabla y el segundo no.
*/
INSERT INTO liga_italiana (id, posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(99, 1,'Nuevo equipo 1',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
INSERT INTO liga_italiana (id, posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(1, 1,'Nuevo equipo 2',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
SELECT * FROM liga_italiana;


/*
La sintaxis cambia en SQLite vs otros motores
INSERT OR ROLLBACK instruye al motor de búsqueda que haga rollback de la transacción si hay un error
*/
BEGIN TRANSACTION;
  /*
   esta instrucción funciona porque 100 es un ID que no existe
  */
  INSERT OR ROLLBACK INTO liga_italiana (id, posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(100, 1,'Nuevo equipo 1',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
    /*
   esta instrucción falla porque el ID 1 ya existe, entonces hace un ROLLBACK de toda la transacción.
  */
  INSERT OR ROLLBACK INTO liga_italiana (id, posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(1, 1,'Nuevo equipo 2',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
COMMIT;

SELECT * FROM liga_italiana;
