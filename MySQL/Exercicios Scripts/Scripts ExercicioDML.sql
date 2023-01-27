USE COMERCIO;

/* EXERCICIOS DML */

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */

INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);
INSERT INTO TELEFONE VALUES(NULL,'CEL','45654165',21);


/* RELATORIO GERAL DE TODOS OS CLIENTES */
SELECT * FROM CLIENTE;
+-----------+--------------+------+-------------------+-------------+
| IDCLIENTE | NOME         | SEXO | EMAIL             | CPF         |
+-----------+--------------+------+-------------------+-------------+
|         1 | JOAO         | M    | JOAO@GMAIL.COM    | 867455456   |
|         2 | PELE         | M    | PELE@GMAIL.COM    | 9645852     |
|         3 | ANA          | F    | ANA@GMAIL.COM     | 58723549826 |
|         4 | NAMI         | F    | NAMI@GMAIL.COM    | 44758648896 |
|         5 | IRINEU       | M    | IRINEU@GMAIL.COM  | 1991849568  |
|         6 | GABY         | F    | GABY@GMAIL.COM    | 6546541654  |
|         7 | ZORO         | M    | NULL              | 353445356   |
|         8 | PAULATEJANDO | M    | NULL              | 8749867654  |
|         9 | FLAVIO       | M    | FLAVIO@IG.COM     | 4657765     |
|        10 | ANDRE        | M    | ANDRE@GLOBO.COM   | 7687567     |
|        11 | GIOVANA      | F    | NULL              | 0876655     |
|        12 | KARLA        | M    | KARLA@GMAIL.COM   | 545676778   |
|        13 | DANIELE      | M    | DANIELE@GMAIL.COM | 43536789    |
|        14 | LORENA       | M    | NULL              | 774557887   |
|        15 | EDUARDO      | M    | NULL              | 54376457    |
|        16 | ANTONIO      | F    | ANTONIO@IG.COM    | 12436767    |
|        17 | ANTONIO      | M    | ANTONIO@UOL.COM   | 3423565     |
|        18 | ELAINE       | M    | ELAINE@GLOBO.COM  | 32567763    |
|        19 | CARMEM       | M    | CARMEM@IG.COM     | 787832213   |
|        20 | ADRIANA      | F    | ADRIANA@GMAIL.COM | 88556942    |
|        21 | JOICE        | F    | JOICE@GMAIL.COM   | 55412256    |
+-----------+--------------+------+-------------------+-------------+

DESC CLIENTE;

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

DESC ENDERECO;

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| UF         | char(2)     | YES  |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

DESC TELEFONE;

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

/* RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDERECO) */
SELECT CLIENTE.IDCLIENTE, CLIENTE.NOME, CLIENTE.SEXO, CLIENTE.EMAIL, CLIENTE.CPF, ENDERECO.RUA, ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.UF, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
    INNER JOIN ENDERECO
    ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
    INNER JOIN TELEFONE
    ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+---------+------+-------------------+-------------+--------------------+------------+----------------+------+------+------------+
| NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO     | CIDADE         | UF   | TIPO | NUMERO     |
+---------+------+-------------------+-------------+--------------------+------------+----------------+------+------+------------+
| JOAO    | M    | JOAO@GMAIL.COM    | 867455456   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP   | RES  | 4658658446 |
| PELE    | M    | PELE@GMAIL.COM    | 9645852     | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ   | COM  | 1654658466 |
| ANA     | F    | ANA@GMAIL.COM     | 58723549826 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES   | CEL  | 5168496844 |
| NAMI    | F    | NAMI@GMAIL.COM    | 44758648896 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ   | RES  | 4586964564 |
| IRINEU  | M    | IRINEU@GMAIL.COM  | 1991849568  | RUA ANTONIO SA     | CENTRO     | B. HERIZONTE   | MG   | CEL  | 5214762610 |
| IRINEU  | M    | IRINEU@GMAIL.COM  | 1991849568  | RUA ANTONIO SA     | CENTRO     | B. HERIZONTE   | MG   | COM  | 7985461239 |
| GABY    | F    | GABY@GMAIL.COM    | 6546541654  | RUA DO OUVIDOR     | FLAMENGO   | RIO DE JANEIRO | RJ   | COM  | 1569865456 |
| ZORO    | M    | NULL              | 353445356   | RUA LIBERDADE      | CENTRO     | SAO PAULO      | SP   | CEL  | 4465312894 |
| ZORO    | M    | NULL              | 353445356   | RUA LIBERDADE      | CENTRO     | SAO PAULO      | SP   | RES  | 6517989745 |
| FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG   | RES  | 68976565   |
| FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG   | CEL  | 99656675   |
| GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ   | CEL  | 33567765   |
| GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ   | CEL  | 88668786   |
| GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ   | COM  | 55689654   |
| KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ   | COM  | 88687979   |
| DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES   | COM  | 88965676   |
| EDUARDO | M    | NULL              | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR   | CEL  | 89966809   |
| ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP   | COM  | 88679978   |
| ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR   | CEL  | 99655768   |
| ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP   | RES  | 89955665   |
| CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ   | RES  | 77455786   |
| CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ   | RES  | 89766554   |
| ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ   | RES  | 77755785   |
| ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ   | COM  | 44522578   |
+---------+------+-------------------+-------------+--------------------+------------+----------------+------+------+------------+

/* RELATORIO DE HOMENS */
/* AJUSTAR 16 */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 16;

UPDATE CLIENTE
SET SEXO = 'M'
WHERE IDCLIENTE = 16;

SELECT CLIENTE.IDCLIENTE, CLIENTE.NOME, CLIENTE.SEXO, CLIENTE.EMAIL, CLIENTE.CPF, ENDERECO.RUA, ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.UF, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
    INNER JOIN ENDERECO
    ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
    INNER JOIN TELEFONE
    ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE SEXO = 'M';


+-----------+---------+------+------------------+------------+--------------------+------------+----------------+------+------+------------+
| IDCLIENTE | NOME    | SEXO | EMAIL            | CPF        | RUA                | BAIRRO     | CIDADE         | UF   | TIPO | NUMERO     |
+-----------+---------+------+------------------+------------+--------------------+------------+----------------+------+------+------------+
|         1 | JOAO    | M    | JOAO@GMAIL.COM   | 867455456  | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP   | RES  | 4658658446 |
|         2 | PELE    | M    | PELE@GMAIL.COM   | 9645852    | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ   | COM  | 1654658466 |
|         5 | IRINEU  | M    | IRINEU@GMAIL.COM | 1991849568 | RUA ANTONIO SA     | CENTRO     | B. HERIZONTE   | MG   | CEL  | 5214762610 |
|         5 | IRINEU  | M    | IRINEU@GMAIL.COM | 1991849568 | RUA ANTONIO SA     | CENTRO     | B. HERIZONTE   | MG   | COM  | 7985461239 |
|         7 | ZORO    | M    | NULL             | 353445356  | RUA LIBERDADE      | CENTRO     | SAO PAULO      | SP   | CEL  | 4465312894 |
|         7 | ZORO    | M    | NULL             | 353445356  | RUA LIBERDADE      | CENTRO     | SAO PAULO      | SP   | RES  | 6517989745 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM    | 4657765    | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG   | RES  | 68976565   |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM    | 4657765    | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG   | CEL  | 99656675   |
|        15 | EDUARDO | M    | NULL             | 54376457   | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR   | CEL  | 89966809   |
|        16 | ANTONIO | M    | ANTONIO@IG.COM   | 12436767   | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP   | COM  | 88679978   |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM  | 3423565    | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR   | CEL  | 99655768   |
+-----------+---------+------+------------------+------------+--------------------+------------+----------------+------+------+------------+

/* RELATORIO DE MULHERES */

/* AJUSTAR 12 13 14 18 19 */

SELECT * FROM CLIENTE
WHERE IDCLIENTE IN (12, 13, 14, 18, 19); 

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE IN (12, 13, 14, 18, 19);

SELECT CLIENTE.IDCLIENTE, CLIENTE.NOME, CLIENTE.SEXO, CLIENTE.EMAIL, CLIENTE.CPF, ENDERECO.RUA, ENDERECO.BAIRRO, ENDERECO.CIDADE, ENDERECO.UF, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
    INNER JOIN ENDERECO
    ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
    INNER JOIN TELEFONE
    ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE SEXO = 'F';

SELECT * FROM CLIENTE WHERE SEXO = 'F';

+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+------+------+------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO     | CIDADE         | UF   | TIPO | NUMERO     |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+------+------+------------+
|         3 | ANA     | F    | ANA@GMAIL.COM     | 58723549826 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES   | CEL  | 5168496844 |
|         4 | NAMI    | F    | NAMI@GMAIL.COM    | 44758648896 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ   | RES  | 4586964564 |
|         6 | GABY    | F    | GABY@GMAIL.COM    | 6546541654  | RUA DO OUVIDOR     | FLAMENGO   | RIO DE JANEIRO | RJ   | COM  | 1569865456 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ   | CEL  | 33567765   |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ   | CEL  | 88668786   |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ   | COM  | 55689654   |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ   | COM  | 88687979   |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES   | COM  | 88965676   |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP   | RES  | 89955665   |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ   | RES  | 77455786   |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ   | RES  | 89766554   |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ   | RES  | 77755785   |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ   | COM  | 44522578   |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+------+------+------------+

/* QUANTIDADE DE HOMENS E MULHERES */

SELECT COUNT(*) AS QUANTIDADE, SEXO 
FROM CLIENTE
GROUP BY SEXO;

+------------+------+
| QUANTIDADE | SEXO |
+------------+------+
|         10 | M    |
|         11 | F    |
+------------+------+

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
NAO TENHAM CELULAR */

SELECT IDCLIENTE, EMAIL
FROM CLIENTE
    INNER JOIN ENDERECO
    ON IDCLIENTE = ENDERECO.ID_CLIENTE
    INNER JOIN TELEFONE
    ON IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE (TELEFONE.TIPO = 'COM' OR TELEFONE.TIPO = 'RES') 
AND ENDERECO.BAIRRO = 'CENTRO' AND ENDERECO.CIDADE = 'RIO DE JANEIRO'
AND SEXO = 'F';

+-----------+-------------------+
| IDCLIENTE | EMAIL             |
+-----------+-------------------+
|        11 | NULL              |
|        19 | CARMEM@IG.COM     |
|        19 | CARMEM@IG.COM     |
|        20 | ADRIANA@GMAIL.COM |
|        20 | ADRIANA@GMAIL.COM |
+-----------+-------------------+

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT CLIENTE.NOME, CLIENTE.EMAIL, TELEFONE.NUMERO AS CELULAR
FROM CLIENTE 
    INNER JOIN ENDERECO
    ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
    INNER JOIN TELEFONE
    ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE TELEFONE.TIPO = 'CEL' AND ENDERECO.UF = 'RJ';

+---------+-----------------+----------+
| NOME    | EMAIL           | CELULAR  |
+---------+-----------------+----------+
| GIOVANA | NULL            | 33567765 |
| GIOVANA | NULL            | 88668786 |
| JOICE   | JOICE@GMAIL.COM | 45654165 |
+---------+-----------------+----------+

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT CLIENTE.NOME, CLIENTE.EMAIL, TELEFONE.NUMERO AS CELULAR
FROM CLIENTE 
    INNER JOIN ENDERECO
    ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
    INNER JOIN TELEFONE
    ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
WHERE ENDERECO.UF = 'SP' AND SEXO = 'F';

+--------+------------------+----------+
| NOME   | EMAIL            | CELULAR  |
+--------+------------------+----------+
| ELAINE | ELAINE@GLOBO.COM | 89955665 |
+--------+------------------+----------+