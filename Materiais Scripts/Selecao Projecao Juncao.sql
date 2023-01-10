USE COMERCIO;

/*SELECAO, PROJECAO E JUNCAO*/

/*PROJECAO -> É TUDO QUE VOCE QUER VER NA TABELA*/

SELECT NOW() AS DATA_ATUAL;

SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW() 
FROM CLIENTE;

/* SELECAO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELECAO É O WHERE */

SELECT NOME, SEXO, EMAIL /*PROJECAO*/
FROM CLIENTE /*ORIGEM*/
WHERE SEXO = 'F'; /*SELECAO*/

SELECT NUMERO /*PROJECAO*/
FROM CLIENTE /*ORIGEM*/
WHERE TIPO = 'CEL'; /*SELECAO*/

/* JUNCAO -> JOIN*/

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+--------+------------------+-----------+
| NOME   | EMAIL            | IDCLIENTE |
+--------+------------------+-----------+
| JOAO   | JOAO@GMAIL.COM   |         1 |
| PELE   | PELE@GMAIL.COM   |         2 |
| ANA    | ANA@GMAIL.COM    |         3 |
| NAMI   | NAMI@GMAIL.COM   |         4 |
| IRINEU | IRINEU@GMAIL.COM |         5 |
| GABY   | GABY@GMAIL.COM   |         6 |
| ZORO   | NULL             |         8 |
+--------+------------------+-----------+

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          5 | CENTRO   | B. HERIZONTE   |
|          2 | CENTRO   | RIO DE JANEIRO |
|          1 | JARDINS  | SAO PAULO      |
|          4 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          3 | CENTRO   | VITORIA        |
|          8 | CENTRO   | SAO PAULO      |
+------------+----------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */
SELECT NOME, SEXO, BAIRRO, CIDADE /*PROJECAO*/
FROM CLIENTE, ENDERECO /*ORIGEM*/
WHERE IDCLIENTE = ID_CLIENTE /*JUNCAO INCORRETA*/;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | JARDINS  | SAO PAULO      |
| PELE   | M    | CENTRO   | RIO DE JANEIRO |
| ANA    | F    | CENTRO   | VITORIA        |
| NAMI   | F    | ESTACIO  | RIO DE JANEIRO |
| IRINEU | M    | CENTRO   | B. HERIZONTE   |
| GABY   | F    | FLAMENGO | RIO DE JANEIRO |
| ZORO   | M    | CENTRO   | SAO PAULO      |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
    INNER JOIN ENDERECO
    ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';

/* NOME, SEXO, EMAIL, TIPO, NUMERO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
    INNER JOIN TELEFONE
    ON IDCLIENTE = ID_CLIENTE;

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
    INNER JOIN ENDERECO
    ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
        INNER JOIN TELEFONE
        ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;