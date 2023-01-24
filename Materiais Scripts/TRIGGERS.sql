/* ESTRUTURA DE UMA TRIGGER */
CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW(PARA CADA LINHA)
BEGIN -> INICIO
        
        QUALQUER COMANDO SQL

END -> FIM


/* DATABASE TRIGGERS */
CREATE DATABASE TRIGGERS;
 
USE TRIGGERS;

CREATE TABLE USUARIO(
    IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30),
    SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO(
    IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
    IDUSUARIO INT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30)
);

/* CRIANDO A TRIGGER */
DELIMITER $
CREATE TRIGGER BACKUP_USER 
BEFORE DELETE ON USUARIO 
FOR EACH ROW
BEGIN
        
        INSERT INTO BKP_USUARIO VALUES
        (NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);

END
$

DELIMITER ;

INSERT INTO USUARIO VALUES(NULL, 'ANDRADE', 'ANDRADE2009', 'HEXACAMPEÃO');

DELETE FROM USUARIO
WHERE IDUSUARIO = 1;

SELECT * FROM BKP_USUARIO;