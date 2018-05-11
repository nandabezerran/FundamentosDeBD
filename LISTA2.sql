CREATE TABLE Empregados(
	ecodigo integer,
	nome varchar(60),
	dcodigo integer,
	salario real,
	PRIMARY KEY (ecodigo)
);

CREATE TABLE Departamentos(
	dcodigo integer,
	gerente integer,
	lcal varchar(60),
	PRIMARY KEY (dcodigo)	
);

CREATE TABLE Projetos (
	pcodigo integer,
	coordenador integer,
	orçamento real,
	PRIMARY KEY (pcodigo)
);

CREATE TABLE Trabalha (
	pcodigo integer,
	ecodigo integer,
	numHoras integer
);

--POVOANDO A TABELA
INSERT INTO Empregados
VALUES (123,'João Silva', 04, 5000);

INSERT INTO Empregados
VALUES (777, 'Thais Anafeloz', 04, 6500);

INSERT INTO Empregados
VALUES (321, 'Pedro de Oliveira', 04, 6500);

INSERT INTO Empregados
VALUES (335, 'Marina Lima', 04, 500);

INSERT INTO Departamentos
VALUES (04, 777, 'Fortaleza');

INSERT INTO Projetos 
VALUES (145, 335, 1000);

INSERT INTO Projetos
Values (3040, 321, 500);

INSERT INTO Trabalha
VALUES (3040, 321, 2);

INSERT INTO Trabalha
VALUES (145, 777, 3);

INSERT INTO Trabalha
VALUES (145, 123, 3);

INSERT INTO Trabalha
VALUES (145, 335, 2);
--ALTER TABLE Departamentos DROP CONSTRAINT fk_cod
ALTER TABLE Departamentos ADD CONSTRAINT fk_cod FOREIGN KEY(gerente) REFERENCES Empregados(ecodigo);
ALTER TABLE Empregados ADD CONSTRAINT fk_cod FOREIGN KEY(dcodigo) REFERENCES Departamentos(dcodigo);
ALTER TABLE Projetos ADD CONSTRAINT fk_cod FOREIGN KEY(coordenador) REFERENCES Empregados(ecodigo);
ALTER TABLE Trabalha ADD CONSTRAINT fk_cod FOREIGN KEY(ecodigo) REFERENCES Empregados(ecodigo);
ALTER TABLE Trabalha ADD CONSTRAINT fk_pcod FOREIGN KEY(pcodigo) REFERENCES Projetos(pcodigo);
--2ªQUESTÃO

--ITEM 1
SELECT nome
FROM Empregados
WHERE ecodigo = (SELECT coordenador
		 FROM projetos
		 WHERE pcodigo = 3040);

--ITEM 2
SELECT nome, salario
FROM Empregados
WHERE dcodigo = 04;

--ITEM 3
SELECT nome, Departamentos.lcal
FROM Empregados, Departamentos
WHERE salario > 5000; 

--ITEM 4
SELECT nome
FROM Empregados, Departamentos
WHERE Departamentos.lcal = 'Fortaleza'

--ITEM 5
SELECT nome
FROM Empregados
WHERE ecodigo in (SELECT ecodigo
		 FROM Trabalha
		 WHERE pcodigo in (SELECT pcodigo 
				  FROM Projetos 
				  WHERE orçamento >= 1000));

--ITEM 6
SELECT pcodigo
FROM Projetos
WHERE coordenador in (SELECT ecodigo 
                      FROM Empregados 
                      WHERE dcodigo = 04);
--ITEM 7
SELECT nome
FROM Empregados, Departamentos
WHERE Departamentos.lcal = 'Fortaleza' and Empregados.ecodigo in (SELECT ecodigo 
								  FROM Trabalha 
								  WHERE Trabalha.pcodigo in (SELECT Projetos.pcodigo 
											     FROM Projetos 
											     WHERE orçamento < 1000 ))
--ITEM 8
SELECT dcodigo
FROM Departamentos
WHERE gerente in (SELECT ecodigo
		  FROM Trabalha
		  WHERE Trabalha.pcodigo in (SELECT pcodigo
					     FROM Projetos
					     WHERE orçamento >= 1000));		