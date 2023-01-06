/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */
USE projeto;

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'JARDIMBOLADO@HOTMAIL.COM';

SELECT NOME, EMAIL
FROM CLIENTE;

/*WHERE - SEU MELHOR AMIGO PARA VIDA INTEIRA! EXTREMAMENTE IMPORTANTE, CASO DE VIDA OU MORTE!*/

UPDATE CLIENTE
SET EMAIL = 'KAUA@HOTMAIL.COM'
WHERE NOME = 'KAUA';

UPDATE CLIENTE
SET EMAIL = 'BIGAO@GMAIL.COM'
WHERE NOME = 'BIG';

UPDATE CLIENTE
SET EMAIL = 'MONT@GMAIL.COM'
WHERE NOME = 'MONTANARI';

UPDATE CLIENTE
SET EMAIL = 'XING@GMAIL.COM'
WHERE NOME = 'XING';

UPDATE CLIENTE
SET EMAIL = 'LING@GMAIL.COM'
WHERE NOME = 'LING';

SELECT NOME, EMAIL
FROM CLIENTE;