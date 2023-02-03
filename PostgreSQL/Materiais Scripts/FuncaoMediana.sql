/* MEDIANA */
CREATE OR REPLACE FUNCTION _final_median(numeric[])
   RETURNS numeric AS
$$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$$
LANGUAGE 'sql' IMMUTABLE;

CREATE AGGREGATE median(numeric) (
  SFUNC=array_append,
  STYPE=numeric[],
  FINALFUNC=_final_median,
  INITCOND='{}'
);

SELECT NOME, ROUND(median(QTD), 2) AS MEDIANA 
FROM MAQUINAS
GROUP BY NOME
ORDER BY 1;

INSERT INTO MAQUINAS VALUES('Maquina 01',11,15.9);
INSERT INTO MAQUINAS VALUES('Maquina 02',11,15.4);
INSERT INTO MAQUINAS VALUES('Maquina 03',11,15.7);
INSERT INTO MAQUINAS VALUES('Maquina 01',12,30);
INSERT INTO MAQUINAS VALUES('Maquina 02',12,24);
INSERT INTO MAQUINAS VALUES('Maquina 03',12,45);