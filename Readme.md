<hr>
CREATE DATABASE emonsalves <br>
<hr>
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR); <br>
<hr>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 56, '01/01/2021','Página' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '01/02/2021', 'Blog' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '01/02/2021', 'Página' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/03/2021', 'Blog' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '01/03/2021', 'Página' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '01/04/2021', 'Blog' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '01/04/2021', 'Página' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '01/05/2021', 'Blog' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '01/05/2021', 'Página' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '01/06/2021', 'Blog' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/06/2021', 'Página' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '01/07/2021', 'Blog' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '01/07/2021', 'Página' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '01/08/2021', 'Blog' ); <br>
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '01/08/2021', 'Página' ); <br>
<hr>
1.- ¿Cuántos registros hay? <br>
SELECT COUNT(*) FROM inscritos; <br>
<hr>
2.- ¿Cuántos inscritos hay en total? <br>
SELECT SUM(cantidad) FROM inscritos; <br>
 <hr>
3.- ¿Cuál o cuáles son los registros de mayor antigüedad?  <br>
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos); <br>
 <hr>
4.- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)  <br>
SELECT fecha, SUM(cantidad) as 'Promedio Inscritos' FROM inscritos GROUP BY fecha;
 <hr>
5.- ¿Cuántos inscritos hay por fuente?  <br>
SELECT fuente, SUM(cantidad) as Inscritos FROM inscritos GROUP BY fuente; <br>
 <hr>
6.- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día? <br>
SELECT SUM(cantidad) as Inscritos , fecha FROM inscritos GROUP BY fecha ORDER BY Inscritos DESC LIMIT 1; <br>
 <hr>
7.- ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron? <br>
SELECT SUM(cantidad) as Inscritos , fecha FROM inscritos WHERE fuente = 'Blog' GROUP BY fecha ORDER BY Inscritos DESC LIMIT 1;  <br>
 <hr>
8.- ¿Cuántas personas en promedio se inscriben en un día?  <br>
SELECT AVG(cantidad) FROM (SELECT SUM(cantidad) AS cantidad FROM inscritos GROUP BY fecha) inscritos;  <br>
 <hr>
9.- ¿Qué días se inscribieron más de 50 personas?  <br>
SELECT SUM(cantidad) as Inscripciones, fecha FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50;  <br>
 <hr>
10.- ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?  <br>
SELECT AVG(cantidad) AS "Promedio de Inscritos", fecha FROM inscritos WHERE fecha > '2021/03/01' GROUP BY fecha ORDER BY fecha ASC; <br>
<hr>
