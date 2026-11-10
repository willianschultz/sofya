## Controlador da tela inicial do SOFYA.
##
## Responsável por:
## - Iniciar um jogo novo.
## - Continuar da última fase salva.
## - Apagar o progresso após uma confirmação simples.
##
## Cena relacionada: scenes/main_menu.tscn
## Documentação: docs/05_INTERFACE.md e docs/06_SALVAMENTO.md
extends Control

@onready var continue_button: Button = $Content/ContinueButton
@onready var reset_button: Button = $Content/ResetButton
@onready var status_label: Label = $Content/StatusLabel

var is_waiting_reset_confirmation: bool = false


func _ready() -> void:
	update_progress_controls()


func on_start_pressed() -> void:
	SaveManager.clear_progress()
	get_tree().change_scene_to_file(SaveManager.DEFAULT_LEVEL_PATH)


func on_continue_pressed() -> void:
	get_tree().change_scene_to_file(SaveManager.load_last_unlocked_level())


func on_reset_progress_pressed() -> void:
	if not is_waiting_reset_confirmation:
		is_waiting_reset_confirmation = true
		reset_button.text = "Confirmar apagar progresso"
		status_label.text = "Clique novamente para apagar o progresso salvo."
		return

	SaveManager.clear_progress()
	is_waiting_reset_confirmation = false
	status_label.text = "Progresso apagado."
	update_progress_controls()


func update_progress_controls() -> void:
	var has_progress: bool = SaveManager.has_saved_progress()
	continue_button.visible = has_progress
	reset_button.visible = has_progress

	if not has_progress:
		reset_button.text = "Apagar progresso"
