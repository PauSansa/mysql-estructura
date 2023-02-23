SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno';
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%F';
SELECT nombre, id FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT P.apellido1, P.apellido2, P.nombre, D.nombre AS 'Nombre Departamento'  FROM persona P INNER JOIN profesor Pr ON p.id = Pr.id_profesor INNER JOIN departamento D ON Pr.id_departamento=D.id ORDER BY P.apellido1, P.apellido2, P.nombre ASC;
SELECT A.nombre, CE.anyo_inicio, CE.anyo_fin FROM persona P INNER JOIN alumno_se_matricula_asignatura ASA ON P.id = ASA.id_alumno INNER JOIN curso_escolar CE ON ASA.id_curso_escolar = CE.id INNER JOIN asignatura A ON ASA.id_asignatura = A.id  WHERE P.nif = '26902806M' AND P.tipo='alumno';
SELECT DISTINCT D.nombre FROM profesor P INNER JOIN departamento D ON P.id_departamento = D.id INNER JOIN asignatura A ON A.id_profesor = P.id_profesor INNER JOIN grado G ON A.id_grado = G.id;
SELECT DISTINCT P.apellido1, P.Apellido2, P.nombre FROM persona P RIGHT JOIN alumno_se_matricula_asignatura ASA ON P.id = ASA.id_alumno RIGHT JOIN curso_escolar CE ON ASA.id_curso_escolar=CE.id WHERE CE.id = 5;
 