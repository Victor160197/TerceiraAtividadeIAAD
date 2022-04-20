
-- 3) 
##################################################################################################################################################################
-- a) Usando consulta aninhada em SQL, recupere os nomes de todos os funcionários que trabalham no mesmo departamento do funcionário que possui o salário de R$ 43.000.
##################################################################################################################################################################
SELECT DISTINCT
    F.Pnome, F.Unome
FROM
    FUNCIONARIO AS F
        JOIN
    DEPARTAMENTO AS D ON D.Dnumero = F.Dnr
        JOIN
    TRABALHA_EM AS TE ON TE.Fcpf = D.Cpf_gerente
        JOIN
    PROJETO AS P ON P.ProjNumero = TE.Pnr
WHERE
    D.Dnome = 'Administração';

##################################################################################################################################################################
-- B) Usando consulta aninhada em SQL, recupere os nomes dos funcionários que ganham pelo menos R$ 14.000,00 a mais que o funcionário que recebe menos na empresa.
##################################################################################################################################################################
SELECT DISTINCT F.Pnome,
				F.Unome 
FROM FUNCIONARIO AS F
WHERE F.Salario > 39000;
##############################################################################################################################################
-- C) Apresente o comando SQL que retorna para cada departamento: a quantidade de funcionários do sexo masculino que ganha mais de R$ 35.000.
#############################################################################################################################################
SELECT D.Dnome,
	   COUNT(F.Dnr)
FROM DEPARTAMENTO AS D
JOIN FUNCIONARIO AS F
ON F.Dnr = D.Dnumero
WHERE F.Sexo = "M" AND F.Salario > 35000
GROUP BY D.Dnome;
