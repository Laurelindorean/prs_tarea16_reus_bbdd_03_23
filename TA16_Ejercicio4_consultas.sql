USE actividades;
/* 4.1 Mostrar el nombre de todas las peliculas */
SELECT NOMBRE FROM peliculas;

/* 4.2 Mostrar las distintas calificaciones de edad que existen */
SELECT DISTINCT CALIFICACIONEDAD AS "Edad calificada" FROM peliculas;

/* 4.3 Mostrar todas las películas que no han sido calificadas */
SELECT * FROM peliculas 
WHERE CALIFICACIONEDAD IS NULL;

/* 4.4 Mostrar todas las salas que no proyectan ninguna película */
SELECT * FROM salas 
WHERE PELICULA IS NULL;

/* 4.5 Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, 
mostrar también la información de la película */
SELECT * FROM salas
LEFT JOIN peliculas ON salas.PELICULA = peliculas.CODIGO;

/* 4.6 Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala. */
SELECT * FROM peliculas
LEFT JOIN salas ON peliculas.CODIGO = salas.PELICULA;

/* 4.7 Mostrar los nombres de las películas que no se proyectan en ninguna sala. */
SELECT NOMBRE FROM peliculas 
WHERE CODIGO NOT IN (SELECT PELICULA FROM salas WHERE PELICULA IS NOT NULL);

/* 4.8 Añadir una nueva película 'Uno, Dos, Tres', para mayores de 7 años */
INSERT INTO peliculas VALUES(20, 'Undo, Dos, Tres', 7);

/* 4.9 Hacer constar que todas las películas no calificadas han sido calificadas 'no recomendables para menores de 13 años' */
UPDATE peliculas
SET CALIFICACIONEDAD = 13 
WHERE CALIFICACIONEDAD IS NULL;

/* 4.10 Eliminar todas las salas que proyectan películas recomendadas para todos los públicos */
DELETE FROM salas
WHERE PELICULA IN (SELECT CODIGO FROM peliculas WHERE CALIFICACIONEDAD = 0);