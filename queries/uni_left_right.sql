SELECT D.nombre AS 'Nombre Departamento', P.apellido1, P.apellido2, P.nombre FROM persona P RIGHT JOIN profesor PR ON P.id = PR.id_profesor LEFT JOIN departamento D ON PR.id_departamento = D.id ORDER BY P.apellido1, P.apellido2, P.nombre ASC ;  #No hi ha cap professor sense departament
SELECT P.apellido1, P.apellido2, P.nombre FROM persona P RIGHT JOIN profesor PR ON P.id = PR.id_profesor LEFT JOIN departamento D ON PR.id_departamento = D.id WHERE D.id is null; #No hi ha cap professor sense departament
SELECT D.nombre FROM departamento D LEFT JOIN profesor P ON P.id_departamento = D.id WHERE P.id_departamento is null;
SELECT P.apellido1, P.apellido2, P.nombre FROM profesor PR LEFT JOIN persona P ON PR.id_profesor = P.id LEFT JOIN asignatura A ON A.id_profesor = PR.id_profesor WHERE A.id_profesor IS NULL;
SELECT A.* FROM asignatura A LEFT JOIN profesor PR ON PR.id_profesor = A.id_profesor WHERE PR.id_profesor is null; 
