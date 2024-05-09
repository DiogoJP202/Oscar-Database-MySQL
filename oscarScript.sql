use oscar_database;

-- 1- Quantas vezes Natalie Portman foi indicada ao Oscar?
SELECT * FROM filmes WHERE nome_do_indicado = "Natalie Portman" and vencedor = "sim";
-- SELECT * FROM usuario WHERE nome = "Diogo";
-- WHERE nome_do_indicado = "Natalie Portman"
-- 2- Quantos Oscars Natalie Portman ganhou?
SELECT COUNT(*) FROM filmes WHERE nome_do_indicado = "Natalie Portman" and vencedor = "sim";

-- 3- Amy Adams já ganhou algum Oscar?
SELECT COUNT(*) FROM filmes WHERE nome_do_indicado = "Amy Adams" and vencedor = "sim";

-- 4- A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT * FROM filmes WHERE nome_filme = "Toy Story" and vencedor = "sim";

-- 5- A partir de que ano que a categoria "Actress" deixa de existir? 
SELECT ano_filmagem, categoria FROM filmes WHERE categoria = "actress" ORDER BY ano_filmagem DESC LIMIT 1;

-- 6- O primeiro Oscar para melhor Atriz foi para quem? Em que ano?
SELECT nome_do_indicado, ano_filmagem FROM filmes WHERE categoria = "actress" ORDER BY ano_filmagem LIMIT 1;

-- 7- Na coluna/campo "Vencedor", altere todos os valores com "Sim" para 1 e todos os valores "Não" para 0.
UPDATE filmes SET vencedor = CASE WHEN vencedor = "Sim" THEN 1 ELSE 0 END;
UPDATE filmes SET vencedor = CASE WHEN vencedor = "1" THEN "Sim" ELSE "Não" END;

-- UPDATE: indica que a operação a ser realizada é uma atualização de dados.
-- SET: define a coluna que será alterada, no caso, a coluna vencedor.
-- vencedor = CASE: inicia uma expressão CASE que determina o novo valor da coluna vencedor para cada linha da tabela.
-- WHEN vencedor = "1": verifica se o valor atual da coluna vencedor na linha atual é igual a "1".
-- THEN "Sim": se a condição for verdadeira, define o novo valor da coluna vencedor como "Sim".
-- ELSE "Não": se a condição for falsa (ou seja, o valor atual não é "1"), define o novo valor da coluna vencedor como "Não".
-- END: finaliza a expressão CASE.

-- 8- Em qual edição do Oscar "Crash" concorreu ao Oscar?
SELECT edicao_cerimonia FROM filmes WHERE nome_filme = "Crash" and vencedor = "sim";

-- 9- Bom... dê um Oscar para um filme que merece muito, mas não ganhou.
UPDATE filmes SET vencedor = "Sim" WHERE nome_filme = "Toy Story";
-- Explicação da consulta:
-- UPDATE nome_tabela: informa qual tabela você deseja atualizar. Substitua "nome_tabela" pelo nome real da sua tabela.
-- SET coluna_a_ser_atualizada = novo_valor: define a coluna que você deseja atualizar e o novo valor que ela deve conter.
-- [WHERE condição]: (opcional) Adicione uma cláusula WHERE para especificar quais linhas da tabela devem ser atualizadas. Se você omitir o WHERE, todas as linhas da tabela serão atualizadas.

-- 10- O filme "Central do Brasil" aparece no Oscar?
SELECT nome_filme FROM filmes WHERE nome_filme = "Central do Brasil";
SELECT edicao_cerimonia, ano_cerimonia from filmes WHERE ano_cerimonia = 2003;

-- 11- Inclua no banco 3 filmes que nunca foram nem nomeados ao Oscar, mas que merecem ser. 
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) VALUES ('2003', '2004', '75', 'ACTOR', 'Best Original Screenplay', '올드보이 (Oldeuboi)', 'Sim'); 
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) VALUES ('1927', '1928', '1', 'ACTOR', 'Emil Jannings', 'The Last Command', 'Sim');
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) VALUES ('1927', '1928', '1', 'ACTRESS', 'Louise Dresser', 'A Ship Comes In', 'Não');

-- 12 - Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?
SELECT categoria FROM filmes WHERE ano_cerimonia = 2004 and categoria = "ACTRESS IN A LEADING ROLE" and categoria = "HONORARY AWARD" and categoria = "DIRECTING";