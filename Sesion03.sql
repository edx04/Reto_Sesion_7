USE tienda;


DESCRIBE puesto;

#RETO 1 SUbconsultas

# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT nombre
FROM empleado
WHERE id_puesto in ( SELECT id_puesto FROM puesto WHERE salario < 10000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?

describe empleado;
describe venta;

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?

SELECT id_empleado,min(ventas),max(ventas)
FROM(
SELECT clave,id_empleado, COUNT(*) AS ventas
FROM venta
GROUP BY clave,id_empleado)as sq
GROUP BY id_empleado;

#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?

SELECT clave, id_articulo
FROM venta
WHERE id_articulo in (
SELECT id_articulo
FROM articulo
WHERE precio > 5000);

#Reto 2 Joins
#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT id_venta,CONCAT(nombre,' ',apellido_paterno,' ',apellido_materno) AS nombre 
FROM empleado as e
JOIN venta as v
ON e.id_empleado = v.id_empleado;

#¿Cuál es el nombre de los artículos que se han vendido?
SELECT id_venta,nombre
FROM venta
JOIN articulo
USING (id_articulo);

#¿Cuál es el total de cada venta?
SELECT id_venta,TRUNCATE(precio+iva,2) as total 
FROM venta
JOIN articulo
USING (id_articulo);


#Reto 3 Definición de vistas

#Obtener el puesto de un empleado.

CREATE VIEW emplado_puesto117 AS 
(SELECT CONCAT(empleado.nombre,' ',apellido_paterno,' ',apellido_materno) AS nombre ,puesto.nombre AS puesto
FROM empleado
JOIN puesto
USING (id_puesto)); 

#Saber qué artículos ha vendido cada empleado.

CREATE VIEW empleado_articulo117 AS
(SELECT v.clave,CONCAT(e.nombre,' ',e.apellido_paterno,' ',e.apellido_materno) nombre,a.nombre AS articulo
FROM venta as v
JOIN articulo as a
USING (id_articulo)
JOIN empleado as e
USING(id_empleado)
ORDER BY clave);

SELECT *
FROM  empleado_articulo117;
       
        
#Saber qué puesto ha tenido más ventas.

CREATE VIEW puesto_ventas117 AS
(SELECT p.nombre puesto,COUNT(*) ventas 
FROM venta as v
JOIN empleado as e
USING (id_empleado)
JOIN puesto as p
USING (id_puesto)
GROUP BY  id_puesto
ORDER BY ventas DESC);

SELECT *
FROM puesto_ventas117
ORDER BY total DESC
LIMIT 1;








