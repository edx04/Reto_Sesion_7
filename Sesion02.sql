USE tienda;
SHOW TABLES;

#Reto 1: Búsqueda de patrones mediante LIKE

#¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';
#¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%CANNELLONI%';
#¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE '%-%';
#¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto WHERE nombre LIKE '%DESIGNER%';
#¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto WHERE nombre LIKE '%DEVELOPER%';

#Reto 2: Funciones de agrupamiento

#¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) as salario_promedio FROM puesto;
#¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';
#¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario) as salario_minimo, MAX(salario) as salario_maximo FROM puesto;
#¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT SUM(salario) FROM puesto WHERE id_puesto >= 996;

#Reto 3: Agrupamientos

# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre,COUNT(*) FROM puesto GROUP BY nombre;
#¿Cuánto dinero se paga en total por puesto?
SELECT nombre,SUM(salario) FROM puesto GROUP BY nombre;
#¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado,COUNT(*) AS ventas FROM venta GROUP BY id_empleado;
#¿Cuál es el número total de ventas por artículo?
SELECT id_articulo,COUNT(*) AS ventas FROM venta GROUP BY id_articulo;


