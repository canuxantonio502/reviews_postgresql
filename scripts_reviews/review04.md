# Review:
1. Crear una vista llamada **vw_ventas_destacadas** que contenga únicamente los registros de ventas cuyo monto sea igual o superior a $300.00, incluyendo la fecha, el vendedor y el monto.
```sql
CREATE VIEW vw_ventas_destacadas AS
SELECT fecha, vendedor, monto
    FROM ventas_vendedores
    WHERE monto >= 300;
 ```

2. Crear una vista llamada **vw_resumen_vendedores** que muestre el nombre de cada vendedor, el número total de transacciones realizadas y el precio promedio de sus ventas redondeado a dos decimales.
```sql
CREATE VIEW vw_resumen_vendedores AS
SELECT vendedor, COUNT(1), ROUND(AVG(monto)::NUMERIC, 2) promedio_precio
    FROM ventas_vendedores
    GROUP BY vendedor;
 ```

3. Crear un procedimiento llamado **sp_ajustar_precios_bajo_stock** que aplique un incremento porcentual al precio de todos los productos cuyo stock sea menor a cierto límite recibido por parámetro (por ejemplo, aumentar un 10% el precio a productos con menos de 15 unidades en existencia).
```sql
CREATE PROCEDURE sp_ajustar_precios_bajo_stock(v_porcentaje INT, v_cantidad_limite INT)
LANGUAGE plpgsql
AS $$
DECLARE porcentaje DECIMAL := v_porcentaje / 100.0;
BEGIN
    UPDATE inventario 
        SET precio = precio + (precio * porcentaje) 
        WHERE cantidad < v_cantidad_limite;
END;
$$;

CALL sp_ajustar_precios_bajo_stock(10, 6);
 ```

4. Crear una función llamada **fn_aplicar_descuento_producto** que reciba el id del producto y un porcentaje de descuento (por ejemplo, 15.00 para 15%). La función debe calcular el precio final restando el descuento al precio original.