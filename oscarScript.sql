use oscar_database;

-- 1- Quantas vezes Natalie Portman foi indicada ao Oscar?
SELECT COUNT(vencedor)
FROM filmes 
WHERE nome_do_indicado = "Natalie Portman";

-- 2- Quantos Oscars Natalie Portman ganhou?
SELECT COUNT(vencedor)
FROM filmes 
WHERE nome_do_indicado = "Natalie Portman" 
AND vencedor = "sim";

-- 3- Amy Adams já ganhou algum Oscar?
SELECT vencedor 
FROM filmes 
WHERE nome_do_indicado = "Amy Adams" 
AND vencedor = "sim" 
LIMIT 1;

-- 4- A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT nome_filme, ano_filmagem 
FROM filmes 
WHERE nome_filme LIKE "%Toy Story%" 
AND vencedor = "sim";

-- 5- A partir de que ano que a categoria "Actress" deixa de existir? 
SELECT ano_filmagem, categoria 
FROM filmes 
WHERE categoria LIKE "%actress%" 
ORDER BY ano_filmagem DESC 
LIMIT 1;

-- 6- O primeiro Oscar para melhor Atriz foi para quem? Em que ano?
SELECT nome_do_indicado, categoria, ano_filmagem
FROM filmes 
WHERE categoria LIKE "%actress%" 
ORDER BY ano_filmagem 
LIMIT 1;

-- 7- Na coluna/campo "Vencedor", altere todos os valores com "Sim" para 1 e todos os valores "Não" para 0.
UPDATE filmes SET vencedor = CASE
WHEN vencedor = "Sim" 
THEN 1 ELSE 0 END;
SELECT vencedor FROM filmes LIMIT 5;

-- Desfazendo a mudança.
UPDATE filmes SET vencedor = CASE 
WHEN vencedor = "1" 
THEN "Sim" ELSE "Não" END;
SELECT vencedor FROM filmes LIMIT 5;

-- UPDATE: indica que a operação a ser realizada é uma atualização de dados.
-- SET: define a coluna que será alterada, no caso, a coluna vencedor.
-- vencedor = CASE: inicia uma expressão CASE que determina o novo valor da coluna vencedor para cada linha da tabela.
-- WHEN vencedor = "1": verifica se o valor atual da coluna vencedor na linha atual é igual a "1".
-- THEN "Sim": se a condição for verdadeira, define o novo valor da coluna vencedor como "Sim".
-- ELSE "Não": se a condição for falsa (ou seja, o valor atual não é "1"), define o novo valor da coluna vencedor como "Não".
-- END: finaliza a expressão CASE.

-- 8- Em qual edição do Oscar "Crash" concorreu ao Oscar?
SELECT nome_filme, edicao_cerimonia FROM filmes 
WHERE nome_filme = "Crash";

-- 9- Bom... dê um Oscar para um filme que merece muito, mas não ganhou.
UPDATE filmes SET vencedor = "Sim" 
WHERE nome_filme = "Toy Story";

-- Explicação da consulta:
-- UPDATE nome_tabela: informa qual tabela você deseja atualizar. Substitua "nome_tabela" pelo nome real da sua tabela.
-- SET coluna_a_ser_atualizada = novo_valor: define a coluna que você deseja atualizar e o novo valor que ela deve conter.
-- [WHERE condição]: (opcional) Adicione uma cláusula WHERE para especificar quais linhas da tabela devem ser atualizadas. Se você omitir o WHERE, todas as linhas da tabela serão atualizadas.

-- 10- O filme "Central do Brasil" aparece no Oscar?
SELECT nome_filme FROM filmes 
WHERE nome_filme = "Central do Brasil";

-- 11- Inclua no banco 3 filmes que nunca foram nem nomeados ao Oscar, mas que merecem ser. 
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) 
VALUES ('2003', '2004', '75', 'CINEMATOGRAPHY', 'CINEMATOGRAPHY', '올드보이 (Oldeuboi)', 'Sim'); 

INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) 
VALUES ('2018', '2019', '99', 'DIRECTING (Comedy Picture)', 'DIRECTING (Comedy Picture)', 'Isle of Dogs', 'Sim');

INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) 
VALUES ('2005', '2006', '97', 'ART DIRECTION', 'ART DIRECTION', 'Constantine', 'Sim');

-- 12 - Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?
SELECT * FROM filmes
WHERE ano_cerimonia = 2012
and vencedor = "Sim" 
and (categoria = "ACTRESS IN A LEADING ROLE"
or categoria = "HONORARY AWARD" 
or categoria = "DIRECTING");
