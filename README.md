# oscar_database
Este é um banco de dados do oscar e eu estarei fazendo algumas operaçõe utilizando **mySQL**.

1. Quantas vezes *Natalie Portman* foi indicada ao Oscar?
    ```mysql
      SELECT * FROM filmes WHERE nome_do_indicado = "Natalie Portman" and vencedor = "sim";
    ```
    ## Retorno
    |ano_filmagem|ano_cerimonia|edicao_cerimonia|categoria|nome_do_indicado|nome_filme|vencedor|
    |---|---|---|---|---|---|---|
    |9156|2010|2011|83|ACTRESS IN A LEADING ROLE|Natalie Portman|Black Swan|Sim|
   ### Resposta:
   > Podemos ver pela coluna "vencedor" que *Natalie Portman* foi indicada ao Oscar!
   ---
2. Quantos Oscars *Natalie Portman* ganhou?
   ```mysql
     SELECT COUNT(*) FROM filmes WHERE nome_do_indicado = "Natalie Portman" and vencedor = "sim";
   ```
   ## Retorno
    |COUNT(*)|
    |---|
    |1|
   ### Resposta:
   > Podemos ver pela coluna "COUNT(*)" que *Natalie Portman* foi indicada ao Oscar 1 vez!
   ---
3. *Amy Adams* já ganhou algum Oscar?
   ```mysql
     SELECT COUNT(*) FROM filmes WHERE nome_do_indicado = "Amy Adams" and vencedor = "sim";
   ```
   ## Retorno
    |COUNT(*)|
    |---|
    |1|
   ### Resposta:
   > Podemos ver pela coluna "COUNT(*)" que *Natalie Portman* não foi indicada ao Oscar nenhuma vez! :(
   ---
   
