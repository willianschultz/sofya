## Controlador da saída da fase.
##
## Responsável por:
## - Detectar quando a Sofya alcança o portal.
## - Exibir a confirmação de conclusão uma única vez.
##
## Cena relacionada: scenes/level_exit.tscn
## Documentação: docs/04_CRIANDO_FASES.md
extends Area2D

@onready var completed_label: Label = $CompletedLabel

var is_completed: bool = false


func _ready() -> void:
	body_entered.connect(on_body_entered)


func on_body_entered(body: Node2D) -> void:
	if is_completed or not body is CharacterBody2D:
		return

	is_completed = true
	completed_label.visible = true
	# A Godot termina o processamento do sinal antes de alterar o monitoramento.
	set_deferred("monitoring", false)
