USE actividades;
/* 3.1 Obtener todos los almacenes */
SELECT * FROM almacenes;

/* 3.2 Obtener todas las cajas cuyo contenido tenga un valor superior a 150€ */
SELECT * FROM cajas 
WHERE VALOR > 150;

/* 3.3 Obtener los tipos de contenidos de las cajas. */
SELECT DISTINCT CONTENIDO FROM cajas;

/* 3.4 Obtener el valor medio de todas las cajas. */
SELECT AVG(VALOR) AS "Precio Medio" FROM cajas;

/* 3.5 Obtener el valor medio de las cajas de cada almacen */
SELECT AVG(VALOR) AS "Precio Medio" FROM cajas
GROUP BY(ALMACEN);

/* 3.6 Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150€ */
SELECT ALMACEN FROM cajas
GROUP BY ALMACEN HAVING AVG(VALOR) > 150;

/* 3.7 Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra */
SELECT NUMREFERENCIA, LUGAR FROM cajas, almacenes
WHERE cajas.ALMACEN = almacenes.CODIGO;

/* 3.8 Obtener el numero de cajas que hay en cada almacén. */
SELECT ALMACEN, COUNT(NUMREFERENCIA) 
FROM cajas
GROUP BY ALMACEN;

/* 3.9 Obtener los códigos de los almacenes que están saturados (los almacenes donde el numero de cajas es superior a la capacidad) */
SELECT CODIGO FROM almacenes
WHERE CAPACIDAD < (SELECT COUNT(*) FROM cajas WHERE ALMACEN = almacenes.CODIGO);

/* 3.10 Obtener los numeros de referencia de las cajas que están en Bilbao */
SELECT NUMREFERENCIA FROM cajas
WHERE ALMACEN IN (SELECT CODIGO FROM almacenes WHERE LUGAR = 'Bilbao');

/* 3.11 Insert un nuevo almacén en Barcelona con capacidad para 3 cajas */
INSERT INTO almacenes VALUES (16, 'Barcelona', 3);

/* 3.12 Insertar una nueva caja, con número de referencia 'H5RT', con contenido 'Papel', 
valor 200, y situada en el almacén 2. */
INSERT INTO cajas VALUES ('H5RT', 'Papel', 200, 2);

/* 3.13 Rebajar el valor de todas las cajas un 15% */
UPDATE cajas
SET VALOR = VALOR * 0.85;

/* 3.14 Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas */
UPDATE cajas
SET VALOR = VALOR * 0.80 
WHERE VALOR >(SELECT AVG(VALOR) FROM cajas);

/* 3.15 Eliminar todas las cajas cuyo valor sea inferior a 100€ */
DELETE FROM cajas
WHERE VALOR < 100;

/* 3.16 Vaciar el contenido de los almacenes que están saturados */
DELETE FROM cajas
WHERE ALMACEN IN (SELECT CODIGO FROM almacenes WHERE CAPACIDAD < (SELECT COUNT(*) FROM cajas WHERE ALMACEN = almacenes.CODIGO));