/*sintaxe básica de inserção - INSERT INTO TABELA...*/
/*FORMA 01 - OMITINDO AS COLUNAS*/
INSERT INTO CLIENTE VALUES('KAUA', 'M', 'KAUAJARDIM2004@GMAIL.COM', 528177328, '963741027', 'CASA');

/*FORMA 02 - ESPECIFICANDO AS COLUNAS*/
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE, EMAIL, CPF) VALUES('KAUA', 'M', 'CASA', '123456789', 'KAUA@GMAIL.COM', 52817732839); 

/*FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL*/

INSERT INTO CLIENTE VALUES('KAUA', 'M', 'JARDIM200@GMAIL.COM', 32852817739, '145677655', 'SP'),
						  ('BIG', 'M', 'BIGAO@GMAIL.COM', 55577799985, '658975623599', 'SAO PAULO');

/*O COMANDO SELECT
SELEÇÃO PROJEÇÃO E JUNÇÃO
*/

SELECT NOW();

SELECT 'KAUA JARDIM';

