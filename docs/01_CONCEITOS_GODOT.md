# Conceitos básicos da Godot no SOFYA

## Cena

Uma **cena** é uma unidade reutilizável formada por nós. Em Delphi, pense em um formulário salvo em arquivo; em JavaScript, pense em um componente com sua estrutura. `scenes/player.tscn` é a cena da Sofya e `scenes/main.tscn` é a fase de testes.

## Nó

Um **nó** é uma peça da cena. A árvore de nós mostra quem contém quem. Na cena da Sofya, o nó raiz `Player` é um `CharacterBody2D`; seus filhos desenham o retângulo, definem sua colisão, verificam o espaço acima e controlam a câmera.

## Script e GDScript

Um **script** contém o comportamento de um nó. `scripts/player.gd` está ligado ao nó `Player`. **GDScript** é a linguagem da Godot: `func` declara uma função, `var` cria uma variável e a indentação define os blocos. O método `_physics_process` é chamado regularmente pelo motor de física, como um evento periódico.

## Sinais

**Sinais** são notificações emitidas por nós. São parecidos com eventos de componentes em Delphi ou `addEventListener` em JavaScript. Esta primeira entrega usa consultas diretas de entrada para manter o código simples, mas menus e itens podem usar sinais depois, por exemplo `button.pressed.connect(on_start_pressed)`.

## Colisões

Uma colisão tem um corpo físico e uma forma. Cada plataforma é um `StaticBody2D` com um `CollisionShape2D` retangular. `StaticBody2D` não se move; ele serve de chão. A Sofya é um corpo que se move e colide com essas plataformas.

## CharacterBody2D

`CharacterBody2D` é o nó indicado para personagens controlados pelo jogador. O script altera sua propriedade `velocity` e chama `move_and_slide()`. A Godot então desloca a personagem e impede que ela atravesse plataformas. É semelhante a deixar um componente cuidar das regras físicas básicas em vez de calcular cada interseção manualmente.

## Camera2D

`Camera2D` define a área do mundo que aparece na tela. Em `player.tscn`, ela é filha da Sofya; por isso acompanha a personagem. O suavizamento configurado evita movimentos bruscos.

## CollisionShape2D

`CollisionShape2D` descreve a forma invisível usada nos cálculos físicos. A arte vetorial da Sofya não é a colisão por si só: o filho `CollisionShape2D` é. Isto permite trocar o desenho sem alterar a física.

## Resources

**Resources** são dados reutilizáveis, como uma forma de colisão, textura ou som. Nas cenas atuais, `RectangleShape2D` é um Resource usado por cada `CollisionShape2D`. Em uma fase maior, uma mesma textura ou configuração pode ser compartilhada por vários nós.

## Coordenadas 2D

A tela usa `Vector2(x, y)`. `x` aumenta para a direita e `y` aumenta para baixo. Uma posição como `Vector2(450, 440)` coloca a primeira plataforma a 450 pixels da esquerda e 440 pixels do topo. A velocidade de salto é negativa porque para subir é necessário reduzir `y`.
