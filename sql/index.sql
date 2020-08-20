/* Nota no podemos crear el índice si ya hay registros duplicados */
CREATE UNIQUE INDEX IF NOT EXISTS idx_liga_italiana_nombre ON liga_italiana(nombre);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(1,'SS Lazio',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
