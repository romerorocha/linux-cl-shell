# Getting to the shell

## Terminais "Console"

Uma das formas de ter acesso à CLI do Linux, uma vez que o sistema não se limita mais a um simples "terminal burro", é rodando ele no modo texto. Esse modo é chamado de **console Linux**, porque emula os dias antigos de um terminal como interface direta de sistema.

Quando o sistema inicia, ele cria vários consoles virtuais, sessões de terminal que rodam na memória e você pode acessá-los através de atalhos de teclado.

Quando acessado, geralmente o console exibe uma informação como "tty2", que significa que é o console virtual 2, criado pelo sistema. O comando "tty" também irá exibir essa informação.

Vale salientar que, dentro de um console, não é possível executar nenhum aplicativo gráfico. Mas, uma vez dentro dele, é possível disparar alguns comandos para configurar e melhorar (um pouco) a experiência visual, como mudar as cores de fundo e fonte.

## Terminais Gráficos

A alternativa aos consoles é o uso de um pacote de emulação de terminal de dentro da interface gráfica do ambiente desktop. A experiência completa é composta de:

- Client: uma aplicação faz requests a serviços gráficos, como o GNOME Shell e o KDE Plasma;
- Display Server: Wayland, X Window System;
- Window Manager: Elemento que adiciona bordas a janelas e provê funcionalidades como mover e organizar elas, como Mutter e Metacity;
- Widgets Library: Elementos que adicionam menus e itens de aparência, como Plasmoids e Cinnamon Spices.

Soluções completas populares: GNOME Terminal, Terminator, Konsole e xterm.
