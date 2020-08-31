/* En SQLite esto es necesario para pedirle al motor que se asegure
que las foreign key se cumplan*/
PRAGMA foreign_keys = ON;


/* El id 100000 no existe por lo que da error */
INSERT INTO jugadores 
(fk_equipo, nombre)
VALUES (2, 'cacho');

/* Da error porque jugadores y partidos tienen registros 
que dependen de esta tabla*/
DELETE FROM liga_italiana;

DELETE FROM jugadores;
DELETE FROM partidos;

/* Ahora si puedo borrar los registros de la liga_italiana porque nadie
depende de estos registros*/
DELETE FROM liga_italiana;
