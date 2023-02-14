/* VARIAVEIS DUMMY PARA MACHINE LEARNING */

/* UTILIZANDO O CASE */

SELECT NOME, SEXO FROM FUNCIONARIOS;
SELECT NOME, CARGO FROM FUNCIONARIOS;

SELECT NOME, CARGO,
CASE

	WHEN CARGO = 'Structural Engineer' THEN 'CONDICAO 01'
	WHEN CARGO = 'Financial Advisor' THEN 'CONDICAO 02'	
	WHEN CARGO = 'Recruiting Manager' THEN 'CONDICAO 03'	
	WHEN CARGO = 'Desktop Support Technician' THEN 'CONDICAO 04'	
	ELSE 'OUTRAS CONDICOES'
END AS "CONDICOES"
FROM FUNCIONARIOS;

SELECT NOME,
CASE 

	WHEN SEXO = 'Masculino' THEN 'M'
	ELSE 'F'

END AS "SEXO"
FROM FUNCIONARIOS

/* UTILIZANDO VALORES BOOLEANOS */

SELECT NOME, CARGO, (SEXO = 'Masculino') AS Masculino, (SEXO = 'Feminino') AS Feminino
FROM FUNCIONARIOS;

SELECT NOME, CARGO, (SEXO = 'Masculino') AS Masculino, (SEXO = 'Feminino') AS Feminino,
CASE
	WHEN (SEXO = 'Masculino') = TRUE THEN 1
	ELSE 0
END AS "MACULINO",
CASE
	WHEN (SEXO = 'Feminino') = TRUE THEN 1
	ELSE 0
END AS "FEMININO"
FROM FUNCIONARIOS;