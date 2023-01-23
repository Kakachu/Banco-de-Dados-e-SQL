CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE CLIENTE(
    IDCLIENTE INT,
    NOME VARCHAR(30) NOT NULL,
    CPF VARCHAR(15) UNIQUE NOT NULL,
    SEXO ENUM('F', 'M') NOT NULL
);

CREATE TABLE TELEFONE(
    IDTELEFONE INT,
    NUMERO VARCHAR(10) NOT NULL,
    TIPO ENUM('RES', 'COM', 'CEL'),
    ID_CLIENTE INT
);

CREATE TABLE CARRO(
    IDCARRO INT,
    MARCA VARCHAR(20) NOT NULL,
    ID_CLIENTE INT
);

CREATE TABLE TINTA(
    IDTINTA INT,
    COR VARCHAR(30) NOT NULL,
    ID_CARRO INT
);

SHOW TABLES;

+-------------------+
| Tables_in_oficina |
+-------------------+
| carro             |
| cliente           |
| telefone          |
| tinta             |
+-------------------+

--ORGANIZANDO CHAVES CLIENTE
ALTER TABLE CLIENTE
ADD CONSTRAINT PK_IDCLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE CLIENTE
CHANGE IDCLIENTE 
IDCLIENTE INT AUTO_INCREMENT;

--ORGANIZANDO CHAVES TELEFONE
ALTER TABLE TELEFONE
ADD CONSTRAINT PK_TELEFONE
PRIMARY KEY(IDTELEFONE);

ALTER TABLE TELEFONE
ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE TELEFONE
CHANGE IDTELEFONE 
IDTELEFONE INT AUTO_INCREMENT;

--ORGANIZANDO CHAVES CARRO
ALTER TABLE CARRO
ADD CONSTRAINT PK_CARRO
PRIMARY KEY (IDCARRO);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CARRO
CHANGE IDCARRO 
IDCARRO INT AUTO_INCREMENT;

--ORGANIZANDO CHAVES TINTA
ALTER TABLE TINTA 
ADD CONSTRAINT PK_TINTA
PRIMARY KEY (IDTINTA);

ALTER TABLE TINTA
ADD CONSTRAINT FK_CARRO_TINTA
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE TINTA
CHANGE IDTINTA 
IDTINTA INT AUTO_INCREMENT;
--INSERINDO VALORES

DESC CLIENTE;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| CPF       | varchar(15)   | NO   | UNI | NULL    |                |
| SEXO      | enum('F','M') | NO   |     | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

DESC TELEFONE;
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| TIPO       | enum('RES','COM','CEL') | YES  |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

DESC CARRO;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDCARRO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| MARCA      | varchar(20) | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | MUL | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

DESC TINTA;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| IDTINTA  | int(11)     | NO   | PRI | NULL    | auto_increment |
| COR      | varchar(30) | NO   |     | NULL    |                |
| ID_CARRO | int(11)     | YES  | MUL | NULL    |                |
+----------+-------------+------+-----+---------+----------------+

INSERT INTO CLIENTE VALUES (NULL, 'JOAO', '867455456', 'M');
INSERT INTO CLIENTE VALUES (NULL, 'PELE', '9645852', 'M');
INSERT INTO CLIENTE VALUES (NULL, 'ANA', '58723549826', 'F');
INSERT INTO CLIENTE VALUES (NULL, 'NAMI', '44758648896', 'F');
INSERT INTO CLIENTE VALUES (NULL, 'IRINEU', '1991849568', 'M');
INSERT INTO CLIENTE VALUES (NULL, 'GABY', '6546541654', 'F');
INSERT INTO CLIENTE VALUES (NULL, 'ZORO', '353445356', 'M');

INSERT INTO TELEFONE VALUES (NULL, '5214762610', 'CEL', 5);
INSERT INTO TELEFONE VALUES (NULL,'4658658446', 'RES', 1);
INSERT INTO TELEFONE VALUES (NULL, '1654658466', 'COM', 2);
INSERT INTO TELEFONE VALUES (NULL, '5168496844', 'CEL', 3);
INSERT INTO TELEFONE VALUES (NULL, '4586964564', 'RES', 4);
INSERT INTO TELEFONE VALUES (NULL, '1569865456', 'COM', 6);
INSERT INTO TELEFONE VALUES (NULL, '4465312894','CEL', 7);
INSERT INTO TELEFONE VALUES (NULL, '6517989745', 'RES', 7);
INSERT INTO TELEFONE VALUES (NULL, '7985461239', 'COM', 5);

INSERT INTO CARRO VALUES(NULL, 'MERCEDES', 1); 
INSERT INTO CARRO VALUES(NULL, 'BMW', 2); 
INSERT INTO CARRO VALUES(NULL, 'FERRARI', 3); 
INSERT INTO CARRO VALUES(NULL, 'VOLKSWAGEN', 4); 
INSERT INTO CARRO VALUES(NULL, 'MITSUBISH', 5); 
INSERT INTO CARRO VALUES(NULL, 'LAMBORGHINI', 6); 
INSERT INTO CARRO VALUES(NULL, 'CHEVROLET', 7);

INSERT INTO TINTA VALUES(NULL, 'PRETO', 7);
INSERT INTO TINTA VALUES(NULL, 'BRANCO', 2);
INSERT INTO TINTA VALUES(NULL, 'CINZA', 1);
INSERT INTO TINTA VALUES(NULL, 'PRETO', 3);
INSERT INTO TINTA VALUES(NULL, 'VERMELHO', 6);
INSERT INTO TINTA VALUES(NULL, 'AZUL', 5);
INSERT INTO TINTA VALUES(NULL, 'MARROM', 4);

--PROJETANDO DADOS DAS TABELAS

SELECT CARRO.IDCARRO, CARRO.MARCA, TINTA.COR
FROM CARRO
INNER JOIN TINTA
ON CARRO.IDCARRO = TINTA.ID_CARRO;

SELECT C.IDCLIENTE, C.NOME, C.CPF, C.SEXO, T.NUMERO, T.TIPO, CARRO.MARCA, TINTA.COR
FROM CLIENTE C
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
    INNER JOIN CARRO
    ON C.IDCLIENTE = CARRO.ID_CLIENTE
    INNER JOIN TINTA
    ON CARRO.IDCARRO = TINTA.ID_CARRO;




