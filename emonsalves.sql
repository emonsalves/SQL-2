CREATE DATABASE emonsalves;

---------------------------------------------------------------------------------------------------------------------
INSERT INTO
    INSCRITOS(cantidad, fecha, fuente)
VALUES
    (44, '01/01/2021', 'Blog'),
    (56, '01/01/2021', 'Página'),
    (39, '01/02/2021', 'Blog'),
    (81, '01/02/2021', 'Página'),
    (12, '01/03/2021', 'Blog'),
    (91, '01/03/2021', 'Página'),
    (48, '01/04/2021', 'Blog'),
    (45, '01/04/2021', 'Página'),
    (55, '01/05/2021', 'Blog'),
    (33, '01/05/2021', 'Página'),
    (18, '01/06/2021', 'Blog'),
    (12, '01/06/2021', 'Página'),
    (34, '01/07/2021', 'Blog'),
    (24, '01/07/2021', 'Página'),
    (83, '01/08/2021', 'Blog'),
    (99, '01/08/2021', 'Página');

---------------------------------------------------------------------------------------------------------------------
-- 1.- ¿ Cuántos registros hay ?
SELECT
    COUNT(*)
FROM
    inscritos;

---------------------------------------------------------------------------------------------------------------------
-- 2.- ¿ Cuántos inscritos hay en total ?
SELECT
    SUM(cantidad)
FROM
    inscritos;

---------------------------------------------------------------------------------------------------------------------
-- 3.- ¿ Cuál o cuáles son los registros de mayor antigüedad ?
SELECT
    *
FROM
    inscritos
WHERE
    fecha = (
        SELECT
            MIN(fecha)
        FROM
            inscritos
    );

---------------------------------------------------------------------------------------------------------------------
-- 4.- ¿ Cuántos inscritos hay por día ? ( entendiendo un día como una fecha distinta de ahora en adelante)
SELECT
    fecha,
    SUM(cantidad) as 'Promedio Inscritos'
FROM
    inscritos
GROUP BY
    fecha;

---------------------------------------------------------------------------------------------------------------------
-- 5.- ¿ Cuántos inscritos hay por fuente ?
SELECT
    fuente,
    SUM(cantidad) as Inscritos
FROM
    inscritos
GROUP BY
    fuente;

---------------------------------------------------------------------------------------------------------------------
-- 6.- ¿ Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día ?
SELECT
    SUM(cantidad) as Inscritos,
    fecha
FROM
    inscritos
GROUP BY
    fecha
ORDER BY
    Inscritos DESC
LIMIT
    1;

---------------------------------------------------------------------------------------------------------------------
-- 7.- ¿ Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron ?
SELECT
    SUM(cantidad) as Inscritos,
    fecha
FROM
    inscritos
WHERE
    fuente = 'Blog'
GROUP BY
    fecha
ORDER BY
    Inscritos DESC
LIMIT
    1;

---------------------------------------------------------------------------------------------------------------------
--8.- ¿ Cuántas personas en promedio se inscriben en un día ?
SELECT
    AVG(cantidad)
FROM
    (
        SELECT
            SUM(cantidad) AS cantidad
        FROM
            inscritos
        GROUP BY
            fecha
    ) inscritos;

---------------------------------------------------------------------------------------------------------------------
-- 9. ¿ Qué días se inscribieron más de 50 personas ?
SELECT
    SUM(cantidad) as Inscripciones,
    fecha
FROM
    inscritos
GROUP BY
    fecha
HAVING
    SUM(cantidad) > 50;

---------------------------------------------------------------------------------------------------------------------
-- 10.- ¿ Cuántas personas se registraron en promedio cada día a partir del tercer día ?
SELECT
    AVG(cantidad) AS "Promedio de Inscritos",
    fecha
FROM
    inscritos
WHERE
    fecha > '2021/03/01'
GROUP BY
    fecha
ORDER BY
    fecha ASC;
