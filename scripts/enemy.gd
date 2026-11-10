## Controlador de um inimigo simples que patrulha uma área horizontal.
##
## Responsável por:
## - Mover o inimigo entre dois limites.
## - Detectar o contato da Sofya e avisar a fase.
##
## Cena relacionada: scenes/enemy.tscn
## Documentação: docs/04_CRIANDO_FASES.md
extends Area2D

signal player_touched(player: CharacterBody2D)

@export var patrol_speed: float = 70.0
@export var patrol_distance: float = 90.0

var start_position: Vector2
var direction: float = -1.0


func _ready() -> void:
	start_position = global_position
	body_entered.connect(on_body_entered)


func _physics_process(delta: float) -> void:
	global_position.x += direction * patrol_speed * delta

	if abs(global_position.x - start_position.x) >= patrol_distance:
		direction *= -1.0


func on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_touched.emit(body)
