CREATE TABLE empregados(enome character varying, dno integer, sal real, localizacao character varying);


CREATE TABLE departamentos(dno integer, dnome character varying, gerente character varying);


CREATE TABLE dependentes(nome character varying, enome character varying);

ALTER TABLE empregados
ADD CONSTRAINT pk_empregados PRIMARY KEY (enome);


ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos PRIMARY KEY (dno);


ALTER TABLE dependentes
ADD CONSTRAINT pk_dependentes PRIMARY KEY (nome, enome);


INSERT INTO empregados VALUES ('Gil', 1, 200, 'Sobral'), 
				('gustavo', 1, 345, 'Fortaleza'),
				('Melo', 1, 1500, 'Fortaleza'),
				('Alessandra', 1, 500, 'Crateus'),
				('Guilherme Briggs', 2, 1335, 'Fortaleza'),
				('Sandra', 2, 1990, 'Maracanau'),
				('Gal', 2, 990, 'Itapaje'),
				('Dorval', 3,  500, 'Paracuru'),
				('Vera', 3,  500, 'Paracuru'),
				('Leyla', 3,  500, 'Fortaleza'),
				('Rios', 3, 1300, 'Pacajus');


INSERT INTO departamentos VALUES (1, 'ti', 'gustavo'), 
				 (2, 'vendas', 'Gal'),
				 (3, 'brinquedos', 'Rios');


INSERT INTO Dependentes VALUES ('Coutinho', 'gustavo'), 
					('Zunda', 'Gal'), 
					('gustavo', 'gustavo'), 
					('Leyla', 'Leyla');

SELECT enome, dnome
FROM Empregados
INNER JOIN Departamentos ON Empregados.dno = Departamentos.dno

SELECT gerente
FROM Departamentos 
INNER JOIN Empregados 
ON Empregados.dno = Departamentos.dno 
WHERE enome = 'Gil' 

SELECT E2.sal
FROM Empregados E1
INNER JOIN Departamentos D ON E1.dno=D.dno
INNER JOIN Empregados E2 ON D.gerente = E2.enome
WHERE E1.enome = 'Gil'

SELECT enome, gerente
FROM Empregados E1
INNER JOIN Departamentos d 
ON d.dno = E1.dno
WHERE d.gerente = 'gustavo' 
AND E1.sal < 1000

SELECT E1.enome
FROM Empregados E1
INNER JOIN Departamentos D ON E1.dno=D.dno
INNER JOIN Empregados E2 ON D.gerente = E2.enome
WHERE E1.sal > E2.sal

SELECT DISTINCT E2.enome
FROM Empregados E1
INNER JOIN Departamentos D ON E1.dno=D.dno
INNER JOIN Empregados E2 ON D.gerente = E2.enome
WHERE E1.sal > E2.sal

SELECT AVG(sal)
FROM Empregados E1
INNER JOIN Departamentos D 
ON E1.dno = D.dno
WHERE D.dnome = 'brinquedos'

SELECT COUNT(E1.enome)
FROM Empregados E1
INNER JOIN Departamentos D 
ON E1.dno = D.dno
WHERE D.dnome = 'brinquedos'

-- PROJEÇAO SELEÇÃO UNIÃO(PROD CART)

SELECT *
FROM Empregados
WHERE localizacao = 'Fortaleza'

SELECT *
FROM Empregados
INNER JOIN Departamentos ON Empregados.dno = Departamentos.dno

SELECT enome
FROM Empregados 
INNER JOIN Departamentos ON Empregados.dno = Departamentos.dno
AND gerente = 'gustavo' 
AND sal < 1000

SELECT E1.enome
FROM Empregados E1
INNER JOIN Departamentos D ON E1.dno = D.dno
INNER JOIN Empregados E2 ON E2.enome = D.gerente
WHERE E1.sal > E2.sal

SELECT DISTINCT E2.enome
FROM Empregados E1
INNER JOIN Departamentos D ON E1.dno = D.dno
INNER JOIN Empregados E2 ON E2.enome = D.gerente
WHERE E1.sal > E2.sal

SELECT AVG(sal)
FROM Empregados
INNER JOIN Departamentos ON Empregados.dno = Departamentos.dno
WHERE Departamentos.dnome = 'brinquedos'