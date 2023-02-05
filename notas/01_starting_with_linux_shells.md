# Starting with Linux Shells

As quatro partes principais de um sistema Linux são:

- O kernel Linux
- Os utilitários GNU
- Um ambiente de desktop gráfico
- Software de aplicações

Cada uma dessa partes tem um trabalho específico no sistema e nenhuma é muito útil sem as outras.

## Kernel

O core do sistema Linux é o seu kernel. Ele controla tudo, alocando hardware quando necessário e executando software quando for requerido. São 5 funções principais: gerenciamento de memória do sistema, gerenciamento de programas de software, gerenciamento de hardware e gerenciamento do sistema de arquivos.

### Gerenciamento de Software

O kernel chama cada programa em execução de **processo**. Um processo pode rodar em primeiro ou segundo plano. O kernel controla como o sistema gerencia todos os processos em execução no sistema. Ele cria o primeiro processo, chamado de _init_, para iniciar todos os outros processos do sistema. Quando o kernel inicia, carrega o processo _init_ na memória virtual e cada processo adicional também ganha um lugar único nela para armazenar seus dados e o código que ele utiliza.

Os dois tipos mais populares de implementações de processos _init_ são _SysVinit_ e _systemd_. O segundo se tornou o sistema de gerenciamento e inicialização de processos mais popular nas distribuições Linux.

O _systemd_ se tornou popular porque tem a habilidade de iniciar processos com base em diferentes eventos:

- No boot do sistema
- Quando um dispositivo particular de hardware é conectado
- Quando um serviço é iniciado
- Quando uma conexão de rede é estabelecida
- Quando um timer expira

Ele funciona ligando eventos a arquivos _unit_. Cada arquivo desse tipo define um programa para rodar quando o evento ocorre. O programa _systemctl_ permite ao usuário iniciar, parar e listar _unit files_ rodando atualmente no sistema.

O _systemd_ agrupa _unit files_ em _targets_. Um _target_ define um estado específico do sistema Linux. Quando o sistema inicia, o `default.target` define todos os _unit files_ a iniciar. Para ver o seu conteúdo:

```sh
systemctl get-default
```

### Gerenciamento de Hardware

Qualquer dispositivo com o qual o sistema Linux precisa se comunicar, carece de código-fonte de drivers inserido dentro do código do kernel. O driver permite ao kernel trafegar dados indo e voltando do dispositivo, atuando como um intermediário entre aplicações e hardware. Isso pode ser feito de duas maneiras:

- Compilando drivers dentro do kernel
- Adicionando módulos de drivers ao kernel

O primeiro exigia que o kernel fosse recompilado toda vez que um novo dispositivo com um novo driver fosse adicionado. O conceito de módulos permitiu que as adições fossem feitas ao kernel que já está rodando, sem a necessidade de nova compilação. Essa mudança simplificou bastante o uso de hardware com Linux.

O sistema Linux identifica dispositivos de hardware como arquivos especiais, chamados de _device files_. São classificados em 3 tipos:

- Character: para dispositivos que tratam os dados um caractere por vez, como modems modernos;
- Block: para dispositivos que tratam grandes blocos de dados de uma vez, como HDs;
- Network: para dispositivos que usam pacotes para enviar e receber dados, como placas de rede.

O Linux cria arquivos especiais denominados _nodes_ para cada dispositivo do sistema, sendo toda a comunicação com um dispositivo feita através de seu _node_. Cada _node_ possui um identificador único, que consiste em um par de números (_major_ e _minor_). Dispositivos similares possuem o mesmo _major number_, sendo diferenciados pelo _minor_.

### Gerenciamento de Arquivos

Ao contrário de outros sistemas operacionais, o kernel do Linux pode suportar diferentes tipos de sistemas de arquivos para ler e escrever dados em discos rígidos, inclusive tipos oriundos de outros SOs.

O kernel interage com cada sistema de arquivos através do _Virtual File System_, que provê uma interface comum de comunicação. O VFS faz _cache_ de informações em memória quando o sistemas de arquivo é montado e utilizado.

## Utilitários GNU

Juntos, o kernel Linux e os utilitários GNU formam um sistema operacional completo, funcional e livre. Alguns puristas chamam o SO de GNU/Linux, outras pessoas apenas de Linux.

### Core GNU utilities

O projeto GNU portou muitas ferramentas de linha de comando comuns em sistemas Unix. Esse pacote de _core utilities_ fornecido para sistemas Linux é chamado de **coreutils** e consiste em 3 partes:

- Utilitários para lidar com arquivos
- Utilitários para manipular texto
- Utilitários para gerenciamento de processos

### O shell

Um utilitário interativo especial, que provê uma forma dos usuários iniciar programas, gerenciar arquivos e processos no sistema Linux. O cerne do shell é o seu _prompt_ de comando, que permite a entrada de comandos de texto, interpretando e executando eles no kernel.

O shell possui comandos internos que você usa para copiar, mover e renomear arquivos, exibir programas que estão rodando e parar a execução deles. Mas, além dos comandos internos, o shell permite que o usuário chame programas pelo nome, que ele repassa para o kernel para execução.

Você pode, então, agrupar comandos shell em um arquivo, que pode ser executado como um programa. Esse tipo de arquivo é chamado de **shell script**.

Existe uma boa quantidade de shells disponíveis para sistemas Linux, com diferentes características. O padrão, na maioria das distribuições, é o Bash (Bourne again shell), desenvolvido pelo projeto GNU como um substituto para o Bourne shell do Unix.

## O ambiente desktop Linux

Nos seus primeiros dias, tudo o que estava disponível no Linux era uma simples interface em modo texto. Com a popularidade do Microsoft Windows, usuários de computador começaram a esperar mais das interfaces dos computadores e os primeiros desktops gráficos para Linux apareceram.

### X Window

Para saber como exibir gráficos bonitos no computador, o software Linux precisa saber como conversar com a placa de vídeo e com o monitor. O software **X Window** é um programa baixo nível, que trabalha como peça central, direto com a placa de vídeo e com o monitor e controla a apresentação de elementos gráficos.

No mundo Linux, alguns pacotes de software implementam X Window, como os conhecidos **X.org** e **Wayland**.

O primeiro é mais velho, baseado no X11 do Unix, sendo que muitas distribuições Linux estão migrando para o Wayland, mais seguro e fácil de manter. Durante a instalação do sistema Linux, o programa realiza a detecção da sua placa de vídeo e monitor, além dos modos de vídeo disponíveis e grava tudo em um arquivo de configuração X Window.

O software X Window fornece um **ambiente de exibição gráfica**, nada mais. Serviria até para rodar aplicações individuais, mas não é útil para nosso uso do dia a dia, onde precisamos de um **ambiente desktop** por cima do X Window, que permita executar múltiplos programas e manipular arquivos. São exemplos de ambientes desktop:

- Mais "ricos" e, consequentemente, pesados: KDE Plasma, GNOME desktop, Cinnamon e MATE;
- Mais "pobres" e leves: Fluxbox, Xfce, JWM;

## Distribuições Linux

Um pacote completo de sistema Linux é chamado de distribuição, que junta todas essas partes necessárias para o sistema rodar. Geralmente, uma distribuição é preparada para um grupo específico de usuários, como negócios, entusiastas de multimídia, desenvolvedores de software ou o usuário comum caseiro.

Podem ser classificadas em "distribuições _full-core_" ou "distribuições especializadas".

Distribuições _Core Linux_ contém o kernel, um ou mais ambientes desktop e um monte de aplicações Linux que estão disponíveis, pré-compiladas para o kernel. Tudo instalado de uma só vez: Slackware, Red Hat Enterprise, Gentoo, openSUSE, Debian.

Já as distribuições especializadas são baseadas nas distribuições principais, porém contendo apenas um subconjunto das aplicações base e adicionando outras que fazem sentido para seu público final. Automaticamente detectam e configuram dispositivos de hardware comuns. Fedora, Ubuntu, MX Linux, Linux Mint e Puppy Linux são exemplos.
