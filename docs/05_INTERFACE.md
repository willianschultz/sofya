# Interface

A interface atual é propositalmente pequena: o nó `Interface` em `scenes/main.tscn` é um `CanvasLayer` que contém o `Label` `Instructions`. `CanvasLayer` mantém o texto fixo na tela mesmo quando a câmera se move.

## Alterar textos e posição

1. Abra `scenes/main.tscn`.
2. Na árvore, expanda `Interface` e selecione `Instructions`.
3. No Inspector, altere **Text**.
4. Altere **Layout > Transform > Position** para mover o texto.

Menus, telas de vida, pausa e controles na tela ainda não fazem parte da primeira entrega. Quando forem criados, cada tela deve ficar em sua própria cena somente se tiver comportamento próprio; um texto ou botão simples pode continuar na cena que o utiliza.

## Controles mobile

Controles mobile ainda não foram implementados. A futura versão deverá usar botões grandes na interface e enviar as mesmas ações já existentes (`move_left`, `move_right`, `run`, `jump`, `crouch`). Assim, `player.gd` continuará simples e não precisará saber se o comando veio do teclado ou da tela.
