/* ESTATISTICAS */

/* MOSTRANDO UMA QUANTIDADE LIMITADA DE LINHAS */

SELECT * FROM FUNCIONARIOS
LIMIT 10;

/* QUAL O GASTO TOTAL DE SALARIO PAGO PELA EMPRESA? */

SELECT SUM(SALARIO) AS "SALARIO TOTAL PAGO"
FROM FUNCIONARIOS;

/* QUAL O MONTANTE QUE CADA DEPARTAMENTO RECEBE DE SALARIO */

SELECT DEPARTAMENTO, SUM(SALARIO) AS "SALARIO TOTAL PAGO"
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO;

/* POR DEPARTAMENTO, QUAL O TOTAL E A MEDIA PAGA PARA
OS FUNCIONARIOS */

SELECT DEPARTAMENTO,
	   SUM(SALARIO) AS "SALARIO TOTAL PAGO",
	   AVG(SALARIO) AS "MEDIA"
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO;

/* ORDENANDO */

SELECT DEPARTAMENTO,
	   SUM(SALARIO) AS "SALARIO TOTAL PAGO",
	   AVG(SALARIO) AS "MEDIA"
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 3;

SELECT DEPARTAMENTO,
	   SUM(SALARIO) AS "SALARIO TOTAL PAGO",
	   AVG(SALARIO) AS "MEDIA"
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 3 ASC;

SELECT DEPARTAMENTO,
	   SUM(SALARIO) AS "SALARIO TOTAL PAGO",
	   AVG(SALARIO) AS "MEDIA"
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY DESC;
/* Modelagem Banco de Dados x Data Science */

/* Banco de Dados -> 1, 2 e 3 Formas Normais
Evitam redundancia, consequentemente poupam espaço em disco.
Consomem muito precessamento em função de JOINS. Queries lentas

Data Science e B.I -> focam em agregacoes e performance. Nao se
preocupam com espaco em disco. Em B.I, modelagem mínima (DW)
em Data Science, preferencialmente modelagem Colunar */

/* O servidor e máquinas gerou um arquivo de log CSV.
Vamos importa-lo e analisa-lo dentro do nosso banco */

/* Importando CSV */

CREATE TABLE MAQUINAS(
	NOME VARCHAR(20),
	DIA INT,
	QTD NUMERIC(10,2)
);


COPY MAQUINAS
FROM 'Z:\SCRIPTS\PostgreSQL\Exercicios Scripts\LogMaquinas.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM MAQUINAS;
/* QUAL A MEDIDA DE CADA MAQUINA */

SELECT NOME, AVG(QTD) AS "MEDIA QTD"
FROM MAQUINAS
GROUP BY NOME;

/* ARREDONDADO */
 
SELECT NOME, ROUND(AVG(QTD), 2) AS "MEDIA QTD"
FROM MAQUINAS
GROUP BY NOME;

/* OU TRUNC*/

SELECT NOME, TRUNC(AVG(QTD), 2) AS "MEDIA QTD"
FROM MAQUINAS
GROUP BY NOME;

/* QUAL A MODA DAS QUANTIDADES */
SELECT NOME, QTD, COUNT(*) AS "MODA"
FROM MAQUINAS
GROUP BY NOME, QTD
ORDER BY 3 DESC;

/* QUAL A MODA DAS QUANTIDADES DE CADA MAQUINA */

SELECT NOME, QTD, COUNT(*) AS "MODA"
FROM MAQUINAS
WHERE NOME = 'Maquina 01'
GROUP BY NOME, QTD
ORDER BY 3 DESC
LIMIT 1;

SELECT NOME, QTD, COUNT(*) AS "MODA"
FROM MAQUINAS
WHERE NOME = 'Maquina 02'
GROUP BY NOME, QTD
ORDER BY 3 DESC
LIMIT 1;

SELECT NOME, QTD, COUNT(*) AS "MODA"
FROM MAQUINAS
WHERE NOME = 'Maquina 03'
GROUP BY NOME, QTD
ORDER BY 3 DESC
LIMIT 1;

/* MODA DO DATASET INTEIRO */

SELECT QTD, COUNT(*) AS MODA
FROM MAQUINAS
GROUP BY QTD
ORDER BY 2 DESC;

/* QUAL O MAXIMO E O MINIMO E AMPLITUDE DE CADA MAQUINA */

SELECT NOME, 
MAX(QTD), 
MIN(QTD),
MAX(QTD) - MIN(QTD) AS AMPLITUDE
FROM MAQUINAS
GROUP BY NOME
ORDER BY 4 DESC;

/* ACRESCENTE A MEDIA AO RELATORIO */

SELECT NOME, 
ROUND(AVG(QTD), 2),
MAX(QTD), 
MIN(QTD),
MAX(QTD) - MIN(QTD) AS AMPLITUDE
FROM MAQUINAS
GROUP BY NOME
ORDER BY 4 DESC;

/* DESVIO PADRAO E VARIANCIA */

--STDDEV_POP(COLUNA)
--VAR_POP(COLUNA)

SELECT NOME, 
ROUND(AVG(QTD), 2),
MAX(QTD), 
MIN(QTD),
MAX(QTD) - MIN(QTD) AS AMPLITUDE,
ROUND(STDDEV_POP(QTD),2) AS DESV_PADRAO,
ROUND(VAR_POP(QTD), 2) AS VARIANCIA
FROM MAQUINAS
GROUP BY NOME
ORDER BY 6 DESC

/* FUNCAO E ANALISE DA MEDIANA NO ARQUIVO FuncaoMediana.sql */

SELECT NOME,
	   COUNT(QTD) AS "QUANTIDADE",
	   SUM(QTD) AS "TOTAL",
	   ROUND(AVG(QTD), 2) AS "MEDIA",
	   MAX(QTD) AS "MAXIMO",
	   MIN(QTD) AS "MINIMO",
	   MAX(QTD) - MIN(QTD) AS "AMPLITUDE",
	   ROUND(STDDEV_POP(QTD), 2) AS  "DESVIO_PADRAO",
	   ROUND(VAR_POP(QTD), 2) AS  "VARIANCIA",  
	   ROUND(MEDIAN(QTD), 2) AS "MEDIANA",
	   ROUND((STDDEV_POP(QTD) / AVG(QTD)) * 100, 2) AS "COEF_VAR",
	   MODE() WITHIN GROUP(ORDER BY QTD) AS "MODA"
FROM MAQUINAS
GROUP BY NOME
ORDER BY 1;

DELETE FROM MAQUINAS WHERE DIA = 11 OR DIA = 12;

/* MODA - MODE()  WITHIN GROUP(ORDER BY COLUNA)*/

SELECT MODE() WITHIN GROUP(ORDER BY QTD) AS "MODA" FROM MAQUINAS;

SELECT NOME, 
	   MODE() WITHIN GROUP(ORDER BY QTD) AS "MODA"
FROM MAQUINAS
GROUP BY NOME;












