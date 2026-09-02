# Ejercicios de Consultas SQL - Tabla Estudiantes

## SELECT

1. Obtener el nombre, edad y promedio de todos los estudiantes que se encuentren activos.
SELECT nombre, edad, promedio
	FROM estudiantes 
	WHERE activo = true;

2. Listar todos los estudiantes del género femenino que tengan un promedio mayor o igual a 4.5.
SELECT * 
	FROM estudiantes 
	WHERE genero = 'F' AND promedio >= 4.5;

3. Consultar los estudiantes ingresados en el año 2024, ordenados de forma descendente por su fecha de ingreso.
SELECT * 
	FROM estudiantes 
	WHERE DATE_PART('year', fecha_hora_registro) = 2024 
	ORDER BY fecha_hora_registro DESC;

4. Obtener el promedio de edad y el promedio general de calificaciones de todos los estudiantes registrados.
SELECT AVG(edad) promedio_edad, AVG(promedio) promedio_general 
	FROM estudiantes;

5. Contar cuántos estudiantes hay registrados por cada género.
SELECT genero, COUNT(1) cantidad 
	FROM estudiantes 
	GROUP BY genero;

6. Listar los 5 estudiantes con los promedios más altos de toda la tabla.
SELECT * 
	FROM estudiantes 
	ORDER BY promedio DESC 
	LIMIT 5;

7. Seleccionar los estudiantes cuya duración de tests haya sido mayor a 2 horas y media.
SELECT * 
	FROM estudiantes 
	WHERE duracion_tests > '02:30:00';

8. Buscar a los estudiantes cuyo análisis de perfil contenga la palabra "bases de datos" o "algoritmos".
SELECT * 
	FROM estudiantes 
	WHERE analisis_perfil ILIKE '%bases de datos%' OR analisis_perfil ILIKE '%algoritmos%';

9. Calcular la altura máxima y mínima registrada entre los estudiantes hombres.
SELECT MAX(altura) altura_maxima, MIN(altura) altura_minima 
    FROM estudiantes 
    WHERE genero = 'M';

10. Mostrar el nombre, fecha e hora exacta de registro de los estudiantes que ingresaron antes de las 09:00:00 AM.
SELECT nombre, fecha_hora_registro 
    FROM estudiantes 
    WHERE hora_ingreso < '09:00:00';

---

## UPDATE

1. Cambiar el estado a inactivo para el estudiante con id 6.
UPDATE estudiantes
    SET activo = false
    WHERE id = 6;

2. Incrementar en 0.2 el promedio de todos los estudiantes que tengan un promedio menor a 3.0.
UPDATE estudiantes
    SET promedio = promedio * 1.2
    WHERE promedio < 3.0;

3. Actualizar la hora de ingreso a 08:00:00 para todos los estudiantes que ingresaron el día 2024-02-01.
UPDATE estudiantes
    SET hora_ingreso = '08:00:00'
    WHERE fecha_ingreso = '2024-02-01';
    
4. Modificar el análisis de perfil del estudiante con id 15 para agregar la anotación: "Graduado con honores académicos.".
UPDATE estudiantes
	SET analisis_perfil = CONCAT(analisis_perfil, ' Graduado con honores académicos.')
	WHERE id = 15;

5. Cambiar el género a F y actualizar la altura a 1.65 para un estudiante específico cuyo ID sea 20.
UPDATE estudiantes
	SET genero = 'F',
	altura = 1.65
	WHERE id = 20;

6. Desactivar a todos los estudiantes registrados antes del año 2022 que tengan un promedio inferior a 3.5.
UPDATE estudiantes
	SET activo = FALSE
	WHERE DATE_PART('year', fecha_hora_registro) < 2022
	AND promedio < 3.5;

7. Ajustar la duración de los tests a 2 horas para todos los estudiantes que actualmente tengan registrada una duración inferior a 1 hora.
UPDATE estudiantes
	SET duracion_tests = '02:00:00'
	WHERE duracion_tests < '01:00:00';

8. Aumentar la edad en 1 año a todos los estudiantes que ingresaron en el año 2021.
UPDATE estudiantes
	SET edad = edad + 1
	WHERE DATE_PART('year', fecha_hora_registro) = 2021;

9. Limpiar o establecer como NULL el campo analisis_perfil para los estudiantes inactivos.
UPDATE estudiantes
	SET analisis_perfil = ''
	WHERE activo = false;

10. Actualizar el promedio a 5.0 para el estudiante que tenga la fecha de registro más antigua de la base de datos.
UPDATE estudiantes
	SET promedio = 5.0
	WHERE id = (
		SELECT id
			FROM estudiantes
			ORDER BY fecha_hora_registro ASC, id ASC
			LIMIT 1
	);

---

## DELETE

1. Eliminar el registro del estudiante con id 34.
DELETE FROM estudiantes 
	WHERE id = 34;

2. Borrar todos los estudiantes que estén inactivos.
DELETE FROM estudiantes 
	WHERE activo = false;

3. Eliminar a los estudiantes cuyo promedio sea estrictamente menor a 2.5.
DELETE FROM estudiantes 
	WHERE promedio < 2.5;

4. Borrar las filas de estudiantes cuya fecha de ingreso sea anterior al '2021-01-01'.
DELETE FROM estudiantes 
	WHERE fecha_ingreso < '2021-01-01';

5. Eliminar a los estudiantes del género masculino que tengan una altura inferior a 1.60 m.
DELETE FROM estudiantes 
	WHERE genero = 'M' AND altura < 1.60;

6. Borrar los registros de estudiantes ingresados en el año 2024 que se encuentren inactivos.
DELETE FROM estudiantes 
	WHERE DATE_PART('year', fecha_ingreso) = 2024
	AND activo = FALSE;

7. Eliminar a los estudiantes cuya duración de tests sea menor a 45 minutos.
DELETE FROM estudiantes 
	WHERE duracion_tests < '00:45:00';

8. Borrar a todos los estudiantes cuyo nombre comience con la letra 'E'.
DELETE FROM estudiantes 
	WHERE nombre ILIKE 'E%';

9. Eliminar a los estudiantes activos que ingresaron antes del año 2023 y cuyo promedio sea menor a 3.5.
DELETE FROM estudiantes 
	WHERE DATE_PART('year', fecha_ingreso) < 2023
	AND promedio < 3.5;

10. Vaciar completamente la tabla estudiantes eliminando todos sus registros.
DELETE FROM estudiantes;