SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, concat(precio,' €') , concat(round(precio*1.08,2), ' $') FROM producto;
SELECT nombre as 'Nom de Producto', concat(precio,' €') AS euros, concat(round(precio*1.08,2), ' $') AS dolares FROM producto;
SELECT UPPER(nombre) AS 'Nom', precio AS 'Preu' FROM producto;
SELECT LOWER(nombre) AS 'Nom', precio AS 'Preu' FROM producto;
SELECT nombre, UPPER(LEFT(nombre,2)) FROM fabricante;
SELECT nombre, ROUND(precio)  FROM producto;


 