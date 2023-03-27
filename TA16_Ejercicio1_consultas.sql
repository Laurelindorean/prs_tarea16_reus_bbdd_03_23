/* 1.1 Obtener los nombres de los productos de la tienda */
SELECT NOMBRE FROM actividades.articulos;

/* 1.2 Obtener los nombres y los precios de los productos de la tienda */
SELECT NOMBRE, PRECIO FROM actividades.articulos;

/* 1.3 Obtener el nombre de los productos cuyo precio sea menor o igual a 200€ */
SELECT NOMBRE FROM actividades.articulos WHERE PRECIO <= 200;

/* 1.4 Obtener todos los datos de los artículos cuyo precio esté entre los 60€ y los 120€ (ambas cantidades incluidas) */
SELECT * FROM actividades.articulos WHERE PRECIO BETWEEN 60 AND 120;

/* 1.5 Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166'386) */
SELECT NOMBRE, PRECIO*166.386 AS "Precio en Pesetas" FROM actividades.articulos;

/* 1.6 Seleccionar el precio medio de todos los productos. */
SELECT AVG(PRECIO) AS "Precio Medio" FROM actividades.articulos;

/* 1.7 Obtener el precio medio de los artículos cuyo código de fabricante sea 2 */
SELECT AVG(PRECIO) AS "Precio Medio" FROM actividades.articulos WHERE FABRICANTE = 2;

/* 1.8 Obtener el numero de artículos cuyo precio sea mayor o igual a 180€ */
SELECT COUNT(CODIGO) FROM actividades.articulos WHERE PRECIO >=180;

/* 1.9 Obtener el nombre y el precio de los artículos cuyo precio sea mayor o igual a 180€ y ordenarlos descendentemente 
por precio, y luego ascendentemente por nombre. */
SELECT NOMBRE, PRECIO FROM actividades.articulos WHERE PRECIO >=180 ORDER BY PRECIO DESC, NOMBRE ASC;

/* 1.10 Obtener un listado completo de artículos, incluyendo por cada articulo los datos del articulo y de su fabricante. */
SELECT * FROM actividades.articulos a 
JOIN actividades.fabricantes f ON a.FABRICANTE = f.CODIGO;

/* 1.11 Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante. */
SELECT articulos.NOMBRE, PRECIO, fabricantes.NOMBRE AS "Fabricante" FROM actividades.articulos
JOIN fabricantes ON FABRICANTE = fabricantes.CODIGO;

/* 1.12 Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante */
SELECT AVG(PRECIO) AS "Precio medio" , FABRICANTE FROM actividades.articulos 
GROUP BY FABRICANTE;

/* 1.13 Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante */
SELECT AVG(articulos.PRECIO) AS "Precio medio" , fabricantes.NOMBRE AS "Nombre fabricante" FROM actividades.articulos, actividades.fabricantes 
WHERE articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY FABRICANTE;

/* 1.14 Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150€ */
SELECT fabricantes.NOMBRE FROM fabricantes, articulos 
WHERE fabricantes.CODIGO = articulos.FABRICANTE 
GROUP BY (fabricantes.NOMBRE) HAVING AVG(articulos.PRECIO)>=150;

/* 1.15 Obtener el nombre y el precio del artículo más barato */
SELECT NOMBRE, PRECIO FROM articulos
HAVING PRECIO =(SELECT MIN(PRECIO) FROM articulos);

/* 1.16 Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor). */
SELECT a.NOMBRE, a.PRECIO, f.NOMBRE FROM articulos a
JOIN fabricantes f ON a.FABRICANTE = f.CODIGO 
WHERE a.PRECIO = ( SELECT MAX(aa.PRECIO) FROM articulos aa WHERE aa.FABRICANTE = f.CODIGO);

/* 1.17 Añadir un nuevo producto: Altavoces de 70€ (del fabricante 2) */
INSERT INTO articulos VALUES (21, 'Altavoces', 70, 2);

/* 1.18 Cambiar el nombre del producto 8 a 'Impresora Laser'. */
UPDATE articulos 
SET NOMBRE = 'Impresora Laser'
WHERE CODIGO = 8;

/* 1.19 Aplicar un descuento del 10% (multiplicar el precio por 0,9) a todos los productos. */
UPDATE articulos
SET PRECIO = PRECIO*0.9;

/* 1.20 Aplicar un descuento de 10€ a todos los productos cuyo precio sea mayor o igual a 120€. */
UPDATE articulos
SET PRECIO = PRECIO -10
WHERE PRECIO >=120;



