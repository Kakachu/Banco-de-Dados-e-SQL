USE COMERCIO;

SHOW TABLES;

/*ALTERANDO TABELAS*/

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

/* CREATE TABLE TABELA(
	COLUNA1 INT PRIMARY KEY AUTO_INCREMENT
); */

ALTER TABLE TABELA
ADD PRIMARY KEY(COLUNA1);

/* ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO */

ALTER TABLE TABELA
ADD COLUMN COLUNA4 VARCHAR(30);

DESC TABELA;

/* ADICIONANDO COLUNA COM POSICAO */

ALTER TABLE TABELA
ADD COLUMN COLUNA VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA1;

DESC TABELA;

/* MODIFICAR UM TIPO DE CAMPO */

ALTER TABLE TABELA
MODIFY COLUNA2 DATE NOT NULL;

/* RENOMEANDO O NOME DA TABELA */
ALTER TABLE TABELA 
RENAME PESSOA;

CREATE TABLE TIME(
    IDTIME INT PRIMARY KEY AUTO_INCREMENT,
    TIME VARCHAR(30),
    ID_PESSOA VARCHAR(30)
);

/* ADICIONANDO FOREIGN KEY */

ALTER TABLE TIME 
ADD CONSTRAINT FK_Time
FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

SHOW CREATE TABLE TIME;

/* ORGANIZACAO DE CHAVES - CONSTRAINT REGRA */
CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY (ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL, 'GUERRERO');

INSERT INTO TIMES VALUES(NULL, 'FLAMENGO', 1);

/* ORGANIZANDO CHAVES - ACOES DE CONSTRAINTS */

SHOW TABLES;

DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE
ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;

/* DICIONARIO DE DADOS */

SHOW DATABASES;

USE INFORMATION_SCHEMA;

STATUS

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   CONSTRAINT_NAME AS "NOME DA REGRA",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = "COMERCIO";

/* APAGANDO CONSTRAINTS */

USE COMERCIO;

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

