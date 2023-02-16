SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno';
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%F';
SELECT nombre, id FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT P.apellido1, P.apellido2, P.nombre, D.nombre AS 'Nombre Departamento'  FROM persona P INNER JOIN profesor Pr ON p.id = Pr.id_profesor INNER JOIN departamento D ON Pr.id_departamento=D.id;