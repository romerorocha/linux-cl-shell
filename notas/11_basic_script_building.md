# Noções básicas de construção de scripts

O shell permite encadear comandos em um único passo. Por exemplo, dois comandos na mesma linha, separados por ";": `date ; who`. Isso já conta como um shell script.

Mas, em vez disso, você pode combinar comandos dentro de um arquivo. Para tal, é preciso especificar qual shell será usado, na primeira linha do arquivo: `#!/bin/bash`. Em uma linha normal de shell script, o sinal `#` é usado para indicar um comentário de linha. Entretanto, a primeira linha do arquivo é um caso especial, e o sinal `#` seguido de `!` diz ao shell qual shell irá executar o script abaixo dela.

Uma vez escrito o script, para executá-lo, é necessária uma de duas coisas: ou adicioná-lo a uma pasta no PATH do sistema, ou chamá-lo a partir do seu caminho absoluto ou relativo. Para executar a segunda forma, você precisa dar permissão de execução a um arquivo.

O comando `echo` é utilizado para produzir mensagens. A opção `-n` para imprimir mensagens sem quebra de linha.

## Utilizando Variáveis

Variáveis permitem armazenar, temporariamente, informação dentro de um shell script para utilizar em outros comandos.

Pode-se referenciar variáveis de ambiente diretamente de dentro do script, utilizando `$`. Para utilizar o caractere '$' em mensagens, utiliza-se do escape `\$`.

Pode-se também utilizar o formato `${variável}`.

Além das variáveis de ambiente, também é possível utilizar variáveis próprias, que consiste em qualquer string de texto de até 20 caracteres do tipo letra, dígito ou underscore.

Variáveis de usuário são _case sensitive_, então `Var1` é diferente de `var1`.

Para obter-se o valor da variável local, usa-se `$`. Para lhe atribuir um valor, não.

## Substituição de Comandos

Uma das _features_ mais úteis de shell script é a habilidade de extrair informações da saída de um comando e atribuí-la a uma variável. Existem duas formas de fazer isso:

- O caractere crase
- O formato `$()`

A substituição de comandos cria o chamado **sub shell** para rodar o comando interno. Como ele é um filho do shell principal, não terá acesso a variáveis definidas no script, por exemplo.

Sub shells também podem acabar sendo criados dependendo da forma como se chama o script no prompt de comando. É preciso ter muito cuidado.

## Redirecionando a saída

- `comando > output_file` é a forma mais básica. Se o arquivo já existir, seu conteúdo é sobrescrito. Se não, é criado um arquivo e o conteúdo preenchido.
- `comando >> output_file` faz um _append_, não sobrescreve o conteúdo existente.

## Redirecionando a entrada

- `comando < input_file` pega o conteúdo de um arquivo e redireciona para um comando.

## Aplicando Pipes

Pipes servem para redirecionar a saída de um comando para outro comando.

O script:

```sh
rpm -qa > rpm.list
sort < rpm.list
```

pode mudar simplesmente para `rpm -qa | sort`.

## Realizando operações matemáticas

Existem duas formas de realizar operações matemáticas em shell scripting.

A primeira, é o comando `expr`. Por exemplo, `expr 1 + 5`. Essa forma é um pouco "desajeitada", pois muitos operadores se confundem com outras coisas em shell. Por exemplo, o asterisco em `expr 5 * 2`, que causa um erro de sintaxe, exigindo que se faça `expr 5 \* 2`.

A segunda forma é utilizando colchetes: `$[ operação ]`. Exemplo: `var1=$[1 + 5]`.

Uma grande limitação de operações matemáticas em shell scripting no Bash é que elas só suportam aritmética de inteiros. Já o **z shell (zsh)** provê aritmética de ponto flutuante.

No Bash, para contornar isso, existe o programa **bc**, uma calculadora embutida no bash, que suporta números, variáveis, comentários, expressões, _statements_ tipo _if-then_ e funções.

## Saindo do script

Quando o script executa o último comando, ele termina. Porém, existe uma forma mais elegante de terminar um script: um _exit status_. É um inteiro que indica ao shell que o processamento terminou, podendo assumir valores entre 0 e 255.

O Linux provê uma variável especial `$?` que guarda o status de saída do último comando executado. Por convenção, se o comando completou com sucesso, o valor é 0.

Alguns códigos geralmente utilizados (mas não são convenção):

- 0: comando completou com sucesso
- 1: erro geral desconhecido
- 2: comando shell usado de forma errada
- 126: o comando não pode executar
- 127: o comando não foi encontrado
- 128: argumento de saída inválido
- 128+x: erro fatal com o sinal Linux x
- 130: comando terminou com ctrl + c
- 255: status de saída _out of range_

Por padrão, um script shell irá terminar com o _exit status_ do seu último comando. Mas, o comando `exit` permite mudar o status no script.
