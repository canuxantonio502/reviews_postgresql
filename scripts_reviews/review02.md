# Review Sesión #02

## Creación de tablas e inserción de datos

```sql
CREATE TABLE autores (
    autor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);
```

```sql
CREATE TABLE libros (
    libro_id SERIAL PRIMARY KEY,
    autor_id INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    fecha_publicacion DATE,
    precio NUMERIC(10, 2)
);
```

```sql
INSERT INTO autores (nombre, apellido, fecha_nacimiento, nacionalidad) VALUES
('Gabriel', 'García Márquez', '1927-03-06', 'Colombiana'),
('Isabel', 'Allende', '1942-08-02', 'Chilena'),
('Jorge Luis', 'Borges', '1899-08-24', 'Argentina'),
('Mario', 'Vargas Llosa', '1936-03-28', 'Peruana'),
('Julio', 'Cortázar', '1914-08-26', 'Argentina'),
('Laura', 'Esquivel', '1950-09-30', 'Mexicana'),
('Carlos', 'Ruiz Zafón', '1964-09-25', 'Española'),
('Octavio', 'Paz', '1914-03-31', 'Mexicana'),
('Rosa', 'Montero', '1951-01-03', 'Española'),
('Arturo', 'Pérez-Reverte', '1951-11-25', 'Española');
```

```sql
INSERT INTO libros (autor_id, titulo, isbn, fecha_publicacion, precio) VALUES
(1, 'Cien años de soledad', '978-0307474728', '1967-05-30', 25.50),
(1, 'El amor en los tiempos del cólera', '978-0307387264', '1985-12-05', 22.00),
(1, 'Crónica de una muerte anunciada', '978-1400034710', '1981-04-01', 15.90),
(1, 'El coronel no tiene quien le escriba', '978-0307474698', '1961-06-01', 14.50),
(1, 'Del amor y otros demonios', '978-0307387783', '1994-04-15', 18.00),
(2, 'La casa de los espíritus', '978-0525433477', '1982-10-01', 21.00),
(2, 'Paula', '978-0060927219', '1994-05-01', 17.50),
(2, 'Eva Luna', '978-0060920043', '1987-01-01', 19.99),
(2, 'Largo pétalo de mar', '978-1984899156', '1989-05-21', 24.00),
(2, 'Inés del alma mía', '978-0061149023', '1998-08-29', 16.80),
(3, 'Ficciones', '978-0307950925', '1944-01-01', 16.00),
(3, 'El Aleph', '978-8420633114', '1949-06-30', 18.50),
(3, 'El hacedor', '978-8420655161', '1960-01-01', 14.00),
(3, 'El libro de arena', '978-8420633138', '1975-01-01', 15.00),
(3, 'Historia universal de la infamia', '978-8420633145', '1935-01-01', 13.50),
(4, 'La ciudad y los perros', '978-8420471839', '1963-10-01', 20.00),
(4, 'La fiesta del Chivo', '978-8420441672', '2000-03-01', 23.90),
(4, 'Conversación en La Catedral', '978-8420471846', '1969-12-01', 26.00),
(4, 'Pantaleón y las visitadoras', '978-8420471853', '1973-05-01', 17.90),
(4, 'La tía Julia y el escribidor', '978-8420471860', '1977-01-01', 19.50),
(5, 'Rayuela', '978-8437604572', '1963-06-28', 22.50),
(5, 'Bestiario', '978-8497592420', '1951-01-01', 14.90),
(5, 'Historias de cronopios y de famas', '978-8497592437', '1962-01-01', 15.99),
(5, 'Todos los fuegos el fuego', '978-8497592444', '1966-01-01', 16.50),
(5, 'Las armas secretas', '978-8497592451', '1959-01-01', 13.90),
(6, 'Como agua para chocolate', '978-0385721233', '1989-09-01', 18.00),
(6, 'La ley del amor', '978-0743202114', '1995-01-01', 16.00),
(6, 'Tan veloz como el deseo', '978-0385721240', '2001-08-07', 17.20),
(6, 'Malinche', '978-1400095810', '2006-05-02', 19.00),
(6, 'El diario de Tita', '978-0451493644', '2016-05-17', 21.50),
(7, 'El sombra del viento', '978-8408163381', '2001-04-12', 24.90),
(7, 'El juego del ángel', '978-8408081253', '2008-04-17', 23.50),
(7, 'El prisionero del cielo', '978-8408105824', '2011-11-17', 21.00),
(7, 'El laberinto de los espíritus', '978-8408163350', '2016-11-17', 27.90),
(7, 'Marina', '978-8408084261', '1999-01-01', 15.50),
(8, 'El laberinto de la soledad', '978-9681600105', '1950-01-01', 16.90),
(8, 'Piedra de sol', '978-9681603526', '1957-01-01', 12.00),
(8, 'El arco y la lira', '978-9681603533', '1956-01-01', 18.50),
(8, 'Libertad bajo palabra', '978-9681603540', '1949-01-01', 14.50),
(8, 'Árbol adentro', '978-9681603557', '1987-01-01', 13.00),
(9, 'La loca de la casa', '978-8420466040', '2003-09-01', 17.90),
(9, 'Historia del Rey Transparente', '978-8420469270', '2005-10-01', 20.00),
(9, 'La ridícula idea de no volver a verte', '978-8420413648', '2013-03-06', 18.50),
(9, 'Los tiempos del odio', '978-8420433301', '2018-10-18', 21.00),
(9, 'La buena suerte', '978-8420454740', '2020-08-27', 19.90),
(10, 'El capitán Alatriste', '978-8420483535', '1996-11-01', 16.50),
(10, 'La tabla de Flandes', '978-8420483542', '1990-01-01', 18.00),
(10, 'El club Dumas', '978-8420483559', '1993-01-01', 19.50),
(10, 'La reina del sur', '978-8420464350', '2002-06-01', 23.00),
(10, 'Falcó', '978-8420419688', '2016-10-19', 20.90);
```




## Ejercicio de consultas sesion #02

Elabore las consultas para los siguientes enunciados:

1. **Obtener el título, fecha de publicación y precio de todos los libros publicados después del año 2000, ordenados del más reciente al más antiguo.**
```sql
SELECT titulo, fecha_publicacion, precio 
    FROM libros
    WHERE DATE_PART('year', fecha_publicacion) > 2000
    ORDER BY fecha_publicacion DESC;
```

2. **Listar los nombres completos (nombre y apellido en una sola columna) y la nacionalidad de todos los autores cuya nacionalidad sea 'Española' o 'Argentina'.**
```sql
SELECT CONCAT(nombre, ' ', apellido) autor, nacionalidad
    FROM autores
    WHERE nacionalidad IN ('Española', 'Argentina');
```

3. **Consultar todos los libros cuyo precio esté entre $15.00 y $20.00 inclusive.**
```sql
SELECT * 
    FROM libros
    WHERE precio BETWEEN 15.00 AND 20.00;
```

4. **Buscar todos los libros cuyo título contenga la palabra "amor" (sin importar si está en mayúsculas o minúsculas).**
```sql
SELECT * 
    FROM libros
    WHERE titulo ILIKE '%amor%';
```

5. **Mostrar los 5 libros más costosos de la base de datos con su título y precio.**
```sql
SELECT titulo, precio
    FROM libros
    ORDER BY precio DESC
    LIMIT 5;
```

6. **Mostrar el título del libro, el precio y el nombre completo del autor al que pertenece cada libro.**
```sql
SELECT titulo, precio, CONCAT(A.nombre, ' ', A.apellido) autor
    FROM libros L INNER JOIN autores A ON L.autor_id = A.autor_id;
```

7. **Calcular la cantidad total de libros que ha escrito cada autor. Mostrar el nombre completo del autor y el total de libros, ordenados de mayor a menor.**
```sql
SELECT CONCAT(nombre, ' ', apellido) autor, COUNT(1) cantidad_libros
    FROM autores A INNER JOIN libros L ON A.autor_id = L.autor_id
    GROUP BY autor
    ORDER BY cantidad_libros DESC;
```

8. **Obtener el precio promedio, el precio mínimo y el precio máximo de los libros publicados por cada autor.**
```sql
SELECT CONCAT(nombre, ' ', apellido) autor, AVG(precio), MIN(precio), MAX(precio)
    FROM autores A INNER JOIN libros L ON A.autor_id = L.autor_id
    GROUP BY autor;
```

9. **Listar los autores que tienen un promedio de precio en sus libros superior a $20.00.**
```sql
SELECT CONCAT(nombre, ' ', apellido) autor, AVG(precio)
    FROM autores A INNER JOIN libros L ON A.autor_id = L.autor_id
    GROUP BY autor
    HAVING AVG(precio) > 20.00;
```

10. **Contar cuántos libros se han publicado por cada nacionalidad de los autores.**
```sql
SELECT A.nacionalidad, COUNT(L.libro_id) cantidad_libros
    FROM autores A INNER JOIN libros L ON A.autor_id = L.autor_id
    GROUP BY A.nacionalidad;
```