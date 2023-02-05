# Usando comandos de estrutura

Existem comandos que permitem que o shell evite seções do script com base em condições e no fluxo de operações. Esses são chamados de _comandos estruturados_.

## Statement if-then

```sh
if command
then
    commands
fi
# ou
if command; then
    commands
fi
```

Em outras linguagens de programação, o objeto depois de um if é uma expressão que é avaliada para _true_ ou _false_. O `if` do Bash não funciona assim.

O `if` do Bash executa o comando definido na primeira linha. Se o status de saída do comando é zero, o bloco de comandos dentro do `then` é executado. Se for qualquer outro código, o shell move o fluxo para o próximo comando do script.

### Statement if-then-else

```sh
if command
then
    commands
else
    commands
fi
```

O bash permite que as estruturas acima sejam aninhadas a gosto. E permite fazê-lo de forma mais organizada também:

```sh
if command1
then
    commands
elif command2
then
    commands
fi
```

### O comando "test"

Existe um utilitário do Bash que ajuda a avaliar coisas além de status de saída de comandos: o comando _test_. Qualquer condição que ele receber e avaliar como _true_, ele retornará um _exit status_ zero.

```sh
if test condition
then
    commands
fi
```

O bash provê uma forma alternativa de testar a condição sem declarar o comando test:

```sh
if [ condition ]
then
    commands
fi
```

Essas duas formas podem realizar 3 tipos de comparações: numéricas, de strings e de arquivos.

As comparações numéricas usam operadores como `-eq`, `-ge`, `-gt`, `-le`, `-lt` e `-ne`.

Bash só realiza comparações usando `test` com números inteiros, não com números de ponto flutuante.

As comparações com strings usam os operadores `= != < > -n -z` e podem ser capciosas.

`-n` verifica se tem length maior que zero.
`-z` se tem length zero.
`>` e `<` dependem de um caractere de _escape_, para não conflitar com os símbolos de redirecionamento de entrada ou saída.

### Comparações de arquivos

São as comparações mais poderosas e usadas de shell scripting. Os operadores são:

`-d file`: se o arquivo existe e é um diretório
`-e file`: se o arquivo existe
`-f file`: se o arquivo existe e é um arquivo
`-r file`: se o arquivo existe e pode ser lido
`-s file`: se o arquivo existe e não está vazio
`-w file`: se o arquivo existe e pode ser escrito
`-x file`: se o arquivo existe e é executável
`-O file`: se o arquivo existe e é propriedade do usuário corrente
`-G file`: se o arquivo existe e o seu grupo padrão é o mesmo do usuário padrão
`file1 -nt file2`: se file1 é mais novo que file2
`file1 -ot file2`: se file1 é mais antigo que file2
