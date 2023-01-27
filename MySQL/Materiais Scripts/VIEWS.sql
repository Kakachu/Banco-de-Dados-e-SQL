    /*  VIEWS   */
USE COMERCIO;

SELECT C.NOME,
    C.SEXO,
    C.EMAIL,
    T.TIPO,
    T.NUMERO,
    E.BAIRRO,
    E.CIDADE,
    E.UF
FROM CLIENTE C
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
    INNER JOIN ENDERECO E
    
CREATE VIEW RELATORIO AS
SELECT C.NOME,
    C.SEXO,
    C.EMAIL,
    T.TIPO,
    T.NUMERO,
    E.BAIRRO,
    E.CIDADE,
    E.UF
FROM CLIENTE C
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM RELATORIO;

/*  APAGANDO UMA VIEW   */

DROP VIEW RELATORIO;

/* INSERIR UM PREFIXO PARA VIEWS   */

CREATE VIEW V_RELATORIO AS
SELECT C.NOME,
    C.SEXO,
    IFNULL (C.EMAIL, 'CLIENTE SEM EMAIL') AS "E-MAIL",
    T.TIPO,
    T.NUMERO,
    E.BAIRRO,
    E.CIDADE,
    E.UF
FROM CLIENTE C
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM V_RELATORIO;

SELECT NOME, NUMERO, UF
FROM V_RELATORIO;

/* UPDATE, INSERT E DELETE - DML NA VIEW */

INSERT INTO V_RELATORIO VALUES(
    'ANDREA', 'F', 'ANDREA@UOL.COM.BR', 'CEL', '5346587687', 'CENTRO', 'VITORIA', 'ES'
);
/* ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list */

DELETE FROM V_RELATORIO
WHERE NOME = 'JOICE';
/* ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio' */

UPDATE V_RELATORIO 
SET NOME = 'JAQUI'
WHERE NOME = 'JOICE';

/* UPDATE E PERMITIDO EM VIEWS COM JOIN */

/* EM VIEWS SEM JOIN E POSSIVEL UTILIZAR DELETE, UPDATE E INSERT */

CREATE TABLE JOGADORES(
    IDJOGADOR INT NOT NULL,
    NOME VARCHAR(30) NOT NULL,
    ESTADO CHAR(2)  
);

INSERT INTO JOGADORES VALUES(1, 'GUERRERO', 'RS');
INSERT INTO JOGADORES VALUES(2, 'GABIGOL', 'RJ');
INSERT INTO JOGADORES VALUES(3, 'GANSO', 'RJ');
INSERT INTO JOGADORES VALUES(4, 'NENÊ', 'RJ');
INSERT INTO JOGADORES VALUES(5, 'LOVE', 'SP');

CREATE VIEW V_JOGADORES AS 
SELECT IDJOGADOR, NOME, ESTADO
FROM JOGADORES;

SELECT * FROM V_JOGADORES;

+-----------+----------+--------+
| IDJOGADOR | NOME     | ESTADO |
+-----------+----------+--------+
|         1 | GUERRERO | RS     |
|         2 | GABIGOL  | RJ     |
|         3 | GANSO    | RJ     |
|         4 | NENÊ     | RJ     |
|         5 | LOVE     | SP     |
+-----------+----------+--------+

DELETE FROM V_JOGADORES 
WHERE IDJOGADOR = 5;

SELECT * FROM V_JOGADORES;

+-----------+----------+--------+
| IDJOGADOR | NOME     | ESTADO |
+-----------+----------+--------+
|         1 | GUERRERO | RS     |
|         2 | GABIGOL  | RJ     |
|         3 | GANSO    | RJ     |
|         4 | NENÊ     | RJ     |
+-----------+----------+--------+

INSERT INTO V_JOGADORES VALUES(5, 'RONALDO', 'RJ');

SELECT * FROM V_JOGADORES;

+-----------+----------+--------+
| IDJOGADOR | NOME     | ESTADO |
+-----------+----------+--------+
|         1 | GUERRERO | RS     |
|         2 | GABIGOL  | RJ     |
|         3 | GANSO    | RJ     |
|         4 | NENÊ     | RJ     |
|         5 | RONALDO  | RJ     |
+-----------+----------+--------+
