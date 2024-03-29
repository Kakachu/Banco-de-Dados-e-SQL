/* FILTROS DE GRUPO */

/* FILTROS BASEADOS EM VALORES NUMERICOS */

SELECT NOME, DEPARTAMENTO, SALARIO
FROM FUNCIONARIOS
WHERE SALARIO > 100000;

/* FILTROS BASEADOS EM STRINGS */

--CASE SENSITIVE
SELECT NOME, DEPARTAMENTO, SALARIO
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'Ferramentas';


SELECT NOME, DEPARTAMENTO, SALARIO
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'FERRAMENTAS';

/* FILTROS BASEADOS EM MULTIPLOS TIPOS E COLUNAS - CONSIDERAR OR E AND */

SELECT NOME, DEPARTAMENTO, SALARIO
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'Ferramentas'
AND
SALARIO > 100000; 

/* FILTRO BASEADO EM UNICO TIPO E COLUNA - ATENCAO PARA A REGRA DO AND E OR 
EM RELACIONAMENTOS 1X1 O FILTRO AND TRATANDO DE UMA UNICA COLUNA SEMPRE TRARA FALSO*/

SELECT NOME, DEPARTAMENTO, SALARIO
FROM FUNCIONARIOS
WHERE DEPARTAMENTO = 'Ferramentas'
AND
DEPARTAMENTO = 'Books'; 

/* FILTROS BASSEADOS EM PADRAO DE CARACTERES */

SELECT DEPARTAMENTO, SUM(SALARIO) AS "TOTAL"
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'B%'
GROUP BY DEPARTAMENTO; 

/* FILTROS BASSEADOS EM PADRAO DE CARACTERES COM MAIS LETRAS */

SELECT DEPARTAMENTO, SUM(SALARIO) AS "TOTAL"
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'Be%'
GROUP BY DEPARTAMENTO; 

/* UTILIZANDO CARACTER CORINGA NO MEIO DA PALAVRA */

SELECT DEPARTAMENTO, SUM(SALARIO) AS "TOTAL"
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'B%s'
GROUP BY DEPARTAMENTO; 

/* COMO FILTRAR O AGRUPAMENTO PELO SALARIO 
COLUNAS NAO AGREGADAS - WHERE
COLUNAS AGREGADAS - HAVING */

/* ERRADO
SELECT DEPARTAMENTO, SUM(SALARIO) AS "TOTAL"
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'B%s'
AND SUM(SALARIO) > 40000000
GROUP BY DEPARTAMENTO;
*/

SELECT DEPARTAMENTO, SUM(SALARIO) AS "TOTAL"
FROM FUNCIONARIOS
WHERE DEPARTAMENTO LIKE 'B%'
GROUP BY DEPARTAMENTO
HAVING SUM(SALARIO) > 4000000;

/* MULTIPLOS CONTADORES */

SELECT COUNT(*) FROM FUNCIONARIOS;

SELECT COUNT(*) AS "QUANTIDADE TOTAL",
COUNT('Masculino') AS "MASCULINO"
FROM FUNCIONARIOS;

SELECT SEXO, COUNT(*)
FROM FUNCIONARIOS
WHERE SEXO = 'Masculino'
GROUP BY SEXO;

SELECT COUNT(*) AS "QUANTIDADE TOTAL",
(SELECT COUNT(*)
	 FROM FUNCIONARIOS
	 WHERE SEXO = 'Masculino'
	 GROUP BY SEXO) AS "MASCULINO"
FROM FUNCIONARIOS;

/* UTILIZANDO FILTER */

SELECT COUNT(*) AS "QUANTIDADE TOTAL",
COUNT(*) FILTER( WHERE SEXO = 'Masculino') AS "MASCULINO",
COUNT(*) FILTER( WHERE DEPARTAMENTO = 'Books') AS "Book",
COUNT(*) FILTER( WHERE SALARIO > 140000) AS "SALARIO > 140K"
FROM FUNCIONARIOS;

/*REFORMATANDO STRINGS*/

/* LISTANDO */

SELECT DEPARTAMENTO FROM FUNCIONARIOS;

/* DISTINCT */

SELECT DISTINCT DEPARTAMENTO FROM FUNCIONARIOS;

/* UPPER CASE */

SELECT DISTINCT UPPER(DEPARTAMENTO) FROM FUNCIONARIOS;

/* LOWER CASE */

SELECT DISTINCT LOWER(DEPARTAMENTO) FROM FUNCIONARIOS;

/* CONCATENANDO STRINGS */

SELECT CARGO || ' - ' || DEPARTAMENTO
FROM FUNCIONARIOS;

SELECT UPPER(CARGO || ' - ' || DEPARTAMENTO) AS "CARGO COMPLETO"
FROM FUNCIONARIOS;

/* REMOVER ESPACOS */

SELECT '   UNIDADOS    ';

/* CONTANDO CARACTERES */

SELECT LENGTH('   UNIDADOS    ');

/* APLICANDO O TRIM */

SELECT TRIM('    UNIDADOS      ');

SELECT LENGTH(TRIM('    UNIDADOS      '));

/* DESAFIO - CRIAR UMA COLUNA AO LADO DA COLUNA CARGO QUE DIGA SE A PESSOA É ASSISTENTE OU NÃO */

SELECT NOME || ' - ' || CARGO AS "FUNCIONARIO(A)", 
CASE
	WHEN (CARGO LIKE '%Assistant%') = TRUE THEN 'SIM'	
	ELSE 'NÃO'
	END AS "ASSITENTE?"
FROM FUNCIONARIOS;
