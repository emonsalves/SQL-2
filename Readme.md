1.- ¿Cuántos registros hay? <br>
SELECT COUNT(*) FROM inscritos  <br>
 <hr>
2.- ¿Cuántos inscritos hay en total? <br>
SELECT SUM(cantidad) FROM inscritos <br>
 <hr>
3.- ¿Cuál o cuáles son los registros de mayor antigüedad?  <br>
SELECT MIN(fecha), fuente FROM inscritos GROUP BY fuente  <br>
 <hr>
4.- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)  <br>
SELECT sum(cantidad) as Inscritos , fecha FROM inscritos GROUP BY fecha  <br>
 <hr>
5.- ¿Cuántos inscritos hay por fuente?  <br>
SELECT SUM(cantidad) as Inscritos FROM inscritos GROUP BY fuente  <br>
 <hr>
6.- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día? <br>
SELECT sum(cantidad) as Inscritos , fecha FROM inscritos GROUP BY fecha ORDER BY Inscritos DESC LIMIT 1 <br>
 <hr>
7.- ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron? <br>
SELECT sum(cantidad) as Inscritos , fecha FROM inscritos WHERE fuente = 'Blog' GROUP BY fecha ORDER BY Inscritos DESC LIMIT 1  <br>
 <hr>
8.- ¿Cuántas personas en promedio se inscriben en un día?  <br>
*** <br>
 <hr>
9.- ¿Qué días se inscribieron más de 50 personas?  <br>
SELECT  cantidad , fecha FROM inscritos where cantidad > 50  <br>
 <hr>
10.- ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?  <br>
*** <br>
<hr>
