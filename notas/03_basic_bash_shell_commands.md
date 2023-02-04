# Comandos Básicos do Shell "Bash"

GNU Bash é o shell padrão utilizado em muitas distribuições Linux. ele provê acesso interativo ao sistema, roda como um programa como outro qualquer e é normalmente iniciado quando um usuário faz login no terminal.

O arquivo `/etc/passwd` contém a lista de usuários do sistema e, no último campo de cada linha, o shell atribuído a cada um deles, iniciado quando o usuário autentica no sistema. Mas, mesmo que seja assim, se o usuário fez login por uma interface gráfica, ele precisa de um emulador gráfico de terminal para obter acesso à CLI.

## Utilizando o Prompt do Shell

O prompt é apresentado assim que o emulador de terminal (ou console) entra. O símbolo de dólar ($) indica que o shell espera pela entrada de texto.

A maioria das distribuições linux incluem um manual para comandos shell e outras diversas ferramentas. O comando `man` provê acesso às páginas do manual, seguido pelo nome da entrada desejada. Por exemplo, `man hostname`.

Comandos geralmente seguem a seguinte estrutura: `COMMAND-NAME [OPTION]... [ARGUMENT]...`.

No uso de mais de uma opção, `comando -a -b` geralmente pode ser convertido em `comando -ab`.

A opção `-k` em `man -k terminal` procura por todos as entradas no manual relacionadas à palavra-chave terminal fornecida.

`man` não é a única opção. Também existem `info` pages e `help`. Muitos programas também aceitam a opção `-h` ou `--help`.

## Uma olhada no Sistema de Arquivos do Linux

A primeira diferença clara, em relação a sistemas de arquivos no Windows, é que o Linux não utiliza letras representando drives nos *pathnames*. O Windows diz, no *path*, exatamente em que partição física um arquivo se encontra. Não é o caso de sistemas Linux, que armazena arquivos em uma única estrutura de diretórios, chamada de diretório virtual, contendo todos os paths de arquivos de todos os dispositivos de armazenamento no computador.

Outra diferença é que o Linux utiliza `/` para denotar diretórios em um path, pois `\` é um caractere de escape e poderia ser problemático utilizá-lo no lugar do outro.

A estrutura do diretório virtual do Linux contém um único diretório base (raiz), chamado de *root*. Um caminho até um arquivo poderia ser: `/home/rich/Documents/test.doc`.

O arquivo `test.doc` está no diretório `Documents`, dentro do diretório `rich`, dentro do diretório `home`. O primeiro disco rígido instalado em um sistema Linux é chamado de *root drive* e ele contém o *core* do diretório virtual. Todo o resto é montado em cima disso.

No *root drive*, o Linux pode usar diretórios especiais como pontos de montagem (*mount points*), diretórios onde você pode atribuir dispositivos de armazenamento adicionais. Quando isso acontece, o Linux faz os diretórios e arquivos do dispositivos aparecerem debaixo do *mount point* indicado, mesmo que estejam fisicamente separados em um *drive* diferente.

É comum que arquivos de sistema sejam fisicamente armazenados no *root drive*, enquanto os arquivos de usuário são armazenados em outro e montado em um diretório como `/home`, por exemplo.

A estrutura do sistema de arquivos do Linux evoluiu da do Unix. Por isso, é comum o uso de alguns nomes de diretórios para funções comuns: `/` para root, `/bin` para binários de utilitários do GNU, `/boot` para os arquivos de boot do sistema, `/dev` para dispositivos (onde o Linux cria *device nodes*), `/etc` para configurações de sistema, `/home` para arquivos do usuário, `/lib` para bibliotecas de sistema e de aplicações, `/media` para mount points de dispositivos removíveis, `/mnt` para montagem temporárias de sistemas de arquivos, `/opt` para software opcional de terceiros, `/proc` para processos do sistema, `/sbin` para binários de ferramentas de administração do sistema, `/sys` para os arquivos de sistemas, dispositivos, drivers e outras informações do kernel, `/tmp` para arquivos temporários, `/usr` para arquivos de usuário, `/var` para arquivos que mudam frequentemente como se fosse variáveis (tipo logs, por exemplo), entre outros.

Em um sistema CentOS, por exemplo, o diretório root tipicamente possui os seguintes diretórios:

```sh
bin  dev home lib64 mnt proc run  srv tmp var
boot etc lib  media opt root sbin sys usr
```

O diretório `/usr` merece menção especial. Ele é um agrupador de diretórios secundário, contendo arquivos somente-leitura que são compartilháveis. Lá geralmente são encontrados comandos de usuários, arquivos de código-fonte, jogos e etc.

Todos esses nomes de diretórios comuns são baseados no [Filesystem Hierarchy Standard](http://refspecs.linuxfoundation.org/fhs.shtml) (FHS), que é um padrão mantido e ocasionalmente atualizado.

Quando o usuário faz login e acessa a CLI do shell, a sessão é iniciada com o prompt apontando para o diretório *home*. Para mudar de diretório, utiliza-se o comando `cd` (change destination), que aceita referências relativas ou absolutas de diretórios como argumento. Referências absolutas começam com `/`, que indica o diretório *root*. Referências relativas não começam por `/`. Geralmente iniciam com um nome ou um caractere especial, como `.`, `..` ou `~`.

O comando `pwd` mostra o caminho completo do diretório corrente do prompt do shell.

## Listando Arquivos e Diretórios

O comando `ls`, na sua forma mais básica, exibe os arquivos e diretórios localizado no diretório corrente. Algumas opções:

- `-F` para diferenciar arquivos texto, arquivos executáveis e diretórios
- `-a` mostra também arquivos ocultos (iniciados com ".")
- `-R` faz a listagem ser recursiva em subdiretórios
- `-l` converte para exibição em lista, em vez de colunas, contendo informações dos arquivos e pastas, como: tipo de arquivo, permissões, número de hard links, username do owner, primary group name, tamanho em bytes, última modificação e, finalmente, o nome do arquivo ou diretório.

`ls -l <diretório>` irá listar na forma longa o conteúdo do diretório. Se quiser listas apenas o nome e os dados daquele diretório, o usuário deverá chamar `ls -ld <diretório>`.

### Filtering

O comando `ls` também permite filtrar os resultados. Fornecendo um nome, traz apenas o arquivo com aquele nome. Também há a possibilidade de utilizar caracteres coringas, como `?` para um caractere e `*` representando qualquer número de caracteres.

O processo de realizar *pattern matching* com caracteres coringa é chamado de *file globbing*. O nome oficial de caracteres coringas é *metacharacter wildcards*.

Também é possível utilizar `[]` para denotar escolhas potenciais. Por exemplo, `ls -l my_scr[ai]pt` traz `my_script` e `my_scrapt` como resultado, mas não traz `my_scrypt`. Um range alfabético também seria possível, com `[a-d]`, por exemplo.

## Manipulando Arquivos

O comando `touch` cria um arquivo vazio e atribui o seu *username* como seu *owner*. Se o arquivo já existir, apenas atualiza o timestamp da última modificação.

`cp` copia um arquivo de uma origem para um destino. Detalhe importante: por garantia, usar um `/` no final do caminho de destino, se ele referenciar um diretório, evitando que acidentalmente seja criado um arquivo com esse nome no diretório anterior: `cp test-one /home/user/Documents/`.

Em caminhos relativos, `.` representa o diretório corrente e `..` o diretório pai.

A opção `-R` permite copiar, recursivamente, todo o conteúdo de um diretório para outro.

## Criando links de arquivos

Se o usuário precisa manter uma ou mais cópias do mesmo arquivo no sistema, em vez de criar cópias físicas separadas, ele pode criar uma cópia física e múltiplas cópias virtuais, chamadas de links.

Um link é um marcador de posição em um diretório que aponta para a localização real de um arquivo. Existem dois tipos:

- Um **link simbólico**, também chamado de *soft link*, é apenas um arquivo físico que aponta para outro arquivo em algum lugar da estrutura virtual de diretórios. Os dois arquivos ligados não compartilham o mesmo conteúdo. Para criar um link simbólico para um outro arquivo, usa-se `ln -s nome_arquivo nome_slink`.

- Um **hard link** cria um arquivo virtual separado que contém informações sobre o arquivo original e onde localizá-lo. Contudo, os dois arquivos são o mesmo arquivo físico. Para criar um *hard link* a opção `-s` não é necessária:  `ln nome_arquivo nome_hlink`.

## Renomeando arquivos

`mv nome_atual novo_nome` é o comando utilizado para renomear arquivos. Isso porque, no mundo Linux, chamamos "renomear arquivos" também de "mover arquivos".

Também se usa o comando `mv` para mudar a localização de um arquivo: `mv /home/user/a.md /home/user/Documents/` irá mover o arquivo "a.md" para dentro do diretório "Documents".

Assim como no comando `cp`, é possível utilizar a opção `-i` para fazer a operação no modo interativo.

Pode-se mover de lugar e renomear o arquivo de uma só vez e também pode-se mover diretórios.

## Deletando arquivos

No mundo Linux, a operação deletar também é conhecida como **remover**. O comando é `rm <nome_do_arquivo>`.

Alguns consideram uma boa prática sempre utilizar a opção `-i`, para confirmar se o arquivo correto está sendo removido.

## Gerenciando Diretórios

- Criar diretório: `mkdir Novo_Dir`
- Criar diretório e subdiretórios: `mkdir -p Novo_Dir/SubDir/SubDir`
- Deletar diretório: `rmdir Nome_Dir` (só funciona em diretórios vazios)
- Deletar diretórios vazios ou não: `rm -r TestDir`

A forma mais bruta de remover um arquivo é com `rm -rf`, que sai apagando tudo sem mensagens nem avisos.

## Visualizando conteúdos de arquivos

- Ver o tipo de arquivo/diretório/link: `file <nome>`
- Ver o conteúdo do arquivo: `cat <nome>` (`-n` ou `-b` numera as linhas)
- Ver conteúdo com navegação: `more` e `less`
- Exibir as últimas linhas (default: 10): `tail nome`
- Exibir últimas linhas e continuar atualizando: `tail -f nome`
- Exibir primeiras linhas: `head nome`
