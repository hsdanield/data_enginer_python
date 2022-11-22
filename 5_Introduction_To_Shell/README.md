# Introdução ao shell

## Como o shell se compara a uma interface de desktop?

Em um sistema operacional como Windows, Linux ou Mac OS, é um tipo especial de programa. Ele controla o processador, o disco rígido e a conexão de rede, mas uma das funções mais importante é executar outros programas.

Nós seres humanos precisamos de uma interface para interagir com o sistema operacional. O mais comum nos dias de hoje é um explorador de arquivos, que por exemplo traduz clicks em comandos para abrir e rodar programas. Antes dos computadores terem exibições gráficas, as pessoas digiavam instruções em um programa chamado. Cada comando que é enviado para o shell, ele exibe uma saida legivel para humanos. 
Com comandos podemos "soletrar" para o computador o que desejamos fazer, combinando-os e criando automações.

## Comandos Básicos

Copiar Arquivo
```datacode
#1 arquivo
cp origem/original.txt destino/duplicate.txt

#2 arquivo
cp origem/original1.txt origem/original2.txt destino
```

Mover Arquivo
```datacode
#Movendo dois arquivo
mv origem/original2.txt origem/original1.txt destino

```
Renomear nome do arquivo
```datacode
mv course.txt old-course.txt
```

Deletar Arquivo e Diretorio
```datacode
#Removendo arquivo
rm arquivo.txt 

#Removendo diretorio (precisa estar vazio)
rm diretorio
```

Criando Diretorio
```datacode
mkdir diretorio
```

Print Arquivo
```datacode
cat file.txt

#Primeiras linhas / parametros (-n <numero>) 
head -n 5 file.txt
```

Ler Mais de um arquivo, adicionando em uma fila
```datacode
#:n (para mover entre os arquivos), :q (para finalizar)
less seasonal/spring.csv seasonal/summer.csv
```

Ler todos os diretorios e seus conteudos 
```datacode
ls -R
```
Manual do comando
```datacode
man <command>
```

Selecionando e cortando um arquivo
```datacode
# -f 2-5,8 significa: Coluna 2 a 5 e coluna 8; 
# -d : delimitador
cut -f 2-5,8 -d , values.csv

#delimitador , primeira Coluna do arquivo 
cut -d , -f 1 seasonal/spring.csv

#Arquivo delimitado por virgula, segunda coluna omitindo Coluna (retornar somente linhas)
cut -d , -f 2 file.csv | grep -v Column
```

Historico dos comandos
```datacode
history
```

Greep
* -c: imprime uma contagem de linhas correspondentes em vez das próprias linhas
* -h: não imprime os nomes dos arquivos ao pesquisar vários arquivos
* --i: ignora o caso (por exemplo, trata "Regressão" e "regressão" como correspondências)
* -l: imprime os nomes dos arquivos que contêm correspondências, não as correspondências
* -n: imprime números de linha para linhas correspondentes
* -v: inverte a correspondência, ou seja, mostra apenas as linhas que não correspondem
```datacode
#Buscando linhas que contem a palavra abacate
grep abacate diretorio/arquivo.txt

#Buscando linhas que NÃO contem a palavra abacate e numerando as linhas
grep abacate -v -n diretorio/arquivo.txt

#Contando o numero de linhas QUE CONTEM A PALAVRA ABACATE
grep abacate -c diretorio/arquivo.txt

#Contando numero vezes que a data aparece no arquivo
grep 2017-07 -wc seasonal/spring.csv

#Imprimindo uma coluna de um arquivo csv, e ordenando em ordem alfabetica
cut -d , -f 2 diretorio/file.csv | grep -v OmitirColuna | sort -r```

#Imprimindo uma coluna de um arquivo csv, ordenando em ordem alfabetica e retornando apenas as palavras unicas com a quantidade de repetição
cut -d , -f 2 seasonal/winter.csv | grep -v Tooth | sort | uniq -c

Salvando linhas de um arquivo em outro
```datacode
#salvando ultimas 5 linhas em outro arquivo
tail -n 5 seasonal/winter.csv > last.csv
```
Corings
* ?: corresponde a um único caractere, portanto, 201?.txt corresponderá a 2017.txt ou 2018.txt, mas não a 2017-01.txt.
* [...]: corresponde a qualquer um dos caracteres dentro dos colchetes, então 201[78].txt corresponde a 2017.txt ou 2018.txt, mas não a 2016.txt.
* {...}: corresponde a qualquer um dos padrões separados por vírgula dentro das chaves, portanto, {*.txt, *.csv} corresponde a qualquer arquivo cujo nome termine com .txt ou .csv, mas não arquivos cujos nomes terminem com .pdf .

Contagem de linhas para cada arquivo
```codeblock
wc -l seasonal/*.csv
```

Encontrando Variáveis de Ambiente
```codeblock
set | grep ENV
```
Criando variável local e Looping
```codeblock
testing=diretorio/file.csv

for filetype in docx odt pdf; do echo $filetype; done
<<output
    docx
    odt
    pdf
>>
```

Executando varios comandos com loop
```codeblock
for file in seasonal/*csv; do grep 2017-07 $file | tail -n 1; done
```
Criando arquivo .sh

* Criando arquivo executavel, $@ variável passada como parametro
  * nano count-records.sh
  * conteudo -> tail -q -n +2 $@ | wc -l 
  * bash count-records.sh seasonal/*.csv > num-records.out
