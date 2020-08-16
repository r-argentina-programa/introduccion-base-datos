/* Renombrar tabla */
ALTER TABLE liga_italiana RENAME TO 'liga_italiana_2'
SELECT * FROM liga_italiana_2;
SELECT * FROM liga_italiana;
ALTER TABLE liga_italiana_2 RENAME TO 'liga_italiana'
SELECT * FROM liga_italiana;
SELECT * FROM liga_italiana_2;

/* Agregar columna */
ALTER TABLE liga_italiana ADD COLUMN created_at_2 DATE;
SELECT * FROM liga_italiana;

/* Renombrar columna */
ALTER TABLE liga_italiana RENAME COLUMN created_at_2 TO created_at_3;
SELECT * FROM liga_italiana;

/*
Para eliminar una culumna
en mysql haríamos
ALTER TABLE liga_italiana DROP created_at_2; 
sqlite no permite hacer esto
create una tabla nueva
la alternativa es mover los datos a la nueva tabla
borrar la tabla actual
renombrar la tabla nueva a liga_italiana
*/

