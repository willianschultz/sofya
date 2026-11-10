# Interface

A interface atual tem três partes pequenas. `scenes/main_menu.tscn` é a tela inicial; o nó `Interface` em `scenes/main.tscn` é um `CanvasLayer` que contém o `Label` `Instructions`; e a confirmação `Fase concluída!` fica no portal em `scenes/level_exit.tscn`. `CanvasLayer` mantém o texto fixo na tela mesmo quando a câmera se move.

## Tela inicial

A tela inicial possui três ações:

- **Novo jogo:** apaga o progresso anterior e abre a fase 1.
- **Continuar:** aparece apenas quando a fase 2 foi desbloqueada e abre essa fase.
- **Apagar progresso:** pede um segundo clique de confirmação antes de apagar o arquivo salvo.

Os botões e textos ficam dentro do nó `Content` de `main_menu.tscn`. O comportamento fica em `scripts/main_menu.gd`; mantenha os nomes dos nós ao reorganizar a cena, pois o script os localiza por caminho.

## Alterar textos e posição

1. Abra `scenes/main.tscn`.
2. Na árvore, expanda `Interface` e selecione `Instructions`.
3. No Inspector, altere **Text**.
4. Altere **Layout > Transform > Position** para mover o texto.

Menus, telas de vida, pausa e controles na tela ainda não fazem parte da primeira entrega. Quando forem criados, cada tela deve ficar em sua própria cena somente se tiver comportamento próprio; um texto ou botão simples pode continuar na cena que o utiliza.

## Controles mobile

Controles mobile ainda não foram implementados. A futura versão deverá usar botões grandes na interface e enviar as mesmas ações já existentes (`move_left`, `move_right`, `run`, `jump`, `crouch`). Assim, `player.gd` continuará simples e não precisará saber se o comando veio do teclado ou da tela.
