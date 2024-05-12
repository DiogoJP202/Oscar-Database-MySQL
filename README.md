# oscar_database
Este é um banco de dados do oscar e eu estarei fazendo algumas operaçõe utilizando **mySQL**.

1. Quantas vezes *Natalie Portman* foi indicada ao Oscar?
```mysql
    SELECT COUNT(vencedor)
    FROM filmes 
    WHERE nome_do_indicado = "Natalie Portman";
```
## Retorno
|COUNT(vencedor)|
|---|
|3|
### Resposta:
> Podemos ver pela coluna "COUNT(vencedor)" que *Natalie Portman* foi indicada ao Oscar 3 vesez!
---
2. Quantos Oscars *Natalie Portman* ganhou?
```mysql
    SELECT COUNT(vencedor)
    FROM filmes 
    WHERE nome_do_indicado = "Natalie Portman" 
    AND vencedor = "sim"
    LIMIT 1;
```
## Retorno
|vencedor|
|---|
|Sim|
### Resposta:
> Podemos ver pela coluna "COUNT(vencedor)" que *Natalie Portman* foi indicada ao Oscar 1 vez!
---
3. *Amy Adams* já ganhou algum Oscar?
```mysql
    SELECT vencedor 
    FROM filmes 
    WHERE nome_do_indicado = "Amy Adams" 
    AND vencedor = "sim" 
    LIMIT 1;   
```
## Retorno
|vencedor|
|---|
|-|
### Resposta:
> Podemos ver pela coluna "vencedor" que *Amy Adams* não foi indicada ao Oscar nenhuma vez! :(
---
4. A série de filmes *Toy Story* ganhou um Oscar em quais anos?
```mysql
    SELECT nome_filme, ano_filmagem 
    FROM filmes 
    WHERE nome_filme LIKE "%Toy Story%" 
    AND vencedor = "sim";   
```
## Retorno
|nome_filme|ano_filmagem|
|---|---|
|Toy Story 3|2010|
|Toy Story 3|2010|
|Toy Story 4|2019|
### Resposta:
> Podemos extrair desses dados que a série de *Toy Story* ganhou Oscars no ano de 2010 e 2019.
---
5. 5- A partir de que ano que a categoria "Actress" deixa de existir? 
```mysql
    SELECT ano_filmagem, categoria 
    FROM filmes 
    WHERE categoria LIKE "%actress%" 
    ORDER BY ano_filmagem DESC 
    LIMIT 1;  
```
## Retorno
|ano_filmagem|categoria|
|---|---|
|2019|ACTRESS IN A SUPPORTING ROLE|
### Resposta:
> Podemos extrair desses dados que a categoria de "actress" deixou de existir a partir do ano de 2019.
---
6. O primeiro Oscar para melhor Atriz foi para quem? Em que ano?
```mysql
    SELECT nome_do_indicado, ano_filmagem, categoria
    FROM filmes 
    WHERE categoria LIKE "%actress%" 
    ORDER BY ano_filmagem 
    LIMIT 1;
```
## Retorno
|nome_indicado|categoria|ano_filmagem|
|---|---|---|
|Louise Dresser|ACTRESS|1927|
### Resposta:
> Podemos extrair desses dados que o primeiro prêmio da categoria "actress" foi para "Louise Dresser" em "1927".
---
7. Na coluna/campo "Vencedor", altere todos os valores com "Sim" para 1 e todos os valores "Não" para 0.
```mysql
    UPDATE filmes SET vencedor = CASE
    WHEN vencedor = "Sim" 
    THEN 1 ELSE 0 END;
    SELECT vencedor FROM filmes LIMIT 5;
    
    -- Desfazendo a mudança.
    UPDATE filmes SET vencedor = CASE 
    WHEN vencedor = "1" 
    THEN "Sim" ELSE "Não" END;
    SELECT vencedor FROM filmes LIMIT 5;
```
## Retorno 1
|vencedor|
|---|
|0|
|1|
|0|
|1|
|0|
## Retorno 2
|vencedor|
|---|
|Não|
|Sim|
|Não|
|Sim|
|Não|
### Observações 
- **UPDATE:** indica que a operação a ser realizada é uma atualização de dados.
- **SET:** define a coluna que será alterada, no caso, a coluna vencedor.
- vencedor = **CASE:** inicia uma expressão CASE que determina o novo valor da coluna vencedor para cada linha da tabela.
- **WHEN** vencedor = "1": verifica se o valor atual da coluna vencedor na linha atual é igual a "1".
- **THEN** "Sim": se a condição for verdadeira, define o novo valor da coluna vencedor como "Sim".
- **ELSE** "Não": se a condição for falsa (ou seja, o valor atual não é "1"), define o novo valor da coluna vencedor como "Não".
- **END:** finaliza a expressão **CASE**.
---
8. Em qual edição do Oscar "Crash" concorreu ao Oscar?
```mysql
    SELECT nome_filme, edicao_cerimonia FROM filmes 
    WHERE nome_filme = "Crash";
```
## Retorno
|nome_filme|edicao_cerimonial|
|---|---|
|Crash|78|
|Crash|78|
|Crash|78|
|Crash|78|
|Crash|78|
|Crash|78|
### Resposta:
> Podemos extrair desses dados que "Crash" concorreu a edição "78".
---
9- Bom... dê um Oscar para um filme que merece muito, mas não ganhou.
```mysql
    UPDATE filmes SET vencedor = "Sim" 
    WHERE nome_filme = "Toy Story";
```
### Observação:
> Em 1995, Toy Story não ganhou nenhum primeiro, então decidir dar um prêmio a ele, embora não ouvesse prêmio de animação.

### Explicação da consulta:
- **UPDATE nome_tabela:** informa qual tabela você deseja atualizar. Substitua "nome_tabela" pelo nome real da sua tabela.
- **SET coluna_a_ser_atualizada = novo_valor:** define a coluna que você deseja atualizar e o novo valor que ela deve conter.
- **[WHERE condição]:** (opcional) Adicione uma cláusula WHERE para especificar quais linhas da tabela devem ser atualizadas. Se você omitir o WHERE, todas as linhas da tabela serão atualizadas.
---
10. O filme "Central do Brasil" aparece no Oscar?
```mysql
    SELECT nome_filme FROM filmes 
    WHERE nome_filme = "Central do Brasil";
```
## Retorno
|nome_filme|
|---|
|-|
### Resposta:
> Podemos extrair desses dados que "Central do Brasil" não consta nessa base de dados.
---
11. Inclua no banco 3 filmes que nunca foram nem nomeados ao Oscar, mas que merecem ser. 
```mysql
    INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor)
    VALUES ('2003', '2004', '75', 'CINEMATOGRAPHY', 'CINEMATOGRAPHY', '올드보이 (Oldeuboi)', 'Sim');

    INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor)
    VALUES ('2018', '2019', '99', 'DIRECTING (Comedy Picture)', 'DIRECTING (Comedy Picture)', 'Isle of Dogs', 'Sim');

    INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor)
    VALUES ('2005', '2006', '97', 'ART DIRECTION', 'ART DIRECTION', 'Constantine', 'Sim');
```
---
12. Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?
```mysql
    SELECT * FROM filmes 
    WHERE ano_cerimonia = 2004 
    or categoria = "ACTRESS IN A LEADING ROLE" 
    or categoria = "HONORARY AWARD" 
    or categoria = "DIRECTING";
```
## Retorno
|id_registro|ano_filmage|ano_cerimonia|edicao_cerimonia|categoria|nome_do_indicado|nome_filme|vencedor|
|---|---|---|---|---|---|---|---|
|9280|2011|2012|84|ACTRESS IN A LEADING ROLE|Meryl Streep|The Iron Lady|Sim|
|9307|2011|2012|84|DIRECTING|Michel Hazanavicius|The Artist|Sim|
|9387|2011|2012|84|HONORARY AWARD|James Earl Jones|legacy of consistent excellence and uncommon versatility|Sim|
|9388|2011|2012|84|HONORARY AWARD|Dick Smith|unparalleled mastery of texture|Sim|
