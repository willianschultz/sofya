# Movimentação da Sofya

O script `scripts/player.gd` concentra toda a movimentação. Selecione o nó **Player** em `scenes/player.tscn` para encontrar seus parâmetros no Inspector.

| Parâmetro | Unidade | Padrão | Significado |
| --- | --- | ---: | --- |
| `Walk Speed` | pixels por segundo | 180 | Velocidade ao andar. |
| `Run Speed` | pixels por segundo | 280 | Velocidade ao manter Shift. |
| `Acceleration` | pixels por segundo² | 1400 | Rapidez para alcançar a velocidade desejada. |
| `Deceleration` | pixels por segundo² | 1800 | Rapidez para parar. |
| `Jump Velocity` | pixels por segundo | -390 | Impulso vertical do salto. Mais negativo significa salto mais alto. |
| `Standing Height` | pixels | 48 | Altura da colisão em pé. |
| `Crouching Height` | pixels | 30 | Altura da colisão agachada. |

## Andar e correr

`Input.get_axis("move_left", "move_right")` devolve `-1`, `0` ou `1`. O método `read_movement_input` transforma esse valor em `velocity.x`. Acelerar e desacelerar com `move_toward` deixa o controle mais natural que mudar a velocidade instantaneamente.

```gdscript
var direction: float = Input.get_axis("move_left", "move_right")
var target_speed: float = run_speed if Input.is_action_pressed("run") else walk_speed
velocity.x = move_toward(velocity.x, direction * target_speed, acceleration * delta)
```

Na implementação real, a corrida é bloqueada enquanto Sofya está agachada.

## Gravidade e salto

A cada atualização física, quando a personagem não está no chão, o projeto soma a gravidade à velocidade vertical:

```gdscript
if not is_on_floor():
    velocity.y += gravity * delta
```

O salto só acontece ao pressionar Espaço, com Sofya no chão e em pé. `jump_velocity` é negativo porque o eixo Y cresce para baixo. Para aumentar a altura, use um número mais negativo, como `-450`; depois teste se a personagem ainda alcança as plataformas sem tornar a fase fácil demais.

## Agachamento

Manter `S` ou seta para baixo reduz o retângulo visual e a forma de colisão. Ao soltar o comando, o `RayCast2D` chamado `HeadClearance` verifica se existe algo acima. Se houver teto, Sofya permanece agachada e não atravessa a colisão ao levantar.

```gdscript
elif not head_clearance.is_colliding():
    set_crouching(false)
```

## Colisões

`move_and_slide()` deve ser chamado depois de definir `velocity`. Ele usa o `CollisionShape2D` da Sofya e os `StaticBody2D` das plataformas. Para corrigir uma colisão, confira se cada plataforma possui ambos: um `StaticBody2D` e um filho `CollisionShape2D` com uma forma válida.
