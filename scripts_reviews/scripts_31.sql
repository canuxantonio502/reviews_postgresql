-- GESTION DE VISTAS Y PROCEDIMIENTOS
/* Operadores

*/




--DATASET

CREATE TABLE clientes_2023 (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE clientes_2024 (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

INSERT INTO clientes_2023 (cliente_id, nombre) VALUES
(1, 'Carlos Mendoza'),
(2, 'Sofia Ramirez'),
(3, 'Mateo Torres'),
(4, 'Valentina Gomez'),
(5, 'Lucas Silva'),
(6, 'Camila Fernandez'),
(7, 'Santiago Morales'),
(8, 'Isabella Castillo'),
(9, 'Gabriel Ortiz'),
(10, 'Mariana Gutierrez'),
(11, 'David Smith'),
(12, 'Sarah Johnson'),
(13, 'James Brown'),
(14, 'Emily Davis'),
(15, 'Robert Wilson'),
(16, 'Jessica Taylor'),
(17, 'William Anderson'),
(18, 'Amanda Thomas'),
(19, 'Daniel Martinez'),
(20, 'Olivia White'),
(21, 'Alejandro Navarro'),
(22, 'Valeria Delgado'),
(23, 'Diego Rios'),
(24, 'Natalia Vega'),
(25, 'Joaquin Paredes'),
(26, 'Luciana Molina'),
(27, 'Andres Salazar'),
(28, 'Elena Suarez'),
(29, 'Adrian Benitez'),
(30, 'Paula Reyes');

INSERT INTO clientes_2024 (cliente_id, nombre) VALUES
(15, 'Robert Wilson'),
(16, 'Jessica Taylor'),
(17, 'William Anderson'),
(18, 'Amanda Thomas'),
(19, 'Daniel Martinez'),
(20, 'Olivia White'),
(21, 'Alejandro Navarro'),
(22, 'Valeria Delgado'),
(23, 'Diego Rios'),
(24, 'Natalia Vega'),
(25, 'Joaquin Paredes'),
(26, 'Luciana Molina'),
(27, 'Andres Salazar'),
(28, 'Elena Suarez'),
(29, 'Adrian Benitez'),
(30, 'Paula Reyes'),
(31, 'Thomas Miller'),
(32, 'Rachel Green'),
(33, 'Ross Geller'),
(34, 'Monica Geller'),
(35, 'Chandler Bing'),
(36, 'Joey Tribbiani'),
(37, 'Phoebe Buffay'),
(38, 'Christopher Lee'),
(39, 'Laura Palmer'),
(40, 'Arthur Dent'),
(41, 'Beatriz Santos'),
(42, 'Charles Xavier'),
(43, 'Diana Prince'),
(44, 'Fiona Gallagher');



-- UNION DE CONJUNTOS

SELECT  cliente_id, nombre, 2023 año
    FROM clientes_2023
UNION
SELECT cliente_id, nombre , 2024  año
    FROM clientes_2024;


-- INTERSECCION DE CONJUNTOS

SELECT  cliente_id, nombre
    FROM clientes_2023
INTERSECT
SELECT cliente_id, nombre
    FROM clientes_2024;


-- EXCEPCION  DE CONJUNTOS

SELECT  cliente_id, nombre
    FROM clientes_2023
EXCEPT
SELECT cliente_id, nombre
    FROM clientes_2024
    ORDER BY cliente_id;

SELECT  cliente_id, nombre
    FROM clientes_2024
EXCEPT
SELECT cliente_id, nombre
    FROM clientes_2023
    ORDER BY cliente_id;    





-- QUE ES UNA VISTA
/* Una vista en Postgres ees una tabla virtual basada en el resultado de una consulta SQL.
No almacena los datos físicamente, sino que los muestra de una consulta a una o más tablas.

VENTAJAS DE USAR VISTAS:
- Seguridad: permite mostrar solo datos específicos, restringiendo el a cceso a
información sensible.
- Simplicidad: facilita a los usuarios el manejo de datos complejos y visualizados de manera
más comprensible.
- Mantenimiento: al cambiar la definición de la vista, no es necesario modificar las
consultas que dependen de ella.
*/

CREATE VIEW v_vistas_mensuales AS
SELECT vendedor,
        EXTRACT(YEAR FROM fecha) anio,
        EXTRACT(MONTH FROM fecha) mes,
        SUM(monto)
    FROM ventas_vendedores
    GROUP BY vendedor, EXTRACT(YEAR FROM fecha), EXTRACT(MONTH FROM fecha);


SELECT * FROM v_vistas_mensuales ORDER BY anio, mes;




-- PROCEDIMIENTOS ALMACENADOS Y FUNCIONES
/*
Los procedimientos almacenados y funciones en Postgres son bloques de código SQL que
se almacena en la base de datos y pueden ser invocados para realizar operaciones
complejas. Permiten encapsular lógica de negocios, hacer cálculos, modificar datos y más,
directamente desde la base de datos
VENTAJAS
- Reutilización de código: Evitan la repeticion de código SQL, ya que pueden ser llamados
múltiples veces.
*/


-- DATASET 03

CREATE TABLE inventario (
  id SERIAL PRIMARY KEY,
  producto VARCHAR(150),
  cantidad INT,
  precio NUMERIC(6, 2)
);

INSERT INTO inventario (producto, cantidad, precio) VALUES
('Teclado Mecánico RGB', 45, 59.99),
('Mouse Inalámbrico Ergonómico', 120, 24.50),
('Monitor 24" Full HD', 30, 149.99),
('Monitor 27" 4K UHD', 15, 329.00),
('Laptop Core i7 16GB RAM', 8, 899.99),
('Laptop Ryzen 5 8GB RAM', 12, 649.50),
('Disco Duro Externo 1TB', 60, 54.00),
('SSD NVMe 500GB', 85, 42.99),
('SSD SATA 1TB', 40, 68.50),
('Memoria RAM 16GB DDR4', 110, 39.99),
('Tarjeta de Video RTX 3060', 6, 289.00),
('Procesador Ryzen 7 5700X', 14, 195.50),
('Fuente de Poder 650W 80 Plus', 25, 62.00),
('Gabinete ATX Cristal Templado', 18, 75.00),
('Silla Gamer Reclinable', 10, 185.00),
('Auriculares Bluetooth con Cancelación de Ruido', 50, 79.99),
('Micrófono Condensador USB', 22, 45.00),
('Cámara Web 1080p', 35, 34.90),
('Hub USB-C 7 en 1', 75, 29.99),
('Cable HDMI 2.1 2 metros', 200, 12.50),
('Teclado Membrana Español', 90, 15.00),
('Mousepad XXL Control', 130, 18.00),
('Soporte para Laptop Ajustable', 40, 22.50),
('Base Enfriadora para Laptop', 28, 27.00),
('Cargador Universal USB-C 65W', 55, 31.99),
('Impresora Multifuncional Tinta Continua', 9, 210.00),
('Router Wi-Fi 6 Dual Band', 32, 84.50),
('Switch Gigabit 8 Puertos', 19, 23.00),
('Pendrive 64GB USB 3.0', 150, 8.99),
('Adaptador Bluetooth 5.0 USB', 80, 7.50);


-- CREACION DE PROCEDIMIENTO ALMACENADO

CREATE PROCEDURE actualizar_inventario(v_producto_id INT, v_cantidad INT)
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE inventario SET cantidad = cantidad + v_cantidad
    WHERE id = v_producto_id;
END;
$$;

CALL actualizar_inventario(1, 5);



-- FUNCIONES ------------------------------------------------------------------------

CREATE FUNCTION valor_total_producto(producto_id INT)
RETURNS DECIMAL
LANGUAGE plpgsql AS $$
DECLARE valor_total DECIMAL;
BEGIN
  SELECT precio * cantidad INTO valor_total 
    FROM inventario 
    WHERE id = producto_id;

  RETURN valor_total;
END;
$$;

SELECT valor_total_producto(1);




-- IMPLEMENTACION DE TRIGGERS

/*
Un trigger o disparador en PostgreSQL es un procedimiento que se ejecuta automáticamente
en respuesta a ciertos eventos en una tabla o vista, como inserciones, actualizaciones o
eliminaciones. Son útiles para mantener la integridad de los datos, automatizar tareas
y aplicar reglas de negocio de manera transparente.
VENTAJAS
- Automatizacion de procesos
- Integridad de Datos
- Seguimiento de cambios
*/


-- TRIGGER

CREATE TABLE auditoria(
    id SERIAL PRIMARY KEY,
    tabla_modificada VARCHAR(150),
    fecha_cambio TIMESTAMP,
    cambio TEXT
);


CREATE FUNCTION registrar_cambio()
RETURNS TRIGGER
LANGUAGE plpgsql AS $$
DECLARE resumen_cambio TEXT := '';
BEGIN
  IF OLD.precio != NEW.precio THEN
    resumen_cambio := resumen_cambio || FORMAT('Precio: %s -> %s;', OLD.precio, NEW.precio);
  END IF;
  IF OLD.cantidad != NEW.cantidad THEN
    resumen_cambio := resumen_cambio || FORMAT('Cantidad: %s -> %s;', OLD.cantidad, NEW.cantidad);
  END IF;
  IF resumen_cambio <> '' THEN
    INSERT INTO auditoria(tabla_modificada, fecha_cambio, cambio)
    VALUES ('Inventario', CURRENT_TIMESTAMP, resumen_cambio);
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER cambiar_inventario
AFTER UPDATE ON inventario
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio();