CREATE TABLE DEPARTAMENTOS (dcodigo integer, nome varchar,gerente
integer,local varchar,CONSTRAINT PK_DEPARTAMETOS PRIMARY KEY (dcodigo));
CREATE TABLE EMPREGADOS (ecodigo integer,nome varchar,dcodigo
integer,salario real,CONSTRAINT PK_EMPREGADOS PRIMARY KEY (ecodigo));
CREATE TABLE PROJETOS (pcodigo integer,coordenador integer,orçamento
real,CONSTRAINT PK_PROJETOS PRIMARY KEY (pcodigo));
CREATE TABLE TRABALHA (pcodigo integer,ecodigo integer,numHoras
integer,CONSTRAINT PK_TRABALHA PRIMARY KEY (pcodigo, ecodigo));


INSERT INTO DEPARTAMENTOS (dcodigo, nome, gerente, local) VALUES
(01, 'Departamento de Seguranca', 0825, 'Fortaleza'),
(02, 'Departamento de Servicos Gerais', 0827, 'Fortaleza'),
(03, 'Departamento de Assistencia Social', 0829, 'Sobral'),
(04, 'Departamento de Informatica', 0827, 'Fortaleza'),
(20, 'Departamento de RH', 022, 'Fortaleza'),
(30, 'Departamento de Jogos', 031, 'Quixada');

INSERT INTO EMPREGADOS (ecodigo, nome, dcodigo, salario)
VALUES(0821, 'Alisson', 01, 400),
(0822, 'Matheus', 01, 1200),
(0823, 'Livia', 02, 1200),
(0824, 'Narciso', 01, 2000),
(0825, 'Emanuele', 01, 7000),
(0826, 'Aline', 02, 2000),
(0827, 'Heitor', 02, 8000),
(0828, 'Aderbaldo', 02, 400),
(0829, 'Jesualdo', 30, 6000),
(0830, 'Davi', 03, 1200),
(0831, 'Larissa', 03, 400),
(0832, 'Gardenia', 03, 2000),
(0833, 'Zilene', 04, 5500),
(0834, 'Italo', 04, 400),

(0835, 'Jucicleudo', 04, 1600),
(0836, 'Beatriz', 04, 2500),
(21, 'John Leitao', 30, 5500),
(002, 'Joao Silva', 30, 3500),
(003, 'E22', 30, 7500),
(004, 'E23', 30, 3500),
(005, 'E24', 30, 2500),
(006, 'E25', 30, 1500),
(007, 'E26', 30, 8500),
(008, 'E27', 30, 7500),
(009, 'E28', 30, 4500),
(010, 'E29', 30, 1500),
(001, 'E30', 30, 3500),
(011, 'E31', 30, 4500),
(012, 'E32', 30, 6500),
(013, 'E33', 30, 7500),
(014, 'E34', 30, 1500),
(015, 'E35', 30, 1500),
(016, 'E36', 30, 2500),
(017, 'E37', 30, 2500),
(018, 'E38', 30, 3500),
(019, 'E39', 30, 3500),
(020, 'E40', 30, 3500),

(022, 'E41', 30, 4500),
(023, 'E42', 30, 4500),
(024, 'E43', 30, 4500),
(025, 'E44', 30, 6500),
(026, 'E45', 30, 9500),
(027, 'E46', 30, 1500),
(028, 'E47', 30, 1500),
(029, 'E48', 30, 2500),
(030, 'E49', 30, 2500),
(031, 'E50', 30, 2500),
(032, 'E51', 30, 2500),
(033, 'E52', 30, 2500),
(034, 'E53', 30, 2500),
(035, 'E54', 30, 3500),
(036, 'E55', 30, 4500);



INSERT INTO PROJETOS (pcodigo, coordenador, orçamento) VALUES
(3040, 0825, 15000),
(0612, 0827, 2000000),
(0613, 0829, 8000),
(0614, 0827, 3000000),
(0615, 0827, 5000),
(0616, 0824, 9000),
(0617, 0824, 9500),
(0618, 0825, 500000),
(0619, 0832, 1500000),
(0620, 0826, 1600000),
(0621, 0827, 5200000),
(0622, 0825, 1150000),
(0623, 0833, 2500000),
(3050, 0836, 185000),
(1, 0833, 2500000),
(21, 0836, 185000);

INSERT INTO TRABALHA (ecodigo, pcodigo, numHoras) VALUES
(0821, 3040, 20),
(0821, 0622, 8),
(0822, 0612, 30),
(0823, 0613, 25),
(0822, 0622, 10),
(0824, 0614, 16),
(0826, 0615, 20),
(0827, 0616, 30),
(0828, 0617, 28),
(0829, 0618, 32),
(0830, 0619, 40),
(0831, 0620, 8),
(0832, 0621, 16),
(0833, 0622, 12),
(0825, 3040, 20),
(0833, 0616, 40),
(0821, 0619, 20),
(0822, 3040, 40),
(0834, 0612, 40),
(0835, 0622, 20),
(0836, 3040, 40),
(0821, 0618, 30),
(21, 0618, 30),
(21, 1, 30),
(21, 21, 30);

ALTER TABLE DEPARTAMENTOS
ADD CONSTRAINT FK_EMPREGADOS FOREIGN KEY (gerente)
REFERENCES EMPREGADOS (ecodigo);

ALTER TABLE PROJETOS
ADD CONSTRAINT FK_COORDENADOR FOREIGN KEY (coordenador)
REFERENCES EMPREGADOS (ecodigo);
ALTER TABLE TRABALHA
ADD CONSTRAINT FK_EMPREGADO FOREIGN KEY (ecodigo)
REFERENCES EMPREGADOS (ecodigo);

ALTER TABLE TRABALHA
ADD CONSTRAINT FK_PROJETO FOREIGN KEY (pcodigo)
REFERENCES PROJETOS (pcodigo);


ALTER TABLE EMPREGADOS
ADD CONSTRAINT FK_DEPARTAMENTO FOREIGN KEY (dcodigo)
REFERENCES DEPARTAMENTOS (dcodigo);

--ALTER TABLE Departamentos DROP CONSTRAINT FK_EMPREGADOS


--1ªQUESTÃO

--ITEM 1
SELECT Empregados.nome, salario, pcodigo, orçamento
FROM Empregados
LEFT JOIN Projetos 
ON Empregados.ecodigo = Projetos.coordenador
ORDER BY nome

--ITEM 2
SELECT Empregados.nome, salario, A.local, Departamentos.dcodigo
FROM Empregados
INNER JOIN Departamentos A 
ON Empregados.dcodigo = A.dcodigo
LEFT JOIN Departamentos
ON Empregados.ecodigo = Departamentos.gerente
ORDER BY Empregados.nome

--ITEM 3
SELECT AVG(salario)
FROM Empregados
WHERE dcodigo = 30; 

--ITEM 4
SELECT Max(salario)
FROM Empregados

--ITEM 5
SELECT nome
FROM  Empregados, Projetos
WHERE Empregados.ecodigo = Projetos.coordenador 
  AND Projetos.orçamento = (SELECT Max(orçamento) 
			    FROM Projetos)
			    
--CAIR ATE A 6 NA PROVA

--ITEM 6
SELECT dcodigo
FROM Empregados
WHERE Empregados.salario = (SELECT Max(salario) 
			    FROM Empregados);


--ITEM 7
SELECT Sum(salario)
FROM Empregados
WHERE  Empregados.dcodigo = 30
				                      
--ITEM 8
SELECT COUNT(ecodigo), SUM(salario), Departamentos.dcodigo
FROM Departamentos , Empregados
WHERE Empregados.dcodigo = Departamentos.dcodigo	
GROUP BY Departamentos.dcodigo

--Item 9
SELECT Departamentos.dcodigo, COUNT(ecodigo), SUM(salario)
FROM Departamentos , Empregados
WHERE Empregados.dcodigo = Departamentos.dcodigo 
GROUP BY Departamentos.dcodigo
HAVING COUNT(ecodigo)>30 

--Item 10 
SELECT dcodigo
FROM (SELECT dcodigo, AVG(salario) 
      AS media
      FROM Empregados
      GROUP BY dcodigo) 
      AS tabelinha
WHERE media = (SELECT  max(media) 
	       FROM (SELECT dcodigo, AVG(salario) 
		     AS media
		     FROM Empregados
		     GROUP BY dcodigo) 
		     AS tabelinha) 


--Item 11
SELECT SUM(numHoras)
FROM Trabalha
WHERE ecodigo = '21' 
AND pcodigo = 1

--Item 12
SELECT SUM(numHoras)
FROM Trabalha
WHERE ecodigo = 21 

--Item 13 
SELECT Projetos.pcodigo, numHoras
FROM Projetos 
LEFT JOIN Trabalha ON Projetos.pcodigo = Trabalha.pcodigo AND ecodigo = 21
GROUP BY Projetos.pcodigo, Trabalha.numHoras

--Item 14
SELECT SUM(numHoras)
FROM trabalha
WHERE pcodigo = 21;

--Item 15
SELECT nome, numHoras
FROM Empregados
FULL OUTER JOIN Trabalha 
ON Trabalha.ecodigo = Empregados.ecodigo
ORDER BY nome

--Item 16
SELECT Departamentos.dcodigo, COUNT(Empregados.ecodigo)
FROM Departamentos, Trabalha, Empregados
WHERE Empregados.dcodigo = Departamentos.dcodigo 
AND Trabalha.ecodigo = Empregados.ecodigo
GROUP BY Departamentos.dcodigo

--Item 17
SELECT nome
FROM Empregados, Projetos
WHERE ecodigo = coordenador
GROUP BY nome
HAVING COUNT(pcodigo) > 3

--Item 18 
SELECT Departamentos.dcodigo
FROM Departamentos, Empregados
WHERE Departamentos.dcodigo = Empregados.dcodigo
GROUP BY Departamentos.dcodigo
HAVING COUNT(ecodigo) >= (SELECT COUNT(ecodigo) FROM Empregados WHERE dcodigo = 03) 

--Item 19 -- NÃO FIZ
SELECT nome
FROM Empregados
WHERE ecodigo in (SELECT Empregados.ecodigo 
		  FROM Empregados
		  WHERE dcodigo in (SELECT salario, dcodigo  
				    FROM (SELECT DISTINCT departamentos.dcodigo, salario, gerente
					  FROM Empregados, Departamentos
					  WHERE ecodigo = gerente) AS tabelinha))
				    
				     

--Item 20
SELECT pcodigo
FROM projetos
WHERE coordenador = (SELECT ecodigo 
		     FROM Empregados 
		     WHERE nome = 'Emanuele')

--Item 21
SELECT nome
FROM Empregados
WHERE ecodigo 
NOT IN (SELECT ecodigo 
	 FROM Trabalha)

--Item 22
SELECT nome
FROM Empregados
WHERE ecodigo 
IN (SELECT ecodigo 
    FROM Trabalha)

--Item 23
SELECT nome
FROM Empregados
GROUP BY nome
HAVING MAX(salario) = (SELECT MAX(salario)
		       FROM Empregados
		       WHERE dcodigo = 02)
--Item 24
SELECT ecodigo, COUNT(pcodigo), SUM(numHoras)
FROM Trabalha
GROUP BY ecodigo

--Item 25 -- NAO FIZ
SELECT DISTINCT COUNT(Empregados.ecodigo)
FROM Trabalha, Empregados
GROUP BY Trabalha.ecodigo, Empregados.ecodigo
HAVING Trabalha.ecodigo = Empregados.ecodigo AND COUNT(pcodigo) > 1

--Item 26
SELECT Projetos.pcodigo, AVG(numHoras)
FROM Trabalha, Projetos
WHERE Projetos.pcodigo = Trabalha.pcodigo
GROUP BY Projetos.pcodigo
HAVING COUNT(Trabalha.ecodigo) > 3

--Item 27 -- NAO FIZ
SELECT Projetos.pcodigo
FROM Projetos, Trabalha
GROUP BY Projetos.pcodigo
HAVING AVG(COUNT(trabalha.ecodigo))

--Item 28 
SELECT nome, salario
FROM Empregados, Departamentos
WHERE Empregados.dcodigo = Departamentos.dcodigo
GROUP BY nome, salario
HAVING salario > (SELECT AVG(salario)
		  FROM Empregados, Departamentos
	          WHERE Empregados.dcodigo = Departamentos.dcodigo)
		
--Item 29
SELECT nome, salario
FROM Empregados
GROUP BY nome, salario, dcodigo
HAVING dcodigo in (SELECT Departamentos.dcodigo 
		   FROM Departamentos, Empregados
		   WHERE Empregados.dcodigo = Departamentos.dcodigo
		   GROUP BY Departamentos.dcodigo
		   HAVING AVG(salario) > (SELECT AVG(salario)
					  FROM Empregados
					  WHERE dcodigo = 03))