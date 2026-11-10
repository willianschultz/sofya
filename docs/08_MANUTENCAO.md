# Manutenção

## Alterações comuns

| Objetivo | Onde alterar |
| --- | --- |
| Mudar velocidade ou corrida | Nó `Player` em `scenes/player.tscn`, no Inspector. |
| Alterar gravidade | **Projeto > Configurações do Projeto > Física > 2D > Default Gravity**. |
| Ajustar salto | `Jump Velocity` no Inspector do Player. |
| Trocar o sprite | Substitua o `Polygon2D` `Visual` em `player.tscn` por `Sprite2D`; mantenha a colisão. |
| Adicionar animação | Crie `AnimatedSprite2D` ou `AnimationPlayer` após definir os sprites disponíveis. |
| Criar inimigo | Etapa futura: comece com uma cena simples, colisão e uma regra de movimento testável. |
| Alterar vida | Etapa futura: crie primeiro a regra de dano, depois a interface e por fim o salvamento se necessário. |
| Adicionar fase | Duplique `level_02.tscn`, ajuste plataformas e defina `Next Scene Path` do portal anterior. Veja [04_CRIANDO_FASES.md](04_CRIANDO_FASES.md). |
| Reiniciar progresso | Feche o jogo e apague `savegame.json` na Pasta de Dados do Usuário. |
| Modificar objetivo | Altere o texto em `Interface/Instructions` de `main.tscn` e a posição do nó `Exit`. |
| Corrigir colisão | Confira `StaticBody2D` + `CollisionShape2D` e use formas de colisão visíveis. |

## Investigar erros

1. Execute a cena com **F6** e leia a aba **Saída** na parte inferior da Godot.
2. Clique na mensagem de erro para abrir o arquivo e a linha correspondente.
3. Em problemas físicos, ative **Depurar > Formas de Colisão Visíveis**.
4. Confira se nomes de ações em `project.godot` são os mesmos usados em `player.gd`.
5. Faça uma alteração pequena, execute novamente e só então avance.

Ao modificar uma funcionalidade, atualize o documento correspondente e execute a fase de testes. Não introduza plugins ou dependências antes de haver uma necessidade concreta.
