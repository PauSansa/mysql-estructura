SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, concat(precio,' €') , concat(round(precio*1.08,2), ' $') FROM producto;
SELECT nombre as 'Nom de Producto', concat(precio,' €') AS euros, concat(round(precio*1.08,2), ' $') AS dolares FROM producto;
SELECT UPPER(nombre) AS 'Nom', precio AS 'Preu' FROM producto;
SELECT LOWER(nombre) AS 'Nom', precio AS 'Preu' FROM producto;
SELECT nombre, UPPER(LEFT(nombre,2)) FROM fabricante;
SELECT nombre, ROUND(precio)  FROM producto;
SELECT nombre, TRUNCATE(precio,0)  FROM producto;
SELECT F.codigo FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo;
SELECT DISTINCT F.codigo FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo;
SELECT DISTINCT F.nombre FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo ORDER BY F.nombre ASC;
SELECT DISTINCT F.nombre FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo ORDER BY F.nombre DESC;
SELECT DISTINCT P.nombre FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo ORDER BY P.nombre,P.precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante WHERE codigo >= 4 LIMIT 2;
SELECT nombre,precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre,precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT DISTINCT P.nombre FROM producto P INNER JOIN fabricante F WHERE P.codigo_fabricante = 2;
SELECT P.nombre,P.precio, F.nombre AS 'Nombre Fabricante' FROM producto p INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo;
SELECT P.nombre,P.precio, F.nombre AS 'Nombre Fabricante' FROM producto p INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo ORDER BY F.nombre ASC;
SELECT P.codigo, P.nombre, F.codigo AS 'Codigo Fabricante', F.nombre AS 'Nombre Fabricante' FROM producto P INNER JOIN fabricante F ON  P.codigo_fabricante=F.codigo ORDER by F.nombre ASC; 
SELECT P.nombre, P.precio, F.nombre AS 'Nombre Fabricante' FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo ORDER BY P.precio ASC LIMIT 1;
SELECT P.nombre, P.precio, F.nombre AS 'Nombre Fabricante' FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo ORDER BY P.precio DESC LIMIT 1;
SELECT nombre from producto WHERE codigo_fabricante = 2;
SELECT nombre from producto WHERE codigo_fabricante = 6 AND precio >= 200;
SELECT * FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 4;
SELECT * FROM producto WHERE codigo_fabricante IN(1,3,4);
SELECT P.nombre, P.precio FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo WHERE F.nombre LIKE '%e';
SELECT P.nombre, P.precio FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo WHERE F.nombre LIKE '%w%';
SELECT P.nombre, P.precio, F.nombre AS 'Nombre fabricante' FROM producto p INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo WHERE P.precio >= 180 ORDER BY P.precio DESC, P.nombre ASC;
SELECT DISTINCT F.nombre, F.codigo FROM producto p INNER JOIN fabricante F ON P.codigo_fabricante=F.codigo;
SELECT F.nombre, P.nombre FROM fabricante F LEFT JOIN producto P ON P.codigo_fabricante=F.codigo;
SELECT F.nombre, P.nombre FROM fabricante F LEFT JOIN producto P ON P.codigo_fabricante=F.codigo WHERE P.codigo_fabricante is null;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT * FROM producto WHERE precio = (SELECT precio FROM producto WHERE codigo_fabricante = 2 ORDER BY precio DESC LIMIT 1);
SELECT nombre FROM producto WHERE codigo_fabricante = 2 ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 3 ORDER BY precio ASC LIMIT 1;
SELECT * FROM producto WHERE precio >= (SELECT precio FROM producto WHERE codigo_fabricante = 2 ORDER BY precio DESC LIMIT 1);
SELECT * FROM producto WHERE codigo_fabricante = 1 AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 1);








 




 