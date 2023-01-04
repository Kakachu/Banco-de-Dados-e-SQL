/*SCRIPT EXERCICIO LIVRARIA*/

/*CRIANDO BANCO DE DADOS LIVRARIA*/
CREATE DATABASE LIVRARIA;

/*ACESSANDO BANCO DE DADOS*/
USE LIVRARIA;

/*CRIANDO TABELA LIVROS*/
CREATE TABLE LIVROS(
NOME VARCHAR(30),
EDITORA VARCHAR(30),
PAGINAS VARCHAR(5),
PRECO DECIMAL(10.2),
AUTOR VARCHAR(30),
SEXO CHAR(1),
UF CHAR(2)
);

/*POPULANDO A TABELA*/
INSERT INTO LIVROS(NOME, EDITORA, PAGINAS, PRECO, AUTOR, SEXO, UF) VALUES('CODIGO LIMPO', 'ALTA BOOKS', '562', 1000, 'TIO BOB', 'M', 'BA'),
																  ('A ODISSEIA', 'GREGO BOOKS', '1002', 539.10, 'HOMERO', 'M', 'RJ'),
																  ('TURMA DA MONICA', 'PANINI', '52', 698, 'MAURICIO DE SOUZA', 'M', 'SP'),
																  ('FRANKENSTEIN', 'EXEMPLO', '777', 963.5, 'MAREY SHELLEY', 'F', 'RJ'),
																  ('MEMORIAL DE MARIA', 'JOSE OLIMPO', 478, '123', 'RACHEL DE QUEIROZ', 'F', 'AM'),
																  ('AGUA VIVA', 'ROCCO', '358', 555, 'CLARICE LISPECTOR', 'F', 'SP');
																  
/*SELECT-PROJEÇÕES*/
/*MOSTRAR TODOS OS LIVROS*/											  
SELECT * FROM LIVROS;	

/*MOSTRAR NOME DO LIVRO E DA EDITORA*/	
SELECT NOME, EDITORA FROM LIVROS;		

/*MOSTRAR NOME DO LIVRO E UF DE LIVROS PUBLICADOS POR AUTORES MASCULINOS*/
SELECT NOME, UF FROM LIVROS
WHERE SEXO = 'M';

/*MOSTRAR NOME DO LIVRO E NUM DE PAGINAS DE LIVROS PUBLICADOS POR AUTORAS FEMININAS*/												  
SELECT NOME, PAGINAS FROM LIVROS
WHERE SEXO = 'F';

/*MOSTRAR VALOR DAS EDITORAS DE SP*/
SELECT PRECO FROM LIVROS
WHERE UF = 'SP';

/*MOSTRAR DADOS DE AUTORES MASCULINOS DE SP OU RJ*/
SELECT * FROM LIVROS
WHERE SEXO = 'M' AND UF = 'SP'
OR SEXO = 'M' AND UF = 'RJ';