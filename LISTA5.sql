create table clientes(
	clcodigo integer, 
	nome varchar, 
	telefone varchar, 
	cidade varchar, 
	dataNasc varchar, 
	CONSTRAINT pk_clientes PRIMARY KEY (clcodigo));
create table clientes_vips(
	clcodigo integer, 
	desconto real, 
	CONSTRAINT pk_clientes_vips PRIMARY KEY (clcodigo));
create table pedidos(
	pecodigo integer, 
	clcodigo integer, 
	dataEntrega varchar, 
	CONSTRAINT pk_pedidos PRIMARY KEY (pecodigo));
create table itens_pedidos(
	pecodigo integer, 
	prcodigo integer, 
	quantidade integer, 
	valor real, 
	CONSTRAINT pk_itens_pedidos PRIMARY KEY (pecodigo, prcodigo));
create table produtos(
	prcodigo integer, 
	descricao varchar, 
	CONSTRAINT pk_produtos PRIMARY KEY (prcodigo));
create table fornece_produtos(
	prcodigo integer, 
	fcodigo integer, 
	CONSTRAINT pk_fornece_produtos PRIMARY KEY (prcodigo, fcodigo));
create table fornecedores(
	fcodigo integer, 
	fnome varchar, 
	cidade varchar, 
	CONSTRAINT pk_fornecedor PRIMARY KEY (fcodigo));

INSERT INTO "clientes" (clcodigo,nome,telefone,cidade,dataNasc) 
VALUES 	(1,'Ben Kenobi','99266-3855','Fortaleza','02/01/1985'),
	(2,'Joao Silva','90208-1420','Caucaia','13/11/1998'),		
	(3,'Paulo Barroso','92831-8968','Caucaia','15/12/1986'),
	(4,'Belchior','99803-9966','Sobral','12/05/1996'),
	(5,'Han Solo','92877-1695','Fortaleza','22/07/1994'),
	(6,'Jorge Parente','94940-5672','Maracanau','15/11/1985');

INSERT INTO "clientes_vips" (clcodigo, desconto) 
VALUES (1, 200),
	(2, 300), 
	(3, 400);
 
INSERT INTO "produtos" (prcodigo, descricao) 
VALUES 	(11, 'Pão'), 
	(22, 'Castanha'), 
	(27, 'Leite'), 
	(35, 'Alho'), 
	(41, 'Azeitona'), 
	(142, 'Milho'), 
	(132, 'Tomate');
 
 
INSERT INTO "fornecedores" (fcodigo, fnome, cidade) 
VALUES 	(1, 'F1', 'Fortaleza'), 
	(2, 'F2', 'Maracanaú'), 
	(3, 'Marcos Costa', 'Fortaleza'), 
	(4, 'F231', 'Quixadá');
 
 
INSERT INTO "pedidos" (pecodigo, clcodigo, dataEntrega) 
VALUES 	(1, 1, '20/05/2015'), 
	(2, 3, '25/03/2016'),
	(3, 4, '17/09/2016'), 
	(4, 6, '11/10/2016'), 
	(5, 2, '27/01/2017'), 
	(6, 3, '15/01/2017'), 
	(7, 5, '19/02/2017'), 
	(8, 3, '20/02/2017'), 
	(9, 1, '01/03/2017'), 
	(10, 1, '29/03/2017'), 
	(11, 6, '04/05/2017'),
	(12, 3, '25/03/2016'),
	(13, 3, '17/09/2016'), 
	(14, 3, '11/10/2016'), 
	(15, 3, '27/01/2017'),
	(16, 3, '15/01/2017'), 
	(17, 3, '19/02/2017'), 
	(18, 3, '20/02/2017'), 
	(19, 3, '01/03/2017');																
 
 
 
INSERT INTO "itens_pedidos" (pecodigo, prcodigo, quantidade, valor) 
VALUES 	(1, 11, 8, 0.15),
	(1, 22, 4, 1.99), 
	(1, 27, 11, 1.99),
	(2, 35, 2, 500), 
	(2, 41, 3, 199), 
	(2, 11, 8, 5),
	(3, 11, 3, 0.15), 
	(3, 22, 2, 1.99),
	(4, 11, 9, 0.15),
	(4, 22, 8, 1.99),
	(4, 27, 9, 1.99), 
	(4, 35, 4, 1.99),
	(5, 142, 2, 0.15),
	(6, 27, 5, 450), 
	(6, 41, 9, 899),
	(7, 22, 7, 3.17), 
	(7, 11, 6, 0.10),
	(8, 22, 1, 199), 
	(8, 27, 7, 599), 
	(8, 41, 3, 899),
	(9, 41, 1, 2.99),
	(10, 142, 3, 0.10), 
	(8, 142, 5, 399), 
	(10, 35, 2, 0.80), 
	(10, 41, 3, 1.99),
	(11, 11, 1, 0.10), 
	(11, 41, 5, 8.99),
	(4, 132, 100, 100), 
	(7, 132, 50, 100),
	(12,35,  30, 1000), 
	(13,11,  3, 1000), 
	(14,142,  1, 1000), 
	(15,35,  10, 100),
	(16,41,  3, 10), 
	(17,11,  3, 1000), 
	(18,35,  3, 1000), 
	(19,35,  3, 1000);
 
 
 
 
 
INSERT INTO "fornece_produtos" (fcodigo, prcodigo) VALUES 	
	(1, 11), 
	(1, 22), 
	(1, 27), 
	(1, 35), 
	(2, 22), 
	(2, 35), 
	(2, 41),
	(3, 11), 
	(3, 27), 
	(3, 41), 
	(3,142), 
	(4, 132);

alter table pedidos
add constraint fk_pedidos_clientes
foreign key (clcodigo)
references clientes(clcodigo);
 
alter table itens_pedidos
add constraint fk_itens_pedidos_pedidos
foreign key (pecodigo)
references pedidos(pecodigo);
 
alter table itens_pedidos
add constraint fk_itens_pedidos_produtos
foreign key (prcodigo)
references produtos(prcodigo);
 
alter table fornece_produtos
add constraint fk_fornece_produtos_produtos
foreign key (prcodigo)
references produtos(prcodigo);
 
alter table fornece_produtos
add constraint fk_fornece_produtos_fornecedores
foreign key (fcodigo)
references fornecedores(fcodigo);

alter table clientes_vips
add constraint fk_clientes_vips
foreign key (clcodigo) 
references clientes(clcodigo);	



-- Consultas

--Item 01
CREATE VIEW CVQntProd (clcodigo, prcodigo, quantidade) AS
SELECT Cv.clcodigo, Ip.prcodigo, Ip.quantidade
FROM Clientes_vips Cv, Itens_pedidos Ip, Pedidos Pe
WHERE  Cv.clcodigo = Pe.clcodigo 
AND Pe.pecodigo = Ip.pecodigo
ORDER BY Cv.clcodigo
DROP VIEW CVQntProd

SELECT Pr.prcodigo, Pr.descricao, COUNT(DISTINCT Cqp.clcodigo)
FROM Produtos Pr
LEFT JOIN CVQntProd Cqp ON Pr.prcodigo = Cqp.prcodigo AND Cqp.quantidade > 10
GROUP BY Pr.prcodigo

--Item 02
SELECT Pr.prcodigo, Pr.descricao
FROM Produtos Pr, Fornece_Produtos Fp, Fornecedores F
WHERE Pr.prcodigo = Fp.prcodigo
AND Fp.fcodigo = F.fcodigo
AND F.fnome = 'F231'
AND Pr.prcodigo NOT IN (SELECT prcodigo FROM CVQntProd)

--Item 03
SELECT Pe.pecodigo, Cl.nome, SUM(Ip.quantidade * Ip.valor)
FROM Clientes Cl, Pedidos Pe, Itens_pedidos Ip
WHERE Cl.clcodigo = Pe.clcodigo
AND Pe.pecodigo = Ip.pecodigo
GROUP BY Pe.pecodigo, Cl.nome
ORDER BY Pe.pecodigo

--Item 04
CREATE VIEW PedidosSoma (Clcodigo, Soma) AS
SELECT Pe.clcodigo, SUM(Ip.quantidade * Ip.valor)
FROM Itens_pedidos IP, Pedidos Pe
WHERE Ip.pecodigo = Pe.pecodigo
GROUP BY Pe.pecodigo

CREATE VIEW MediaPedidosClientes (Media, Clcodigo) AS
SELECT AVG(P.Soma), P.Clcodigo
FROM PedidosSoma P 
GROUP BY P.clcodigo
ORDER BY P.clcodigo

SELECT Mpc.media,Mpc.clcodigo, Cl.nome
FROM MediaPedidosClientes Mpc, Clientes Cl
WHERE Mpc.clcodigo = Cl.clcodigo
AND Mpc.media > (SELECT AVG(Ip.quantidade * Ip.valor) 
		 FROM Itens_pedidos Ip, Pedidos Pe 
		 WHERE Ip.pecodigo = Pe.pecodigo
		    )

--Item 05
SELECT Cl.nome, Cl.cidade, Cl.clcodigo
FROM PedidosSoma, Clientes Cl
WHERE PedidosSoma.clcodigo = Cl.clcodigo
AND PedidosSoma.soma = (SELECT Max(soma) FROM PedidosSoma)	

--Item 06
SELECT Cl.clcodigo, Pr.prcodigo, SUM(COALESCE(Ip.Quantidade,0))
FROM Produtos Pr
CROSS JOIN Clientes Cl 
LEFT JOIN Pedidos Pe ON Pe.clcodigo = Cl.clcodigo
LEFT JOIN Itens_Pedidos IP ON Ip.prcodigo = Pr.prcodigo AND Ip.pecodigo = Pe.pecodigo
GROUP BY Cl.clcodigo, Pr.prcodigo
ORDER BY Cl.clcodigo

--Item 07
CREATE VIEW QtdProdF(fcodigo, fcidade, qtdprodutos) AS
SELECT F.fcodigo, F.cidade, COUNT(DISTINCT Fp.prcodigo)
FROM Fornecedores F, Fornece_Produtos Fp
WHERE F.fcodigo = Fp.fcodigo
GROUP BY F.fcodigo

CREATE VIEW QtdProdC (Clcodigo, Clnome, Cidade, Fcodigo, qtdprodutos) AS
SELECT Cl.clcodigo, Cl.come, Cl.cidade, Fp.fcodigo, COUNT(DISTINCT Fp.prcodigo)
FROM Clientes Cl, Fornece_Produtos Fp, Pedidos Pe, Itens_Pedidos Ip, Produtos Pr
WHERE​ Cl.clcodigo = Pe.clcodigo
AND​ Pe.pecodigo = Ip.pecodigo
AND​ Ip.prcodigo = Pr.prcodigo
AND​ Pr.prcodigo = Fp.prcodigo
GROUP​ BY​ Cl.clcodigo, Fp.fcodigo;

SELECT CL.clcodigo, CL.nome, CL.cidade, FP.fcodigo, COUNT​(DISTINCT​ FP.prcodigo)
FROM​ CLIENTES CL, PEDIDOS PE, ITENS_PEDIDOS IP, PRODUTOS PR, FORNECE_PRODUTOS FP
WHERE​ CL.clcodigo = PE.clcodigo
AND​ PE.pecodigo = IP.pecodigo
AND​ IP.prcodigo = PR.prcodigo
AND​ PR.prcodigo = FP.prcodigo
GROUP​ BY​ CL.clcodigo, FP.fcodigo;

-- CONSULTAS
-- Item 01
SELECT Pr.prcodigo, Pr.descricao, COUNT(DISTINCT CV.clcodigo)
FROM Produtos Pr
LEFT JOIN Itens_Pedidos Ip ON Pr.prcodigo = Ip.prcodigo 
LEFT JOIN Pedidos Pe ON Ip.pecodigo = Pe.pecodigo 
LEFT JOIN Clientes_Vips CV ON CV.clcodigo = Pe.clcodigo AND Ip.quantidade > 10
GROUP BY Pr.prcodigo

-- Item 02
SELECT DISTINCT Pr.prcodigo, Pr.descricao
FROM Produtos Pr
INNER JOIN Fornece_produtos Fp ON Fp.prcodigo = Pr.prcodigo
INNER JOIN Fornecedores F ON Fp.fcodigo =  F.fcodigo
WHERE F.fnome = 'F231'
AND Pr.prcodigo NOT IN (SELECT Ip.prcodigo 
		        FROM Clientes_vips Cv
		        INNER JOIN Pedidos Pe ON Cv.clcodigo = Pe.clcodigo
		        INNER JOIN Itens_pedidos Ip ON Ip.pecodigo = Pe.pecodigo)



-- Item 03
SELECT Pe.pecodigo, Pe.clcodigo, C.nome, SUM(Ip.quantidade * Ip.valor)
FROM Itens_Pedidos Ip, Pedidos Pe, Clientes C
WHERE Pe.clcodigo = C.clcodigo
AND Pe.pecodigo = Ip.pecodigo
GROUP BY Pe.pecodigo, C.nome
ORDER BY C.nome

-- Item 04 
CREATE VIEW MediaPedidos (Soma, Clcodigo) AS
SELECT SUM(Ip.quantidade * Ip.valor), C.clcodigo
FROM Clientes C, Itens_Pedidos Ip, Pedidos Pe
WHERE C.clcodigo = Pe.clcodigo
AND Ip.pecodigo = Pe.pecodigo
GROUP BY C.clcodigo
ORDER BY C.clcodigo

SELECT C.clcodigo, C.nome
FROM Clientes C, Itens_Pedidos Ip, Pedidos Pe, MediaPedidos Mp
WHERE C.clcodigo = Pe.clcodigo
AND Ip.pecodigo = Pe.pecodigo
AND Mp.clcodigo = C.clcodigo
GROUP BY C.clcodigo
HAVING AVG(Mp.Soma) > (SELECT AVG(Ip.valor*Ip.quantidade) FROM Itens_Pedidos Ip ) 

-- Item 05
SELECT C.clcodigo, C.nome, C.cidade
FROM Clientes C
WHERE C.clcodigo in (SELECT Clcodigo 
		     FROM MediaPedidos
		     WHERE soma in (SELECT Max(soma) 
				    FROM MediaPedidos))

--Item 06
CREATE VIEW RelCliProd(Prcodigo, Clcodigo,Pecodigo,Quantidade) AS
SELECT Ip.prcodigo, Pe.clcodigo, Pe.pecodigo, Ip.quantidade
FROM Itens_Pedidos Ip, Pedidos Pe, Produtos P
WHERE Ip.pecodigo = Pe.pecodigo
AND P.prcodigo = Ip.prcodigo
GROUP BY Pe.clcodigo,Ip.prcodigo, Ip.quantidade, Pe.pecodigo
ORDER BY Pe.clcodigo,Pe.pecodigo, IP.prcodigo, IP.quantidade;
DROP VIEW RelCliProd

SELECT V.prcodigo, V.clcodigo, SUM(Rcp.quantidade)
FROM RelCliProd Rcp
RIGHT JOIN ( SELECT P.prcodigo, P.descricao, CL.clcodigo
FROM PRODUTOS P, CLIENTES CL) V
ON Rcp.prcodigo = V.prcodigo
AND Rcp.clcodigo = V.clcodigo
GROUP BY V.prcodigo, V.descricao, V.clcodigo
ORDER BY V.prcodigo, V.descricao, V.clcodigo;

--Item 07

CREATE VIEW Q7 (cliente, pedido, produtos) AS
SELECT PE.clcodigo AS cliente, PE.pecodigo AS pedido, IP.prcodigo AS produto
FROM pedidos PE, itens_pedidos IP
WHERE IP.pecodigo = PE.pecodigo
GROUP BY PE.pecodigo, IP.prcodigo
ORDER BY PE.pecodigo

SELECT CL.clcodigo, CL.nome
FROM clientes CL, Q7 q
WHERE CL.clcodigo = q.cliente
GROUP BY CL.clcodigo, CL.nome
HAVING COUNT (DISTINCT produtos) IN (SELECT COUNT(DISTINCT FP.prcodigo)
	    FROM fornece_produtos FP, fornecedores F
            WHERE F.fcodigo = FP.fcodigo
            AND F.cidade = CL.cidade)
            
--Item 08
CREATE VIEW Q8A (clcodigo, nome, cidade, pecodigo, custo) AS
SELECT CL.clcodigo, CL.nome, CL.cidade, PE.pecodigo, SUM (IP.quantidade * IP.valor)
FROM CLIENTES CL, PEDIDOS PE, ITENS_PEDIDOS IP
WHERE CL.clcodigo = PE.clcodigo
AND PE.pecodigo = IP.pecodigo
GROUP BY CL.clcodigo, PE.pecodigo
ORDER BY CL.clcodigo;

CREATE VIEW Q8B (cidade, mcp_cidade) AS
SELECT V1.cidade, AVG (V1.custo)
FROM Q8A V1
GROUP BY V1.cidade;

CREATE VIEW CLIENTES_ESPECIAIS (clcodigo, nome, telefone, mcp) AS
SELECT CL.clcodigo, CL.nome, CL.telefone, AVG (V1.custo)
FROM CLIENTES CL, Q8A V1, Q8B V2
WHERE CL.clcodigo = V1.clcodigo
AND CL.cidade = V2.cidade
GROUP BY CL.clcodigo
HAVING COUNT (V1.custo > 30000) > 10
OR AVG (V1.custo) > AVG (V2.mcp_cidade);						
