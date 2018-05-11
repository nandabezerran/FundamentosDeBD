-- Criando Tabelas
CREATE TABLE Empregados (
cpf bigint,
enome varchar(60),
salario float,
cpf_supervisor bigint,
dnumero integer,
PRIMARY KEY (cpf)
);

CREATE TABLE Departamentos (
dnumero integer,
dnome varchar(60),
cpf_gerente bigint,
PRIMARY KEY (dnumero)
);

CREATE TABLE Trabalha (
cpf_emp bigint,
pnumero integer
);

CREATE TABLE Projetos (
pnumero integer,
pnome varchar(45),
dnumero integer,
PRIMARY KEY(pnumero)
);

-- Povoando Tabelas
INSERT INTO empregados
VALUES (049382234322,'João Silva', 2350, 2434332222, 1010);

INSERT INTO empregados(cpf, enome, salario, cpf_supervisor, dnumero)
VALUES (586733922290,'Mario Silveira', 3500, 2454332222, 05);

INSERT INTO empregados(cpf, enome, salario, cpf_supervisor, dnumero)
VALUES (587734922290,'Pedro de Oliveira', 5500, 2454332222, 05);

INSERT INTO empregados
VALUES (2434332222,'Aline Barros', 1350, NULL, 1010);

INSERT INTO empregados
VALUES (2454332222,'Thais Lima', 6050, NULL, 05);

INSERT INTO departamentos (dnumero, dnome, cpf_gerente)
VALUES (1010, 'Transporte', 049382234322);

INSERT INTO departamentos
VALUES (05, 'Vendas', 2434332222);

INSERT INTO trabalha (cpf_emp, pnumero)
VALUES (049382234322, 2010);

INSERT INTO trabalha (cpf_emp, pnumero)
VALUES (586733922290, 2020);

INSERT INTO trabalha (cpf_emp, pnumero)
VALUES (049382234322, 2020);

INSERT INTO projetos (pnumero, pnome, dnumero)
VALUES (2010,'Alpha', 1010);

INSERT INTO projetos (pnumero, pnome, dnumero)
VALUES (2020,'Beta', 05);

-- Adicionando chaves estrangeiras
ALTER TABLE Departamentos ADD CONSTRAINT fk_cpf FOREIGN KEY(cpf_gerente) REFERENCES empregados(cpf);
ALTER TABLE Trabalha ADD CONSTRAINT fk_cpfemp FOREIGN KEY(cpf_emp) REFERENCES empregados(cpf);
ALTER TABLE Projetos ADD CONSTRAINT fk_dnum FOREIGN KEY(dnumero) REFERENCES
departamentos(dnumero);
ALTER TABLE empregados ADD CONSTRAINT fk_dnum FOREIGN KEY(dnumero)
REFERENCES departamentos(dnumero);
ALTER TABLE trabalha ADD CONSTRAINT fk_pnum FOREIGN KEY(pnumero)
REFERENCES projetos(pnumero);

-- Iniciando Consultas
-- Item 01
SELECT *
FROM Empregados
WHERE salario > 5000 and dnumero = (SELECT dnumero 
				    FROM Departamentos 
				    WHERE dnumero = 05);

-- Item 02
SELECT enome
FROM Empregados
WHERE cpf in (SELECT cpf_supervisor 
	      FROM Empregados 
	      WHERE salario > 5000);

-- Item 03 NÃO FIZ
SELECT enome, salario
FROM Empregados
WHERE cpf_supervisor in (SELECT cpf 
		         FROM Empregados
		         WHERE salario in (SELECT salario 
					   FROM Empregados));
-- Item 04 NÃO FIZ
SELECT enome
WHERE (
)
-- Item 05
SELECT pnome
FROM Projetos
WHERE pnumero in (SELECT pnumero
		  FROM Trabalha
		  WHERE cpf_emp in (SELECT cpf 
				    FROM Empregados 
				    WHERE enome = 'João Silva'))
-- Item 06
SELECT cpf
FROM Empregados
WHERE cpf not in (SELECT cpf_emp 
		  FROM Trabalha);
-- Item 07
SELECT cpf
FROM Empregados
WHERE cpf in (SELECT cpf_emp 
	      FROM Trabalha)
-- Item 08
SELECT cpf
FROM Empregados
WHERE 	      