-- 3° Atividade IAAD

-- 1°)
##################################################################################################################################################################
-- A) Especifique o comando SQL que retorna os nomes de todos(as) programadores(as) e os nomes das respectivas startups em que eles(elas) trabalham. Apresentar a consulta de três formas: (I) junção na cláusula where, (II) conexão interna (inner join), (III) junção natural.
##################################################################################################################################################################
-- (I)  Junção na cláusula where
SELECT Programador.nome_programador, Startup.nome_startup
	FROM Programador
	JOIN Startup
		WHERE Programador.id_startup = Startup.id_startup;

-- (II) conexão interna (inner join)
SELECT Programador.nome_programador, Startup.nome_startup
	FROM Programador
	INNER JOIN Startup
		ON Programador.id_startup = Startup.id_startup;

-- (III) junção natural
SELECT Programador.nome_programador, Startup.nome_startup 
	FROM Programador NATURAL JOIN Startup;
##################################################################################################################################################################    
-- B Especifique o comando SQL que retorna os nomes e identificadores dos(as) programadores(as) que não programam nas linguagens de programação cadastradas no BD Startup. Apresentar a consulta de três formas: (I) left join, (II) not in, (III) not exists. Além dos comandos SQL, apresente a tabela resultante.
##################################################################################################################################################################
-- (I) left join 

SELECT * FROM Programador AS P
LEFT JOIN Programador_Linguagem AS PL
ON P.id_programador = PL.id_programador -- chave primaria = chave estrangeira
LEFT JOIN Linguagem_Programacao AS LP
ON LP.id_linguagem = PL.id_linguagem
WHERE LP.id_linguagem != PL.id_linguagem;

-- (II) not in 

SELECT * FROM Programador AS P
LEFT JOIN Programador_Linguagem AS PL
ON P.id_programador = PL.id_programador -- chave primaria = chave estrangeira
LEFT JOIN Linguagem_Programacao AS LP
ON LP.id_linguagem = PL.id_linguagem
WHERE LP.id_linguagem NOT IN (PL.id_linguagem);

-- (III) not exists

SELECT * FROM Programador as P
    WHERE NOT EXISTS (SELECT * FROM Programador_Linguagem AS PL
                        LEFT JOIN Linguagem_Programacao AS LP
                            ON LP.id_linguagem = PL.id_linguagem);
##################################################################################################################################################################                            
-- C Especifique o comando SQL que retorna o nome de cada startup e a quantidade de programadores(as) de cada uma delas. Além do comando SQL, apresente a tabela resultante.Observação: incluir na consulta as startups com zero programadores.
##################################################################################################################################################################
SELECT distinct A.nome_startup, 
				COUNT(B.id_programador) AS numero_de_programadores
FROM Startup as A
    LEFT JOIN Programador AS B
        ON A.id_startup = B.id_startup
        GROUP BY A.nome_startup;
##################################################################################################################################################################
-- D  Especifique o comando SQL que retorna a tabela abaixo: 
##################################################################################################################################################################
SELECT S.nome_startup, 
	GROUP_CONCAT(" ", P.nome_programador) AS nomes_programadores
FROM  Startup AS S
LEFT JOIN Programador AS P
	ON S.id_startup = P.id_startup
GROUP BY S.nome_startup;
##################################################################################################################################################################
-- E Especifique o comando SQL que retorna o código e nome de cada linguagem de programação (LP), seguido do número de programadores(as) (quantidade total) que programam na LP. Devem aparecer no resultado da consulta apenas as LP com mais de 1 programador(a). Ou seja, retornar as linguagens de programação que têm mais de um(a) programador(a). Além do comando SQL, apresente a tabela resultante.
##################################################################################################################################################################        
SELECT LP.id_linguagem,
	   LP.nome_linguagem,
	   COUNT(PL.id_programador)  AS numero_de_programadores
FROM Linguagem_Programacao AS LP
JOIN Programador_Linguagem AS PL ON LP.id_linguagem = PL.id_linguagem -- chave primaria = chave estrangeira
JOIN Programador AS P ON P.id_programador = PL.id_programador
WHERE PL.id_linguagem > 0
GROUP BY LP.id_linguagem;
##################################################################################################################################################################
-- F Apresente a expressão da álgebra relacional e o comando SQL que retorna os nomes e e-mail das programadoras (apenas gênero feminino) que nasceram entre 1985 e 1990, além dos nomes das respectivas  linguagens de programação em que elas programam. Apresente também a tabela resultante.
##################################################################################################################################################################
SELECT P.nome_programador,
	   P.email, 
       LP.nome_linguagem FROM Programador AS P
JOIN Programador_Linguagem AS PL
	ON P.id_programador = PL.id_programador -- chave primaria = chave estrangeira
JOIN Linguagem_Programacao AS LP
	ON LP.id_linguagem = PL.id_linguagem
WHERE P.genero = 'F' AND P.data_nascimento >= '1985/01/01' AND P.data_nascimento <= '1990/12/31';
##################################################################################################################################################################
-- G Apresente a expressão da álgebra relacional e o comando SQL que retorna os identificadores das linguagens de programação cadastradas no BD Startup em que o programador cujo id é “30003” não programa. Apresente também a tabela resultante.
##################################################################################################################################################################
SELECT * 
FROM Linguagem_Programacao as LP
    LEFT JOIN Programador_Linguagem as PL
        ON LP.id_linguagem = PL.id_linguagem
    LEFT JOIN Programador as P
        ON P.id_programador = PL.id_programador
        WHERE LP.id_linguagem <> 30003 and LP.nome_linguagem not in ('C', 'JavaScript');
 
##################################################################################################################################################################
-- I  Apresente a expressão da álgebra relacional e o comando SQL que retorna os identificadores dos(as) programadores(as) que têm até 35 anos OU que trabalham na startup “Smart123”. Apresente também a tabela resultante. Observação: Considera-se 35 anos completados até 17/04/2022 (data de entrega da atividade).
##################################################################################################################################################################
SELECT *
FROM Programador AS P
JOIN Startup AS S
	ON P.id_startup = S.id_startup
WHERE S.nome_startup = 'Smart123' OR P.data_nascimento >= '1987-04-17';
##################################################################################################################################################################
-- J Apresente a expressão da álgebra relacional e o comando SQL que retorna os identificadores dos(as) programadores(as) que têm até 35 anos E que trabalham na startup “Smart123”. Apresente também a tabela resultante. Observação: Considera-se 35 anos completados até 17/04/2022 (data de entrega da atividade).
##################################################################################################################################################################
SELECT *
FROM Programador AS P
JOIN Startup AS S
	ON P.id_startup = S.id_startup
WHERE S.nome_startup = 'Smart123' AND P.data_nascimento >= '1987-04-17';





