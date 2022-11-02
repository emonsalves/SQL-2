¿Cuántos registros hay?
SELECT COUNT(*) FROM inscritos

¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) FROM inscritos

¿Cuál o cuáles son los registros de mayor antigüedad? 
SELECT MIN(fecha), fuente FROM inscritos GROUP BY fuente 

¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT sum(cantidad) as Inscritos , fecha FROM inscritos GROUP BY fecha 

¿Cuántos inscritos hay por fuente?
SELECT SUM(cantidad) as Inscritos FROM inscritos GROUP BY fuente

¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT sum(cantidad) as Inscritos , fecha FROM inscritos GROUP BY fecha ORDER BY Inscritos DESC LIMIT 1

¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
SELECT sum(cantidad) as Inscritos , fecha FROM inscritos WHERE fuente = 'Blog' GROUP BY fecha ORDER BY Inscritos DESC LIMIT 1

*** ¿Cuántas personas en promedio se inscriben en un día?

¿Qué días se inscribieron más de 50 personas?
SELECT  cantidad , fecha FROM inscritos where cantidad > 50

*** ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
