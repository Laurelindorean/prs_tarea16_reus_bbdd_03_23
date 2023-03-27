USE actividades;

/*Realizamos 10 inserciones */
INSERT INTO actividades.fabricantes VALUES
(7, 'Intel'),(8, 'AMD'),(9, 'Nvidia'),(10, 'Asus'),(11, 'MSI'),(12, 'Acer'),(13, 'Razer'),(14, 'Logitech'),(15, 'HyperX'),(16, 'Lenovo');

/*Consultamos que se hayan creado correctamente*/
SELECT * FROM actividades.fabricantes;

/*Realizamos 10 inserciones */
INSERT INTO actividades.articulos VALUES
(11, 'Razer Kraken', 75, 13),
(12, 'Solo cast', 40, 15),
(13, 'RTX 3080', 680, 9),
(14, 'Ryzen 7 5800X', 560, 8),
(15, 'GeForce RTX 3060', 379, 10),
(16, 'GeForce RTX 3070', 659, 11),
(17, 'G502 X PLUS', 140, 14),
(18, 'Intel Core i9-13900k', 659, 7),
(19, 'Huntsman Tournament Edition', 220, 13),
 (20, 'Legion 5 Pro', 2630, 16);

 /*Consultamos que se hayan creado correctamente*/
SELECT * FROM actividades.articulos;