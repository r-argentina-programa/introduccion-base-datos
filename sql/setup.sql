PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS liga_italiana;
CREATE TABLE IF NOT EXISTS liga_italiana(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  posicion INTEGER NOT NULL,
  nombre TEXT NOT NULL,
  jugados INTEGER NOT NULL,
  ganados_total INTEGER NOT NULL,
  empatados_total INTEGER NOT NULL,
  perdidos_total INTEGER NOT NULL,
  goles_favor_total INTEGER NOT NULL,
  goles_contra_total INTEGER NOT NULL,
  goles_diferencia_total INTEGER NOT NULL,
  puntos_total INTEGER NOT NULL,
  ganados_casa INTEGER NOT NULL,
  empatados_casa INTEGER NOT NULL,
  perdidos_casa INTEGER NOT NULL,
  goles_favor_casa INTEGER NOT NULL,
  goles_contra_casa INTEGER NOT NULL,
  ganados_fuera INTEGER NOT NULL,
  empatados_fuera INTEGER NOT NULL,
  perdidos_fuera INTEGER NOT NULL,
  goles_favor_fuera INTEGER NOT NULL,
  goles_contra_fuera INTEGER NOT NULL,
  /*
    datetime es UTC por default
    para especificar una zona horaria específica o la hora del servidor podemos usar el 2ndo parámetro:
    datetime('now', 'localtime')
  */
  created_at DATE DEFAULT (datetime('now')) NOT NULL,
  updated_at DATE DEFAULT (datetime('now')) NOT NULL
);

DROP TABLE IF EXISTS partidos;
CREATE TABLE IF NOT EXISTS partidos(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  fk_equipo_casa INTEGER NOT NULL, /* fk_ es una convención recomendada por mi pero no es necesaria */
  fk_equipo_fuera INTEGER NOT NULL, /* fk_ es una convención recomendada por mi pero no es necesaria */
  goles_casa INTEGER NOT NULL,
  goles_fuera INTEGER NOT NULL,
  created_at DATE DEFAULT (datetime('now')) NOT NULL,
  updated_at DATE DEFAULT (datetime('now')) NOT NULL,
  FOREIGN KEY(fk_equipo_casa) REFERENCES liga_italiana(id)
  FOREIGN KEY(fk_equipo_fuera) REFERENCES liga_italiana(id)
);

DROP TABLE IF EXISTS jugadores;
CREATE TABLE IF NOT EXISTS jugadores(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  fk_equipo INTEGER NULL, /* fk_ es una convención recomendada por mi pero no es necesaria */
  nombre TEXT NOT NULL,
  created_at DATE DEFAULT (datetime('now')) NOT NULL,
  updated_at DATE DEFAULT (datetime('now')) NOT NULL,
  FOREIGN KEY(fk_equipo) REFERENCES liga_italiana(id)
);

PRAGMA foreign_keys = ON;

/* FUENTE https://github.com/openfootball/italy/tree/master/2019-20 */
/* Procesamiento de datos en: https://docs.google.com/spreadsheets/d/17ZGDEkUyaHa-WH7Xagcr42a5kq5oiAchQtPf-XOcIAI/edit?usp=drive_web&ouid=109791343978390431897 */

/* Insertar registros */
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(1,'SS Lazio',27,19,6,2,60,23,37,63,11,4,0,39,10,8,2,2,21,13);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(2,'Juventus',26,20,3,3,50,24,26,63,12,1,0,31,10,8,2,3,19,14);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(3,'FC Internazionale Milano',25,16,6,3,49,24,25,54,7,4,1,23,10,9,2,2,26,14);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(4,'Atalanta BC',25,14,6,5,70,34,36,48,6,2,4,33,19,8,4,1,37,15);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(5,'AS Roma',26,13,6,7,51,35,16,45,6,3,4,26,19,7,3,3,25,16);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(6,'SSC Napoli',26,11,6,9,41,36,5,39,5,2,6,17,18,6,4,3,24,18);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(7,'Hellas Verona FC',26,9,9,8,29,26,3,36,6,3,3,17,12,3,6,5,12,14);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(8,'AC Milan',26,10,6,10,28,34,-6,36,4,5,4,13,15,6,1,6,15,19);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(9,'US Sassuolo Calcio',26,10,5,11,43,39,4,35,6,1,6,28,22,4,4,5,15,17);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(10,'Parma',25,10,5,10,32,31,1,35,6,1,6,17,12,4,4,4,15,19);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(11,'Bologna FC',26,9,7,10,38,42,-4,34,4,5,4,18,20,5,2,6,20,22);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(12,'Cagliari Calcio',25,8,8,9,41,40,1,32,5,2,6,25,23,3,6,3,16,17);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(13,'Udinese Calcio',26,8,7,11,22,36,-14,31,5,4,4,10,12,3,3,7,12,24);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(14,'ACF Fiorentina',26,7,9,10,32,36,-4,30,3,5,5,13,17,4,4,5,19,19);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(15,'Torino FC',25,8,3,14,28,45,-17,27,4,2,6,11,22,4,1,8,17,23);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(16,'Genoa CFC',26,6,7,13,31,47,-16,25,4,1,7,14,18,2,6,6,17,29);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(17,'US Lecce',26,6,7,13,34,56,-22,25,2,5,6,19,26,4,2,7,15,30);
INSERT INTO liga_italiana (posicion, nombre, jugados, ganados_total, empatados_total, perdidos_total, goles_favor_total, goles_contra_total, goles_diferencia_total, puntos_total, ganados_casa, empatados_casa, perdidos_casa, goles_favor_casa, goles_contra_casa, ganados_fuera, empatados_fuera, perdidos_fuera, goles_favor_fuera, goles_contra_fuera) VALUES(18,'UC Sampdoria',25,6,5,14,27,45,-18,23,3,4,7,15,23,3,1,7,12,22);

/* Insertar varios registros */
INSERT INTO liga_italiana 
(
  posicion, 
  nombre, 
  jugados, 
  ganados_total, 
  empatados_total, 
  perdidos_total, 
  goles_favor_total, 
  goles_contra_total, 
  goles_diferencia_total, 
  puntos_total, 
  ganados_casa, 
  empatados_casa, 
  perdidos_casa, 
  goles_favor_casa, 
  goles_contra_casa, 
  ganados_fuera, 
  empatados_fuera, 
  perdidos_fuera, 
  goles_favor_fuera, 
  goles_contra_fuera
 )
 VALUES
 (20,'Brescia',27,4,4,19,22,51,-29,16,1,3,10,13,27,3,1,9,9,24),
 (19,'SPAL',26,5,3,18,20,44,-24,18,2,2,8,11,20,3,1,10,9,24);


INSERT INTO partidos(
  fk_equipo_casa,
  fk_equipo_fuera,
  goles_casa,
  goles_fuera
) VALUES (
  (SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),
  (SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),
  /* fuente: https://stackoverflow.com/questions/8304204/generating-only-positive-random-numbers-in-sqlite*/
  /* lo que está haciendo es elegir el resultado de un número positivo módulo 7 */
  (SELECT ABS(RANDOM() % 7)), /* Considero un máximo de 7 goles*/
  (SELECT ABS(RANDOM() % 7)) /* Considero un máximo de 7 goles*/
),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7))),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1),(SELECT ABS(RANDOM() % 7)),(SELECT ABS(RANDOM() % 7)));

INSERT INTO jugadores (fk_equipo, nombre) VALUES
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1), 'pepe'),
((SELECT id FROM liga_italiana ORDER BY RANDOM() LIMIT 1), 'juan'),
(NULL, 'cacho');

