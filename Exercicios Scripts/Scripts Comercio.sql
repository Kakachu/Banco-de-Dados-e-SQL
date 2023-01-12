/*CARDINALIDADE*/

/*QUEM DECIDE A CARDINALIDADE E A REGRA DE NEGOCIOS*/

/*PRIMEIRO ALGARISMO - OBRIGATORIEDADE
0 - NÃO OBRIGATORIO
1 - OBRIGATORIO 

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MÁXIMO DE UM
N - MAIS QUE UM
*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE (
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO (
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR (30) NOT NULL,
	UF CHAR (2),
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE (
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT, 
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/*ENDERECO - OBRIGATORIO
CADASTRO DE SOMENTE UM

TELEFONE - NAO OBRIGATORIO 
CADASTRO DE MAIS DE UM (OPCIONAL)
*/

/* EM RELACIONAMENTOS 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */ 

/* EM RELACIONAMENTOS 1 X N A CHAVE ESTRANGEIRA FICA NA CARDINALIDADE N */ 

INSERT INTO CLIENTE VALUES (NULL, 'JOAO', 'M', 'JOAO@GMAIL.COM', '867455456');
INSERT INTO CLIENTE VALUES (NULL, 'PELE', 'M', 'PELE@GMAIL.COM', '9645852');
INSERT INTO CLIENTE VALUES (NULL, 'ANA', 'F', 'ANA@GMAIL.COM', '58723549826');
INSERT INTO CLIENTE VALUES (NULL, 'NAMI', 'F', 'NAMI@GMAIL.COM', '44758648896');
INSERT INTO CLIENTE VALUES (NULL, 'IRINEU', 'M', 'IRINEU@GMAIL.COM', '1991849568');
INSERT INTO CLIENTE VALUES (NULL, 'GABY', 'F', 'GABY@GMAIL.COM', '6546541654');
INSERT INTO CLIENTE VALUES (NULL, 'ZORO', 'M', NULL, '353445356');

SELECT * FROM CLIENTE;

+-----------+--------+------+------------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL            | CPF         |
+-----------+--------+------+------------------+-------------+
|         1 | JOAO   | M    | JOAO@GMAIL.COM   | 867455456   |
|         2 | PELE   | M    | PELE@GMAIL.COM   | 9645852     |
|         3 | ANA    | F    | ANA@GMAIL.COM    | 58723549826 |
|         4 | NAMI   | F    | NAMI@GMAIL.COM   | 44758648896 |
|         5 | IRINEU | M    | IRINEU@GMAIL.COM | 1991849568  |
|         6 | GABY   | F    | GABY@GMAIL.COM   | 6546541654  |
|         7 | ZORO   | M    | NULL             | 353445356   |
+-----------+--------+------+------------------+-------------+

INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'B. HERIZONTE', 'MG', 5);
INSERT INTO ENDERECO VALUES(NULL, 'RUA CAPITAO HERMES', 'CENTRO', 'RIO DE JANEIRO', 'RJ', 2);
INSERT INTO ENDERECO VALUES(NULL, 'RUA PRES VARGAS', 'JARDINS', 'SAO PAULO', 'SP', 1);
INSERT INTO ENDERECO VALUES(NULL, 'RUA ALFANDEGA', 'ESTACIO', 'RIO DE JANEIRO', 'RJ', 4);
INSERT INTO ENDERECO VALUES(NULL, 'RUA DO OUVIDOR', 'FLAMENGO', 'RIO DE JANEIRO', 'RJ', 6);
INSERT INTO ENDERECO VALUES(NULL, 'RUA URUGUAIANA', 'CENTRO', 'VITORIA', 'ES', 3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA LIBERDADE', 'CENTRO', 'SAO PAULO', 'SP', 7);

DESC TELEFONE;

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

INSERT INTO TELEFONE VALUES (NULL, 'CEL', '5214762610', 5);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '4658658446', 1);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '1654658466', 2);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '5168496844', 3);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '4586964564', 4);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '1569865456', 6);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '4465312894', 7);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '6517989745', 7);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '7985461239', 5);

SELECT * FROM TELEFONE;

+------------+------+------------+------------+
| IDTELEFONE | TIPO | NUMERO     | ID_CLIENTE |
+------------+------+------------+------------+
|          1 | CEL  | 5214762610 |          5 |
|          2 | CEL  | 5214762610 |          5 |
|          3 | RES  | 4658658446 |          1 |
|          4 | COM  | 1654658466 |          2 |
|          5 | CEL  | 5168496844 |          3 |
|          6 | RES  | 4586964564 |          4 |
|          7 | COM  | 1569865456 |          6 |
|          9 | RES  | 6517989745 |          7 |
|         10 | COM  | 7985461239 |          5 |
+------------+------+------------+------------+

/*
DML - DATA MANIPULATION LANGUAGE
DDL - DATA DEFINITION LANGUAGE
DCL - DATA CONTROL LANGUAGE
TCL - TRANSACTION CONTROL LANGUAGE
*/

/* DML - DATA MANIPULATION LANGUAGE*/
/* INSERT */

INSERT INTO CLIENTE VALUES(NULL, 'PAULATEJANDO', 'M', NULL, '8749867654');
INSERT INTO ENDERECO VALUES(NULL, 'R JOAQUIM SILVA', 'ALVORADA','NITEROI', 'RJ', 8);


/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 9;

/* DELETE */

INSERT INTO CLIENTE VALUES(NULL, 'TOMASTURBO', 'M', 'XXXXX', '4864653');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 10;

DELETE FROM CLIENTE 
WHERE IDCLIENTE = 10;


/* DDL - DATA DEFINITION LANGUAGE*/
CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL 
);

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

ALTER TABLE PRODUTO
DROP COLUMN FRETE;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| PESO           | float(10,2) | NO   |     | NULL    |                |
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+