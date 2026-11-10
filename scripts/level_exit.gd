## Controlador da saída da fase.
##
## Responsável por:
## - Detectar quando a Sofya alcança o portal.
## - Exibir a confirmação de conclusão uma única vez.
## - Abrir a próxima fase quando ela for configurada.
##
## Cena relacionada: scenes/level_exit.tscn
## Documentação: docs/04_CRIANDO_FASES.md
extends Area2D

@export_file("*.tscn") var next_scene_path: String = ""
@export var transition_delay: float = 1.0

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

	if not next_scene_path.is_empty():
		SaveManager.save_last_unlocked_level(next_scene_path)
		await get_tree().create_timer(transition_delay).timeout
		get_tree().change_scene_to_file(next_scene_path)
